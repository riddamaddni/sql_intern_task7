use pharmaplus;

-- CREATE VIEW ProductCatalog AS
-- SELECT name, category, price
-- FROM Products;

-- SELECT * FROM ProductCatalog;

-- SELECT * FROM ProductCatalog
-- WHERE category = 'Pain Relief';

-- CREATE VIEW SouthRegionSales AS
-- SELECT
--     c.name AS customer_name,
--     c.city,
--     r.name AS rep_name
-- FROM Customers c
-- JOIN SalesOrders s ON c.customer_id = s.customer_id
-- JOIN SalesReps r ON s.rep_id = r.rep_id
-- WHERE r.region = 'South';


-- SELECT * FROM SouthRegionSales;

-- CREATE VIEW DetailedSalesReport AS
-- SELECT
--     s.order_id,
--     s.order_date,
--     p.name AS product_name,
--     p.category,
--     oi.quantity,
--     oi.item_price,
--     c.name AS customer_name,
--     r.name AS rep_name,
--     r.region
-- FROM OrderItems oi
-- JOIN Products p ON oi.product_id = p.product_id
-- JOIN SalesOrders s ON oi.order_id = s.order_id
-- JOIN Customers c ON s.customer_id = c.customer_id
-- JOIN SalesReps r ON s.rep_id = r.rep_id;


-- SELECT * FROM DetailedSalesReport;

-- SELECT order_id, product_name, quantity
-- FROM DetailedSalesReport
-- WHERE category = 'Antibiotic' AND customer_name = 'General Hospital';

-- CREATE VIEW CustomerTotalSpending AS
-- SELECT
--     c.name,
--     c.city,
--     SUM(oi.quantity * oi.item_price) AS total_spent
-- FROM Customers c
-- JOIN SalesOrders s ON c.customer_id = s.customer_id
-- JOIN OrderItems oi ON s.order_id = oi.order_id
-- GROUP BY c.customer_id, c.name, c.city;

-- SELECT *
-- FROM CustomerTotalSpending
-- ORDER BY total_spent DESC;

-- CREATE VIEW RepManagerHierarchy AS
-- SELECT
--     e.name AS employee_name,
--     e.region,
--     m.name AS manager_name
-- FROM SalesReps e
-- LEFT JOIN SalesReps m ON e.manager_id = m.rep_id;


-- SELECT * FROM RepManagerHierarchy;

-- CREATE OR REPLACE VIEW ProductCatalog AS
-- SELECT
--     p.name,
--     p.category,
--     p.price,
--     m.name AS manufacturer_name
-- FROM Products p
-- JOIN Manufacturers m ON p.manufacturer_id = m.manufacturer_id;


-- SELECT * FROM ProductCatalog;


-- CREATE VIEW PainReliefProducts AS
-- SELECT product_id, name, category, price, manufacturer_id
-- FROM Products
-- WHERE category = 'Pain Relief';

-- SELECT * FROM PainReliefProducts;


-- UPDATE PainReliefProducts
-- SET price = 4.75
-- WHERE name = 'Ibuprofen 200mg';


-- SELECT name, price FROM Products WHERE name = 'Ibuprofen 200mg';

-- CREATE OR REPLACE VIEW PainReliefProducts AS
-- SELECT product_id, name, category, price, manufacturer_id
-- FROM Products
-- WHERE category = 'Pain Relief'
-- WITH CHECK OPTION;


-- CREATE VIEW OrderRevenueSummary AS
-- SELECT
--     s.order_id,
--     s.order_date,
--     c.name AS customer_name,
--     SUM(oi.quantity * oi.item_price) AS total_revenue
-- FROM SalesOrders s
-- JOIN Customers c ON s.customer_id = c.customer_id
-- JOIN OrderItems oi ON s.order_id = oi.order_id
-- GROUP BY s.order_id, s.order_date, c.name;

-- SELECT *
-- FROM OrderRevenueSummary
-- ORDER BY total_revenue DESC
-- LIMIT 5;

-- CREATE VIEW UnsoldProducts AS
-- SELECT
--     p.product_id,
--     p.name,
--     p.category,
--     p.price,
--     m.name AS manufacturer_name
-- FROM Products p
-- JOIN Manufacturers m ON p.manufacturer_id = m.manufacturer_id
-- WHERE p.product_id NOT IN (SELECT DISTINCT product_id FROM OrderItems);

-- SELECT * FROM UnsoldProducts;

-- CREATE VIEW InactiveCustomers AS
-- SELECT
--     customer_id,
--     name,
--     city,
--     state
-- FROM Customers
-- WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM SalesOrders);

-- SELECT * FROM InactiveCustomers;

-- CREATE VIEW ProductPriceTiers AS
-- SELECT
--     product_id,
--     name,
--     price,
--     CASE
--         WHEN price > 20.00 THEN 'Premium'
--         WHEN price > 10.00 THEN 'Mid-Range'
--         ELSE 'Standard'
--     END AS price_tier
-- FROM Products;

-- SELECT price_tier, COUNT(*)
-- FROM ProductPriceTiers
-- GROUP BY price_tier;


-- CREATE VIEW AverageCustomerRevenue AS
-- SELECT
--     customer_name,
--     SUM(total_revenue) AS total_spent_by_customer,
--     AVG(total_revenue) AS average_order_value,
--     COUNT(*) AS total_orders
-- FROM OrderRevenueSummary
-- GROUP BY customer_name;


-- SELECT *
-- FROM AverageCustomerRevenue
-- ORDER BY average_order_value DESC;

-- CREATE VIEW UsaContacts AS
-- SELECT
--     name,
--     'Customer' AS contact_type,
--     city,
--     state
-- FROM Customers
-- WHERE state IN ('NY', 'CA', 'IL', 'MA') -- Assuming these are all USA
-- UNION ALL
-- SELECT
--     name,
--     'Manufacturer' AS contact_type,
--     NULL AS city, -- Manufacturer table doesn't have city/state
--     'USA' AS state
-- FROM Manufacturers
-- WHERE country = 'USA';

-- SELECT * FROM UsaContacts
-- ORDER BY contact_type, name;

-- CREATE VIEW ProductCategoryPerformance AS
-- SELECT
--     p.category,
--     p.name AS product_name,
--     SUM(oi.quantity) AS total_quantity_sold
-- FROM Products p
-- LEFT JOIN OrderItems oi ON p.product_id = oi.product_id
-- GROUP BY p.category, p.name
-- ORDER BY p.category, total_quantity_sold DESC;


-- SELECT *
-- FROM ProductCategoryPerformance
-- WHERE category = 'Pain Relief';


