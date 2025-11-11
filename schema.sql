CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT REFERENCES Authors(author_id),
    published_year INT CHECK (published_year > 1900)
);

CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Loans (
    loan_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES Members(member_id),
    book_id INT REFERENCES Books(book_id),
    loan_date DATE DEFAULT CURRENT_DATE,
    return_date DATE
);
