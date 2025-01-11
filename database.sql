-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 11-01-2025 a las 11:30:03
-- Versión del servidor: 5.7.44
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_archivos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` int(11) NOT NULL DEFAULT '1',
  `elimina` datetime DEFAULT NULL,
  `id_carpeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `archivos`
--

INSERT INTO `archivos` (`id`, `nombre`, `tipo`, `fecha_create`, `estado`, `elimina`, `id_carpeta`) VALUES
(1, 'circulo.jpg', 'image/jpeg', '2025-01-11 11:14:19', 1, NULL, 1),
(2, 'comprimido(cir-tri).zip', 'application/x-zip-compressed', '2025-01-11 11:14:38', 1, NULL, 1),
(3, 'comprimido(cir-cua).zip', 'application/x-zip-compressed', '2025-01-11 11:14:49', 1, NULL, 1),
(4, 'comprimido(cua-rec).zip', 'application/x-zip-compressed', '2025-01-11 11:15:15', 1, NULL, 3),
(5, 'triangulo.png', 'image/png', '2025-01-11 11:16:03', 1, NULL, 4),
(6, 'cuadrado.jpg', 'image/jpeg', '2025-01-11 11:19:02', 1, NULL, 4),
(7, 'comprimido(cir-rec).zip', 'application/x-zip-compressed', '2025-01-11 11:20:17', 1, NULL, 5),
(8, 'rectangulo.png', 'image/png', '2025-01-11 11:22:43', 1, NULL, 4),
(9, 'comprimido(tri-cua).zip', 'application/x-zip-compressed', '2025-01-11 11:25:57', 0, '2025-02-11 06:25:57', 6),
(10, 'comprimido(tri-rec).zip', 'application/x-zip-compressed', '2025-01-11 11:24:58', 1, NULL, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carpetas`
--

CREATE TABLE `carpetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` int(11) NOT NULL DEFAULT '1',
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carpetas`
--

INSERT INTO `carpetas` (`id`, `nombre`, `fecha_create`, `estado`, `id_usuario`) VALUES
(1, 'Fotos', '2025-01-11 11:13:16', 1, 1),
(2, 'Videos', '2025-01-11 11:13:24', 1, 1),
(3, 'Documentos', '2025-01-11 11:13:33', 1, 1),
(4, 'Fotos', '2025-01-11 11:13:47', 1, 2),
(5, 'Videos', '2025-01-11 11:13:58', 1, 2),
(6, 'Documentos', '2025-01-11 11:24:39', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_archivos`
--

CREATE TABLE `detalle_archivos` (
  `id` int(11) NOT NULL,
  `fecha_add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `correo` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `elimina` datetime DEFAULT NULL,
  `id_archivo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_archivos`
--

INSERT INTO `detalle_archivos` (`id`, `fecha_add`, `correo`, `estado`, `elimina`, `id_archivo`, `id_usuario`) VALUES
(1, '2025-01-11 11:15:43', 'jordan@gmail.com', 1, NULL, 1, 1),
(2, '2025-01-11 11:15:43', 'jordan@gmail.com', 1, NULL, 3, 1),
(3, '2025-01-11 11:21:01', 'juan@gmail.com', 1, NULL, 6, 2),
(4, '2025-01-11 11:24:18', 'juan@gmail.com', 0, '2025-02-11 06:24:18', 8, 2),
(5, '2025-01-11 11:29:28', 'roger@gmail.com', 1, NULL, 7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `perfil` varchar(100) DEFAULT NULL,
  `clave` varchar(200) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` int(11) NOT NULL DEFAULT '1',
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`, `perfil`, `clave`, `token`, `fecha`, `estado`, `rol`) VALUES
(1, 'Roger', 'Muguruza', 'roger@gmail.com', '987654321', 'Huacho', NULL, '$2y$10$fgqrD0MgV61k7hCRq3oomOwBTHN5xPx4vG4QCquMRxaRauGzAeYSm', NULL, '2025-01-11 11:08:19', 1, 1),
(2, 'Jordan', 'Chinga', 'jordan@gmail.com', '123456789', 'CarquÃ­n', NULL, '$2y$10$G8l3fobBumO5qXU6BbQlrO2elJS92YXggFLebDzL4Y0MIpNZzLGAm', NULL, '2025-01-11 11:09:26', 1, 1),
(3, 'Juan', 'Quispe', 'juan@gmail.com', '111111111', 'Hualmay', NULL, '$2y$10$GKpzo/LGC4NSPiuvYDIm4O/TEpNQPyRXcgbhuKHr/Kn1stCj9RVLy', NULL, '2025-01-11 11:10:53', 1, 2),
(4, 'Carlos', 'Torres', 'carlos@gmail.com', '111111112', 'VÃ©gueta', NULL, '$2y$10$82gHFTqJk4mMnwQX6xrnyuL3y0KBZN32t8xmUijUe2ZfVnE.cjxLO', NULL, '2025-01-11 11:11:41', 1, 2),
(5, 'Pedro', 'Herrera', 'pedro@gmail.com', '111111113', 'Humaya', NULL, '$2y$10$4GSKK0Ms.J/Wzojri4sJauqyEyM3t.UpiqjjM/dkDdH70eS.u7YQ2', NULL, '2025-01-11 11:12:55', 0, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_carpeta` (`id_carpeta`);

--
-- Indices de la tabla `carpetas`
--
ALTER TABLE `carpetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_archivo` (`id_archivo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `carpetas`
--
ALTER TABLE `carpetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`id_carpeta`) REFERENCES `carpetas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `carpetas`
--
ALTER TABLE `carpetas`
  ADD CONSTRAINT `carpetas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_archivos`
--
ALTER TABLE `detalle_archivos`
  ADD CONSTRAINT `detalle_archivos_ibfk_1` FOREIGN KEY (`id_archivo`) REFERENCES `archivos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_archivos_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
