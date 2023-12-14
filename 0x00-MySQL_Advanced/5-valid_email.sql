-- A script that creates a trigger that resets the attribute
--  valid_email only when the email has been changed. 'users'
--  table is defined in 5-init.sql
DROP TRIGGER IF EXISTS TRG_clrVldEmail;
DELIMITER $$
CREATE TRIGGER TRG_clrVldEmail BEFORE UPDATE
    ON `users` FOR EACH ROW
    BEGIN
		IF NOT (NEW.`email` = OLD.`email`)
        THEN
			SET NEW.`valid_email` = 0;
		END IF;
    END;
$$
DELIMITER ;
