USE emart;

SELECT * FROM Product;
USE emart;

SELECT * FROM Product;

SELECT * FROM Product
WHERE price > 1000;

SELECT * FROM Product
ORDER BY price DESC;

SELECT DISTINCT category_id
FROM Product;

SELECT *
FROM Product
WHERE price BETWEEN 1000 AND 30000;

SELECT *
FROM Product
WHERE category_id = 1;

SELECT *
FROM Product
WHERE stock > 0;

SELECT *
FROM Customer;

SELECT *
FROM Product;

SELECT
    Customer.customer_name,
    Product.product_name,
    Product.price
FROM Customer
JOIN Orders
    ON Customer.customer_id = Orders.customer_id
JOIN Order_Details
    ON Orders.order_id = Order_Details.order_id
JOIN Product
    ON Order_Details.product_id = Product.product_id;

SELECT
    category_id,
    COUNT(*) AS total_products,
    SUM(stock) AS total_stock,
    AVG(price) AS average_price
FROM Product   
GROUP BY category_id;
