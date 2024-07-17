CREATE DATABASE hello_world_db;
USE hello_world_db;
CREATE TABLE greet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255)
);
INSERT INTO greet (message)
VALUES ("Hello, World!");
SELECT message
FROM greet
WHERE id = 1;