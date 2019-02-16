use geodata;

ALTER TABLE _countries
    add id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    add title VARCHAR(150) NOT NULL,
    ADD INDEX (title)
    ;

ALTER TABLE _regions
    add id INT PRIMARY KEY AUTO_INCREMENT, 
    add country_id INT Foreign Key _countries (id), 
    add title VARCHAR(150),
    ADD INDEX (title)
    ;

ALTER TABLE _cities
    add id INT PRIMARY KEY AUTO_INCREMENT, 
    add country_id INT Foreign Key _countries (id),
    add important TINYINT(1),
    add region_id INT Foreign Key _regions (id),
    add title VARCHAR(150),
    ADD INDEX (title)
    ;