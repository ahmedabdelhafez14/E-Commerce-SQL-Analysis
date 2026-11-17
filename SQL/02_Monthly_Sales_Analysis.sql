-- 02: Monthly Sales Analysis
-- Only Completed orders are included.

SELECT
    YEAR(o.OrderDate) AS year_y,
    MONTH(o.OrderDate) AS month_m,
    MONTHNAME(o.OrderDate) AS month_name,
    ROUND(SUM(oi.quantity * oi.unitPrice), 2) AS totalSales
FROM orders o
INNER JOIN order_items oi
    ON o.OrderID = oi.OrderID
WHERE o.Status = 'Completed'
GROUP BY
    YEAR(o.OrderDate),
    MONTH(o.OrderDate),
    MONTHNAME(o.OrderDate)
ORDER BY
    year_y,
    month_m;
