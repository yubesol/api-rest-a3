-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-12-2022 a las 00:54:22
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes_recibidos`
--

CREATE TABLE `mensajes_recibidos` (
  `id` int(11) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `telefono` int(10) NOT NULL,
  `asunto` varchar(20) NOT NULL,
  `mensaje` varchar(100) NOT NULL,
  `id_organizacion` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mensajes_recibidos`
--

INSERT INTO `mensajes_recibidos` (`id`, `correo`, `nombre`, `telefono`, `asunto`, `mensaje`, `id_organizacion`) VALUES
(9, 'mesiasg@dev.com', 'mesias garcia', 972639812, 'Proforma', 'Requiero el producto cccp001 ceramica ', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizacion`
--

CREATE TABLE `organizacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `mision` varchar(50) NOT NULL,
  `vision` varchar(50) NOT NULL,
  `valores` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `organizacion`
--

INSERT INTO `organizacion` (`id`, `nombre`, `foto`, `descripcion`, `mision`, `vision`, `valores`) VALUES
(8, 'IONOS', 'Ionos.png', 'Descr ionos', 'mision ionos', 'vision ionos', 'valores ionos'),
(9, 'M Joandry', 'joandrys.png', 'empresa construct', 'mision mult', 'vision mult', 'valores mult');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `rol` varchar(1) NOT NULL,
  `id_organizacion` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `nombre`, `apellido`, `correo`, `rol`, `id_organizacion`) VALUES
(12, 'Lucia', 'Endara', 'len@len.com', '2', 9),
(13, 'Mirian', 'Pozo', 'mp@mp', '1', 9),
(14, 'Oscar', 'Sanchez', 'os@os.com', '2', 9),
(15, 'Luis', 'Cortez', 'lc@lc.com', '2', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `id_organizacion` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `codigo`, `descripcion`, `foto`, `id_organizacion`) VALUES
(6, 'Ceramica', 'cccp001', 'ceramica pisos', 'cerpiso.png', 9),
(9, 'porcelanato', 'pctpp001', 'porcelanato pared', 'pocrpar.png', 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mensajes_recibidos`
--
ALTER TABLE `mensajes_recibidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_organizacion` (`id_organizacion`);

--
-- Indices de la tabla `organizacion`
--
ALTER TABLE `organizacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_organizacion` (`id_organizacion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_organizacion` (`id_organizacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensajes_recibidos`
--
ALTER TABLE `mensajes_recibidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `organizacion`
--
ALTER TABLE `organizacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensajes_recibidos`
--
ALTER TABLE `mensajes_recibidos`
  ADD CONSTRAINT `mensajes_recibidos_ibfk_1` FOREIGN KEY (`id_organizacion`) REFERENCES `organizacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`id_organizacion`) REFERENCES `organizacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_organizacion`) REFERENCES `organizacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
