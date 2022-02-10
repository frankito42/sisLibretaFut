-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-02-2022 a las 16:43:21
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `full5`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `articulo` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT '0',
  `costo` decimal(11,2) DEFAULT 0.00,
  `stockmin` int(11) DEFAULT 0,
  `cantidad` int(11) DEFAULT 0,
  `descripcion` text DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `categoria` int(11) NOT NULL,
  `codBarra` varchar(40) NOT NULL,
  `precioVenta` decimal(11,2) NOT NULL,
  `idEsta` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `mayoritario` decimal(11,2) NOT NULL,
  `keyTwoLabor` int(11) NOT NULL,
  `fechaVence` date DEFAULT NULL,
  `menorCentaje` decimal(11,2) NOT NULL,
  `mayorCentaje` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`articulo`, `nombre`, `costo`, `stockmin`, `cantidad`, `descripcion`, `imagen`, `categoria`, `codBarra`, `precioVenta`, `idEsta`, `idProveedor`, `mayoritario`, `keyTwoLabor`, `fechaVence`, `menorCentaje`, `mayorCentaje`) VALUES
(1, 'CANCHA', '1500.00', 10, 9986, 'a', '', 19, '1', '1500.00', 1, 7, '1300.00', 0, NULL, '20.00', '10.00'),
(2, 'Corona 710', '350.00', 10, 69, 'CORONA 710', '', 22, '123', '450.00', 1, 7, '450.00', 0, '2022-02-16', '0.00', '0.00'),
(3, 'Quilmes 710', '200.00', 10, 86, 'QUILMES 710', '', 22, '1234', '300.00', 1, 7, '300.00', 0, '2021-07-10', '20.00', '10.00'),
(5, 'Coca 3L', '247.50', 10, 91, 'COCA 3L', '', 21, '123456', '350.00', 1, 0, '350.00', 0, '2021-07-21', '0.00', '0.00'),
(6, 'Miller 710', '247.50', 10, 98, 'Miller 710', '', 21, '123456', '350.00', 1, 7, '350.00', 0, '2021-07-16', '0.00', '0.00'),
(7, 'Brahama 710', '198.00', 10, 96, 'Brahama 710', '', 21, '1234567', '300.00', 1, 0, '300.00', 0, '2021-07-13', '0.00', '0.00'),
(8, 'Sol 330ML', '150.00', 10, 100, 'sol botellita 330', '', 19, '123456789', '200.00', 1, 0, '200.00', 0, '2021-07-05', '0.00', '0.00'),
(9, 'Speed', '150.00', 10, 98, 'speed', '', 22, '1233456', '200.00', 2, 0, '200.00', 0, '3333-03-31', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombreCategoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nombreCategoria`) VALUES
(19, 'red'),
(20, 'yellow'),
(21, 'green'),
(22, 'gray'),
(23, 'pink'),
(24, 'white'),
(25, 'black'),
(26, 'brown');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetalleVenta` int(11) NOT NULL,
  `idV` int(11) NOT NULL,
  `nombreProducto` varchar(100) NOT NULL,
  `cantidadV` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `fecha` date NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`idDetalleVenta`, `idV`, `nombreProducto`, `cantidadV`, `precio`, `fecha`, `idArticulo`, `estado`) VALUES
(1, 5, 'VACUNA DOG', 1, '108.51', '2022-02-08', 1, 'PAGADO'),
(2, 6, 'CREMA ARMADILLO', 1, '1000.00', '2022-02-08', 3, 'PAGADO'),
(3, 5, 'VACUNA DOG', 1, '108.51', '2022-02-08', 1, 'PAGADO'),
(4, 5, 'CREMA ARMADILLO', 1, '1000.00', '2022-02-08', 3, 'PAGADO'),
(5, 6, 'VACUNA CAT', 1, '498.99', '2022-02-08', 2, 'PAGADO'),
(6, 6, 'd', 1, '432.69', '2022-02-08', 6, 'PAGADO'),
(7, 8, 'VACUNA DOG', 1, '108.51', '2022-02-08', 1, 'PAGADO'),
(8, 8, 'VACUNA CAT', 1, '498.99', '2022-02-08', 2, 'PAGADO'),
(9, 8, 'CREMA ARMADILLO', 1, '1000.00', '2022-02-08', 3, 'PAGADO'),
(10, 6, 'VACUNA CAT', 1, '498.99', '2022-02-08', 2, 'PAGADO'),
(11, 6, 'VACUNA CAT', 1, '498.99', '2022-02-08', 2, 'PAGADO'),
(12, 9, 'VACUNA DOG', 1, '108.51', '2022-02-08', 1, 'PAGADO'),
(13, 9, 'VACUNA CAT', 1, '498.99', '2022-02-08', 2, 'PAGADO'),
(14, 10, 'VACUNA DOG', 1, '108.51', '2022-02-08', 1, 'PAGADO'),
(15, 10, 'VACUNA CAT', 1, '498.99', '2022-02-08', 2, 'PAGADO'),
(16, 10, 'd', 1, '0.00', '2022-02-08', 5, 'PAGADO'),
(17, 10, 'VACUNA CAT', 1, '498.99', '2022-02-08', 2, 'PAGADO'),
(18, 11, 'VACUNA DOG', 1, '108.51', '2022-02-08', 1, 'PAGADO'),
(19, 11, 'VACUNA CAT', 1, '498.99', '2022-02-08', 2, 'PAGADO'),
(20, 11, 'CREMA ARMADILLO', 1, '1000.00', '2022-02-08', 3, 'PAGADO'),
(21, 5, 'cvbdfgb', 1, '0.00', '2022-02-09', 9, 'PAGADO'),
(22, 5, 'VACUNA DOG', 1, '108.51', '2022-02-09', 1, 'PAGADO'),
(23, 6, 'CREMA ARMADILLO', 1, '1000.00', '2022-02-09', 3, 'PAGADO'),
(24, 5, 'VACUNA CAT', 1, '498.99', '2022-02-09', 2, 'PAGADO'),
(25, 12, 'VACUNA DOG', 1, '108.51', '2022-02-09', 1, 'PAGADO'),
(26, 13, 'CANCHA', 1, '1500.00', '2022-02-10', 1, 'PAGADO'),
(27, 13, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(28, 13, 'Quilmes 710', 1, '300.00', '2022-02-10', 3, 'PAGADO'),
(29, 13, 'Coca 3L', 1, '350.00', '2022-02-10', 5, 'PAGADO'),
(30, 13, 'Coca 3L', 1, '350.00', '2022-02-10', 5, 'PAGADO'),
(31, 13, 'Coca 3L', 1, '350.00', '2022-02-10', 5, 'PAGADO'),
(32, 13, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(33, 13, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(34, 13, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(35, 13, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(36, 13, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(37, 14, 'CANCHA', 1, '1500.00', '2022-02-10', 1, 'PAGADO'),
(38, 14, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(39, 14, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(40, 14, 'Corona 710', 1, '450.00', '2022-02-10', 2, 'PAGADO'),
(41, 14, 'Quilmes 710', 1, '300.00', '2022-02-10', 3, 'PAGADO'),
(42, 14, 'Quilmes 710', 1, '300.00', '2022-02-10', 3, 'PAGADO'),
(43, 14, 'Brahama 710', 1, '300.00', '2022-02-10', 7, 'PAGADO'),
(44, 14, 'Brahama 710', 1, '300.00', '2022-02-10', 7, 'PAGADO'),
(45, 14, 'Coca 3L', 1, '350.00', '2022-02-10', 5, 'PAGADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `idEntrada` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nFactura` varchar(100) NOT NULL,
  `observacion` text NOT NULL,
  `idProve` int(11) NOT NULL,
  `keyLaboratorio` int(11) NOT NULL,
  `transporte` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entrada`
--

INSERT INTO `entrada` (`idEntrada`, `fecha`, `nFactura`, `observacion`, `idProve`, `keyLaboratorio`, `transporte`) VALUES
(3, '2021-05-11', '003', '', 25, 1, '300'),
(4, '2021-05-18', '123123', 'asd', 7, 0, '11'),
(15, '2021-08-05', 'aasd', '', 7, 0, '0'),
(16, '2021-08-05', 'aasd', '', 7, 0, '0'),
(17, '2021-08-05', 'aasd', '', 7, 0, '0'),
(18, '2021-08-05', 'asdasd', '', 7, 0, '0'),
(19, '2021-08-05', 'asdasd', '', 7, 0, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `idEsta` int(11) NOT NULL,
  `nombreEsta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `establecimiento`
--

INSERT INTO `establecimiento` (`idEsta`, `nombreEsta`) VALUES
(1, 'Lauchi Danmontti'),
(2, 'tyhghh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturaentrada`
--

CREATE TABLE `facturaentrada` (
  `id` int(11) NOT NULL,
  `idEntrada` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `costo` decimal(11,2) NOT NULL,
  `transporte` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facturaentrada`
--

INSERT INTO `facturaentrada` (`id`, `idEntrada`, `idArticulo`, `cantidad`, `fecha`, `costo`, `transporte`) VALUES
(3, 3, 3, 100, '2021-05-11', '1000.00', '0.00'),
(4, 4, 4, 111, '2021-05-18', '22.00', '0.00'),
(16, 19, 3, 50, '2021-08-05', '41.00', '0.00'),
(17, 19, 1, 50, '2021-08-05', '21.00', '0.00'),
(18, 4, 3, 10, '2022-01-07', '50.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorios`
--

CREATE TABLE `laboratorios` (
  `idLaboratorio` int(11) NOT NULL,
  `nombreLaboratorio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `laboratorios`
--

INSERT INTO `laboratorios` (`idLaboratorio`, `nombreLaboratorio`) VALUES
(1, 'New labor'),
(2, 'Animals secure'),
(3, 'Dr plus'),
(4, 'Red cats');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `nombreP` varchar(50) NOT NULL,
  `direccionP` varchar(50) NOT NULL,
  `telefonoP` varchar(50) NOT NULL,
  `informacionExtra` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `nombreP`, `direccionP`, `telefonoP`, `informacionExtra`) VALUES
(7, 'DOG DOGGY', 'PERROS', '3718659852', 'DOG DOG DOG'),
(21, 'CAT CATS', 'Mateu 567', '3718563125', 'GATOS TOP'),
(25, 'ARMAZON', 'Ruta 86', '3718569253', 'ARMADILLOS YELLOW');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user`, `pass`) VALUES
(1, 'admin', '123'),
(2, 'ventas', '123'),
(3, 'ventas2', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `fechaV` date NOT NULL,
  `totalV` decimal(11,2) DEFAULT 0.00,
  `idUser` int(11) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `fechaV`, `totalV`, `idUser`, `cliente`, `estado`) VALUES
(5, '2022-02-08', '1824.52', 1, 'Francisco Javier Gonzalez', 'PAGADO'),
(6, '2022-02-08', '3929.66', 1, 'Matias Mereles', 'PAGADO'),
(8, '2022-02-08', '1607.50', 1, 'Aurora Lopez', 'PAGADO'),
(9, '2022-02-08', '607.50', 1, 'mati feo', 'PAGADO'),
(10, '2022-02-08', '1106.49', 1, 'negro negro', 'PAGADO'),
(11, '2022-02-08', '1607.50', 1, 'hola', 'PAGADO'),
(12, '2022-02-09', '108.51', 1, 'Jesus Aguero', 'PAGADO'),
(13, '2022-02-10', '5550.00', 1, 'adri', 'PAGADO'),
(14, '2022-02-10', '4400.00', 1, 'el doc', 'PAGADO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`articulo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetalleVenta`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`idEntrada`);

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`idEsta`);

--
-- Indices de la tabla `facturaentrada`
--
ALTER TABLE `facturaentrada`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`idLaboratorio`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `articulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `entrada`
--
ALTER TABLE `entrada`
  MODIFY `idEntrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  MODIFY `idEsta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `facturaentrada`
--
ALTER TABLE `facturaentrada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
