-- 06: Customer Profitability Analysis
-- Only Completed orders are included.

-- A) Top 10 customers by total profit
WITH customer_profit AS
(
    SELECT
        o.CustomerID,
        COUNT(DISTINCT o.OrderID) AS totalOrders,
        SUM(oi.quantity * oi.unitPrice) AS totalSales,
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)) AS totalProfit
    FROM orders o
    INNER JOIN order_items oi
        ON o.OrderID = oi.OrderID
    INNER JOIN products p
        ON oi.ProductID = p.ProductID
    WHERE o.Status = 'Completed'
    GROUP BY o.CustomerID
)
SELECT
    c.CustomerID,
    c.CustomerName,
    cp.totalOrders,
    ROUND(cp.totalSales, 2) AS totalSales,
    ROUND(cp.totalProfit, 2) AS totalProfit,
    ROUND(
        cp.totalProfit * 100 / NULLIF(cp.totalSales, 0),
        2
    ) AS profitMargin
FROM customer_profit cp
INNER JOIN customers c
    ON cp.CustomerID = c.CustomerID
ORDER BY cp.totalProfit DESC
LIMIT 10;


-- B) Top 10 profit margins among customers with at least 10 completed orders
WITH customer_profit AS
(
    SELECT
        o.CustomerID,
        COUNT(DISTINCT o.OrderID) AS totalOrders,
        SUM(oi.quantity * oi.unitPrice) AS totalSales,
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)) AS totalProfit
    FROM orders o
    INNER JOIN order_items oi
        ON o.OrderID = oi.OrderID
    INNER JOIN products p
        ON oi.ProductID = p.ProductID
    WHERE o.Status = 'Completed'
    GROUP BY o.CustomerID
)
SELECT
    c.CustomerID,
    c.CustomerName,
    cp.totalOrders,
    ROUND(cp.totalSales, 2) AS totalSales,
    ROUND(cp.totalProfit, 2) AS totalProfit,
    ROUND(
        cp.totalProfit * 100 / NULLIF(cp.totalSales, 0),
         2
    ) AS profitMargin
FROM customer_profit cp
INNER JOIN customers c
    ON cp.CustomerID = c.CustomerID
WHERE cp.totalOrders >= 10
ORDER BY profitMargin DESC
LIMIT 10;
