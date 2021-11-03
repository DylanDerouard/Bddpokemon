-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Stats` (
  `idstats` INT NOT NULL AUTO_INCREMENT,
  `PV` TINYINT(15) NOT NULL,
  `defense` TINYINT(15) NOT NULL,
  `attack` TINYINT(15) NOT NULL,
  `speed` TINYINT(15) NOT NULL,
  `special_defense` TINYINT(15) NOT NULL,
  `special_attack` TINYINT(15) NOT NULL,
  `level` TINYINT(100) NULL,
  PRIMARY KEY (`idstats`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokemon` (
  `idPokemon` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `Stats_idstats` INT NOT NULL,
  PRIMARY KEY (`idPokemon`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_pokemon_Stats1_idx` (`Stats_idstats` ASC),
  CONSTRAINT `fk_pokemon_Stats1`
    FOREIGN KEY (`Stats_idstats`)
    REFERENCES `mydb`.`Stats` (`idstats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type` (
  `idType` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idType`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pokeball`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokeball` (
  `idPokeball` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `resistance_rate` TINYINT(100) NOT NULL,
  `price` DECIMAL NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`idPokeball`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pokemon_in_the_pocket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokemon_in_the_pocket` (
  `idPokemon_in_the_pocket` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `stats_idstats` INT NOT NULL,
  PRIMARY KEY (`idPokemon_in_the_pocket`),
  INDEX `fk_Pokemon_in_the_pocket_Stats1_idx` (`stats_idstats` ASC),
  CONSTRAINT `fk_Pokemon_in_the_pocket_Stats1`
    FOREIGN KEY (`stats_idstats`)
    REFERENCES `mydb`.`Stats` (`idstats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`arena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`arena` (
  `idArena` INT NOT NULL AUTO_INCREMENT,
  `badge_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idArena`),
  UNIQUE INDEX `name_UNIQUE` (`badge_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`inventory` (
  `idInventory` INT NOT NULL AUTO_INCREMENT,
  `money` INT NOT NULL,
  `ct` VARCHAR(45) NULL,
  `pokemon_in_the_pocket_idPokemon_in_the_pocket` INT NOT NULL,
  `badge_earned` TINYINT(1) NULL,
  `arene_idArena` INT NOT NULL,
  `pokemon_idPokemon` INT NOT NULL,
  `pokeball_idPokeball` INT NOT NULL,
  PRIMARY KEY (`idInventory`),
  INDEX `fk_Inventory_Pokemon_in_the_pocket1_idx` (`pokemon_in_the_pocket_idPokemon_in_the_pocket` ASC),
  INDEX `fk_Inventory_Arene1_idx` (`arene_idArena` ASC),
  INDEX `fk_inventory_pokemon1_idx` (`pokemon_idPokemon` ASC),
  INDEX `fk_inventory_pokeball1_idx` (`pokeball_idPokeball` ASC),
  CONSTRAINT `fk_Inventory_Pokemon_in_the_pocket1`
    FOREIGN KEY (`pokemon_in_the_pocket_idPokemon_in_the_pocket`)
    REFERENCES `mydb`.`pokemon_in_the_pocket` (`idPokemon_in_the_pocket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Inventory_Arene1`
    FOREIGN KEY (`arene_idArena`)
    REFERENCES `mydb`.`arena` (`idArena`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_pokemon1`
    FOREIGN KEY (`pokemon_idPokemon`)
    REFERENCES `mydb`.`pokemon` (`idPokemon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_pokeball1`
    FOREIGN KEY (`pokeball_idPokeball`)
    REFERENCES `mydb`.`pokeball` (`idPokeball`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pokemon_Box`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokemon_Box` (
  `idpokemon_Box` INT NOT NULL AUTO_INCREMENT,
  `pokemon_catched` TINYINT(1) NULL,
  `pokemon_idPokemon` INT NOT NULL,
  PRIMARY KEY (`idpokemon_Box`),
  INDEX `fk_pokemon_Box_pokemon1_idx` (`pokemon_idPokemon` ASC),
  CONSTRAINT `fk_pokemon_Box_pokemon1`
    FOREIGN KEY (`pokemon_idPokemon`)
    REFERENCES `mydb`.`pokemon` (`idPokemon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`capSpecial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`capSpecial` (
  `idCapSpecial` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  `type_idType` INT NOT NULL,
  PRIMARY KEY (`idCapSpecial`),
  INDEX `fk_CapSpecial_Type1_idx` (`type_idType` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  CONSTRAINT `fk_CapSpecial_Type1`
    FOREIGN KEY (`type_idType`)
    REFERENCES `mydb`.`type` (`idType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`object`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`object` (
  `idObject` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`idObject`),
  UNIQUE INDEX `heals_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shop` (
  `idShop` INT NOT NULL AUTO_INCREMENT,
  `pokeball_idPokeball` INT NOT NULL,
  `capSpecial_idCapSpecial` INT NOT NULL,
  `object_idobject` INT NOT NULL,
  PRIMARY KEY (`idShop`),
  INDEX `fk_Shop_Pokeball1_idx` (`pokeball_idPokeball` ASC),
  INDEX `fk_Shop_CapSpecial1_idx` (`capSpecial_idCapSpecial` ASC),
  INDEX `fk_Shop_Heals1_idx` (`object_idobject` ASC),
  CONSTRAINT `fk_Shop_Pokeball1`
    FOREIGN KEY (`pokeball_idPokeball`)
    REFERENCES `mydb`.`pokeball` (`idPokeball`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shop_CapSpecial1`
    FOREIGN KEY (`capSpecial_idCapSpecial`)
    REFERENCES `mydb`.`capSpecial` (`idCapSpecial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shop_Heals1`
    FOREIGN KEY (`object_idobject`)
    REFERENCES `mydb`.`object` (`idObject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pokemon_in_the_pocket_has_Pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokemon_in_the_pocket_has_Pokemon` (
  `pokemon_in_the_pocket_idPokemon_in_the_pocket` INT NOT NULL,
  `pokemon_idPokemon` INT NOT NULL,
  PRIMARY KEY (`pokemon_in_the_pocket_idPokemon_in_the_pocket`, `pokemon_idPokemon`),
  INDEX `fk_Pokemon_in_the_pocket_has_Pokemon_Pokemon1_idx` (`pokemon_idPokemon` ASC),
  INDEX `fk_Pokemon_in_the_pocket_has_Pokemon_Pokemon_in_the_pocket1_idx` (`pokemon_in_the_pocket_idPokemon_in_the_pocket` ASC),
  CONSTRAINT `fk_Pokemon_in_the_pocket_has_Pokemon_Pokemon_in_the_pocket1`
    FOREIGN KEY (`pokemon_in_the_pocket_idPokemon_in_the_pocket`)
    REFERENCES `mydb`.`pokemon_in_the_pocket` (`idPokemon_in_the_pocket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pokemon_in_the_pocket_has_Pokemon_Pokemon1`
    FOREIGN KEY (`pokemon_idPokemon`)
    REFERENCES `mydb`.`pokemon` (`idPokemon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pokemon_has_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokemon_has_type` (
  `pokemon_idPokemon` INT NOT NULL,
  `type_idType` INT NOT NULL,
  PRIMARY KEY (`pokemon_idPokemon`, `type_idType`),
  INDEX `fk_pokemon_has_type_type1_idx` (`type_idType` ASC),
  INDEX `fk_pokemon_has_type_pokemon1_idx` (`pokemon_idPokemon` ASC),
  CONSTRAINT `fk_pokemon_has_type_pokemon1`
    FOREIGN KEY (`pokemon_idPokemon`)
    REFERENCES `mydb`.`pokemon` (`idPokemon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_has_type_type1`
    FOREIGN KEY (`type_idType`)
    REFERENCES `mydb`.`type` (`idType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
