# 📌 Superstore Dataset - Documentación

## 🔹 Descripción general
Este dataset proviene de Kaggle y ha sido transformado para modelado en **dbt**. Contiene información detallada sobre pedidos, clientes y productos de una superstore con ventas en distintos paises a lo largo de un periodo de ~ 4 años, permitiendo generar modelos analíticos para entender el comportamiento de ventas.

## 🔹 Flujo de procesamiento
- **Fuente original:** Archivo **Parquet** procesado localmente con **DuckDB**.
- **Configuración de `target` en dbt:**
  - `dev`: Usa **DuckDB** para procesamiento en un entorno local.
  - `prod`: Escribe en **MotherDuck**, siempre que se provean las credenciales en el repositorio.
- **Beneficios:** Esta arquitectura permite trabajar eficientemente en desarrollo sin costos en la nube, mientras que en producción se aprovecha la escalabilidad de **MotherDuck**.

## 🔹 Modelos derivados

### **1️⃣ `order_line`**
**📌 Descripción:**  
Cada línea representa un producto dentro de un pedido. Incluye detalles sobre el cliente, producto y fechas clave de compra y envío.  

**🔹 Campos principales:**  
- `id`: Identificador único de la línea de pedido.  
- `order_id`: Identificador del pedido al que pertenece.  
- `order_date`: Fecha en que se realizó el pedido.  
- `ship_date`: Fecha en que el producto fue enviado al cliente.  
- `product_id`: Identificador único del producto.  
- `amount_sales`: Monto total de la venta por producto.  

### **2️⃣ `orders`**
**📌 Descripción:**  
Resumen de pedidos agrupados por orden, incluyendo información de fechas y montos.  

**🔹 Campos principales:**  
- `order_id`: Identificador único del pedido.  
- `customer_id`: Identificador del cliente que realizó la compra.  
- `order_date`: Fecha de creación del pedido.  
- `total_sales`: Monto total de la venta en el pedido.  
- `num_products`: Cantidad de productos en el pedido.  

### **3️⃣ `customers`**
**📌 Descripción:**  
Resumen de comportamiento del cliente, incluyendo primera compra, valor de vida del cliente y tiempo entre pedidos.  

**🔹 Campos principales:**  
- `customer_id`: Identificador único del cliente.  
- `customer_name`: Nombre del cliente.  
- `first_order_date`: Fecha en que realizó su primera compra.  
- `lifetime_value`: Total acumulado de compras realizadas.  
- `avg_reorder_days`: Promedio de días entre compras.  

### **4️⃣ `products`**
**📌 Descripción:**  
Resumen de cada producto, incluyendo clientes que lo han comprado y ventas acumuladas.  

**🔹 Campos principales:**  
- `product_id`: Identificador único del producto.  
- `product_name`: Nombre del producto en el catálogo.  
- `num_customers`: Cantidad de clientes que han comprado el producto.  
- `first_sale_date`: Fecha de la primera venta del producto.  
- `last_sale_date`: Fecha de la última venta registrada.  
- `total_sales`: Monto acumulado de ventas.  

## 📌 Uso en dbt  
Cada modelo extrae y transforma los datos desde el **dataset original**, permitiendo realizar análisis avanzados sobre **ventas, clientes y productos**.  
El proyecto está diseñado para ejecutarse **localmente con DuckDB en `dev`**, mientras que en `prod` se conecta a **MotherDuck**, si se proveen credenciales en el repositorio.
Sigue la estructura recomendada para modelado en dbt especificado en su documentación de dividir las capas de modelado en staging, intermediate y marts.
Cada modelo tiene su propia documentación, descripción de campo y tests de calidad de dato.

---
