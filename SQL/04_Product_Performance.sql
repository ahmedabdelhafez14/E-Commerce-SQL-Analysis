-- 04: Product Performance Analysis
-- The three queries rank products by sales, profit, and units sold.
-- Only Completed orders are included.

-- A) Top 10 products by total sales
SELECT
    p.ProductName,
    p.ProductID,
    ROUND(SUM(oi.quantity * oi.unitPrice), 2) AS sales,
    SUM(oi.quantity) AS units,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)),
        2
    ) AS totalProfit,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)) * 100 /
        NULLIF(SUM(oi.quantity * oi.unitPrice), 0),
        2
    ) AS profitMargin
FROM orders o
INNER JOIN order_items oi
    ON o.OrderID = oi.OrderID
INNER JOIN products p
    ON oi.ProductID = p.ProductID
WHERE o.Status = 'Completed'
GROUP BY
    p.ProductName,
    p.ProductID
ORDER BY sales DESC
LIMIT 10;


-- B) Top 10 products by total profit
SELECT
    p.ProductName,
    p.ProductID,
    ROUND(SUM(oi.quantity * oi.unitPrice), 2) AS sales,
    SUM(oi.quantity) AS units,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)),
        2
    ) AS totalProfit,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)) * 100 /
        NULLIF(SUM(oi.quantity * oi.unitPrice), 0),
        2
    ) AS profitMargin
FROM orders o
INNER JOIN order_items oi
    ON o.OrderID = oi.OrderID
INNER JOIN products p
    ON oi.ProductID = p.ProductID
WHERE o.Status = 'Completed'
GROUP BY
    p.ProductName,
    p.ProductID
ORDER BY totalProfit DESC
LIMIT 10;


-- C) Top 10 products by units sold
SELECT
    p.ProductName,
    p.ProductID,
    ROUND(SUM(oi.quantity * oi.unitPrice), 2) AS sales,
    SUM(oi.quantity) AS units,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)),
        2
    ) AS totalProfit,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)) * 100 /
        NULLIF(SUM(oi.quantity * oi.unitPrice), 0),
        2
    ) AS profitMargin
FROM orders o
INNER JOIN order_items oi
    ON o.OrderID = oi.OrderID
INNER JOIN products p
    ON oi.ProductID = p.ProductID
WHERE o.Status = 'Completed'
GROUP BY
    p.ProductName,
    p.ProductID
ORDER BY units DESC
LIMIT 10;
