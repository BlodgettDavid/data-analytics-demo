INSERT INTO customers (first_name, last_name, email)
VALUES
  ('Alice', 'Johnson', 'alice.johnson@example.com'),
  ('Bob', 'Martinez', 'bob.martinez@example.com'),
  ('Carol', 'Nguyen', 'carol.nguyen@example.com'),
  ('David', 'Smith', 'david.smith@example.com');

INSERT INTO products (product_name, category, price)
VALUES
  ('Wireless Mouse', 'Electronics', 29.99),
  ('Mechanical Keyboard', 'Electronics', 89.99),
  ('Noise-Cancelling Headphones', 'Audio', 199.99),
  ('USB-C Charger', 'Accessories', 24.99),
  ('Laptop Stand', 'Accessories', 39.99);

INSERT INTO orders (customer_id, order_timestamp)
VALUES
  (1, '2025-01-10 14:30:00'),
  (1, '2025-01-12 09:15:00'),
  (2, '2025-01-15 18:45:00'),
  (3, '2025-01-16 11:20:00');
  
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES
  -- Order 1 (Alice)
  (1, 1, 1, 29.99),   -- Wireless Mouse
  (1, 4, 2, 24.99),   -- USB-C Charger x2

  -- Order 2 (Alice)
  (2, 2, 1, 89.99),   -- Mechanical Keyboard

  -- Order 3 (Bob)
  (3, 3, 1, 199.99),  -- Headphones
  (3, 5, 1, 39.99),   -- Laptop Stand

  -- Order 4 (Carol)
  (4, 1, 1, 29.99),   -- Wireless Mouse
  (4, 2, 1, 89.99);   -- Mechanical Keyboard
  
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;