-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bdbanco
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `altacuentas`
--

DROP TABLE IF EXISTS `altacuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `altacuentas` (
  `IDAltaCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `DNI` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `SaldoInicial` decimal(10,2) DEFAULT '10000.00',
  PRIMARY KEY (`IDAltaCuenta`,`DNI`),
  UNIQUE KEY `Cliente` (`DNI`,`Fecha`),
  CONSTRAINT `altacuentas_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `clientes` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `altacuentas`
--

LOCK TABLES `altacuentas` WRITE;
/*!40000 ALTER TABLE `altacuentas` DISABLE KEYS */;
/*!40000 ALTER TABLE `altacuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `altaprestamos`
--

DROP TABLE IF EXISTS `altaprestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `altaprestamos` (
  `IDAltaPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Importe` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IDAltaPrestamo`,`Cliente`),
  UNIQUE KEY `Cliente` (`Cliente`,`Fecha`),
  CONSTRAINT `altaprestamos_ibfk_1` FOREIGN KEY (`Cliente`) REFERENCES `clientes` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `altaprestamos`
--

LOCK TABLES `altaprestamos` WRITE;
/*!40000 ALTER TABLE `altaprestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `altaprestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `DNI` int(11) NOT NULL,
  `CUIL` varchar(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Sexo` int(11) NOT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `IDLocalidad` int(11) DEFAULT NULL,
  `CorreoElectronico` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Usuario` varchar(50) DEFAULT NULL,
  `IDNacionalidad` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `IDProvincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `Usuario` (`Usuario`),
  KEY `IDLocalidad` (`IDLocalidad`),
  KEY `FK_Clientes_Nacionalidad` (`IDNacionalidad`),
  KEY `clientes_ibfk_3_idx` (`Sexo`),
  KEY `clientes_ibfk_4_idx` (`IDProvincia`),
  CONSTRAINT `FK_Clientes_Nacionalidad` FOREIGN KEY (`IDNacionalidad`) REFERENCES `nacionalidad` (`IDNacionalidad`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Usuario`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`IDLocalidad`) REFERENCES `localidades` (`IDLocalidad`),
  CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`Sexo`) REFERENCES `sexo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clientes_ibfk_4` FOREIGN KEY (`IDProvincia`) REFERENCES `provincias` (`IDProvincia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (11333333,'11333333','Luis','Tapia',1,'1998-02-05','viedna',9,'LuisTapia@gmail.com','1144444444','LuisTapia',2,1,8),(45111111,'45111111','hector','espejo',1,'2003-08-14','monterrey',2,'hectorespejo@gmail.com','1111111111','hectorespejo',1,1,1),(45111222,'45111222','Vladilena','Milize',2,'2005-06-12','San Magnolia',5,'VladilenaMilize@gmail.com','1122334455','VladilenaMilize',1,1,4),(45222222,'45222222','Antonela','Navarro',2,'2002-07-07','12 octubre',3,'AntonelaNavarro@gmail.com','1122222222','AntonelaNavarro',3,1,2),(45222444,'45222444','Shin','Nozen',1,'2004-05-07','Imperio guiade',3,'ShinNozen@gmail.com','1123235454','ShinNozen',1,1,2),(45222555,'45222555','Raiden','Shuga',1,'2003-07-18','London',5,'RaidenShuga@gmail.com','1198981123','RaidenShuga',1,1,4),(45222666,'45222666','Theo','Rikka',1,'1979-12-02','Federacion',9,'TheoRikka@gmail.com','1111233211','TheoRikka',2,1,8),(45333333,'45333333','Maria','salazar',2,'1986-11-12','españa 2010',5,'MariaSalazar@gmail.com','1133333333','MariaSalazar',4,1,4),(45333444,'45333444','Angela','Torres',2,'2001-04-18','palermo',6,'AngelaTorres@gmail.com','1176761223','AngelaTorres',4,1,5),(45444444,'45444444','Gaston','Arce',1,'2001-05-25','italia 2006',4,'GastonArce@gmail.com','1155555555','GastonArce',1,1,3),(45555555,'45555555','Candela','Ramirez',2,'2002-06-02','brasil 2002',6,'CandelaRamirez@gmail.com','1166666666','CandelaRamirez',2,1,5),(45666666,'45666666','Mauri','Cardoso',1,'1999-12-31','el barrio',8,'MauriCardoso@gmail.com','11777777','MauriCardoso',2,1,7),(45777777,'45777777','Elsa','Soprano',2,'1988-10-15','la calle pou',5,'ElsaSoprano@gmail.com','1188888888','ElsaSoprano',1,1,4),(45888888,'45888888','cristobal','colon',3,'1976-09-23','virreynato',4,'cristobalcolon@gmail.com','1199999999','cristobalcolon',4,1,3),(45999999,'45999999','Olivia','Walker',2,'1997-01-05','Jamaica Lane',2,'OliviaWalker@gmail.com','1111122233','OliviaWalker',1,1,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicionprestamos`
--

DROP TABLE IF EXISTS `condicionprestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condicionprestamos` (
  `idCondicion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idCondicion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicionprestamos`
--

LOCK TABLES `condicionprestamos` WRITE;
/*!40000 ALTER TABLE `condicionprestamos` DISABLE KEYS */;
INSERT INTO `condicionprestamos` VALUES (1,'Aceptado'),(2,'Rechazado'),(3,'Pendiente'),(4,'Pagado');
/*!40000 ALTER TABLE `condicionprestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `NumeroCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `CBU` varchar(22) NOT NULL,
  `TipoCuenta` varchar(20) NOT NULL,
  `Saldo` decimal(10,2) DEFAULT '10000.00',
  `DNI` int(11) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`NumeroCuenta`,`DNI`),
  KEY `Cliente` (`DNI`),
  CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `clientes` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,'1234567890123456789011','Caja de Ahorro',200000.00,45111111,'2021-03-01',1),(2,'1234567890123456789012','Caja de Ahorro',10000.00,45111111,'2024-12-05',1),(3,'1234567890123456789013','Cuenta Corriente',10000.00,45111111,'2024-12-05',1),(4,'1234567890123456789014','Cuenta Corriente',10000.00,45111222,'2024-12-05',1),(5,'1234567890123456789015','Caja de Ahorro',10000.00,45111222,'2024-12-05',1),(6,'1234567890123456789016','Cuenta Corriente',10000.00,45222444,'2024-12-05',1),(7,'1234567890123456789017','Caja de Ahorro',10000.00,45333333,'2024-12-05',1),(8,'1234567890123456789018','Cuenta Corriente',10000.00,45333333,'2024-12-05',1),(9,'1234567890123456789019','Cuenta Corriente',10000.00,45444444,'2024-12-05',1),(10,'1234567890123456789020','Caja de Ahorro',10000.00,45777777,'2024-12-05',1),(11,'1234567890123456789021','Cuenta Corriente',10000.00,45777777,'2024-12-05',1),(12,'1234567890123456789022','Cuenta Corriente',10000.00,45777777,'2024-12-05',1),(13,'1234567890123456789023','Cuenta Corriente',10000.00,45999999,'2024-12-05',1),(14,'1234567890123456789024','Cuenta Corriente',10000.00,45999999,'2024-12-05',1),(15,'1234567890123456789025','Caja de Ahorro',10000.00,45999999,'2024-12-05',1),(16,'1234567890123456789026','Cuenta Corriente',10000.00,45666666,'2024-12-05',1);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuotas` (
  `IDCuota` int(11) NOT NULL AUTO_INCREMENT,
  `IDPrestamo` int(11) NOT NULL,
  `FechaPago` date DEFAULT NULL,
  `Importe` decimal(10,2) NOT NULL,
  `Pagado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`IDCuota`,`IDPrestamo`),
  KEY `cuotas_ibfk_1_idx` (`IDPrestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `IDLocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `IDProvincia` int(11) NOT NULL,
  PRIMARY KEY (`IDLocalidad`,`IDProvincia`),
  KEY `localidades_ibfk_1` (`IDProvincia`),
  CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`IDProvincia`) REFERENCES `provincias` (`IDProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'La Plata',1),(2,'Mar del Plata',1),(3,'Córdoba Capital',2),(4,'Rosario',3),(5,'Mendoza Capital',4),(6,'San Miguel de Tucumán',5),(7,'Salta Capital',6),(8,'Resistencia',7),(9,'Posadas',8),(10,'Formosa Capital',9);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `IDMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Detalle` varchar(255) DEFAULT NULL,
  `Importe` decimal(10,2) NOT NULL,
  `IdTipoMovimiento` int(11) NOT NULL,
  `CuentaOrigen` int(11) DEFAULT NULL,
  `CuentaDestino` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDMovimiento`),
  KEY `CuentaOrigen` (`CuentaOrigen`),
  KEY `CuentaDestino` (`CuentaDestino`),
  KEY `movimientos_ibfk_3_idx` (`IdTipoMovimiento`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`CuentaOrigen`) REFERENCES `cuentas` (`NumeroCuenta`),
  CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`CuentaDestino`) REFERENCES `cuentas` (`NumeroCuenta`),
  CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`IdTipoMovimiento`) REFERENCES `tipomovimiento` (`idTipoMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nacionalidad` (
  `IDNacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`IDNacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,'Argentina'),(2,'Brasil'),(3,'Uruguay'),(4,'Chile');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagoprestamos`
--

DROP TABLE IF EXISTS `pagoprestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagoprestamos` (
  `IDPagoPrestamo` int(11) NOT NULL AUTO_INCREMENT,
  `IDCuota` int(11) NOT NULL,
  `FechaPago` date NOT NULL,
  `Importe` decimal(10,2) NOT NULL,
  `IDPrestamo` int(11) NOT NULL,
  PRIMARY KEY (`IDPagoPrestamo`,`IDCuota`,`IDPrestamo`),
  UNIQUE KEY `IDCuota` (`IDCuota`,`FechaPago`),
  CONSTRAINT `pagoprestamos_ibfk_1` FOREIGN KEY (`IDCuota`) REFERENCES `cuotas` (`IDCuota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagoprestamos`
--

LOCK TABLES `pagoprestamos` WRITE;
/*!40000 ALTER TABLE `pagoprestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagoprestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestamos` (
  `IDPrestamo` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `ImportePedido` decimal(10,2) NOT NULL,
  `ImporteAPagar` decimal(10,2) NOT NULL,
  `PlazoDePago` int(11) NOT NULL,
  `MontoPorMes` decimal(10,2) NOT NULL,
  `Cuotas` int(11) NOT NULL,
  `Condicion` int(11) NOT NULL,
  `Estado` tinyint(4) NOT NULL DEFAULT '1',
  `NumCuenta` int(11) NOT NULL,
  PRIMARY KEY (`IDPrestamo`,`Cliente`),
  KEY `Cliente` (`Cliente`),
  KEY `prestamos_ibfk_2_idx` (`Condicion`),
  KEY `prestamos_ibfk_3_idx` (`NumCuenta`),
  CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`Cliente`) REFERENCES `clientes` (`DNI`),
  CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`Condicion`) REFERENCES `condicionprestamos` (`idCondicion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prestamos_ibfk_3` FOREIGN KEY (`NumCuenta`) REFERENCES `cuentas` (`NumeroCuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,45999999,'2024-12-05',10000.00,11000.00,12,916.67,12,3,1,14),(2,45999999,'2024-12-05',1000.00,1100.00,6,183.33,6,3,1,13),(3,45333333,'2024-12-05',1200.00,1320.00,18,73.33,18,3,1,7),(4,45333333,'2024-12-05',800.00,880.00,12,73.33,12,3,1,8),(5,45666666,'2024-12-05',1000.00,1100.00,24,45.83,24,3,1,16),(6,45666666,'2024-12-05',5000.00,5500.00,6,916.67,6,3,1,16),(7,45777777,'2024-12-05',1000.00,1100.00,6,183.33,6,3,1,11),(8,45777777,'2024-12-05',2000.00,2200.00,12,183.33,12,3,1,10),(9,45777777,'2024-12-05',5000.00,5500.00,24,229.17,24,3,1,12),(10,45222444,'2024-12-05',1000.00,1100.00,6,183.33,6,3,1,6),(11,45222444,'2024-12-05',2000.00,2200.00,18,122.22,18,3,1,6),(12,45222444,'2024-12-05',6000.00,6600.00,12,550.00,12,3,1,6),(13,45111222,'2024-12-05',100.00,110.00,6,18.33,6,3,1,4),(14,45111222,'2024-12-05',2000.00,2200.00,12,183.33,12,3,1,5),(15,45111222,'2024-12-05',3000.00,3300.00,18,183.33,18,3,1,4);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `IDProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`IDProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Córdoba'),(3,'Santa Fe'),(4,'Mendoza'),(5,'Tucumán'),(6,'Salta'),(7,'Chaco'),(8,'Misiones'),(9,'Formosa'),(10,'Corrientes');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino'),(2,'Femenino'),(3,'Otro');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodeusuario`
--

DROP TABLE IF EXISTS `tipodeusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodeusuario` (
  `IDTipoDeUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`IDTipoDeUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodeusuario`
--

LOCK TABLES `tipodeusuario` WRITE;
/*!40000 ALTER TABLE `tipodeusuario` DISABLE KEYS */;
INSERT INTO `tipodeusuario` VALUES (1,'administrador'),(2,'cliente');
/*!40000 ALTER TABLE `tipodeusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomovimiento`
--

DROP TABLE IF EXISTS `tipomovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomovimiento` (
  `idTipoMovimiento` int(11) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomovimiento`
--

LOCK TABLES `tipomovimiento` WRITE;
/*!40000 ALTER TABLE `tipomovimiento` DISABLE KEYS */;
INSERT INTO `tipomovimiento` VALUES (1,'Depósito'),(2,'Transferencia'),(3,'Pago de préstamo');
/*!40000 ALTER TABLE `tipomovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferencias`
--

DROP TABLE IF EXISTS `transferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transferencias` (
  `IDTransferencia` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Importe` decimal(10,2) NOT NULL,
  `CuentaOrigen` int(11) NOT NULL,
  `CuentaDestino` int(11) NOT NULL,
  PRIMARY KEY (`IDTransferencia`),
  KEY `transferencias_ibfk_1` (`CuentaOrigen`),
  KEY `transferencias_ibfk_2` (`CuentaDestino`),
  CONSTRAINT `transferencias_ibfk_1` FOREIGN KEY (`CuentaOrigen`) REFERENCES `cuentas` (`NumeroCuenta`),
  CONSTRAINT `transferencias_ibfk_2` FOREIGN KEY (`CuentaDestino`) REFERENCES `cuentas` (`NumeroCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferencias`
--

LOCK TABLES `transferencias` WRITE;
/*!40000 ALTER TABLE `transferencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `Usuario` varchar(50) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `IDTipoDeUsuario` int(11) DEFAULT NULL,
  `Estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Usuario`),
  KEY `IDTipoDeUsuario` (`IDTipoDeUsuario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`IDTipoDeUsuario`) REFERENCES `tipodeusuario` (`IDTipoDeUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('admin','1234',1,1),('AngelaTorres','1234',2,1),('AntonelaNavarro','1234',2,1),('CandelaRamirez','1234',2,1),('cristobalcolon','1234',2,1),('ElsaSoprano','1234',2,1),('GastonArce','1234',2,1),('hectorespejo','1234',2,1),('LuisTapia','1234',2,1),('MariaSalazar','1234',2,1),('MauriCardoso','1234',2,1),('OliviaWalker','1234',2,1),('RaidenShuga','1234',2,1),('ShinNozen','1234',2,1),('TheoRikka','1234',2,1),('VladilenaMilize','1234',2,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-05 10:13:48
