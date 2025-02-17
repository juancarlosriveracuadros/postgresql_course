INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES
    (1, 'John', 'Doe', 'john@example.com', '123 Main St', 'New York', 'USA',
    '2023-01-01 00:00:00', '2023-06-01 00:00:00', FALSE),
    
    (1, 'John', 'Doe', 'john@example.com', '456 Oak Ave', 'New York', 'USA',
    '2023-06-01 00:00:00', '2023-12-01 00:00:00', FALSE),
    
    (1, 'John', 'Doe', 'john@example.com', '789 Pine St', 'New York', 'USA',
    '2023-12-01 00:00:00', NULL, TRUE);

-- Customer 2: One address change
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES
    (2, 'Jane', 'Smith', 'jane@example.com', '321 Elm St', 'Boston', 'USA',
    '2023-01-01 00:00:00', '2023-08-15 00:00:00', FALSE),
    
    (2, 'Jane', 'Smith', 'jane@example.com', '654 Maple Ave', 'Boston', 'USA',
    '2023-08-15 00:00:00', NULL, TRUE);

-- Customer 3: No changes, single record
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES
    (3, 'Bob', 'Wilson', 'bob@example.com', '147 Cedar Ln', 'Chicago', 'USA',
    '2023-01-01 00:00:00', NULL, TRUE);

-- Customer 4: Multiple changes including city change
INSERT INTO dim_customer (
    customer_id, first_name, last_name, email, address, city, country, 
    effective_start_date, effective_end_date, is_current
) VALUES
    (4, 'Alice', 'Brown', 'alice@example.com', '963 First St', 'Miami', 'USA',
    '2023-01-01 00:00:00', '2023-03-15 00:00:00', FALSE),
    
    (4, 'Alice', 'Brown', 'alice@example.com', '852 Second St', 'Miami', 'USA',
    '2023-03-15 00:00:00', '2023-09-01 00:00:00', FALSE),
    
    (4, 'Alice', 'Brown', 'alice@example.com', '741 Third St', 'Orlando', 'USA',
    '2023-09-01 00:00:00', NULL, TRUE);