select
	`timestamp` as `Horário da Transação`
	,rcct.card_network as `Bandeira do cartão`
	,1.0*rcct.bill_value as `Valor da conta`
	,rcct.merchant_type as `Categoria do estabelecimento`
	,rcct.merchant_name as `Nome do estabelecimento`
	,rcct.installments as `Parcelas`
	,rcct.transaction_type as `Tipo de transação`
from
	main.dlt_demo_credit_cards.merchant_credit_card_transactions rcct