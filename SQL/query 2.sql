-- Import USERS
COPY users FROM 'D:/Personal/Vishal/Projects/persona_pulse/users.csv' DELIMITER ',' CSV HEADER;

-- Import PRODUCTS
COPY products FROM 'D:/Personal/Vishal/Projects/persona_pulse/products.csv' DELIMITER ',' CSV HEADER;

-- Import ORDERS
COPY orders FROM 'D:/Personal/Vishal/Projects/persona_pulse/orders.csv' DELIMITER ',' CSV HEADER;

-- Import RETURNS
COPY returns FROM 'D:/Personal/Vishal/Projects/persona_pulse/returns.csv' DELIMITER ',' CSV HEADER;

-- Import PRODUCT VIEWS
COPY product_views FROM 'D:/Personal/Vishal/Projects/persona_pulse/product_views.csv' DELIMITER ',' CSV HEADER;


SELECT persona, COUNT(*) FROM users GROUP BY persona;
