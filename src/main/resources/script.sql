USE test;
DROP TABLE IF EXISTS part;
CREATE TABLE part
(id INT NOT NULL AUTO_INCREMENT, name VARCHAR(100)   NOT NULL,
needed TINYINT(1) DEFAULT 0 NOT NULL, number INT(4)  NOT NULL, PRIMARY KEY(id))
ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO part (name, needed, number) VALUES ('system block', 1, 10), ('matherboard', 1, 5),
('processor', 1, 4), ('power supply', 1, 7), ('video card', 0, 3), ('monitor', 0, 6),
('keyboard', 0, 4), ('RAM 1024', 1, 9), ('HDD', 1, 14),('sound card', 0, 6),
('computer mouse', 0, 8), ('cart reader', 0, 6), ('SSD', 0, 7),
('DVD driver', 0, 5), ('TV out', 0, 9), ('RAM 2048', 1, 9), ('cooler', 1, 8),
('blu-ray', 0, 3), ('optical mouse', 0, 7), ('joystick', 0, 6);
