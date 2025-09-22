 Create Authors table
CREATE TABLE Authors (
    author_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL
);

Create Books table
CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(200) NOT NULL,
    author_id INTEGER,
    year_published YEAR,
    genre VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

Create Members table
CREATE TABLE Members (
    member_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    join_date DATE
);
 Create Loans table
CREATE TABLE Loans (
    loan_id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER,
    member_id INTEGER,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

Insert sample data
INSERT INTO Authors (name) VALUES ('J.K. Rowling'), ('George Orwell'), ('Jane Austen');

INSERT INTO Books (title, author_id, year_published, genre) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy'),
('1984', 2, 1949, 'Dystopian'),
('Pride and Prejudice', 3, 1813, 'Romance');

INSERT INTO Members (name, join_date) VALUES ('Akshay', '2023-01-15'), ('Benzie', '2024-06-20');

INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2025-09-01', '2025-09-10'),
(3, 2, '2025-09-05', NULL);
Query to display loan details
SELECT m.name AS Member, b.title AS Book, l.loan_date, l.return_date
FROM Loans l
JOIN Members m ON l.member_id = m.member_id
JOIN Books b ON l.book_id = b.book_id;