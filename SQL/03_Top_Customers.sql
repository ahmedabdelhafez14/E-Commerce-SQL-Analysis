-- 03: Top 10 Customers by Total Sales
-- Only Completed orders are included.

WITH customer_sales AS
(
    SELECT
        o.CustomerID,
        COUNT(DISTINCT o.OrderID) AS totalOrders,
        SUM(oi.quantity * oi.unitPrice) AS totalSales
    FROM orders o
    INNER JOIN order_items oi
        ON o.OrderID = oi.OrderID
    WHERE o.Status = 'Completed'
    GROUP BY o.CustomerID
),
ranked AS
(
    SELECT
        *,
        ROUND(totalSales / NULLIF(totalOrders, 0), 2) AS avgOrderValue,
        DENSE_RANK() OVER(ORDER BY totalSales DESC) AS rank_sales,
        DENSE_RANK() OVER(ORDER BY totalOrders DESC) AS rank_orders
    FROM customer_sales
)
SELECT
    c.CustomerID,
    c.CustomerName,
    r.totalOrders,
    ROUND(r.totalSales, 2) AS totalSales,
    r.avgOrderValue,
    r.rank_sales,
    r.rank_orders
FROM ranked r
INNER JOIN customers c
    ON r.CustomerID = c.CustomerID
WHERE r.rank_sales <= 10
ORDER BY
    r.rank_sales,
    r.totalSales DESC;
