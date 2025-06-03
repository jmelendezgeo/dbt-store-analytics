include .env
export

.PHONY: sales-transform sales-docs-generate sales-test


DBT_FOLDER = transform/superstore_sales_metrics/
DBT_TARGET = dev

sales-transform:
	cd $$DBT_FOLDER && \
	poetry run dbt deps && \
	poetry run dbt run \
		--target $$DBT_TARGET \

sales-docs-generate:
	cd $$DBT_FOLDER && \
	poetry run dbt deps && \
	poetry run dbt docs generate && \
	poetry run dbt docs serve 

sales-test:
	cd $$DBT_FOLDER && \
	poetry run dbt deps && \
	poetry run dbt test