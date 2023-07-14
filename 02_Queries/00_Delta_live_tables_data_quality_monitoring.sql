--- Now actually running the query
select
  date_trunc('minute', event_date) time_period,
  dqm.target_table,
  dqm.expectation,
  sum(failing_records) / sum(failing_records + passing_records) * 100 as failure_rate,
  sum(failing_records) as failing_records,
  sum(passing_records) as passing_records
from
  main.dlt_demo_credit_cards.expectation_data_ingestion dqm
group by
  time_period,
  target_table,
  expectation
order by
  time_period