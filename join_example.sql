-- https://www.techagilist.com/mainframe/db2/outer-join-step-by-step-walkthrough-with-examples/


-- Table a
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    active BOOLEAN
);

-- Table b
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO customers (customer_id, customer_name, country, active) VALUES
(1, 'John Doe', 'USA', true),
(2, 'Jane Smith', 'Canada', true),
(3, 'Bob Wilson', 'UK', false),
(4, 'Alice Brown', 'Australia', true);

INSERT INTO orders (order_id, customer_id, order_date, amount, status) VALUES
(101, 1, '2023-01-15', 150.00, 'completed'),
(102, 2, '2023-02-20', 299.99, 'completed'),
(103, 1, '2023-03-10', 89.99, 'pending'),
(104, 5, '2023-04-05', 199.99, 'completed'),
(105, 2, '2023-05-01', 449.99, 'cancelled');


-- Table a » 1,2,3,4
select * 
from customers 
LEFT JOIN orders 
on customers.customer_id = orders.customer_id;

-- Table a - b » 3,4
select * 
from customers 
LEFT JOIN orders 
on customers.customer_id = orders.customer_id 
where orders.customer_id is null;

-- Table b » 1,2,1,5,2
select * 
from customers 
RIGHT JOIN orders 
on customers.customer_id = orders.customer_id;

-- Table b - a » 5
select * 
from customers 
RIGHT JOIN orders 
on customers.customer_id = orders.customer_id
where customers.customer_id is null;

-- Table a oder/und b » 1,2,3,4,5
select * 
from customers 
FULL OUTER JOIN orders 
on customers.customer_id = orders.customer_id;

-- Table a or b but not a und b » 3,4,5
select * 
from customers 
FULL OUTER JOIN orders 
on customers.customer_id = orders.customer_id
where customers.customer_id is null 
OR orders.customer_id is null
;

--Table  a und b but not a or b » 1,2
select * 
from customers 
INNER JOIN orders 
on customers.customer_id = orders.customer_id
;

