-- Create tables

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE
);

-- Insert sample data

INSERT INTO customers (name, country) VALUES
('Ivan', 'Finland'),
('Anna', 'Finland'),
('John', 'Sweden');

INSERT INTO orders (customer_id, amount, order_date) VALUES
(1, 100.50, '2024-01-10'),
(1, 200.00, '2024-02-15'),
(2, 150.75, '2024-01-12'),
(3, 300.00, '2024-03-01');

-- Analysis: Total spending by customer

SELECT 
    c.id,
    c.name,
    SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name
ORDER BY total_spent DESC;

