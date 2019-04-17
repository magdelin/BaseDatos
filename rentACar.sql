CREATE SCHEMA IF NOT EXISTS `rentACar` DEFAULT CHARACTER SET utf8 ;
USE `rentAcar` ;

-- -----------------------------------------------------
-- Table `rentAcar`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Cliente` (
  `ClienteId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ClienteNombre` VARCHAR(20) NOT NULL,
  `ClienteApellido` VARCHAR(20) NULL,
  `ClienteCorreo` VARCHAR(45) NULL,
  `ClienteEdad` INT NULL,
  `ClienteGenero` VARCHAR(1) NULL,
  PRIMARY KEY (`ClienteId`),
  UNIQUE INDEX `ClienteId_UNIQUE` (`ClienteId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Oficina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Oficina` (
  `OficinaId` INT NOT NULL AUTO_INCREMENT,
  `OficinaNombre` VARCHAR(45) NULL,
  PRIMARY KEY (`OficinaId`),
  UNIQUE INDEX `OficinaId_UNIQUE` (`OficinaId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`DocumentoIdentidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`DocumentoIdentidad` (
  `DocumentoIdentidadId` INT NOT NULL AUTO_INCREMENT,
  `DocumentoIdentidad` VARCHAR(45) NULL,
  PRIMARY KEY (`DocumentoIdentidadId`),
  UNIQUE INDEX `DocumentoIdentidadId_UNIQUE` (`DocumentoIdentidadId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`DocumentoIdentidadTipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`DocumentoIdentidadTipo` (
  `DocumentoIdentidadTipoId` INT NOT NULL AUTO_INCREMENT,
  `DocumentoIdentidadTipo` VARCHAR(20) NULL,
  `DocumentoIdentidadId` INT NOT NULL,
  PRIMARY KEY (`DocumentoIdentidadTipoId`),
  INDEX `fk_DocumentoIdentidadTipo_DocumentoIdentidad1_idx` (`DocumentoIdentidadId` ASC) VISIBLE,
  UNIQUE INDEX `DocumentoIdentidadTipoId_UNIQUE` (`DocumentoIdentidadTipoId` ASC) VISIBLE,
  CONSTRAINT `fk_DocumentoIdentidadTipo_DocumentoIdentidad1`
    FOREIGN KEY (`DocumentoIdentidadId`)
    REFERENCES `rentAcar`.`DocumentoIdentidad` (`DocumentoIdentidadId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Factura` (
  `FacturaId` INT NOT NULL AUTO_INCREMENT,
  `FacturaFecha` DATE NULL,
  `FacturaPrecio` DOUBLE NULL,
  `FacturaITBIS` DOUBLE NULL,
  `FacturaTotal` DOUBLE NULL,
  PRIMARY KEY (`FacturaId`),
  UNIQUE INDEX `FacturaId_UNIQUE` (`FacturaId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Carro` (
  `CarroId` INT NOT NULL AUTO_INCREMENT,
  `CarroMatricula` VARCHAR(10) NULL,
  `CarroChasis` VARCHAR(10) NULL,
  `CarroPlaca` VARCHAR(10) NULL,
  `CarroKilometraje` INT(10) NULL,
  `CarroEstado` VARCHAR(1) NULL,
  PRIMARY KEY (`CarroId`),
  UNIQUE INDEX `CarroId_UNIQUE` (`CarroId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Alquiler`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Alquiler` (
  `AlquilerId` INT NOT NULL AUTO_INCREMENT,
  `AlquilerCodigo` VARCHAR(10) NULL,
  `AlquilerFechaDe` DATE NULL,
  `AlquilerFechaHasta` DATE NULL,
  `Factura_FacturaId` INT NOT NULL,
  `ClienteId` INT UNSIGNED NOT NULL,
  `CarroId` INT NOT NULL,
  `OficinaId` INT NOT NULL,
  PRIMARY KEY (`AlquilerId`),
  INDEX `fk_Alquiler_Factura1_idx` (`Factura_FacturaId` ASC) VISIBLE,
  INDEX `fk_Alquiler_Cliente1_idx` (`ClienteId` ASC) VISIBLE,
  INDEX `fk_Alquiler_Carro1_idx` (`CarroId` ASC) VISIBLE,
  INDEX `fk_Alquiler_Oficina1_idx` (`OficinaId` ASC) VISIBLE,
  UNIQUE INDEX `AlquilerId_UNIQUE` (`AlquilerId` ASC) VISIBLE,
  CONSTRAINT `fk_Alquiler_Factura1`
    FOREIGN KEY (`Factura_FacturaId`)
    REFERENCES `rentAcar`.`Factura` (`FacturaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_Cliente1`
    FOREIGN KEY (`ClienteId`)
    REFERENCES `rentAcar`.`Cliente` (`ClienteId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_Carro1`
    FOREIGN KEY (`CarroId`)
    REFERENCES `rentAcar`.`Carro` (`CarroId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alquiler_Oficina1`
    FOREIGN KEY (`OficinaId`)
    REFERENCES `rentAcar`.`Oficina` (`OficinaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Reserva` (
  `ReservaId` INT NOT NULL AUTO_INCREMENT,
  `ReservaCodigo` VARCHAR(10) NULL,
  `ReservaAlquilerFechaDe` DATE NULL,
  `ReservaAlquilarFechaHasta` DATE NULL,
  `FacturaId` INT NOT NULL,
  `ClienteId` INT UNSIGNED NOT NULL,
  `CarroId` INT NOT NULL,
  `OficinaId` INT NOT NULL,
  PRIMARY KEY (`ReservaId`),
  INDEX `fk_Reserva_Factura1_idx` (`FacturaId` ASC) VISIBLE,
  INDEX `fk_Reserva_Cliente1_idx` (`ClienteId` ASC) VISIBLE,
  INDEX `fk_Reserva_Carro1_idx` (`CarroId` ASC) VISIBLE,
  INDEX `fk_Reserva_Oficina1_idx` (`OficinaId` ASC) VISIBLE,
  UNIQUE INDEX `ReservaId_UNIQUE` (`ReservaId` ASC) VISIBLE,
  UNIQUE INDEX `ReservaCodigo_UNIQUE` (`ReservaCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Factura1`
    FOREIGN KEY (`FacturaId`)
    REFERENCES `rentAcar`.`Factura` (`FacturaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Cliente1`
    FOREIGN KEY (`ClienteId`)
    REFERENCES `rentAcar`.`Cliente` (`ClienteId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Carro1`
    FOREIGN KEY (`CarroId`)
    REFERENCES `rentAcar`.`Carro` (`CarroId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Oficina1`
    FOREIGN KEY (`OficinaId`)
    REFERENCES `rentAcar`.`Oficina` (`OficinaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Motor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Motor` (
  `MotorId` INT NOT NULL AUTO_INCREMENT,
  `MotorNombre` VARCHAR(45) NULL,
  `CarroId` INT NOT NULL,
  PRIMARY KEY (`MotorId`, `CarroId`),
  INDEX `fk_Motor_Carro1_idx` (`CarroId` ASC) VISIBLE,
  UNIQUE INDEX `MotorId_UNIQUE` (`MotorId` ASC) VISIBLE,
  CONSTRAINT `fk_Motor_Carro1`
    FOREIGN KEY (`CarroId`)
    REFERENCES `rentAcar`.`Carro` (`CarroId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Color` (
  `ColorId` INT NOT NULL AUTO_INCREMENT,
  `ColorNombre` VARCHAR(45) NULL,
  `CarroId` INT NOT NULL,
  PRIMARY KEY (`ColorId`, `CarroId`),
  INDEX `fk_Color_Carro1_idx` (`CarroId` ASC) VISIBLE,
  UNIQUE INDEX `ColorId_UNIQUE` (`ColorId` ASC) VISIBLE,
  CONSTRAINT `fk_Color_Carro1`
    FOREIGN KEY (`CarroId`)
    REFERENCES `rentAcar`.`Carro` (`CarroId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Marca` (
  `MarcaId` INT NOT NULL AUTO_INCREMENT,
  `MarcaNombre` VARCHAR(45) NULL,
  `CarroId` INT NOT NULL,
  PRIMARY KEY (`MarcaId`, `CarroId`),
  INDEX `fk_Marca_Carro1_idx` (`CarroId` ASC) VISIBLE,
  UNIQUE INDEX `MarcaId_UNIQUE` (`MarcaId` ASC) VISIBLE,
  CONSTRAINT `fk_Marca_Carro1`
    FOREIGN KEY (`CarroId`)
    REFERENCES `rentAcar`.`Carro` (`CarroId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Modelo` (
  `ModeloId` INT NOT NULL AUTO_INCREMENT,
  `ModeloNombre` VARCHAR(45) NULL,
  `MarcaId` INT NOT NULL,
  PRIMARY KEY (`ModeloId`, `MarcaId`),
  INDEX `fk_Modelo_Marca1_idx` (`MarcaId` ASC) VISIBLE,
  UNIQUE INDEX `ModeloId_UNIQUE` (`ModeloId` ASC) VISIBLE,
  CONSTRAINT `fk_Modelo_Marca1`
    FOREIGN KEY (`MarcaId`)
    REFERENCES `rentAcar`.`Marca` (`MarcaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`ClienteOficina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`ClienteOficina` (
  `ClienteOficinaId` INT NOT NULL AUTO_INCREMENT,
  `OficinaId` INT NOT NULL,
  `ClienteId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ClienteOficinaId`, `OficinaId`, `ClienteId`),
  INDEX `fk_ClienteOficina_Oficina1_idx` (`OficinaId` ASC) VISIBLE,
  INDEX `fk_ClienteOficina_Cliente1_idx` (`ClienteId` ASC) VISIBLE,
  UNIQUE INDEX `ClienteOficinaId_UNIQUE` (`ClienteOficinaId` ASC) VISIBLE,
  CONSTRAINT `fk_ClienteOficina_Oficina1`
    FOREIGN KEY (`OficinaId`)
    REFERENCES `rentAcar`.`Oficina` (`OficinaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClienteOficina_Cliente1`
    FOREIGN KEY (`ClienteId`)
    REFERENCES `rentAcar`.`Cliente` (`ClienteId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Telefono` (
  `TelefonoId` INT NOT NULL AUTO_INCREMENT,
  `TelefonoNumero` VARCHAR(45) NULL,
  PRIMARY KEY (`TelefonoId`),
  UNIQUE INDEX `TelefonoId_UNIQUE` (`TelefonoId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Telefonia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Telefonia` (
  `TelefoniaId` INT NOT NULL AUTO_INCREMENT,
  `TelefoniaNombre` VARCHAR(45) NULL,
  `TelefonoId` INT NOT NULL,
  PRIMARY KEY (`TelefoniaId`),
  INDEX `fk_Telefonia_Telefono1_idx` (`TelefonoId` ASC) VISIBLE,
  UNIQUE INDEX `TelefoniaId_UNIQUE` (`TelefoniaId` ASC) VISIBLE,
  CONSTRAINT `fk_Telefonia_Telefono1`
    FOREIGN KEY (`TelefonoId`)
    REFERENCES `rentAcar`.`Telefono` (`TelefonoId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Direccion` (
  `DireccionId` INT NOT NULL AUTO_INCREMENT,
  `DireccionCasa` VARCHAR(45) NULL,
  `DireccionCalle` VARCHAR(45) NULL,
  PRIMARY KEY (`DireccionId`),
  UNIQUE INDEX `DireccionId_UNIQUE` (`DireccionId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Provincia` (
  `ProvinciaId` INT NOT NULL AUTO_INCREMENT,
  `ProvinciaNombre` VARCHAR(45) NULL,
  `DireccionId` INT NOT NULL,
  PRIMARY KEY (`ProvinciaId`, `DireccionId`),
  INDEX `fk_Provincia_Direccion1_idx` (`DireccionId` ASC) VISIBLE,
  UNIQUE INDEX `ProvinciaId_UNIQUE` (`ProvinciaId` ASC) VISIBLE,
  CONSTRAINT `fk_Provincia_Direccion1`
    FOREIGN KEY (`DireccionId`)
    REFERENCES `rentAcar`.`Direccion` (`DireccionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Municipio` (
  `MunicipioId` INT NOT NULL AUTO_INCREMENT,
  `MunicipioNombre` VARCHAR(45) NULL,
  `ProvinciaId` INT NOT NULL,
  PRIMARY KEY (`MunicipioId`, `ProvinciaId`),
  INDEX `fk_Municipio_Provincia1_idx` (`ProvinciaId` ASC) VISIBLE,
  UNIQUE INDEX `MunicipioId_UNIQUE` (`MunicipioId` ASC) VISIBLE,
  CONSTRAINT `fk_Municipio_Provincia1`
    FOREIGN KEY (`ProvinciaId`)
    REFERENCES `rentAcar`.`Provincia` (`ProvinciaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`Sector`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`Sector` (
  `SectorId` INT NOT NULL AUTO_INCREMENT,
  `SectorNombre` VARCHAR(45) NULL,
  `MunicipioId` INT NOT NULL,
  PRIMARY KEY (`SectorId`, `MunicipioId`),
  INDEX `fk_Sector_Municipio1_idx` (`MunicipioId` ASC) VISIBLE,
  UNIQUE INDEX `SectorId_UNIQUE` (`SectorId` ASC) VISIBLE,
  CONSTRAINT `fk_Sector_Municipio1`
    FOREIGN KEY (`MunicipioId`)
    REFERENCES `rentAcar`.`Municipio` (`MunicipioId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`ClienteTelefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`ClienteTelefono` (
  `ClienteTelefonoId` INT NOT NULL AUTO_INCREMENT,
  `ClienteId` INT UNSIGNED NOT NULL,
  `TelefonoId` INT NOT NULL,
  PRIMARY KEY (`ClienteTelefonoId`),
  INDEX `fk_ClienteTelefono_Cliente1_idx` (`ClienteId` ASC) VISIBLE,
  INDEX `fk_ClienteTelefono_Telefono1_idx` (`TelefonoId` ASC) VISIBLE,
  UNIQUE INDEX `ClienteTelefonoId_UNIQUE` (`ClienteTelefonoId` ASC) VISIBLE,
  CONSTRAINT `fk_ClienteTelefono_Cliente1`
    FOREIGN KEY (`ClienteId`)
    REFERENCES `rentAcar`.`Cliente` (`ClienteId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClienteTelefono_Telefono1`
    FOREIGN KEY (`TelefonoId`)
    REFERENCES `rentAcar`.`Telefono` (`TelefonoId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`OficinaTelefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`OficinaTelefono` (
  `OficinaTelefonoId` INT NOT NULL AUTO_INCREMENT,
  `OficinaId` INT NOT NULL,
  `TelefonoId` INT NOT NULL,
  PRIMARY KEY (`OficinaTelefonoId`),
  INDEX `fk_OficinaTelefono_Oficina1_idx` (`OficinaId` ASC) VISIBLE,
  INDEX `fk_OficinaTelefono_Telefono1_idx` (`TelefonoId` ASC) VISIBLE,
  UNIQUE INDEX `OficinaTelefonoId_UNIQUE` (`OficinaTelefonoId` ASC) VISIBLE,
  CONSTRAINT `fk_OficinaTelefono_Oficina1`
    FOREIGN KEY (`OficinaId`)
    REFERENCES `rentAcar`.`Oficina` (`OficinaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OficinaTelefono_Telefono1`
    FOREIGN KEY (`TelefonoId`)
    REFERENCES `rentAcar`.`Telefono` (`TelefonoId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`ClienteDireccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`ClienteDireccion` (
  `ClienteDireccionId` INT NOT NULL AUTO_INCREMENT,
  `ClienteId` INT UNSIGNED NOT NULL,
  `DireccionId` INT NOT NULL,
  PRIMARY KEY (`ClienteDireccionId`),
  INDEX `fk_ClienteDireccion_Cliente1_idx` (`ClienteId` ASC) VISIBLE,
  INDEX `fk_ClienteDireccion_Direccion1_idx` (`DireccionId` ASC) VISIBLE,
  UNIQUE INDEX `ClienteDireccionId_UNIQUE` (`ClienteDireccionId` ASC) VISIBLE,
  CONSTRAINT `fk_ClienteDireccion_Cliente1`
    FOREIGN KEY (`ClienteId`)
    REFERENCES `rentAcar`.`Cliente` (`ClienteId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClienteDireccion_Direccion1`
    FOREIGN KEY (`DireccionId`)
    REFERENCES `rentAcar`.`Direccion` (`DireccionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentAcar`.`OficinaDireccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rentAcar`.`OficinaDireccion` (
  `OficinaDireccionId` INT NOT NULL AUTO_INCREMENT,
  `OficinaId` INT NOT NULL,
  `DireccionId` INT NOT NULL,
  PRIMARY KEY (`OficinaDireccionId`),
  INDEX `fk_OficinaDireccion_Oficina1_idx` (`OficinaId` ASC) VISIBLE,
  INDEX `fk_OficinaDireccion_Direccion1_idx` (`DireccionId` ASC) VISIBLE,
  UNIQUE INDEX `OficinaDireccionId_UNIQUE` (`OficinaDireccionId` ASC) VISIBLE,
  CONSTRAINT `fk_OficinaDireccion_Oficina1`
    FOREIGN KEY (`OficinaId`)
    REFERENCES `rentAcar`.`Oficina` (`OficinaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OficinaDireccion_Direccion1`
    FOREIGN KEY (`DireccionId`)
    REFERENCES `rentAcar`.`Direccion` (`DireccionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
