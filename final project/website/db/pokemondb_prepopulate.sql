-- ----------------------------------------------------------------------------
--	Prepopulating `pokemon_type`
-- ----------------------------------------------------------------------------

INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("grass", "Bulbasaur");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("water", "Squirtle");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("fire", "Charmander");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("normal", "Rattata");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("flying", "Pidgey");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("poison", "Weedle");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("bug", "Caterpie");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("bug", "Metapod");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("bug", "Kakuna");
INSERT INTO pokemon_type (type_name, pokemon_name) VALUES ("flying", "Spearow");
-- ----------------------------------------------------------------------------
--	Prepopulating `pokemon`
-- ----------------------------------------------------------------------------

INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (1, "Bulbasaur");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (2, "Charmander");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (3, "Squirtle");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (4, "Caterpie");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (5, "Metapod");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (6, "Weedle");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (7, "Kakuna");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (8, "Pidgey");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (9, "Rattata");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (10, "Spearow");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (11, "Bulbasaur");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (12, "Charmander");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (13, "Squirtle");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (14, "Caterpie");
INSERT INTO pokemon (pokemon_id, pokemon_name) VALUES (15, "Pidgey");
-- ----------------------------------------------------------------------------
--	Prepopulating `location`
-- ----------------------------------------------------------------------------
INSERT INTO locations (location_id, location_name, location_zipcode) VALUES (1, "Pallet Town", 98125);
INSERT INTO locations (location_id, location_name, location_zipcode) VALUES (2, "Route 1", 98004);
INSERT INTO locations (location_id, location_name, location_zipcode) VALUES (3, "Viridian City", 98133);
INSERT INTO locations (location_id, location_name, location_zipcode) VALUES (4, "Route 2", 98101);
INSERT INTO locations (location_id, location_name, location_zipcode) VALUES (5, "Viridian Forest", 98006);
INSERT INTO locations (location_id, location_name, location_zipcode) VALUES (6, "Route 3", 98167);

-- ----------------------------------------------------------------------------
--	Prepopulating `player`
-- ----------------------------------------------------------------------------
INSERT INTO player (player_id, first_name, last_name) VALUES (1, "Susan", "Miller");
INSERT INTO player (player_id, first_name, last_name) VALUES (2, "Will", "Peng");
INSERT INTO player (player_id, first_name, last_name) VALUES (3, "Samamtha", "Klapp");
INSERT INTO player (player_id, first_name, last_name) VALUES (4, "Chris", "Creme");
INSERT INTO player (player_id, first_name, last_name) VALUES (5, "Kris", "Hight");
INSERT INTO player (player_id, first_name, last_name) VALUES (6, "Eric", "Mcgree");

-- ----------------------------------------------------------------------------
--	Prepopulating `catch`
-- ----------------------------------------------------------------------------
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (5/30/17, (SELECT player_id FROM player WHERE first_name = "Will" AND LAST_NAME="Peng"), (SELECT location_id FROM location WHERE location_name = "Pallet Town"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Caterpie"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (5/27/17, (SELECT player_id FROM player WHERE first_name = "Susan" AND LAST_NAME="Miller"), (SELECT location_id FROM location WHERE location_name = "Pallet Town"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Pidgey"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (5/29/17, (SELECT player_id FROM player WHERE first_name = "Susan" AND LAST_NAME="Miller"), (SELECT location_id FROM location WHERE location_name = "Pallet Town"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Squirtle"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (5/31/17, (SELECT player_id FROM player WHERE first_name = "Eric" AND LAST_NAME="Mcgree"), (SELECT location_id FROM location WHERE location_name = "Route 1"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Weedle"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/1/17, (SELECT player_id FROM player WHERE first_name = "Eric" AND LAST_NAME="Mcgree"), (SELECT location_id FROM location WHERE location_name = "Route 1"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Kakuna"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/2/17, (SELECT player_id FROM player WHERE first_name = "Kris" AND LAST_NAME="Hight"), (SELECT location_id FROM location WHERE location_name = "Viridian Forest"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Metapod"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/3/17, (SELECT player_id FROM player WHERE first_name = "Kris" AND LAST_NAME="Hight"), (SELECT location_id FROM location WHERE location_name = "Viridian Forest"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Rattata"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/4/17, (SELECT player_id FROM player WHERE first_name = "Will" AND LAST_NAME="Peng"), (SELECT location_id FROM location WHERE location_name = "Viridian Forest"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Squirtle"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/5/17, (SELECT player_id FROM player WHERE first_name = "Chris" AND LAST_NAME="Creme"), (SELECT location_id FROM location WHERE location_name = "Route 2"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Bulbasaur"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/6/17, (SELECT player_id FROM player WHERE first_name = "Chris" AND LAST_NAME="Creme"), (SELECT location_id FROM location WHERE location_name = "Route 2"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Charmander"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/7/17, (SELECT player_id FROM player WHERE first_name = "Samamtha" AND LAST_NAME="Klapp"), (SELECT location_id FROM location WHERE location_name = "Viridian City"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Spearow"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/8/17, (SELECT player_id FROM player WHERE first_name = "Samamtha" AND LAST_NAME="Klapp"), (SELECT location_id FROM location WHERE location_name = "Route 3"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Bulbasaur"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/9/17, (SELECT player_id FROM player WHERE first_name = "Samamtha" AND LAST_NAME="Klapp"), (SELECT location_id FROM location WHERE location_name = "Route 3"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Charmander"));
INSERT INTO catch (catch_time, catch_player_id, catch_location_id, catch_pokemon_id) VALUES (6/10/17, (SELECT player_id FROM player WHERE first_name = "Susan" AND LAST_NAME="Miller"), (SELECT location_id FROM location WHERE location_name = "Viridian City"), (SELECT pokemon_id FROM pokemon WHERE pokemon_name="Pidgey"));












