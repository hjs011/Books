-- Active: 1710830958857@@database-2.c5iywe822rl5.ap-northeast-2.rds.amazonaws.com@3306@data
CREATE TABLE Categories(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name varchar(255) NOT NULL,
    category_index INT
)

CREATE TABLE Authors(
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    age INT
)

CREATE TABLE Books(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    pub_year DATETIME NOT NULL,
    price INT NOT NULL,
    category_id INT,
    author_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) 
)

