USE emart;

SHOW TABLES;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

INSERT INTO Customer
(customer_name, email, phone)
VALUES
('Arun', 'arun@gmail.com', '9876543210'),
('Riya', 'riya@gmail.com', '9876543211'),
('Kavin', 'kavin@gmail.com', '9876543212');

SELECT * FROM Customer;
USE emart;

INSERT INTO Review
(customer_id, product_id, review_text, review_date)
VALUES
(1, 1, 'Very good product', '2026-08-25'),
(2, 4, 'Good quality', '2026-08-26'),
(3, 5, 'Nice product', '2026-08-27'),
(1, 2, 'Good mobile', '2026-08-28'),
(2, 3, 'Average quality', '2026-08-29');

SELECT * FROM Review;
USE emart;

-- Create Review table
CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    review_text VARCHAR(255),
    review_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
);

-- Create Rating table
CREATE TABLE Rating (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    review_id INT,
    rating INT,

    FOREIGN KEY (review_id)
        REFERENCES Review(review_id)
);
USE emart;

INSERT INTO Rating
(review_id, rating)
VALUES
(1, 5),
(2, 4),
(3, 5),
(4, 4),
(5, 3);

SELECT * FROM Rating;
USE emart;


SELECT
    Product.product_name,
    AVG(Rating.rating) AS average_rating
FROM Review
JOIN Product
    ON Review.product_id = Product.product_id
JOIN Rating
    ON Review.review_id = Rating.review_id
GROUP BY Product.product_name;
SELECT
    Product.product_name,
    AVG(Rating.rating) AS average_rating
FROM Review
JOIN Product
    ON Review.product_id = Product.product_id
JOIN Rating
    ON Review.review_id = Rating.review_id
GROUP BY Product.product_name
HAVING AVG(Rating.rating) >= 4;
