-- DBMS Week 4: Order Management System
-- GitHub SQL Script
-- Description: Manage customer orders, order details, modifications,
-- and customer order history reports.

CREATE DATABASE IF NOT EXISTS OrderManagement;
USE OrderManagement;

-- 1. Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL
);

-- 2. Create Order_Details table
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 3. Insert customer product orders
INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(1001, 101, '2026-09-01', 1500.00),
(1002, 102, '2026-09-02', 2500.00),
(1003, 101, '2026-09-03', 1200.00),
(1004, 103, '2026-09-04', 3000.00),
(1005, 104, '2026-09-05', 1800.00);

INSERT INTO Order_Details
(order_detail_id, order_id, product_id, quantity, price) VALUES
(1, 1001, 201, 2, 500.00),
(2, 1001, 202, 1, 500.00),
(3, 1002, 203, 5, 500.00),
(4, 1003, 204, 2, 600.00),
(5, 1004, 205, 3, 1000.00),
(6, 1005, 206, 2, 900.00);

-- 4. View inserted orders
SELECT * FROM Orders;

-- 5. View order details
SELECT * FROM Order_Details;

-- 6. Modify an order amount
UPDATE Orders
SET total_amount = 1600.00
WHERE order_id = 1001;

-- 7. Modify order quantity
UPDATE Order_Details
SET quantity = 3
WHERE order_detail_id = 4;

-- 8. Generate customer order history report
SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    od.product_id,
    od.quantity,
    od.price,
    o.total_amount
FROM Orders o
JOIN Order_Details od
ON o.order_id = od.order_id
ORDER BY o.customer_id, o.order_date;

-- 9. Generate order summary report
SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY customer_id;

-- 10. Display a particular customer's order history
SELECT
    o.order_id,
    o.order_date,
    od.product_id,
    od.quantity,
    od.price,
    o.total_amount
FROM Orders o
JOIN Order_Details od
ON o.order_id = od.order_id
WHERE o.customer_id = 101
ORDER BY o.order_date;
