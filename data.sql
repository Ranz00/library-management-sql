-- Insert authors
INSERT INTO Authors (name) VALUES ('George Orwell');
INSERT INTO Authors (name) VALUES ('Jane Austen');
INSERT INTO Authors (name) VALUES ('J.K. Rowling');

-- Insert books
INSERT INTO Books (title, author_id, published_year) VALUES ('1984', 1, 1949);
INSERT INTO Books (title, author_id, published_year) VALUES ('Pride and Prejudice', 2, 1813);
INSERT INTO Books (title, author_id, published_year) VALUES ('Harry Potter and the Philosopher''s Stone', 3, 1997);

-- Insert members
INSERT INTO Members (full_name, email) VALUES ('Alice Johnson', 'alice@example.com');
INSERT INTO Members (full_name, email) VALUES ('Bob Smith', 'bob@example.com');

-- Insert loans (example: Alice borrows 1984)
INSERT INTO Loans (member_id, book_id, loan_date) VALUES (1, 1, CURRENT_DATE);
