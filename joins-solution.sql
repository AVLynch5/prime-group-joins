-- Question 1: Get all customers and their addresses.
SELECT ("customers"."last_name", "customers"."first_name"), ("addresses"."street", "addresses"."city", "addresses"."state", "addresses"."zip")
FROM "customers"
INNER JOIN "addresses"
ON "customers"."id" = "addresses"."id";

-- Question 2: Get all orders and their line items (orders, quantity and product).
SELECT "orders"."id", "line_items"."quantity", "products"."description"
FROM "orders"
INNER JOIN "line_items"
ON "orders"."id" = "line_items"."order_id"
INNER JOIN "products"
on "line_items"."product_id" = "products"."id";

-- Question 3: Which warehouses have cheetos?
SELECT "warehouse"."warehouse"
FROM "warehouse" 
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos';

-- Question 4: Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse"
FROM "warehouse" 
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';

-- Question 5: Get the number of orders for each customer -- CB solution
SELECT "customers"."first_name", "customers"."last_name", COUNT("orders"."id") as "order_count"
FROM "customers" 
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
GROUP BY "customers"."first_name", "customers"."last_name"
LIMIT 100;

-- Question 6: How many customers do we have?
SELECT COUNT(*)
FROM "customers";

-- Question 7: How many products do we carry?
SELECT COUNT(*)
FROM "products";

-- Question 8: What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand")
FROM "warehouse" 
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';
