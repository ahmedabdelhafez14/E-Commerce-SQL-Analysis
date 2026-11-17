-- 05: Payment Method Analysis
-- First calculate each completed order's total, then aggregate by payment method.

WITH order_totals AS
(
    SELECT
        o.OrderID,
        o.PaymentMethod,
        SUM(oi.quantity * oi.unitPrice) AS orderSales
    FROM orders o
    INNER JOIN order_items oi
        ON o.OrderID = oi.OrderID
    WHERE o.Status = 'Completed'
    GROUP BY
        o.OrderID,
        o.PaymentMethod
)
SELECT
    PaymentMethod,
    COUNT(*) AS totalOrders,
    ROUND(SUM(orderSales), 2) AS totalSales,
    ROUND(AVG(orderSales), 2) AS avgOrderValue,
    ROUND(
        SUM(orderSales) * 100 /
        NULLIF(SUM(SUM(orderSales)) OVER(), 0),
        2
    ) AS salesPercentage
FROM order_totals
GROUP BY PaymentMethod
ORDER BY totalSales DESC;
