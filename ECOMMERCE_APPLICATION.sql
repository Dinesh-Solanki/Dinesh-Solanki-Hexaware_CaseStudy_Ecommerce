CREATE DATABASE ECOMMERCE_APPLICATION

USE ECOMMERCE_APPLICATION

CREATE TABLE customers(
customer_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL);

CREATE TABLE products(
product_id INT NOT NULL IDENTITY(100,1) PRIMARY KEY,
name VARCHAR(255) NOT NULL,
price DECIMAL NOT NULL,
description VARCHAR(255) NOT NULL,
stockQuantity int  NOT NULL);

CREATE TABLE cart(
cart_id INT NOT NULL IDENTITY(200,1) PRIMARY KEY,
customer_id INT NOT NULL,
product_id INT NOT NULL,
Quantity int  NOT NULL,
CONSTRAINT fk_customers_cart FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk_products_cart FOREIGN KEY(product_id) REFERENCES products(product_id)ON UPDATE CASCADE ON DELETE CASCADE);


CREATE TABLE orders(
order_id INT NOT NULL IDENTITY(300,1) PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATETIME NOT NULL,
total_price DECIMAL  NOT NULL,
shipping_address TEXT NOT NULL,
CONSTRAINT fk_customers_orders FOREIGN KEY(customer_id) REFERENCES customers(customer_id)ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE order_items(
order_item_id INT NOT NULL IDENTITY(300,1) PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
Quantity INT NOT NULL,
CONSTRAINT fk_products_orderitems FOREIGN KEY(product_id) REFERENCES products(product_id)ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk_orders_orderitems FOREIGN KEY(order_id) REFERENCES orders(order_id)ON UPDATE CASCADE ON DELETE CASCADE);


Select * from customers
select * from products
select * from cart
select * from orders
select * from order_items



