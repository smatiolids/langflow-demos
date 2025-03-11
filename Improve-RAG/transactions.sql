CREATE TABLE banking_transactions (
    account_id UUID,              -- Unique identifier for the account
    transaction_id UUID,          -- Unique identifier for the transaction
    transaction_date TIMESTAMP,   -- Date and time of the transaction
    description TEXT,             -- Description of the transaction
    amount DECIMAL,               -- Amount of the transaction (positive for deposits, negative for withdrawals)
    currency TEXT,                -- Currency of the transaction (e.g., USD, EUR)
    transaction_type TEXT,        -- Type of transaction (e.g., deposit, withdrawal, transfer)
    category TEXT,                -- Category (e.g., groceries, salary, utilities)
    PRIMARY KEY (account_id, transaction_date, transaction_id)
) WITH CLUSTERING ORDER BY (transaction_date DESC);

CREATE CUSTOM INDEX banking_transactions_category ON default_keyspace.banking_transactions (category) USING 'StorageAttachedIndex' ;

INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID() '2025-03-10 14:30:00', 'Grocery Shopping', -45.75, 'USD', 'debit', 'groceries');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-09 18:15:00', 'Salary Deposit', 2500.00, 'USD', 'credit', 'salary');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-08 10:45:00', 'Electricity Bill', -120.50, 'USD', 'debit', 'utilities');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-07 16:20:00', 'Coffee Shop', -5.25, 'USD', 'debit', 'food & drink');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-06 12:10:00', 'Gym Membership', -40.00, 'USD', 'debit', 'fitness');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-05 09:00:00', 'Online Shopping', -99.99, 'USD', 'debit', 'shopping');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-04 14:30:00', 'Dinner at Restaurant', -75.60, 'USD', 'debit', 'food & drink');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-03 08:00:00', 'Freelance Payment', 500.00, 'USD', 'credit', 'income');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-02 11:50:00', 'Movie Ticket', -15.00, 'USD', 'debit', 'entertainment');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-03-01 20:30:00', 'Car Gas', -60.00, 'USD', 'debit', 'transportation');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-28 10:20:00', 'Water Bill', -45.00, 'USD', 'debit', 'utilities');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-27 22:15:00', 'Gift Purchase', -35.00, 'USD', 'debit', 'shopping');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-26 14:00:00', 'Interest Credit', 5.75, 'USD', 'credit', 'interest');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-25 17:40:00', 'Taxi Fare', -20.00, 'USD', 'debit', 'transportation');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-24 19:30:00', 'Health Insurance', -200.00, 'USD', 'debit', 'insurance');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-23 13:25:00', 'Phone Bill', -70.00, 'USD', 'debit', 'utilities');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-22 16:55:00', 'Concert Ticket', -120.00, 'USD', 'debit', 'entertainment');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-21 12:45:00', 'Loan Repayment', -300.00, 'USD', 'debit', 'loan');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-20 18:10:00', 'Online Course', -150.00, 'USD', 'debit', 'education');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-19 07:30:00', 'Pet Supplies', -30.00, 'USD', 'debit', 'pets');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-18 09:40:00', 'ATM Withdrawal', -100.00, 'USD', 'debit', 'cash');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-17 21:10:00', 'Streaming Subscription', -12.99, 'USD', 'debit', 'entertainment');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-16 15:50:00', 'Grocery Shopping', -55.20, 'USD', 'debit', 'groceries');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-15 08:05:00', 'Salary Bonus', 800.00, 'USD', 'credit', 'salary');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-14 18:00:00', 'Book Purchase', -22.75, 'USD', 'debit', 'education');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-13 10:15:00', 'Hotel Booking', -250.00, 'USD', 'debit', 'travel');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-12 19:35:00', 'Uber Ride', -18.50, 'USD', 'debit', 'transportation');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-11 14:20:00', 'Flight Ticket', -500.00, 'USD', 'debit', 'travel');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-10 22:25:00', 'Rent Payment', -1200.00, 'USD', 'debit', 'housing');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-09 16:40:00', 'Concert Merchandise', -45.99, 'USD', 'debit', 'shopping');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-08 11:15:00', 'Medical Checkup', -100.00, 'USD', 'debit', 'healthcare');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-07 20:05:00', 'Lottery Winnings', 1000.00, 'USD', 'credit', 'gambling');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-06 09:30:00', 'Stock Investment', -500.00, 'USD', 'debit', 'investment');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-05 13:20:00', 'Restaurant Bill', -65.00, 'USD', 'debit', 'food & drink');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-04 15:10:00', 'Credit Card Payment', -400.00, 'USD', 'debit', 'loan');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-03 12:00:00', 'Bitcoin Purchase', -700.00, 'USD', 'debit', 'investment');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-02 19:00:00', 'Home Repair', -150.00, 'USD', 'debit', 'home');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-02-01 08:45:00', 'Child Tuition Fee', -500.00, 'USD', 'debit', 'education');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-31 10:55:00', 'Amazon Refund', 75.99, 'USD', 'credit', 'refund');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-30 22:15:00', 'Weekend Trip', -300.00, 'USD', 'debit', 'travel');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-29 18:30:00', 'Music Streaming Subscription', -9.99, 'USD', 'debit', 'entertainment');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-28 14:50:00', 'Online Game Purchase', -29.99, 'USD', 'debit', 'entertainment');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-27 11:10:00', 'Car Repair', -200.00, 'USD', 'debit', 'transportation');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-26 16:20:00', 'Charity Donation', -50.00, 'USD', 'debit', 'charity');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-25 20:40:00', 'Stock Dividend', 250.00, 'USD', 'credit', 'investment');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-24 13:35:00', 'Fast Food Lunch', -12.50, 'USD', 'debit', 'food & drink');
INSERT INTO banking_transactions (account_id, transaction_id, transaction_date, description, amount, currency, transaction_type, category) VALUES 
   (9868afb8-a4b9-4ec7-80ae-b5b0ff3e4607, UUID(), '2025-01-23 09:20:00', 'Gift Card Purchase', -40.00, 'USD', 'debit', 'shopping');