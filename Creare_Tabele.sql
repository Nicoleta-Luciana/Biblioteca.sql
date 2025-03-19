CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    country VARCHAR2(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR2(150) NOT NULL,
    author_id INT,
    category VARCHAR2(50),
    status VARCHAR2(20) DEFAULT 'disponibil',
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    phone VARCHAR2(20),
    join_date DATE DEFAULT SYSDATE
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE DEFAULT SYSDATE,
    return_date DATE,
    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES Books(book_id),
    CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
