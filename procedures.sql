CREATE OR REPLACE PROCEDURE loan_book(p_member_id INT, p_book_id INT) AS
    v_onloan INT;
BEGIN
    SELECT COUNT(*) INTO v_onloan
    FROM Loans
    WHERE book_id = p_book_id AND return_date IS NULL;

    IF v_onloan > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Book is already on loan.');
    ELSE
        INSERT INTO Loans(member_id, book_id, loan_date)
        VALUES (p_member_id, p_book_id, SYSDATE);
    END IF;
END;
CREATE OR REPLACE PROCEDURE return_book(p_member_id INT, p_book_id INT) AS
BEGIN
    UPDATE Loans
    SET return_date = SYSDATE
    WHERE member_id = p_member_id
      AND book_id = p_book_id
      AND return_date IS NULL;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'No active loan found for this book and member.');
    END IF;
END;
