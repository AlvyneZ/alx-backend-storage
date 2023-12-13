-- A script that creates a table  with ENUM in the current database
CREATE TABLE IF NOT EXISTS users(
    `id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255),
    `country` ENUM('US','CO','TN') NOT NULL DEFAULT 'US',
    CONSTRAINT UNQ_id UNIQUE(`id`),
    CONSTRAINT UNQ_email UNIQUE(`email`),
    CONSTRAINT PK_id PRIMARY KEY(`id`)
);
