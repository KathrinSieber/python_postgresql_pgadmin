SELECT 
  columns_name,
  data_type,
  character_maximum_length,
  is_nullable,
  column_default
FROM information_schema.columns
WHERE TABLE_NAME = 'customers';

-- 1. What are the details of all customers whose country is 'Spain'?
SELECT * FROM Customers WHERE Country = 'Spain';

-- 2. What are the distinct cities of customers from Germany with a city containing the letter 'B'?
SELECT city FROM Customers WHERE Country = 'Germany' AND City ILIKE '%B%';

-- 3. What are the number of orders placed by each customer? Sort the result by the number of orders in descending order.
SELECT CustomerID, COUNT(OrderID) AS OrderCount FROM Orders GROUP BY CustomerID ORDER BY OrderCount DESC;

-- 4. What are the customers who have placed more than 3 orders?
SELECT CustomerID, COUNT(OrderID) AS OrderCount FROM Orders GROUP BY CustomerID HAVING COUNT(OrderID) > 3;

-- 5. What are the top 5 most expensive products? Round the price to 2 decimal places.
SELECT ProductName, ROUND(CAST(Price AS NUMERIC), 2) AS Price FROM products ORDER BY Price DESC LIMIT 5; 

-- 6. What are the order details (ProductID, Quantity) for customers from France?
SELECT o.OrderID, c.CustomerName, c.Country, od.ProductID, od.Quantity FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID JOIN OrderDetails od ON o.OrderID = od.OrderID WHERE c.Country = 'France';

-- 7. Area there products without a category assigned?
SELECT ProductID, ProductName, CategoryID FROM Products WHERE CategoryID IS NULL;

-- 8. What are all orders and their employees?
SELECT o.OrderID, e.EmployeeID, e.FirstName, e.LastName FROM Orders o LEFT JOIN Employees e ON o.EmployeeID = e.EmployeeID;

-- 9. What is the average, minimum, and maximum price of products? Round the values to 2 decimal places.
SELECT ROUND(CAST(AVG(Price) AS NUMERIC), 2) AS AveragePrice, ROUND(CAST(MIN(Price) AS NUMERIC), 2) AS MinimumPrice, ROUND(CAST(MAX(Price) AS NUMERIC), 2) AS MaximumPrice FROM Products;

10. What are the products with prices between 10 and 50? Round the price to 2 decimal places and sort the result by price in descending order.

11. What are the shippers and the total number of orders shipped by each shipper, including those with no orders?

12. What are the employees who have processed > 5 orders? Sort the result by the number of orders in descending order.

13. What is the total revenue for each product within each order, including the product name and ordered by order ID and total revenue in descending order?

14. What are the customers, employees, and the total number of orders placed by each customer?

15. What are the products with an average price higher than the overall average product price? 
    Round the price to 2 decimal places and sort the result by price in descending order.
