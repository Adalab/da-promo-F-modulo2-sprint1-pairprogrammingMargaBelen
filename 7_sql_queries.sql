CREATE SCHEMA `northwind`;

USE `northwind`;

-- 4. Conociendo a la empleadas (seleccionar empleados): 
SELECT `employee_id`, `last_name`, `first_name`
FROM `employees`;

-- 5. Conociendo los productos más baratos: 

SELECT * 
FROM `products` WHERE `unit_price` BETWEEN 0 AND 5; 

-- 6. Conociendo los productos que no tienen precio: 
SELECT * 
FROM `products` WHERE `unit_price` IS NULL; 

 -- 7. Comparando productos: 
 
 SELECT *
 FROM `products` WHERE `product_id`< 10 AND `unit_price` < 15; 
 
 -- 8. Cambiando de operadores: 
 
 SELECT *
 FROM `products` WHERE `product_id` > 10 AND `unit_price` > 15; 
 
 
 -- 9. Conociendo a los países a los que vendemos: 
 
SELECT  DISTINCT (country) 
FROM `customers`;

-- 10. Conociendo el tipo de productos que vendemos: 

SELECT `product_id` AS `id`, `product_name` AS `nombre_producto`, `unit_price`AS `precio`
FROM `products`
LIMIT 10; 

-- 11. Ordenando los resultados 

SELECT `product_id` AS `id`, `product_name` AS `nombre_producto`, `unit_price`AS `precio`
FROM `products`
ORDER BY `product_id` DESC
LIMIT 10;

-- 12. Que pedidos tenemos en nuestra BD? 

SELECT DISTINCT (order_id) 
FROM `order_details`

-- 13. ¿Qué pedidos han gastado más? 3 pedidos que han gastado mas

SELECT `order_id`, `product_id`, `unit_price`, `quantity`, `unit_price` * `quantity` AS `ImporteTotal`
FROM `order_details` 
ORDER BY `importeTotal` DESC
LIMIT 3;

-- 14. Pedidos que están entre posiciones 5 y 10 de nuestro ranking: 


SELECT `order_id`, `product_id`, `unit_price`, `quantity`, `unit_price` * `quantity` AS `ImporteTotal`
FROM `order_details` 
ORDER BY `importeTotal` ASC
LIMIT 5
OFFSET 5;


-- 15. Categorías que tenemos en nuestra tienda: 

SELECT `category_name` AS `Categoria` 
FROM categories; 


-- 16. Selecciona envíos con retraso: 

SELECT `order_date`, `shipped_date`, DATE_ADD(`shipped_date`, INTERVAL 5 DAY) AS `Fecha_retrasada`
FROM orders; 



-- 17. Selecciona los productos más rentables: 

SELECT `product_name`, `unit_price`
FROM `products`
WHERE `unit_price` BETWEEN 15 AND 50; 


-- 18. Selecciona productos con precios dados. 
SELECT *
FROM `products`
WHERE `unit_price` IN (18, 19, 20)
ORDER BY `unit_price` DESC; 




 
