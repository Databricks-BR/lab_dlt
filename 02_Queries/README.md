
<img src="https://raw.githubusercontent.com/Databricks-BR/lab_dlt/main/images/lab_dlt.png">

# Consultas SQL para analisar nosso Delta Live Tables

## Conteúdo

Nesta pasta, existem 3 consultas SQL que podemos utilizar para analisar nosso pipeline de dados:
</br>
* **`00_Delta_live_tables_data_quality_monitoring.sql`**
  - Neste arquivo, é criada uma view em cima das expectativas do Delta Live Tables para que monitoremos a qualidade dos dados em um dashboard (que pode ser o mesmo dashboard de negócios).

* **`01_Delta_live_tables_silver_query.sql`**
  - Analisando nossa tabela silver, que tem dados filtrados com as nossas expectativas e regras de negócios para o pipeline.

* **`02_Delta_live_tables_gold_query.sql`**
  - Lendo os dados agregados diariamente e por bandeira de cartão de crédito, ótima tabela para incluirmos em dashboards de negócio que tem um número conhecido de filtros e análises repetidas, pois podemos reduzir o tamanho dos warehouses que consomem a informação (não terão que fazer a agregação dos dados em tempo de execução).


## Como visualizar o data quality

Depois de criarmos nosso Delta Live Tables Pipeline, será gerado um uuid com o formato `7819dcc4-d56e-4bf8-8e7e-39b6ac68ed64` e que precisamos incluir na linha 25 do arquivo `00_Delta_live_tables_data_quality_monitoring.sql` 
