-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create table for orders
CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    product_id UUID,
    quantity INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id UUID,
    customer_address TEXT
);

-- Create table for shipping details
CREATE TABLE shipping_details (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    order_id UUID,
    shipping_date TIMESTAMP,
    estimated_arrival_date TIMESTAMP,
    carrier VARCHAR(255),
    tracking_number VARCHAR(255)
);

-- Create table for customer activity logs
CREATE TABLE customer_activity_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    order_id UUID REFERENCES orders(id),
    activity TEXT,
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert seed data for orders
INSERT INTO orders (id, product_id, quantity, customer_id, customer_address) VALUES
('4552ae36-2074-4d23-b1a3-8fa6b573e59a', 'e5b396a1-6038-40bb-86d5-24fd69106ae7', 2, '9d7097a7-234b-47a8-9f02-5c089aefa8a4', '123 Main St, Springfield, MO, 65806'),
('c951f941-32d9-4af4-90f7-057e686f84f3', '989dba2f-dfc9-4eb6-86df-e6542a25444e', 1, 'a58c743d-7d7d-447f-b9a0-24b1bfd172d3', '456 Elm St, Rivertown, Dallas, TX, 75201');

-- Insert seed data for shipping details
INSERT INTO shipping_details (id, order_id, shipping_date, estimated_arrival_date, carrier, tracking_number) VALUES
('a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', '4552ae36-2074-4d23-b1a3-8fa6b573e59a', '2023-01-10 09:00:00', '2023-01-15 09:00:00', 'FastShip', 'FS123456789'),
('b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e', 'c951f941-32d9-4af4-90f7-057e686f84f3', '2023-01-11 10:00:00', '2023-01-16 10:00:00', 'QuickDeliver', 'QD987654321');

-- Insert additional seed data for customer activity logs
INSERT INTO customer_activity_logs (id, order_id, activity) VALUES
('a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', '4552ae36-2074-4d23-b1a3-8fa6b573e59a', 'Order placed'),
('b2c3d4e5-f6a7-8b9c-0d1e-2f3a4b5c6d7e', 'c951f941-32d9-4af4-90f7-057e686f84f3', 'Order placed');



