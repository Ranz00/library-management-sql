-- List all books with their authors
SELECT b.title, a.name AS author
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

-- Find all books currently on loan
SELECT b.title, m.full_name, l.loan_date
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
JOIN Members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL;

-- Top 5 most borrowed books
SELECT b.title, COUNT(*) AS times_borrowed
FROM Loans l
JOIN Books b ON l.book_id = b.book_id
GROUP BY b.title
ORDER BY times_borrowed DESC
LIMIT 5;

-- Members with overdue loans (assuming >30 days)
SELECT m.full_name, b.title, l.loan_date
FROM Loans l
JOIN Members m ON l.member_id = m.member_id
JOIN Books b ON l.book_id = b.book_id
WHERE l.return_date IS NULL
  AND l.loan_date < CURRENT_DATE - INTERVAL '30 days';
