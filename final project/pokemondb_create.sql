DROP TABLE IF EXISTS `pokemon`;
DROP TABLE IF EXISTS`pokemon_type`;
DROP TABLE IF EXISTS`catch`;
DROP TABLE IF EXISTS`player`;
DROP TABLE IF EXISTS`location`;

CREATE TABLE `pokemon`(
	`pokemon_id` int(11) NOT NULL AUTO_INCREMENT,
	`pokemon_name` varchar(255) NOT NULL,
	PRIMARY KEY(`pokemon_id`),
	UNIQUE KEY(`pokemon_name`)
)ENGINE=InnoDB;

CREATE TABLE `pokemon_type`(
	`type_name` varchar(255) NOT NULL,
	`pokemon_name` varchar(255) NOT NULL,
	UNIQUE KEY (`pokemon_name`)
)ENGINE=InnoDB;

CREATE TABLE `player` (
	`player_id` int(11) NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	PRIMARY KEY(`player_id`),
	CONSTRAINT `name_unique` UNIQUE (`first_name`,`last_name`)
)ENGINE=InnoDB;

CREATE TABLE `location`(
	`location_id` int(11) NOT NULL AUTO_INCREMENT,
	`location_name` varchar(255) NOT NULL,
	`location-zipcode` int(11),
	PRIMARY KEY(`location_id`),
	UNIQUE KEY (`location_name`)
)ENGINE=InnoDB;

CREATE TABLE `catch`(
	`catch_time` date,
	foreign key(`player_id`) REFERENCES `player_id` (`player`)
		ON DELETE CASCADE
		ON UPDATE CASCADE 
	foreign key(`location_id`) REFERENCES `location_id`(`location`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	foreign key(`pokemon_id`) REFERENCES `pokemon_id`(`pokemon`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)ENGINE=InnoDB;
