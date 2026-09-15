CREATE DATABASE PaymentManagement;
USE PaymentManagement;
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    order_id INT,
    payment_mode VARCHAR(20),
    payment_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);
INSERT INTO Payment VALUES
(1, 101, 1001, 'UPI', '2026-09-01', 1500.00, 'Successful'),
(2, 102, 1002, 'Credit Card', '2026-09-02', 2500.00, 'Successful'),
(3, 103, 1003, 'Debit Card', '2026-09-03', 1200.00, 'Failed'),
(4, 104, 1004, 'UPI', '2026-09-04', 3000.00, 'Successful'),
(5, 105, 1005, 'Cash', '2026-09-05', 1800.00, 'Successful'),
(6, 101, 1006, 'UPI', '2026-09-06', 2200.00, 'Failed');

SELECT *
FROM Payment
WHERE status = 'Successful';
SELECT *
FROM Payment
WHERE status = 'Failed';
SELECT 
    payment_mode,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM Payment
GROUP BY payment_mode;
SELECT
    payment_id,
    customer_id,
    order_id,
    payment_mode,
    payment_date,
    amount,
    status
FROM Payment
ORDER BY payment_date;

UPDATE Payment
SET status = 'Successful'
WHERE payment_id = 3;
SELECT * FROM Payment
WHERE payment_id = 3;