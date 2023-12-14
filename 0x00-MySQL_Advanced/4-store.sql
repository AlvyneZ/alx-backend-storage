-- A script that creates a trigger that decreases the quantity
--  of an item after adding a new order. ''items' and 'orders'
--  tables are defined in 4-init.sql
DROP TRIGGER IF EXISTS TRG_decOrderQtty;
DELIMITER $$
CREATE TRIGGER TRG_decOrderQtty BEFORE INSERT
    ON `orders` FOR EACH ROW
    BEGIN
        DECLARE item_exists BOOLEAN;
        SELECT 1 INTO @item_exists FROM `items`
            WHERE `items`.`name` = NEW.`item_name`;
        IF @item_exists = 1
        THEN
            UPDATE `items`
            SET `items`.`quantity` = `items`.`quantity` - NEW.`number`
            WHERE `items`.`name` = NEW.`item_name`;
		END IF;
    END;
$$
DELIMITER ;
