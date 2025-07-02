-- USERS TABLE
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    signup_date DATE,
    location VARCHAR(100),
    view_count INT,
    order_count INT,
    return_count INT,
    persona VARCHAR(50)
);

-- PRODUCTS TABLE
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    rating NUMERIC(2,1)
);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product_id INT,
    order_date DATE,
    amount NUMERIC(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- RETURNS TABLE
CREATE TABLE returns (
    user_id INT,
    order_id INT,
    return_reason VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- PRODUCT VIEWS TABLE
CREATE TABLE product_views (
    user_id INT,
    product_id INT,
    category VARCHAR(50),
    timestamp TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
