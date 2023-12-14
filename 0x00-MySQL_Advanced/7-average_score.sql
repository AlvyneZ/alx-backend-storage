-- A script that creates a stored procedure 'ComputeAverageScoreForUser'
--  that computes and store the average score for a student. 'users',
--  'projects' and 'corrections' tables are defined in 7-init.sql
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser (user_id INT)
BEGIN
    DECLARE average FLOAT;
    SET average = (
		SELECT AVG(`final_corrections`.`final`)
			FROM (
				SELECT MAX(`corrections`.`score`) AS `final`
					FROM `corrections`
					WHERE `corrections`.`user_id` = user_id
					GROUP BY `corrections`.`project_id`
			) AS `final_corrections`
	);
    UPDATE `users`
        SET `average_score` = average
        WHERE `id` = user_id;
END;
$$
DELIMITER ;
