SELECT
  timestamp_day as time_period,
  merchant_type,
  card_network,
  sum_bill_value
FROM
  main.dlt_demo_credit_cards.gold_merchant_credit_card_transactions_daily_agg