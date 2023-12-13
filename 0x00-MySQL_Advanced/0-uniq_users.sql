-- A script that creates a table  with unique keys in the current database
CREATE TABLE IF NOT EXISTS users(
    `id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255),
    UNIQUE(`id`),
    UNIQUE(`email`),
    PRIMARY KEY(`id`)
);
