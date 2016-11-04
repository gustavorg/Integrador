CREATE DATABASE dbcmsproductos;
USE dbcmsproductos;

CREATE TABLE `Pagina` (
  `Nom_Pagina` varchar(45) NOT NULL ,
  `Titulo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Nom_Pagina`)
);

INSERT INTO `dbcmsproductos`.`Pagina` VALUES
('index',
'Home');


INSERT INTO `dbcmsproductos`.`Pagina` VALUES
('productos',
'Productos');


INSERT INTO `dbcmsproductos`.`Pagina` VALUES
('nosotros',
'Nosotros');

CREATE TABLE `contenido_web` (
  `Num` int(11) NOT NULL AUTO_INCREMENT,
  `Id` varchar(45) DEFAULT NULL,
  `Nom_Pagina` varchar(45) DEFAULT NULL,
  `Contenido` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Num`),
  FOREIGN KEY (`Nom_Pagina`) REFERENCES `Pagina`(`Nom_Pagina`)
); 



CREATE TABLE `categoria` (
  `Categoria_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Nombre` varchar(20) NOT NULL,
  `Descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `dbcmsproductos`.`categoria`
(`Categoria_id`,`Nombre`,`Descripcion`)VALUES
(1, 'RELOJES Y ACCESORIOS', 'Productos de relojeria de mano tanto para hombres como para mujeres\r'),
(2, 'CELULARES Y TABLETAS', 'Dispositivos de comunicación inteligentes de diversas caracteristicas\r'),
(3, 'CAMARAS', 'Dispositivos que permitiran almacenar los mejores momentos de tu vida\r'),
(4, 'LAPTOPS', 'Computadores portatiles de ultima tecnologia en rendimiento y disenio\r'),
(5, 'PLAYSTATIONS', 'Consolas de videojuegos de ultima tecnologia PS1,2,3,4  Totalmente compatibles con TV\r'),
(6, 'TELEVISORES', 'Televisores de todos los tipos LED, HD, FULLHD, PLASMA, CURVE, CINEMA para que el momento en casa se'),
(7, 'MINICOMPONENTES', 'Equipos de sonido de distintas marcas y modelos. Ultima tecnologia en reproductores de música\r');



CREATE TABLE `modelo` (
  `Id_modelo` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Nom_modelo` text NOT NULL,
  `Desc_modelo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `modelo` (`Id_modelo`, `Nom_modelo`, `Desc_modelo`) VALUES
(1, 'S55-C5214S', 'CORE I7 5500u,12GB,1TB,15.6 Windows 8.1  2GB NVIDIA GFORCE\r'),
(2, 'HandyCam HDR-X190', 'Modelo Top Lente G angular zoom optico 30x FULLHD Incluye sensor CMOS y Proyector\r'),
(3, 'Galaxy S3', 'Ultima edicion de la familia Galaxy. Es lo ultimo en tecnologia movil\r'),
(4, 'ORLANDO', 'Material de Aleacion de plata con acero. Tiene segundero\r'),
(5, 'Iphone 5S', '"Pantalla 4"" 2 Nucleos 1GB RAM 64GB Memoria  8Mpx"\r'),
(6, 'KOORLAN', 'Reloj Plata al 85% Trozos de baño de oro\r'),
(7, 'PowerShot SX530', '"Modelo de camara semiprofesional con zoom 100x Pantalla Led 7.5"""\r');

CREATE TABLE `marca` (
  `Id_marca` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Nom_marca` text NOT NULL,
  `Desc_marca` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `marca` (`Id_marca`, `Nom_marca`, `Desc_marca`) VALUES
(1, 'CANON', 'Marca Nº1 en camaras profesionales y semiprofesionales\r'),
(2, 'SAMSUNG', 'Marca top a nivel mundial lider en el sector movil\r'),
(3, 'QUARTZ', 'Marca de relojeria americana sinonimo de calidad\r'),
(4, 'SONY', 'Marca americana significado de garantia en sus productos\r'),
(5, 'TOSHIBA', 'Marca de computadores portatiles, simbolo de innovacion permanente\r'),
(6, 'APPLE', 'Marca de computadores y dispositivos tecnologicos lider en sus sectores\r'),
(7, 'NEW ENGLAND', 'Marca de relojeria Inglesa posicionada en todo el globo\r');
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Cliente_id` int(11) NOT NULL,
  `Nombre` varchar(70) NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `Id` int(11) NOT NULL,
  `numeroventa` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `imagen` text NOT NULL,
  `precio` text NOT NULL,
  `cantidad` text NOT NULL,
  `subtotal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `descripción` text NOT NULL,
  `imagen` text NOT NULL,
  `precio` double NOT NULL,
  `categoria` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `Id_marca` int(11) NOT NULL,
  `Id_modelo` int(11) NOT NULL,
   FOREIGN KEY (`Id_marca`) REFERENCES `marca`(`Id_marca`),
    FOREIGN KEY (`Id_modelo`) REFERENCES `modelo`(`Id_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripción`, `imagen`, `precio`, `categoria`, `stock`, `Id_marca`, `Id_modelo`) VALUES
(1, 'Reloj Plata', 'Material de Aleacion de plata con acero. Tiene segundero', 'ORLANDO.jpg', 70, 1, 40, 3, 4),
(2, 'Reloj Espiral', 'Reloj Plata al 85% Trozos de baño de oro', 'KOORLAN.jpg', 120, 1, 60, 7, 6),
(3, 'Celular Galaxy S3', 'Samsung Galaxy S3 Azul Metalico 12Mpx 32GB', 'Galaxy S3.jpg', 500, 2, 100, 2, 3),
(4, 'Celular Iphone 5S', 'Iphone 5S Plus Negro 64GB 10Mpx 4.5Pulgadas', 'Iphone 5S.jpg', 800, 2, 120, 6, 5),
(5, 'Camara CANON PowerShot SX530', 'PowerShot SX530 HS 16MP 50x Zoom WiFi NFC - Negro', 'PowerShot SX530.jpg', 700, 3, 80, 1, 7),
(6, 'Camara SONY HandyCam HDR-X190', 'Camara Filmadora SONY HC-V160 77x zoom inteligente Full HD - Negro', 'HandyCam HDR-X190.jpg', 2000, 3, 80, 4, 2),
(7, 'Laptop Toshiba Corei7 12GB RAM 1TB DDR', 'Toshiba - LAPTOP S55-C5214S - CORE I7 5500u,12GB,1TB,15.6 Windows 8.1  2GB NVIDIA GFORCE', 'S55-C5214S.jpg', 3400, 4, 50, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `Sucursal_id` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Direccion` varchar(120) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Id_encargado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `Trabajador_id` int(11) NOT NULL,
  `Nombre` int(11) NOT NULL,
  `Direccion` int(11) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Correo` int(11) NOT NULL,
  `Fecha_Ingreso` int(11) NOT NULL,
  `Salario` int(11) NOT NULL,
  `Sucursal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuario` (
  `Num` smallint(5) PRIMARY KEY AUTO_INCREMENT,
  `Nombre` varchar(45),
  `Apellido_Paterno` varchar(30),
  `Apellido_Materno` varchar(30),
  `Usuario` varchar(45),
  `Password` varchar(10),
  `Correo` varchar(45),
  `Tipo` char(1)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `usuario` VALUES (1,'Gustavo','Rivero','Garcia','rivero19','123','jgriverogarcia@gmail.com',2),
(2,'Lizardo','Silva','Ubaldo','lizardo2016','123','C123@grupoutp.edu.pe',1);

