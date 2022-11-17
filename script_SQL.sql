SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `perfil`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `perfil` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) NOT NULL ,
  `descricao` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `menu` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(255) NOT NULL ,
  `link` VARCHAR(255) NOT NULL ,
  `icone` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `usuario` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) NOT NULL ,
  `login` VARCHAR(45) NOT NULL ,
  `senha` VARCHAR(255) NOT NULL ,
  `situacao` TINYINT(1) NOT NULL ,
  `id_perfil` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_usuario_perfil_idx` (`id_perfil` ASC) ,
  CONSTRAINT `fk_usuario_perfil`
    FOREIGN KEY (`id_perfil` )
    REFERENCES `perfil` (`id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menu_perfil`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `menu_perfil` (
  `id_perfil` INT NOT NULL ,
  `id_menu` INT NOT NULL ,
  PRIMARY KEY (`id_perfil`, `id_menu`) ,
  INDEX `fk_perfil_has_menu_menu1_idx` (`id_menu` ASC) ,
  INDEX `fk_perfil_has_menu_perfil1_idx` (`id_perfil` ASC) ,
  CONSTRAINT `fk_perfil_has_menu_perfil1`
    FOREIGN KEY (`id_perfil` )
    REFERENCES `perfil` (`id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_perfil_has_menu_menu1`
    FOREIGN KEY (`id_menu` )
    REFERENCES `menu` (`id` )
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cliente` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) NOT NULL ,
  `telefone` VARCHAR(15) NOT NULL ,
  `senha` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `produto` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) NOT NULL ,
  `descricao` VARCHAR(255) NOT NULL ,
  `quantidade` DECIMAL(10,2) NOT NULL ,
  `valor` DECIMAL(10,2) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venda`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `venda` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `data_venda` DATETIME NOT NULL ,
  `data_pagamento` DATETIME NULL ,
  `data_entrega` DATETIME NULL ,
  `id_usuario` INT NOT NULL ,
  `id_cliente` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_venda_usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_venda_cliente1_idx` (`id_cliente` ASC) ,
  CONSTRAINT `fk_venda_usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_cliente1`
    FOREIGN KEY (`id_cliente` )
    REFERENCES `cliente` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `item_venda`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `item_venda` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `id_venda` INT NOT NULL ,
  `id_produto` INT NOT NULL ,
  `quantidade` DECIMAL(10,2) NOT NULL ,
  `valor` DECIMAL(10,2) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_venda_has_produto_produto1_idx` (`id_produto` ASC) ,
  INDEX `fk_venda_has_produto_venda1_idx` (`id_venda` ASC) ,
  CONSTRAINT `fk_venda_has_produto_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `venda` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_has_produto_produto1`
    FOREIGN KEY (`id_produto` )
    REFERENCES `produto` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
