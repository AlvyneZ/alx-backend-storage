-- A script that creates a stored procedure 'ComputeAverageWeightedScoreForUsers'
--  that computes and stores the average weighted score for all students. 'users',
--  'projects' and 'corrections' tables are defined in 100-init.sql
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (user_id INT)
BEGIN
	DECLARE total_weight INT;
    DECLARE average FLOAT;

	CREATE TEMPORARY TABLE `final_corrections`
    SELECT `projects`.`weight` AS `weight`, MAX(`corrections`.`score`) AS `final`
		FROM `corrections`
		LEFT JOIN `projects` ON `projects`.`id` = `corrections`.`project_id`
		WHERE `corrections`.`user_id` = user_id
		GROUP BY `corrections`.`project_id`;

	SET total_weight = (
		SELECT SUM(`final_corrections`.`weight`)
		FROM `final_corrections`
	);

    SET average = (
		SELECT SUM(`final_corrections`.`final` * `final_corrections`.`weight`)
			FROM `final_corrections`
	) / total_weight;
    
    DROP TEMPORARY TABLE IF EXISTS `final_corrections`; 

    UPDATE `users`
        SET `average_score` = average
        WHERE `id` = user_id;
END;
$$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
	DECLARE n INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	SELECT COUNT(*) FROM `users` INTO n;
	WHILE i < n
	DO
		CALL ComputeAverageWeightedScoreForUser((
			SELECT id FROM users LIMIT i, 1
		));
		SET i = i + 1;
	END WHILE;
END;
$$
DELIMITER ;
