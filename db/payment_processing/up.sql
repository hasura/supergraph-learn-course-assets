-- Assuming the users table is the same as in the User Experience Team's database
-- Create table for payment methods
CREATE TABLE payment_methods (
    id SERIAL PRIMARY KEY,
    user_id UUID,
    method_details JSONB
);

-- Create table for transactions
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    user_id UUID,
    method_id INT REFERENCES payment_methods(id),
    amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50)
);

-- Insert seed data for payment methods
INSERT INTO payment_methods (user_id, method_details) VALUES
('9d7097a7-234b-47a8-9f02-5c089aefa8a4', '{"type": "credit_card", "last_four": "1234"}'),
('a58c743d-7d7d-447f-b9a0-24b1bfd172d3', '{"type": "debit_card", "last_four": "5678"}');

-- Insert seed data for transactions
INSERT INTO transactions (user_id, amount, status) VALUES
('9d7097a7-234b-47a8-9f02-5c089aefa8a4', 100.00, 'Completed'),
('a58c743d-7d7d-447f-b9a0-24b1bfd172d3', 50.00, 'Pending');