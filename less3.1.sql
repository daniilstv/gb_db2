USE geodata;

SELECT
    geodata._cities.title AS 'Город',
    geodata._regions.title AS 'Регион',
    geodata._countries.title AS 'Страна'
    FROM geodata._cities 
        LEFT JOIN (geodata._regions, geodata._countries)
            ON (geodata._cities.region_id = geodata._regions.id 
                AND geodata._cities.country_id = geodata._countries.id)
    WHERE
        geodata._cities.title = 'Мурманск'
    ;


SELECT DISTINCT
    geodata._cities.title AS 'Город'
    FROM geodata._cities 
        JOIN geodata._regions ON geodata._cities.region_id = geodata._regions.id
    WHERE
        geodata._regions.title = 'Московская область'
    ;