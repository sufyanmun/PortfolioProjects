-- Creates the databased 
CREATE DATABASE grocery store;

-- Creates the items table 
CREATE TABLE items (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  quantity INTEGER NOT NULL);

-- Adds fruits with their name, price, & quantity in the items table
INSERT INTO items (name, price, quantity)
VALUES
  ("Apple", 0.99, 10),
  ("Banana", 0.59, 20),
  ("Orange", 0.79, 15),
  ("Grape", 1.99, 5),
  ("Strawberry", 2.49, 8),
  ("Peach", 1.49, 12),
  ("Lemon", 0.69, 25),
  ("Kiwi", 0.99, 18),
  ("Mango", 1.79, 10),
  ("Blueberry", 2.99, 7);

-- Sorts the items by lowest price
SELECT * FROM items ORDER BY price ASC;

-- Gets the total number of items in stock
SELECT SUM(quantity) AS total_quantity FROM items;

-- Gets the average price of all items in the table
SELECT AVG(price) AS avg_price FROM items;

-- Most expensive item in the table
SELECT * FROM items ORDER BY price DESC LIMIT 1;

-- Shows items that are low in stock, less than 10 available 
SELECT name FROM items WHERE quantity < 10;

-- Updates the price of all items by 10%
UPDATE items SET price = price * 1.1;

-- Retrives all items that have a price of less than $1 and a quantity of at least 10
SELECT name
FROM items
WHERE price < 1 AND quantity >= 10;
