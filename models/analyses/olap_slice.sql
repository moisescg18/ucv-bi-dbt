SELECT
    d.year,
    SUM(f.sales_amount) AS total_sales
FROM {{ ref('fact_sales') }} f
JOIN {{ ref('dim_date') }} d
    ON f.date_key = d.date_key
WHERE d.year = 2026
GROUP BY d.year