-- Trigger to prevent duplicate active loans for the same book
CREATE OR REPLACE TRIGGER prevent_duplicate_loans
BEFORE INSERT ON Loans
FOR EACH ROW
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Loans
    WHERE book_id = :NEW.book_id AND return_date IS NULL;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'This book is already on loan.');
    END IF;
END;
