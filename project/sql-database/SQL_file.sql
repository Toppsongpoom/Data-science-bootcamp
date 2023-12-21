-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`publisher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `isbn` VARCHAR(45) NOT NULL,
  `publisher` INT NOT NULL,
  `author` INT NOT NULL,
  `total_pages` INT NOT NULL,
  `publication` YEAR(4) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `bookcol` VARCHAR(45) NULL,
  `publisher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `isbn_UNIQUE` (`isbn` ASC) ,
  INDEX `fk_book_publisher1_idx` (`publisher_id` ASC) ,
  CONSTRAINT `fk_book_publisher1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `mydb`.`publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autthor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autthor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`book_has_autthor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`book_has_autthor` (
  `book_id` INT NOT NULL,
  `autthor_id` INT NOT NULL,
  PRIMARY KEY (`book_id`, `autthor_id`),
  INDEX `fk_book_has_autthor_autthor1_idx` (`autthor_id` ASC) ,
  INDEX `fk_book_has_autthor_book_idx` (`book_id` ASC) ,
  CONSTRAINT `fk_book_has_autthor_book`
    FOREIGN KEY (`book_id`)
    REFERENCES `mydb`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_autthor_autthor1`
    FOREIGN KEY (`autthor_id`)
    REFERENCES `mydb`.`autthor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
