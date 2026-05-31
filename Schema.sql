CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customername VARCHAR(100) NOT NULL, 
email VARCHAR(100) UNIQUE NOT NULL,
city VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
product_id INT AUTO_INCREMENT PRIMARY KEY,
productname VARCHAR(100) NOT NULL,
category VARCHAR(50),
price DECIMAL(10, 2) NOT NULL,
stock_qty INT DEFAULT 0
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT,
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
status ENUM('pending', 'shipped','delivered','cancelled') DEFAULT 'pending',
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);








