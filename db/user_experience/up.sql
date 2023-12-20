-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create table for users
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for user preferences
CREATE TABLE user_preferences (
    preference_id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    preferences JSONB
);

-- Create table for user activity logs
CREATE TABLE user_activity_logs (
    log_id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    activity TEXT,
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert seed data for users
INSERT INTO users (id, username, email, password_hash) VALUES
('9d7097a7-234b-47a8-9f02-5c089aefa8a4', 'user0', 'user0@example.com', 'hash1'),
('a58c743d-7d7d-447f-b9a0-24b1bfd172d3', 'user1', 'user1@example.com', 'hash2'),
('37778ff0-251c-470d-b2f2-3b574437804d', 'user2', 'user2@example.com', 'hash3'),
('7f80adf9-5f99-468c-ae23-45b2808fe390', 'user3', 'user3@example.com', 'hash4'),
('4b10f819-6182-44ff-a181-0df9e408ec5c', 'user4', 'user4@example.com', 'hash5'),
('481ba3ef-ac60-49a9-8baf-3e59869e3141', 'user5', 'user5@example.com', 'hash6'),
('dd96cb2f-174c-410d-a587-94856dbf4d3a', 'user6', 'user6@example.com', 'hash7'),
('16dd0afe-b2cd-4871-9c6f-82a19c03a170', 'user7', 'user7@example.com', 'hash8'),
('169e6f00-2ea8-4504-b21b-eeafa57f8c73', 'user8', 'user8@example.com', 'hash9'),
('67faac8a-7441-4b1f-a39e-986f5b86d8b3', 'user9', 'user9@example.com', 'hash10'),
('8ecd385b-544d-4fc6-9f4c-aed9f6d42e24', 'user10', 'user10@example.com', 'hash11'),
('1633c66d-b047-4bf7-a341-80d004a2a5b1', 'user11', 'user11@example.com', 'hash12');

-- Insert seed data for user preferences
INSERT INTO user_preferences (user_id, preferences) VALUES
('9d7097a7-234b-47a8-9f02-5c089aefa8a4', '{"theme": "dark", "notifications": "enabled"}'),
('a58c743d-7d7d-447f-b9a0-24b1bfd172d3', '{"theme": "light", "notifications": "disabled"}'),
('37778ff0-251c-470d-b2f2-3b574437804d', '{"theme": "dark", "notifications": "enabled"}'),
('7f80adf9-5f99-468c-ae23-45b2808fe390', '{"theme": "light", "notifications": "disabled"}'),
('4b10f819-6182-44ff-a181-0df9e408ec5c', '{"theme": "dark", "notifications": "enabled"}'),
('481ba3ef-ac60-49a9-8baf-3e59869e3141', '{"theme": "light", "notifications": "disabled"}'),
('dd96cb2f-174c-410d-a587-94856dbf4d3a', '{"theme": "dark", "notifications": "enabled"}'),
('16dd0afe-b2cd-4871-9c6f-82a19c03a170', '{"theme": "light", "notifications": "disabled"}'),
('169e6f00-2ea8-4504-b21b-eeafa57f8c73', '{"theme": "dark", "notifications": "enabled"}');