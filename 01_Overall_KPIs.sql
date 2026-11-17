-- E-Commerce Sales & Profitability Analysis
-- 01: Overall KPIs
-- Only Completed orders are included.

SELECT
    COUNT(DISTINCT o.OrderID) AS totalOrders,
    COUNT(DISTINCT o.CustomerID) AS totalCustomers,
    SUM(oi.quantity) AS totalUnits,
    ROUND(SUM(oi.quantity * oi.unitPrice), 2) AS totalSales,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)),
        2
    ) AS totalProfit,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)) * 100 /
        NULLIF(SUM(oi.quantity * oi.unitPrice), 0),
        2
    ) AS profitMargin,
    ROUND(
        SUM(oi.quantity * oi.unitPrice) /
        NULLIF(COUNT(DISTINCT o.OrderID), 0),
        2
    ) AS averageOrderValue,
    ROUND(
        SUM(oi.quantity * (oi.unitPrice - p.unitCost)) /
        NULLIF(COUNT(DISTINCT o.OrderID), 0),
        2
    ) AS averageProfitPerOrder,
    ROUND(
        SUM(oi.quantity) /
        NULLIF(COUNT(DISTINCT o.OrderID), 0),
        2
    ) AS averageUnitsPerOrder
FROM orders o
INNER JOIN order_items oi
    ON o.OrderID = oi.OrderID
INNER JOIN products p
    ON oi.ProductID = p.ProductID
WHERE o.Status = 'Completed';
