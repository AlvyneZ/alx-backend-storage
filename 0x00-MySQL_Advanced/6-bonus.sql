-- A script that creates a stored procedure 'AddBonus'
--  that adds a new correction for a student. 'users',
--  'projects' and 'corrections' tables are defined in
--  6-init.sql
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus (user_id INT, project_name VARCHAR(255), score FLOAT)
BEGIN
    DECLARE project_id INT;
    SET project_id = (
        SELECT `id` FROM `projects`
        WHERE `name` = project_name
        LIMIT 1
    );
    IF project_id IS NULL
    THEN
        INSERT INTO `projects` (`name`) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;
    INSERT INTO `corrections` (`user_id`, `project_id`, `score`)
        VALUES (user_id, project_id, score);
END;
$$
DELIMITER ;
