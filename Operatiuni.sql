-- Afisare imprumut cu detalii despre carte si membru
SELECT l.loan_id, b.title AS book_title, m.name AS member_name, 
       l.loan_date, l.return_date
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id;

-- Update status
UPDATE books
SET status = 'Disponibil'
WHERE book_id = 2;

-- Stergere imprumut
DELETE FROM loans
WHERE loan_id = 1;

-- Numar carti disponibile
SELECT COUNT(*) AS total_disponibile
FROM books
WHERE status = 'Disponibil';

-- Carti imprumutate
SELECT b.title
FROM books b
WHERE b.status = 'Imprumutat';

-- Carti scrise de J.K. Rowling
SELECT b.title
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.name = 'J.K. Rowling';

-- Stergere constrangeri
ALTER TABLE books DROP CONSTRAINT fk_author;
ALTER TABLE loans DROP CONSTRAINT fk_book;
ALTER TABLE loans DROP CONSTRAINT fk_member;

-- Creare constrangeri
ALTER TABLE books
ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id);
ALTER TABLE loans
ADD CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES books(book_id);
ALTER TABLE loans
ADD CONSTRAINT fk_member FOREIGN KEY (member_id) REFERENCES members(member_id);

-- Lista ordonata alfabetic
SELECT b.book_id, b.title, a.name AS author, b.category, b.status
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE b.status = 'Disponibil'
ORDER BY b.title;

-- Numar imprumuturi per membru
SELECT m.member_id, m.name, COUNT(l.loan_id) AS numar_imprumuturi
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
GROUP BY m.member_id, m.name;

-- View carti disponibile
CREATE OR REPLACE VIEW vw_carti_disponibile AS
SELECT b.book_id, b.title, a.name AS author, b.category, b.status
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE b.status = 'Disponibil';

-- View membri cu imprumuturi active
CREATE OR REPLACE VIEW vw_membri_imprumuturi AS
SELECT m.member_id, m.name, m.email, b.title AS book_title, l.loan_date, l.return_date
FROM members m
JOIN loans l ON m.member_id = l.member_id
JOIN books b ON l.book_id = b.book_id
WHERE b.status = 'Imprumutat';

-- Trigger pentru status 'Imprumutat'
CREATE OR REPLACE TRIGGER trg_set_status_imprumutat
AFTER INSERT ON Loans
FOR EACH ROW
BEGIN
    UPDATE Books
    SET status = 'Imprumutat'
    WHERE book_id = :NEW.book_id;
END;

-- Trigger pentru status 'Disponibil'
CREATE OR REPLACE TRIGGER trg_set_status_disponibil
AFTER DELETE ON Loans
FOR EACH ROW
BEGIN
    UPDATE Books
    SET status = 'Disponibil'
    WHERE book_id = :OLD.book_id;
END;

-- Testare trigger
INSERT INTO loans (loan_id, book_id, member_id, loan_date, return_date)
VALUES (2, 3, 2, SYSDATE, NULL);

SELECT * FROM books WHERE book_id = 3;
DELETE FROM loans WHERE loan_id = 2;
SELECT * FROM books WHERE book_id = 3;
