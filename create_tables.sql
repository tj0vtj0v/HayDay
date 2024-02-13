SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `items`;
DROP TABLE IF EXISTS `ingredients`;
DROP TABLE IF EXISTS `source`;
DROP TABLE IF EXISTS `evaluation`;
DROP TABLE IF EXISTS `ore_probability`;
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
    `id`       INT,
    `name`     VARCHAR(64),
    `mastered` bit DEFAULT 0,
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
    `id`            INT,
    `time`          DECIMAL(6, 4),
    `time_no_crops` DECIMAL(6, 4),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id`) REFERENCES items (`id`)
);

CREATE TABLE IF NOT EXISTS `ore_probability`
(
    `id`              INT           NOT NULL,
    `categories`      VARCHAR(32)   NOT NULL,
    `silver`          DECIMAL(4, 2) NOT NULL,
    `gold`            DECIMAL(4, 2) NOT NULL,
    `platinum`        DECIMAL(4, 2) NOT NULL,
    `iron`            DECIMAL(4, 2) NOT NULL,
    `coal`            DECIMAL(4, 2) NOT NULL,
    `diamond`         DECIMAL(4, 2) NOT NULL,
    `ores_per_diamond` DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (`id`)
)