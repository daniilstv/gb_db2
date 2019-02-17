use geodata;

ALTER TABLE _countries
    CHANGE country_id id INT PRIMARY KEY AUTO_INCREMENT, 
    CHANGE title_ru title VARCHAR(150) NOT NULL,
    ADD INDEX (title),
    DROP title_pl,
    DROP title_ua,
    DROP title_es,
    DROP title_be,
    DROP title_en,
    DROP title_pt,
    DROP title_de,
    DROP title_fr,
    DROP title_it,
    DROP title_ja,
    DROP title_lt,
    DROP title_lv,
    DROP title_cz
    ;

ALTER TABLE _regions
    CHANGE region_id id INT PRIMARY KEY AUTO_INCREMENT, 
    CHANGE title_ru title VARCHAR(150),
    ADD FOREIGN KEY (country_id) REFERENCES _countries(id),
    ADD INDEX (title),
    DROP title_pl,
    DROP title_ua,
    DROP title_es,
    DROP title_be,
    DROP title_en,
    DROP title_pt,
    DROP title_de,
    DROP title_fr,
    DROP title_it,
    DROP title_ja,
    DROP title_lt,
    DROP title_lv,
    DROP title_cz
    ;

ALTER TABLE _cities
    CHANGE city_id id INT PRIMARY KEY AUTO_INCREMENT, 
    CHANGE title_ru title VARCHAR(150),
    ADD FOREIGN KEY (country_id) REFERENCES _countries(id),
    ADD FOREIGN KEY (region_id) REFERENCES _regions(id),
    ADD INDEX (title)
    ;

ALTER TABLE _cities
    DROP title_pl,
    DROP title_ua,
    DROP title_es,
    DROP title_be,
    DROP title_en,
    DROP title_pt,
    DROP title_de,
    DROP title_fr,
    DROP title_it,
    DROP title_ja,
    DROP title_lt,
    DROP title_lv,
    DROP title_cz,

    DROP area_be,
    DROP area_cz,
    DROP area_en,
    DROP area_de,
    DROP area_es,
    DROP area_fr,
    DROP area_it,
    DROP area_lv,
    DROP area_pl,
    DROP area_pt,
    DROP area_ua,
    DROP area_ja,
    DROP area_lt,
    DROP area_ru,

    DROP region_be,
    DROP region_cz,
    DROP region_en,
    DROP region_de,
    DROP region_es,
    DROP region_fr,
    DROP region_it,
    DROP region_lv,
    DROP region_pl,
    DROP region_pt,
    DROP region_ja,
    DROP region_lt,
    DROP region_ua,
    DROP region_ru
    ;