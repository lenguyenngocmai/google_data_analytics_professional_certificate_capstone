CREATE TABLE analytics.rfm_segment AS

WITH  rfm_value AS (
SELECT
    customer_id
    ,('2011-12-31'::DATE - MAX(invoice_date)::DATE) AS recency
    , COUNT(DISTINCT invoice_id) AS frequency
    , SUM(quantity*unit_price) AS monetary
FROM analytics.sales_transaction 
WHERE customer_id != 'no data'
GROUP BY customer_id

)

, rfm_quintiles AS (
    SELECT *
        , NTILE(5) OVER (ORDER BY recency DESC) AS recency_score
        , NTILE(5) OVER (ORDER BY frequency) AS frequency_score
        , NTILE(5) OVER (ORDER BY monetary) AS monetary_score
FROM rfm_value
ORDER BY 5 DESC

)

, rfm_table AS (

SELECT *
    , (recency_score*100 + frequency_score*10 + monetary_score) AS rfm
    , (recency_score + frequency_score + monetary_score) AS rfm_score
FROM rfm_quintiles
ORDER BY 9 DESC

)

SELECT *
    , CASE
        WHEN recency_score = 5 THEN '5-Most Active'
        WHEN recency_score = 4 THEN '4-Active'
        WHEN recency_score = 3 THEN '3-Normal'
        WHEN recency_score = 2 THEN '2-Churning'
        WHEN recency_score = 1 THEN '1-Churned'
        ELSE 'Other'
    END AS r_segment

    , CASE
        WHEN frequency_score = 5 THEN '5-Most Frequent'
        WHEN frequency_score = 4 THEN '4-Usually Frequent'
        WHEN frequency_score = 3 THEN '3-Normal Frequent'
        WHEN frequency_score = 2 THEN '2-Less Frequent'
        WHEN frequency_score = 1 THEN '1-Least Frequent'
        ELSE 'Other'
    END AS f_segment

    , CASE
        WHEN monetary_score = 5 THEN '5-Most Spend'
        WHEN monetary_score = 4 THEN '4-Much Spend'
        WHEN monetary_score = 3 THEN '3-Normal Spend'
        WHEN monetary_score = 2 THEN '2-Less Spend'
        WHEN monetary_score = 1 THEN '1-Least Spend'
        ELSE 'Other'
    END AS m_segment

    , CASE
        WHEN rfm IN (555, 554, 544, 545, 454, 455, 445) THEN 'Champions'
        WHEN rfm IN (334,335,343,344,345,353,354,355,434,435,443,444,453,534,535,543,553) THEN 'Loyal Customers'
        WHEN rfm IN (333,351,352,431,432,433,441,442,451,452,513,514,515,531,532,533,541,542,551,552) THEN 'Potential Loyalist'
        WHEN rfm IN (411,412,421,422,511,512,521,522) THEN 'Recent Customers'
        WHEN rfm IN (413,414,415,423,424,425,523,524,525) THEN 'Promising'
        WHEN rfm IN (322,323,324,325,332,341,342) THEN 'Need Attention'
        WHEN rfm IN (113,114,132,221,231,232,311,312,313,314,315,321,331) THEN 'About To Sleep'
        WHEN rfm IN (115,123,124,125,133,134,135,142,143,152,153,222,223,224,225,233, 234,235,241,242,243,244,245,251,252,253,254,255) THEN 'At Risk'
        WHEN rfm IN (144,145,154,155) THEN 'Cannot Lose Them'
        WHEN rfm IN (211,212,213,214,215) THEN 'Hibernating'
        WHEN rfm IN (111,112,121,122,131,141,151) THEN 'Lost'
        ELSE 'Other'
    END AS rfm_segment

    , CASE
        WHEN rfm_score >= 11 THEN 'High Value'
        WHEN rfm_score BETWEEN 7 AND 10 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS rfm_group
FROM rfm_table;