-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcmsproductos
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `Categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`Categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'RELOJES Y ACCESORIOS','Productos de relojeria de mano tanto para hombres como para mujeres\r'),(2,'CELULARES Y TABLETAS','Dispositivos de comunicación inteligentes de diversas caracteristicas\r'),(3,'CAMARAS','Dispositivos que permitiran almacenar los mejores momentos de tu vida\r'),(4,'LAPTOPS','Computadores portatiles de ultima tecnologia en rendimiento y disenio\r'),(5,'PLAYSTATIONS','Consolas de videojuegos de ultima tecnologia PS1,2,3,4  Totalmente compatibles con TV\r'),(6,'TELEVISORES','Televisores de todos los tipos LED, HD, FULLHD, PLASMA, CURVE, CINEMA para que el momento en casa se');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido_web`
--

DROP TABLE IF EXISTS `contenido_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenido_web` (
  `Num` int(11) NOT NULL AUTO_INCREMENT,
  `Id` varchar(45) DEFAULT NULL,
  `Nom_Pagina` varchar(45) DEFAULT NULL,
  `Contenido` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Num`),
  KEY `Nom_Pagina` (`Nom_Pagina`),
  CONSTRAINT `contenido_web_ibfk_1` FOREIGN KEY (`Nom_Pagina`) REFERENCES `pagina` (`Nom_Pagina`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido_web`
--

LOCK TABLES `contenido_web` WRITE;
/*!40000 ALTER TABLE `contenido_web` DISABLE KEYS */;
INSERT INTO `contenido_web` VALUES (1,'HISTORIA','nosotros','Somos una empresa peruana con marca registrada TECHNOLOGICAL DEVICES, con más de 10 años de experiencia, nos dedicamos a la comercialización y distribución de dispositivos tecnológicos con una gran variedad de accesorios para: celulares-smartphones, '),(2,'SEDE PRINCIPAL','nosotros','local.jpg'),(3,'MISIÓN','nosotros','“Satisfacer con nuestros productos y servicios, todas las expectativas de nuestros clientes, brindando la mejor experiencia profesional en el negocio de dispositivos de última tecnología. Esta labor la hacemos en un ambiente de calidad total donde el'),(4,'VISIÓN','nosotros','“Ser la cadena de tiendas líder, reconocida por su oferta integral de alta calidad de productos, servicios de dispositivos tecnológicos diversos, brindando una buena atención y servicio”.\r\n\r\nGenerar valores y desarrollo de competencias en nuestro per'),(5,'ORGANIGRAMA','nosotros','organigrama.jpg'),(6,'VALORES','nosotros','Technological Devices está conformada por personas que se apoyan mutuamente, las cuales se desarrollan y fomentan los siguientes valores:\r\n\r\nTenemos empatía por nuestros clientes.\r\nTrabajamos con honestidad y transparencia.\r\nServimos con responsabili'),(7,'carrousel2','inicio','c2.jpg'),(8,'carrousel3','inicio','c3.jpg');
/*!40000 ALTER TABLE `contenido_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_venta` (
  `Num` int(5) NOT NULL AUTO_INCREMENT,
  `Id_Producto` varchar(10) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` decimal(10,2) NOT NULL,
  `SubTotal` decimal(10,2) NOT NULL,
  `Cod_Usuario` varchar(45) NOT NULL,
  `Num_V` int(5) NOT NULL,
  PRIMARY KEY (`Num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,'1',70.00,1.00,70.00,'rivero19',1),(2,'10',2600.00,1.00,2600.00,'rivero19',1),(3,'7',3400.00,1.00,3400.00,'rivero19',1);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `Id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_marca` text NOT NULL,
  `Desc_marca` text NOT NULL,
  PRIMARY KEY (`Id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'CANON','Marca Nº1 en camaras profesionales y semiprofesionales\r'),(2,'SAMSUNG','Marca top a nivel mundial lider en el sector movil\r'),(3,'QUARTZ','Marca de relojeria americana sinonimo de calidad\r'),(4,'SONY','Marca americana significado de garantia en sus productos\r'),(5,'TOSHIBA','Marca de computadores portatiles, simbolo de innovacion permanente\r'),(6,'APPLE','Marca de computadores y dispositivos tecnologicos lider en sus sectores\r'),(7,'NEW ENGLAND','Marca de relojeria Inglesa posicionada en todo el globo\r'),(8,'HUAWEY','Marca disponsitivos tecnologicos ,celulares,tablets,etc\r'),(9,'HTC','Marca disponsitivos tecnologicos ,celulares,tablets,etc\r'),(10,'JM','Marca de dispositivos de localizacion\r'),(11,'GARMIN','Marca de dispositivos de localizacion\r'),(12,'HP','Marca reconocida en equipos de tecnologia, almacenamiento, impresoras y computadores\r'),(13,'Logitech','Marca de accesorios para videojuegos o gama tecnologica\r');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `Id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_modelo` text NOT NULL,
  `Desc_modelo` text NOT NULL,
  PRIMARY KEY (`Id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'S55-C5214S','CORE I7 5500u,12GB,1TB,15.6 Windows 8.1  2GB NVIDIA GFORCE\r'),(2,'HDR-X190','Modelo Top Lente G angular zoom optico 30x FULLHD Incluye sensor CMOS y Proyector\r'),(3,'Galaxy S3','Ultima edicion de la familia Galaxy. Es lo ultimo en tecnologia movil\r'),(4,'ORLANDO','Material de Aleacion de plata con acero. Tiene segundero\r'),(5,'Iphone 5S','\"Pantalla 4\"\" 2 Nucleos 1GB RAM 64GB Memoria  8Mpx\"\r'),(6,'KOORLAN','Reloj Plata al 85% Trozos de baño de oro\r'),(7,'SX530','\"Modelo de camara semiprofesional con zoom 100x Pantalla Led 7.5\"\"\"\r'),(8,'TIZEN','modelo de tv curvo samsung\r'),(9,'JM','Modelo de localizador\r'),(10,'Etrex 10','Modelo de localizador\r'),(11,'P8 Lite','Modelo de celular de gama media\r'),(12,'M8','Modelo de celular de gama alta\r'),(13,'Galaxy S7','Modelo de celular de gama alta\r'),(14,'UN40KU6000','Modelo de tv plasma smart\r'),(15,'KDL-50W805C','Televisor sony android\r'),(16,'sony ps4','Mando Ps4\r'),(17,'HP - 15-ac135la','hp Intel Core i5-6200U 2.30GHz\r'),(18,'Consola PS4','Consola categorizada por Sony\r'),(19,'Driving Force Shifter','modelo de Jostick Integrado\r');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagina`
--

DROP TABLE IF EXISTS `pagina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagina` (
  `Nom_Pagina` varchar(45) NOT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Nom_Pagina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagina`
--

LOCK TABLES `pagina` WRITE;
/*!40000 ALTER TABLE `pagina` DISABLE KEYS */;
INSERT INTO `pagina` VALUES ('inicio','Home'),('nosotros','Nosotros'),('productos','Productos');
/*!40000 ALTER TABLE `pagina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `descripción` text NOT NULL,
  `imagen` text NOT NULL,
  `precio` double NOT NULL,
  `categoria` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `Id_marca` int(11) NOT NULL,
  `Id_modelo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Id_marca` (`Id_marca`),
  KEY `Id_modelo` (`Id_modelo`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Id_marca`) REFERENCES `marca` (`Id_marca`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`Id_modelo`) REFERENCES `modelo` (`Id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Reloj Plata','Material de Aleacion de plata con acero. Tiene segundero','ORLANDO.jpg',70,1,40,3,4),(2,'Reloj Espiral','Reloj Plata al 85% Trozos de baño de oro','KOORLAN.jpg',120,1,60,7,6),(3,'Celular Galaxy S3','Samsung Galaxy S3 Azul Metalico 12Mpx 32GB','Galaxy S3.jpg',500,2,100,2,3),(4,'Celular Iphone 5S','Iphone 5S Plus Negro 64GB 10Mpx 4.5Pulgadas','Iphone 5S.jpg',800,2,120,6,5),(5,'Camara CANON PowerShot SX530','PowerShot SX530 HS 16MP 50x Zoom WiFi NFC - Negro','SX530.jpg',700,3,80,1,7),(6,'Camara SONY HandyCam HDR-X190','Camara Filmadora SONY HC-V160 77x zoom inteligente Full HD - Negro','HDR-X190.jpg',2000,3,80,4,2),(7,'Laptop Toshiba Corei7 12GB RAM 1TB DDR','Toshiba - LAPTOP S55-C5214S - CORE I7 5500u,12GB,1TB,15.6 Windows 8.1  2GB NVIDIA GFORCE','S55-C5214S.jpg',3400,4,50,5,1),(8,'Huawei P8 Lite 16GB 13MP 4G LTE','\"Pantalla 5\"\" 2GB RAM Android 5.0 Lolipop 2G/3G/4G LTE Memoria micro expandible hasta 128GB\"','Huawei P8.jpg',800,2,200,8,11),(9,'HTC one M8 32GB ','\"Color Griss Pantalla 5\"\" Cámara 5Mpx  3GB RAM 32GB MEMORIA Android 4.4.2 \"','HTC M8.jpg',658,2,180,9,12),(10,'Samsung Galaxy S7 Edge G935F LTE 32GB','4G Almacenamiento 32GB Android 6.0 Pantalla 5.5 Cámaras 5Mpx y 12Mpx ','Galaxy S7 Edge.jpg',2600,2,200,2,13),(11,'Garmin - GPS Navegador de Mano Etrex 10','\"Pantalla TFT transflectiva monocromática 2.2\"\" -Resistente al agua- Mapa base - 1000 waypoints - 50 rutas - Calculo de áreas\"','Garmin.jpg',600,8,130,11,10),(12,'Samsung Ultra HD 4K Smart TV Tizen 40\'\'','\"Pantalla 40\"\" Ultra HD Resolución 3840 × 2160 -Wifi-HDMI 3-USB 2-Puerto Ethernet-Sintonizador Digital\"','samsung ultra.jpg',1400,6,200,2,14),(13,'\"SONY ANDROID TV LED SMART 3D FULL HD 50\"\"\"','Android 5.1 Lollipop 3D Activo Full HD 1920 X 1080 Marco de aluminio de alta calidad Entradas USB y HDMI','Sony Android.jpg',2600,6,200,4,15),(14,'Samsung TV Curved Smart 3D SUHD Tizen 65','Color: negro - pantalla: LED Ultra HD 55 pulgadas - 3 x HDMI - 2 x USB - 1 x Ethernet (LAN) - Esctructura curva de última generación','Samsung curved.jpg',3500,6,200,2,9),(15,'Sony - Mando Dualshock 4 para Playstation 4 PS4 Inalámbrico','Panel táctil de 2 puntos-Sistema de detección de movimiento de seis ejes -Barra de luz, vibración, parlante mono integrado-Puerto de extensión, USB (Micro B) conector de auriculares estéreo','sonym01.jpg',209,5,70,4,16),(16,'Sony - Control Dualshock 4 Para PS4 - Negro','Diseño ergonómico-Panel táctil-Joysticks-Altavoz incorporado-Entrada  para audífonos-inalámbrico','sonym02.jpg',218,5,70,4,16),(17,'Notebook HP -15-AC135LA Intel Core i5-6200U','\"Notebook HP -15-AC135LA Intel Core i5-6200U 2.30GHz 8GB 1TB HDD 2GB ATI Radeon DDR3 15.6\"\" LED Win 10 más Mochila - Rojo\"','laptophp01.jpg',3000,4,60,12,17),(19,'Consola PlayStation4 500GB + No Mans Sky','Color Negro-HDMI Cable-Mono Headset-USB cable Printed materials (not Shown)','ps4.jpg',1900,5,30,4,18);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `Num` smallint(5) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido_Paterno` varchar(30) DEFAULT NULL,
  `Apellido_Materno` varchar(30) DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `Correo` varchar(45) DEFAULT NULL,
  `Tipo` char(1) DEFAULT NULL,
  PRIMARY KEY (`Num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Gustavo','Rivero','Garcia','rivero19','123','jgriverogarcia@gmail.com','2'),(2,'Lizardo','Silva','Ubaldo','lizardo2016','123','C123@grupoutp.edu.pe','1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `Num_V` int(5) NOT NULL AUTO_INCREMENT,
  `Cod` varchar(45) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `Fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Num_V`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'rivero19',6070.00,'2016-11-08 23:03:33');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dbcmsproductos'
--
/*!50003 DROP PROCEDURE IF EXISTS `LOGEAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGEAR_USUARIO`(
	IN IId_U VARCHAR(30)
)
begin
	select * from USUARIO
    where Usuario = IId_U;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_DETALLE_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_DETALLE_VENTA`(
    IN Modelo VARCHAR(100),
    IN Precio DECIMAL(10,2),
	IN Cantidad DECIMAL(10,2),
    IN SubTotal DECIMAL(10,2),
    IN Usuario VARCHAR(45),
    IN NumV VARCHAR(5)
)
BEGIN
	INSERT INTO detalle_venta VALUES (null,Modelo,Precio,Cantidad,SubTotal,Usuario,NumV);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REGISTRAR_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_VENTA`(
	IN Usuario VARCHAR(100),
    IN TTotal DOUBLE
)
BEGIN
        INSERT INTO venta VALUES (default,Usuario,TTotal,default);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-08 23:48:20
