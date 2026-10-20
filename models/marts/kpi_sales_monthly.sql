SELECT
    d.year,
    d.month,
    d.month_name,
    SUM(f.sales_amount) AS total_sales,
    SUM(f.quantity) AS units_sold,
    COUNT(DISTINCT f.sale_id) AS total_sales_count,
    CASE
        WHEN COUNT(DISTINCT f.sale_id) = 0 THEN 0
        ELSE SUM(f.sales_amount) / COUNT(DISTINCT f.sale_id)
    END AS average_ticket
FROM {{ ref('fact_sales') }} f
INNER JOIN {{ ref('dim_date') }} d
    ON f.date_key = d.date_key
GROUP BY
    d.year,
    d.month,
    d.month_name