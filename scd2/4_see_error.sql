-- Error 1: Multiple current records for same customer
SELECT customer_id, COUNT(*) as current_records
FROM dim_customer
WHERE is_current = TRUE
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Error 2: End date before start date
SELECT customer_id, effective_start_date, effective_end_date
FROM dim_customer
WHERE effective_end_date < effective_start_date;

-- Error 3: Current record with end date
SELECT customer_id, effective_start_date, effective_end_date
FROM dim_customer
WHERE is_current = TRUE 
AND effective_end_date IS NOT NULL;

-- Error 4: Gap in dates between records
WITH date_gaps AS (
  SELECT 
    customer_id,
    effective_start_date,
    effective_end_date,
    LEAD(effective_start_date) OVER (PARTITION BY customer_id ORDER BY effective_start_date) as next_start_date
  FROM dim_customer
)
SELECT customer_id, effective_end_date, next_start_date
FROM date_gaps
WHERE effective_end_date IS NOT NULL 
AND next_start_date IS NOT NULL
AND next_start_date > effective_end_date;

-- Error 5: Overlapping dates
WITH date_overlaps AS (
  SELECT 
    customer_id,
    effective_start_date,
    effective_end_date,
    LAG(effective_end_date) OVER (PARTITION BY customer_id ORDER BY effective_start_date) as prev_end_date
  FROM dim_customer
)
SELECT customer_id, effective_start_date, prev_end_date
FROM date_overlaps
WHERE effective_start_date < prev_end_date;

-- Error 6: Non-current record without end date
SELECT customer_id, effective_start_date, effective_end_date
FROM dim_customer
WHERE is_current = FALSE 
AND effective_end_date IS NULL;
