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
  ("Grape", 1.99, 5);

-- Sorts the items by lowest price
SELECT * FROM items ORDER BY price ASC;
