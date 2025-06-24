-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2025 a las 02:39:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `key`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Accesorios'),
(9, 'Deporte'),
(4, 'Documentos'),
(2, 'Electrónica'),
(8, 'Herramientas'),
(6, 'Juguetes'),
(7, 'Libros'),
(5, 'Llaves'),
(10, 'Otros'),
(3, 'Ropa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos_encontrados`
--

CREATE TABLE `objetos_encontrados` (
  `id_encontrado` int(11) NOT NULL,
  `id_usuario_encuentra` int(11) NOT NULL,
  `nombre_objeto` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `lugar_encontrado` varchar(100) NOT NULL,
  `fecha_encontrado` date NOT NULL,
  `fecha_reporte` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('encontrado','devuelto') NOT NULL DEFAULT 'encontrado',
  `foto` longblob DEFAULT NULL,
  `tipo_imagen` varchar(50) DEFAULT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `objetos_encontrados`
--

INSERT INTO `objetos_encontrados` (`id_encontrado`, `id_usuario_encuentra`, `nombre_objeto`, `descripcion`, `lugar_encontrado`, `fecha_encontrado`, `fecha_reporte`, `estado`, `foto`, `tipo_imagen`, `nombre_archivo`, `id_categoria`) VALUES
(1, 2, 'Mochila negra', 'Mochila con cuadernos y calculadora', 'Baños del edificio A', '2025-06-11', '2025-06-16 15:17:33', 'encontrado', NULL, NULL, NULL, 1),
(2, 1, 'Llaves de carro', 'Llaves con llavero del Real Madrid', 'Pasillo de Ciencias', '2025-06-15', '2025-06-16 15:17:33', 'encontrado', NULL, NULL, NULL, 10),
(3, 3, 'Tarjeta de débito', 'Tarjeta del Banco Azul a nombre de Ana T.', 'Cajero automático', '2025-06-12', '2025-06-16 15:17:33', 'encontrado', NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos_perdidos`
--

CREATE TABLE `objetos_perdidos` (
  `id_objeto` int(11) NOT NULL,
  `id_usuario_reporta` int(11) NOT NULL,
  `nombre_objeto` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `lugar_perdida` varchar(100) NOT NULL,
  `fecha_perdida` date NOT NULL,
  `fecha_reporte` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('perdido','encontrado','devuelto') NOT NULL DEFAULT 'perdido',
  `foto` longblob DEFAULT NULL,
  `tipo_imagen` varchar(50) DEFAULT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `objetos_perdidos`
--

INSERT INTO `objetos_perdidos` (`id_objeto`, `id_usuario_reporta`, `nombre_objeto`, `descripcion`, `lugar_perdida`, `fecha_perdida`, `fecha_reporte`, `estado`, `foto`, `tipo_imagen`, `nombre_archivo`, `id_categoria`) VALUES
(1, 1, 'Mochila negra', 'Mochila marca Adidas con libros de cálculo', 'Biblioteca Central', '2025-06-10', '2025-06-16 15:17:25', 'perdido', NULL, NULL, NULL, 1),
(2, 2, 'Celular Samsung', 'Celular con carcasa roja', 'Cafetería de Ingeniería', '2025-06-14', '2025-06-16 15:17:25', 'perdido', NULL, NULL, NULL, 2),
(3, 3, 'Llaves de carro', 'Llaves con llavero del Real Madrid', 'Parqueo Norte', '2025-06-15', '2025-06-16 15:17:25', 'perdido', NULL, NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `foto_perfil` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `contrasena`, `telefono`, `fecha_registro`, `foto_perfil`) VALUES
(1, 'Carlos Gómez', 'carlos@example.com', '1234cifrada', '789456123', '2025-06-16 15:16:09', NULL),
(2, 'Ana Torres', 'ana@example.com', 'abcd1234', '789123456', '2025-06-16 15:16:09', NULL),
(3, 'Luis Méndez', 'luis@example.com', 'passsegura', '745963852', '2025-06-16 15:16:09', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `objetos_encontrados`
--
ALTER TABLE `objetos_encontrados`
  ADD PRIMARY KEY (`id_encontrado`),
  ADD KEY `id_usuario_encuentra` (`id_usuario_encuentra`),
  ADD KEY `fk_objetos_encontrados_categoria` (`id_categoria`);

--
-- Indices de la tabla `objetos_perdidos`
--
ALTER TABLE `objetos_perdidos`
  ADD PRIMARY KEY (`id_objeto`),
  ADD KEY `id_usuario_reporta` (`id_usuario_reporta`),
  ADD KEY `fk_objetos_perdidos_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `objetos_encontrados`
--
ALTER TABLE `objetos_encontrados`
  MODIFY `id_encontrado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `objetos_perdidos`
--
ALTER TABLE `objetos_perdidos`
  MODIFY `id_objeto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `objetos_encontrados`
--
ALTER TABLE `objetos_encontrados`
  ADD CONSTRAINT `fk_objetos_encontrados_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `objetos_encontrados_ibfk_1` FOREIGN KEY (`id_usuario_encuentra`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `objetos_perdidos`
--
ALTER TABLE `objetos_perdidos`
  ADD CONSTRAINT `fk_objetos_perdidos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `objetos_perdidos_ibfk_1` FOREIGN KEY (`id_usuario_reporta`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
