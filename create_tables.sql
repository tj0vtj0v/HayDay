SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `items`;
DROP TABLE IF EXISTS `ingredients`;
DROP TABLE IF EXISTS `source`;
DROP TABLE IF EXISTS `evaluation`;
DROP TABLE IF EXISTS `ore_probability`;;
DROP TABLE IF EXISTS `animal_steps`;
DROP TABLE IF EXISTS `magic_number`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS `ingredients`
(
    `id`           INT,
    `ingredient_1` INT,
    `quantity_1`   DECIMAL(5, 3),
    `ingredient_2` INT,
    `quantity_2`   DECIMAL(5, 3),
    `ingredient_3` INT,
    `quantity_3`   DECIMAL(5, 3),
    `ingredient_4` INT,
    `quantity_4`   DECIMAL(5, 3),
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `source`
(
    `id`       INT         NOT NULL,
    `name`     VARCHAR(64) NOT NULL,
    `mastered` boolean DEFAULT FALSE,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `items`
(
    `id`              INT,
    `source`          INT         NOT NULL,
    `ingredients`     INT         NOT NULL,
    `name`            VARCHAR(64) NOT NULL,
    `level`           INT           DEFAULT 40,
    `production_time` DECIMAL(6, 2) DEFAULT 0,
    `mastered_time`   DECIMAL(6, 2) DEFAULT 0,
    `experience`      INT           DEFAULT 0,
    `default_price`   INT         NOT NULL,
    `maximum_price`   INT         NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`source`) REFERENCES source (`id`),
    FOREIGN KEY (`ingredients`) REFERENCES ingredients (`id`)
);

CREATE TABLE IF NOT EXISTS `evaluation`
(
    `id`                       INT           NOT NULL,
    `complete_production_time` DECIMAL(6, 2) NOT NULL,
    `complete_mastered_time`   DECIMAL(6, 2) NOT NULL,
    `no_crops_production_time` DECIMAL(6, 2) NOT NULL,
    `no_crops_mastered_time`   DECIMAL(6, 2) NOT NULL,
    `profit`                   DECIMAL(5, 2) NOT NULL,
    `complete_experience`      INT           NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id`) REFERENCES items (`id`)
);

CREATE TABLE IF NOT EXISTS `ore_probability`
(
    `id`               INT           NOT NULL,
    `categories`       VARCHAR(32)   NOT NULL,
    `silver`           DECIMAL(4, 2) NOT NULL,
    `gold`             DECIMAL(4, 2) NOT NULL,
    `platinum`         DECIMAL(4, 2) NOT NULL,
    `iron`             DECIMAL(4, 2) NOT NULL,
    `coal`             DECIMAL(4, 2) NOT NULL,
    `diamond`          DECIMAL(4, 2) NOT NULL,
    `ores_per_diamond` DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `animal_steps`
(
    `id`         INT           NOT NULL,
    `name`       varchar(64)   NOT NULL,
    `level`      INT           NOT NULL,
    `experience` INT           NOT NULL,
    `cooldown`   DECIMAL(5, 2) NOT NULL,
    `step_value` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `magic_number`
(
    `level`        INT NOT NULL,
    `magic_number` INT NOT NULL,
    `fields`       INT NOT NULL,
    PRIMARY KEY (`level`)
)