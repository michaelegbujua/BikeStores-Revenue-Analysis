
SELECT
	ord.order_id,
	CONCAT(cus.first_name,' ', cus.last_name) AS 'Customer name',
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) AS 'Sales_rep'
FROM sales.orders  ord

--joining sales.orders table with sales.customers table--
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id

--joining sales.order table with sales.orders table--
JOIN sales.order_items ite
ON ord.order_id = ite.order_id

--joining production.products table with sales.order_items
JOIN production.products pro
ON ite.product_id = pro.product_id

--joining the production.products table with the production.categories table
JOIN production.categories cat
ON pro.category_id = cat.category_id 

--joining the sales.stores table with sales.orders table--
JOIN sales.stores sto 
ON ord.store_id = sto.store_id

--joining sales.staffs table with sales.order table--
JOIN sales.staffs sta
ON sta.staff_id = ord.staff_id

--group the columns in request--
GROUP BY 
	ord.order_id,
	CONCAT(cus.first_name,' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name)