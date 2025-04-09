CREATE TABLE latam_miles (
    customer_id UUID,
    date TIMESTAMP,
    description TEXT,
    type TEXT,
    source TEXT,
    miles INT,
    monetary_amount FLOAT,
    balance FLOAT,
    PRIMARY KEY (customer_id, date)
) WITH CLUSTERING ORDER BY (date DESC);
