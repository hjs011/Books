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

CREATE TABLE Users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    age INT
)

CREATE TABLE Purchases(
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_date DATETIME NOT NULL,
    quantity INT NOT NULL,
    purchase_price INT NOT NULL,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
)

# 모든 저자의 이름과 나이 출력
SELECT name, age FROM Authors;

# 출판 연도가 2020년 이후인 모든 책을 출력
SELECT * FROM Books WHERE YEAR(pub_year) > 2020;

# 2024년 구매한 모든 내역을 출력 / user_id, book_id, purchase_date 표시
SELECT user_id, book_id, purchase_date 
FROM Purchases
WHERE YEAR(purchase_date) = 2024;

# 서울에 거주하는 모든 유저의 이름, 주소 출력
SELECT name, address 
FROM Users
WHERE address = '서울'

# 가격이 높은 순서대로 책을 출력
SELECT * FROM Books ORDER BY price DESC;

# 카테고리 이름에 '과학'이 포함된 모든 카테고리 출력
SELECT * FROM Categories WHERE category_name='과학'

# 28~30세 사이인 유저의 이메일, 나이 출력
SELECT email, age FROM Users WHERE age >= 28 and age <= 30;

# 매년 출판된 책의 수 출력 (연도순으로 내림차순 정렬)
SELECT YEAR(pub_year) as 'year', count(*) as 'total_books' FROM Books GROUP BY YEAR(pub_year) ORDER BY count(*) DESC;

# 구매내역에서 구매 수량이 4보다 큰 모든 내역 출력
SELECT * FROM Purchases WHERE quantity > 4;

# 모든 책의 이름, 카테고리 출력
SELECT title, category_name FROM Books INNER JOIN Categories ON Books.category_id = Categories.category_id;
 
# 이름이 '김'으로 시작하는 모든 유저 출력
SELECT * FROM Users WHERE name LIKE '김%';


# 가장 비싼 책 5권 출력
SELECT * FROM Books ORDER BY price DESC LIMIT 5;

# 모든 사용자의 평균 나이 출력
SELECT AVG(age) as 'average_age' FROM Users; 

# 각 작가가 출판한 총 책의 수 출력
SELECT Authors.author_id, count(*) as 'total_books' FROM Authors INNER JOIN Books ON Authors.author_id = Books.author_id GROUP BY author_id;

# 각 작가가 출판한 총 책의 수 출력 / (3개 이상 출판한 작가만)
SELECT Books.author_id, count(*) as 'total_books' FROM Authors INNER JOIN Books ON Authors.author_id = Books.author_id GROUP BY author_id HAVING count(*) >= 3;

# 책을 구매한 모든 유저의 이름을 출력



