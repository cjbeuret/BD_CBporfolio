-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BD_CBportfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BD_CBportfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_CBportfolio` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema bd_cbportfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_cbportfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_cbportfolio` DEFAULT CHARACTER SET utf8mb3 ;
USE `BD_CBportfolio` ;

-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `especialidad1` VARCHAR(50) NOT NULL,
  `especialidad2` VARCHAR(50) NULL,
  `sobre_mi` VARCHAR(255) NOT NULL,
  `banner` VARCHAR(80) NOT NULL,
  `alt_banner` VARCHAR(50) NOT NULL,
  `img_perfil` VARCHAR(80) NOT NULL,
  `alt_img_perfil` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`experiencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(150) NOT NULL,
  `logo` VARCHAR(80) NULL,
  `alt` VARCHAR(45) NULL,
  `url` VARCHAR(80) NULL,
  `cargo` VARCHAR(50) NOT NULL,
  `descr_puesto` VARCHAR(255) NOT NULL,
  `inicio` VARCHAR(45) NOT NULL,
  `fin` VARCHAR(45) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_experiencia_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `BD_CBportfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`idioma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idioma` VARCHAR(50) NOT NULL,
  `porcentaje` DECIMAL NOT NULL,
  `comentario` VARCHAR(255) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_idioma_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_idioma_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `BD_CBportfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`educacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `institucion` VARCHAR(100) NOT NULL,
  `logo` VARCHAR(80) NULL,
  `alt` VARCHAR(45) NULL,
  `url` VARCHAR(80) NULL,
  `titulo` VARCHAR(50) NOT NULL,
  `alcance_titulo` VARCHAR(255) NOT NULL,
  `comentario` VARCHAR(60) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_educacion_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `BD_CBportfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`proyecto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo_proyecto` VARCHAR(50) NOT NULL,
  `imagen` VARCHAR(80) NULL,
  `alt` VARCHAR(45) NULL,
  `link_proyecto` VARCHAR(80) NULL,
  `destinatario` VARCHAR(100) NOT NULL,
  `descr_proyecto` VARCHAR(255) NOT NULL,
  `periodo_desarrollo` VARCHAR(50) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_proyecto_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `BD_CBportfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`provincia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`localidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `localidad` VARCHAR(60) NOT NULL,
  `provincia_id` INT NOT NULL,
  PRIMARY KEY (`id`, `provincia_id`),
  INDEX `fk_localidad_provincia1_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_localidad_provincia1`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `BD_CBportfolio`.`provincia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`red_social` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(80) NOT NULL,
  `alt` VARCHAR(50) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_red_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_red_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `BD_CBportfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`habilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`habilidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `img_habilidad` VARCHAR(80) NOT NULL,
  `alt` VARCHAR(50) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `porcentaje` DOUBLE NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_habilidad_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidad_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `BD_CBportfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_CBportfolio`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_CBportfolio`.`domicilio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(50) NOT NULL,
  `altura` REAL NOT NULL,
  `piso` VARCHAR(45) NULL,
  `depto` VARCHAR(45) NULL,
  `localidad_id` INT NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `localidad_id`, `persona_id`),
  INDEX `fk_domicilio_localidad1_idx` (`localidad_id` ASC) VISIBLE,
  INDEX `fk_domicilio_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_domicilio_localidad1`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `BD_CBportfolio`.`localidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_domicilio_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `BD_CBportfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `bd_cbportfolio` ;

-- -----------------------------------------------------
-- Table `bd_cbportfolio`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cbportfolio`.`educacion` (
  `ideducacion` INT NOT NULL AUTO_INCREMENT,
  `institucion` VARCHAR(50) NOT NULL,
  `logo` VARCHAR(80) NOT NULL,
  `url` VARCHAR(80) NOT NULL,
  `alt` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(50) NOT NULL,
  `alcance_titulo` VARCHAR(255) NOT NULL,
  `inicio` VARCHAR(45) NOT NULL,
  `fin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ideducacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bd_cbportfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cbportfolio`.`experiencia` (
  `idexperiencia` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(50) NOT NULL,
  `logo` VARCHAR(80) NOT NULL,
  `url` VARCHAR(80) NOT NULL,
  `alt` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(50) NOT NULL,
  `descr_puesto` VARCHAR(255) NOT NULL,
  `inicio` VARCHAR(45) NOT NULL,
  `fin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idexperiencia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bd_cbportfolio`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cbportfolio`.`habilidades` (
  `idhabilidades` INT NOT NULL AUTO_INCREMENT,
  `habilidad` VARCHAR(45) NOT NULL,
  `porcentaje` DECIMAL(10,0) NOT NULL,
  `imagen` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idhabilidades`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bd_cbportfolio`.`idiomas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cbportfolio`.`idiomas` (
  `ididiomas` INT NOT NULL AUTO_INCREMENT,
  `idioma` VARCHAR(50) NOT NULL,
  `porcentaje` DECIMAL(10,0) NOT NULL,
  `comentario` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ididiomas`),
  UNIQUE INDEX `idioma_UNIQUE` (`idioma` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bd_cbportfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cbportfolio`.`persona` (
  `idpersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) CHARACTER SET 'utf8mb3' NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `especialidad1` VARCHAR(50) NOT NULL,
  `especialidad2` VARCHAR(50) NULL DEFAULT NULL,
  `sobre_mi` VARCHAR(255) NOT NULL,
  `banner` VARCHAR(80) NOT NULL,
  `img_perfil` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idpersona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bd_cbportfolio`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cbportfolio`.`provincia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bd_cbportfolio`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_cbportfolio`.`proyecto` (
  `idproyecto` INT NOT NULL AUTO_INCREMENT,
  `titulo_proyecto` VARCHAR(50) NOT NULL,
  `imagen` VARCHAR(80) NOT NULL,
  `url` VARCHAR(80) NOT NULL,
  `alt` VARCHAR(45) NOT NULL,
  `descr_proyecto` VARCHAR(255) NOT NULL,
  `inicio` VARCHAR(45) NOT NULL,
  `fin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproyecto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
