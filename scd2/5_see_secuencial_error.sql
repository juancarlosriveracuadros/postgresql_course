WITH customer_testing AS (
	SELECT 
        customer_id,
        effective_start_date,
        effective_end_date,
        is_current,
        created_at,
        LAG(effective_end_date) OVER (PARTITION BY customer_id ORDER BY effective_start_date) as previous_end_date,
		LAG(customer_id) OVER (PARTITION BY customer_id ORDER BY effective_start_date) as previous_customer_id
    FROM dim_customer
	ORDER BY 
    customer_id ASC,
    effective_start_date ASC)
SELECT *
FROM customer_testing
where(previous_end_date IS DISTINCT FROM effective_start_date and customer_id  = previous_customer_id )