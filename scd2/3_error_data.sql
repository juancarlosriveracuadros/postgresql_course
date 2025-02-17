    -- Multiple current records for same customer (Error 1)
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
    5, 'Carlos', 'Doe', 'john@example.com', '456 Second St', 'New York', 'USA',
    '2023-02-01 00:00:00', '2023-02-05 00:00:00', TRUE
);

INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
    5, 'Carlos', 'Doe', 'john@example.com', 'test', 'Cali', 'USA',
    '2023-02-05 00:00:00', NULL, TRUE
);

-- End date before start date (Error 2)
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
    6, 'Jana', 'Smith', 'jane@example.com', '789 Oak St', 'Boston', 'USA',
    '2023-06-01 00:00:00', '2023-01-01 00:00:00', FALSE
);

-- Current record with end date (Error 3)
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
    7, 'Bobby', 'Wilson', 'bob@example.com', '321 Pine St', 'Chicago', 'USA',
    '2023-01-01 00:00:00', '2023-12-31 00:00:00', TRUE
);

-- Gap in dates between records (Error 4)
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
   8, 'Alisa', 'Brown', 'alice@example.com', '567 Maple St', 'Miami', 'USA',
    '2023-01-01 00:00:00', '2023-03-01 00:00:00', FALSE
);

INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
    8, 'Alisa', 'Brown', 'alice@example.com', '890 Palm St', 'Miami', 'USA',
    '2023-04-01 00:00:00', NULL, TRUE
);

-- Overlapping dates (Error 5)
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
    9, 'Charly', 'Davis', 'charlie@example.com', '432 Elm St', 'Seattle', 'USA',
    '2023-01-01 00:00:00', '2023-06-01 00:00:00', FALSE
);

INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
    9, 'Charly', 'Davis', 'charlie@example.com', '765 Cedar St', 'Seattle', 'USA',
    '2023-05-01 00:00:00', NULL, TRUE
);

-- Non-current record without end date (Error 6)
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES (
    10, 'Rodrigo', 'Miller', 'david@example.com', '098 Beach St', 'LA', 'USA',
    '2023-01-01 00:00:00', NULL, FALSE
);