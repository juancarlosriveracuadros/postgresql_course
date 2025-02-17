CREATE TABLE dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(200),
    city VARCHAR(50),
    country VARCHAR(50),
    effective_start_date TIMESTAMP NOT NULL,
    effective_end_date TIMESTAMP,
    is_current BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for better performance
CREATE INDEX idx_customer_id ON dim_customer(customer_id);
CREATE INDEX idx_is_current ON dim_customer(is_current);

-- Customer 1: Two address changes, properly sequenced
