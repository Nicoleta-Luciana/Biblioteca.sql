BEGIN
    INSERT INTO authors (author_id, name, country) VALUES (1, 'Mihai Eminescu', 'Romania');
    INSERT INTO authors (author_id, name, country) VALUES (2, 'J.K. Rowling', 'Marea Britanie');
    INSERT INTO authors (author_id, name, country) VALUES (3, 'Gabriel Garcia Marquez', 'Columbia');

    INSERT INTO books (book_id, title, author_id, category, status) 
    VALUES (1, 'Luceafarul', 1, 'Poezie', 'Disponibil');

    INSERT INTO books (book_id, title, author_id, category, status) 
    VALUES (2, 'Harry Potter', 2, 'Fictiune', 'Imprumutat');

    INSERT INTO books (book_id, title, author_id, category, status) 
    VALUES (3, 'Un veac de singuratate', 3, 'Roman', 'Disponibil');

    INSERT INTO members (member_id, name, email, phone, join_date) 
    VALUES (1, 'Ion Popescu', 'ion.popescu@gmail.com', '0712345678', TO_DATE('2024-01-15', 'YYYY-MM-DD'));

    INSERT INTO members (member_id, name, email, phone, join_date) 
    VALUES (2, 'Maria Ionescu', 'maria.ionescu@gmail.com', '0723456789', TO_DATE('2023-11-10', 'YYYY-MM-DD'));

    INSERT INTO loans (loan_id, book_id, member_id, loan_date, return_date) 
    VALUES (1, 2, 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-15', 'YYYY-MM-DD'));
END;
