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

INSERT INTO `contenido_web` (`Num`, `Id`, `Nom_Pagina`, `Contenido`) VALUES
(1, 'HISTORIA', 'nosotros', 'Somos una empresa peruana con marca registrada TECHNOLOGICAL DEVICES, con más de 10 años de experiencia, nos dedicamos a la comercialización y distribución de dispositivos tecnológicos con una gran variedad de accesorios para: celulares-smartphones, tabletas, cómputo, televisores, cámaras entre otros. Contamos con Servicio Técnico garantizado, para todas las marcas.\r\n\r\nNuestra empresa nació como una alternativa de solución a las necesidades del público, que no encontraban una tienda de una amplia gama de productos y servicios para usuarios de dispositivos tecnológicos. Nuestra compañía es considerada como tiendas mul-tiproductos o mul-timarcas. De ahí nuestro slogan: TECHNOLOGICAL DEVICES - tecnología de punta que mejora tu vida ...\r\n\r\nNuestros clientes son nuestra carta de presentación. Es por ello que queremos llevar nuestras tiendas a todo el rincón del país.'),
(2, 'SEDE PRINCIPAL', 'nosotros', 'local.jpg'),
(3, 'MISIÓN', 'nosotros', '“Satisfacer con nuestros productos y servicios, todas las expectativas de nuestros clientes, brindando la mejor experiencia profesional en el negocio de dispositivos de última tecnología. Esta labor la hacemos en un ambiente de calidad total donde el producto y el servicio ofrecido son reflejo de nuestra calidad garantizada."'),
(4, 'VISIÓN', 'nosotros', '“Ser la cadena de tiendas líder, reconocida por su oferta integral de alta calidad de productos, servicios de dispositivos tecnológicos diversos, brindando una buena atención y servicio”.\r\n\r\nGenerar valores y desarrollo de competencias en nuestro personal, dando oportunidades de crecimiento profesional.\r\n\r\nSer una empresa innovadora, aportando en el desarrollo tecnológico de nuestra comunidad.'),
(5, 'ORGANIGRAMA', 'nosotros', 'organigrama.jpg'),
(6, 'VALORES', 'nosotros', 'Technological Devices está conformada por personas que se apoyan mutuamente, las cuales se desarrollan y fomentan los siguientes valores:\r\n\r\nTenemos empatía por nuestros clientes.\r\nTrabajamos con honestidad y transparencia.\r\nServimos con responsabilidad y puntualidad.\r\nTratamos con cortesía y educación.\r\nSomos un equipo ganador.');

INSERT INTO `contenido_web` (`Num`, `Id`, `Nom_Pagina`, `Contenido`) VALUES
(9, 'carrousel2', 'inicio', 'c2.jpg'),
(10, 'carrousel3', 'inicio', 'c3.jpg');

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
(7, 'PowerShot SX530', '"Modelo de camara semiprofesional con zoom 100x Pantalla Led 7.5"""\r'),
(8, 'TIZEN', 'modelo de tv curvo samsung\r'),
(9, 'JM', 'Modelo de localizador\r'),
(10, 'Etrex 10', 'Modelo de localizador\r'),
(11, 'P8 Lite', 'Modelo de celular de gama media\r'),
(12, 'M8', 'Modelo de celular de gama alta\r'),
(13, 'Galaxy S7', 'Modelo de celular de gama alta\r'),
(14, 'UN40KU6000', 'Modelo de tv plasma smart\r'),
(15, 'KDL-50W805C', 'Televisor sony android\r'),
(16, 'sony ps4', 'Mando Ps4\r'),
(17, 'HP - 15-ac135la', 'hp Intel Core i5-6200U 2.30GHz\r'),
(18, 'Consola PS4', 'Consola categorizada por Sony\r'),
(19, 'Driving Force Shifter', 'modelo de Jostick Integrado\r');

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
(7, 'NEW ENGLAND', 'Marca de relojeria Inglesa posicionada en todo el globo\r'),
(8, 'HUAWEY', 'Marca disponsitivos tecnologicos ,celulares,tablets,etc\r'),
(9, 'HTC', 'Marca disponsitivos tecnologicos ,celulares,tablets,etc\r'),
(10, 'JM', 'Marca de dispositivos de localizacion\r'),
(11, 'GARMIN', 'Marca de dispositivos de localizacion\r'),
(12, 'HP', 'Marca reconocida en equipos de tecnologia, almacenamiento, impresoras y computadores\r'),
(13, 'Logitech', 'Marca de accesorios para videojuegos o gama tecnologica\r');
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
(7, 'Laptop Toshiba Corei7 12GB RAM 1TB DDR', 'Toshiba - LAPTOP S55-C5214S - CORE I7 5500u,12GB,1TB,15.6 Windows 8.1  2GB NVIDIA GFORCE', 'S55-C5214S.jpg', 3400, 4, 50, 5, 1),
(8, 'Huawei P8 Lite 16GB 13MP 4G LTE', '"Pantalla 5"" 2GB RAM Android 5.0 Lolipop 2G/3G/4G LTE Memoria micro expandible hasta 128GB"', 'Huawei P8.jpg', 800, 2, 200, 8, 11),
(9, 'HTC one M8 32GB ', '"Color Griss Pantalla 5"" Cámara 5Mpx  3GB RAM 32GB MEMORIA Android 4.4.2 "', 'HTC M8.jpg', 658, 2, 180, 9, 12),
(10, 'Samsung Galaxy S7 Edge G935F LTE 32GB', '4G Almacenamiento 32GB Android 6.0 Pantalla 5.5 Cámaras 5Mpx y 12Mpx ', 'Galaxy S7 Edge.jpg', 2600, 2, 200, 2, 13),
(11, 'Garmin - GPS Navegador de Mano Etrex 10', '"Pantalla TFT transflectiva monocromática 2.2"" -Resistente al agua- Mapa base - 1000 waypoints - 50 rutas - Calculo de áreas"', 'Garmin.jpg', 600, 8, 130, 11, 10),
(12, 'Samsung Ultra HD 4K Smart TV Tizen 40''''', '"Pantalla 40"" Ultra HD Resolución 3840 × 2160 -Wifi-HDMI 3-USB 2-Puerto Ethernet-Sintonizador Digital"', 'samsung ultra.jpg', 1400, 6, 200, 2, 14),
(13, '"SONY ANDROID TV LED SMART 3D FULL HD 50"""', 'Android 5.1 Lollipop 3D Activo Full HD 1920 X 1080 Marco de aluminio de alta calidad Entradas USB y HDMI', 'Sony Android.jpg', 2600, 6, 200, 4, 15),
(14, 'Samsung TV Curved Smart 3D SUHD Tizen 65', 'Color: negro - pantalla: LED Ultra HD 55 pulgadas - 3 x HDMI - 2 x USB - 1 x Ethernet (LAN) - Esctructura curva de última generación', 'Samsung curved.jpg', 3500, 6, 200, 2, 9),
(15, 'Sony - Mando Dualshock 4 para Playstation 4 PS4 Inalámbrico', 'Panel táctil de 2 puntos-Sistema de detección de movimiento de seis ejes -Barra de luz, vibración, parlante mono integrado-Puerto de extensión, USB (Micro B) conector de auriculares estéreo', 'sonym01.jpg', 209, 5, 70, 4, 16),
(16, 'Sony - Control Dualshock 4 Para PS4 - Negro', 'Diseño ergonómico-Panel táctil-Joysticks-Altavoz incorporado-Entrada  para audífonos-inalámbrico', 'sonym02.jpg', 218, 5, 70, 4, 16),
(17, 'Notebook HP -15-AC135LA Intel Core i5-6200U', '"Notebook HP -15-AC135LA Intel Core i5-6200U 2.30GHz 8GB 1TB HDD 2GB ATI Radeon DDR3 15.6"" LED Win 10 más Mochila - Rojo"', 'laptophp01.jpg', 3000, 4, 60, 12, 17),
(18, 'Logitech - Joystick Driving Force Shifter para el G29 y G920', 'Diseñado para volantes de carreras G29/G920 Driving Force-Seis velocidades-Compatible con PlayStation®4, Xbox One™, Windows® 8.1, Windows 8 o Windows 7', 'joystick.jpg', 316, 5, 40, 13, 19),
(19, 'Consola PlayStation4 500GB + No Mans Sky', 'Color Negro-HDMI Cable-Mono Headset-USB cable Printed materials (not Shown)', 'ps4.jpg', 1900, 5, 30, 4, 18);
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

