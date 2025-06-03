# 📌 Superstore Sales Metrics - dbt Project  

## 🔹 Descripción del Proyecto  
Este proyecto es parte de mi **portafolio de proyectos personales**. Se basa en un **dataset de retail** extraído de Kaggle y modelado con **dbt**, generando múltiples tablas listas para análisis.  

La arquitectura sigue el diseño recomendado de **staging, intermediate y marts**, asegurando un flujo de datos estructurado y optimizado.  

## 🔹 Arquitectura del Proyecto  
El desarrollo se realiza en un **DevContainer**, utilizando **Poetry** para manejar dependencias y **DuckDB** para procesamiento local. La ejecución de `dbt` se gestiona mediante un **Makefile**, simplificando los comandos de transformación de datos.  

📂 **Estructura del Proyecto:**  
```

├── Makefile                        # Comandos de ejecución del proyecto
├── data_processed
│   └── sales_dataset.parquet       # Dataset original en formato Parquet
├── logs
│   └── dbt.log                     # Registros de ejecución de dbt
├── poetry.lock                     # Dependencias bloqueadas de Poetry
├── pyproject.toml                   # Configuración de Poetry
└── transform
├── superstore_sales_metrics
│   ├── dbt_project.yml          # Configuración del proyecto dbt
│   ├── models                   # Modelos de transformación de datos
│   │   ├── staging
│   │   ├── intermediate
│   │   ├── marts
│   ├── packages.yml             # Dependencias de dbt (dbt-utils, etc.)
│   ├── profiles.yml             # Configuración de conexiones
│   ├── tests                    # Pruebas y validaciones de dbt

```

## 🔹 Instalación y Configuración  

### 1️⃣ **Clonar el repositorio**  
```bash
git clone git@github.com:jmelendezgeo/dbt-store-analytics.git
cd superstore_sales_metrics
```

### Definir variables de entorno
Crear un archivo .env con las configuraciones necesarias:

```
SALES_FILE_PATH=data_processed/sales_dataset.parquet  
MOTHERDUCK_TOKEN=<your_token_here>  
```

## Ejecución del Proyecto
### 🛠️ Ejecutar la transformación de datos en desarrollo local con duckdb 

```bash
make sales-transform
```

Esto ejecutara los siguientes pasos:

- Activación de entorno con `poetry`
- Instala dependencias de dbt (`dbt deps`)
- Ejecuta los modelos de transformación (`dbt run`)

### Ejecutar en producción (MotherDuck)
Para ejecutar el modelo con MotherDuck en la nube, usa:

```bash
make sales-transform DBT_TARGET=prod
```

Esto conectará dbt con MotherDuck, siempre que las credenciales (token) estén especificadas en .env

## Validación de Modelos
Este proyecto aplica tests de dbt para asegurar la calidad de los datos:
✅ not_null en claves primarias (customer_id, order_id, product_id)
✅ unique en identificadores
✅ accepted_range en métricas financieras (lifetime_value, amount_sales)

Para ejecutar los test usa el comando

```bash
make sales-test
```

Esto ejecutara los siguientes pasos:

- Activación de entorno con `poetry`
- Instala dependencias de dbt (`dbt deps`)
- Ejecuta los test de los modelos (`dbt test`)

## Documentación de Modelos
Los modelos están documentados con dbt docs, siguiendo una estructura clara:
- staging: Tablas crudas procesadas.
- intermediate: Transformaciones intermedias.
- marts: Tablas finales optimizadas para análisis.
Para generar la documentación:

```bash
make sales-docs-generate
```

Esto ejecutara los siguientes pasos:

- Activación de entorno con `poetry`
- Instala dependencias de dbt (`dbt deps`)
- Generación de documentación (`dbt docs generate`)
- Deploy de documentación en localhost puerto 8080 (`dbt docs serve`)

