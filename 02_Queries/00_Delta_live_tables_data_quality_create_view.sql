-- Create a view to query the external table:
CREATE
OR REPLACE VIEW main.dlt_demo_credit_cards.expectation_data_ingestion AS
SELECT
  event_date as event_date,
  row_expectations.dataset as target_table,
  row_expectations.name as expectation,
  SUM(row_expectations.passed_records) as passing_records,
  SUM(row_expectations.failed_records) as failing_records
FROM
  (
    SELECT
      date_trunc("minute", `timestamp`) as event_date,
      explode(
        from_json(
          details :flow_progress :data_quality :expectations,
          "array<struct<name: string, dataset: string, passed_records: int, failed_records: int>>"
        )
      ) row_expectations
    FROM
      (
        select
          *
        from
          event_log("YOUR_PIPELINE_ID")
      )
    WHERE
      event_type = 'flow_progress'
  )
GROUP BY
  row_expectations.dataset,
  row_expectations.name,
  event_date;