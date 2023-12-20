CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create table for categories
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create table for suppliers
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_info JSONB
);

-- Create table for products
CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    category_id INT REFERENCES categories(category_id),
    supplier_id INT REFERENCES suppliers(supplier_id)
);

-- Insert seed data for categories
INSERT INTO categories (name, description) VALUES
('Electronics', 'Electronic gadgets and devices'),
('Home Appliances', 'Appliances for everyday home use');

-- Insert seed data for suppliers
INSERT INTO suppliers (name, contact_info) VALUES
('GadgetPro', '{"email": "contact@gadgetpro.com", "phone": "123-456-7890"}'),
('HomeGoodies', '{"email": "info@homegoodies.com", "phone": "098-765-4321"}');

-- Insert seed data for products
INSERT INTO products (id, name, description, price, category_id, supplier_id) VALUES
('e5b396a1-6038-40bb-86d5-24fd69106ae7', 'Smartphone', 'Latest model with advanced features', 799.99, 1, 1),
('989dba2f-dfc9-4eb6-86df-e6542a25444e', 'Microwave Oven', 'Energy-efficient with multiple modes', 299.99, 2, 2),
('8a64f7bd-96e7-491b-b8f8-4ff509b22a75', 'Wireless Headphones', 'Noise-cancelling, over-ear design', 199.99, 1, 1),
('1ca9f6b0-20b3-4f64-b650-ccd46bf89517', 'Blender', 'High-powered with multiple speeds', 89.99, 2, 2),
('205e1a25-7ca8-43e9-84f9-d8f86b38a123', 'Smartwatch', 'Feature-rich with health tracking', 249.99, 1, 1),
('d59d4f08-01ba-4544-8688-57ea3db5680d', 'Coffee Maker', 'Programmable and easy to clean', 119.99, 2, 2),
('1792cb60-06d7-4450-af16-bcf5a4bfe54a', 'Tablet', 'Lightweight, high-resolution screen', 499.99, 1, 1),
('f7df2321-9c3a-4e23-bc22-865fb5790a62', 'Air Purifier', 'HEPA filter with smart sensors', 179.99, 2, 2),
('4344eb00-10a1-415a-8419-d06e73af6f4d', 'E-reader', 'E-ink technology for eye comfort', 129.99, 1, 1),
('11202814-0bbf-48e2-a747-941ed8eb8ebc', 'Toaster Oven', 'Convection feature for even baking', 95.99, 2, 2);
