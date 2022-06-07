-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-06-2022 a las 03:24:12
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cespidh_v2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configurations`
--

CREATE TABLE `configurations` (
  `id` int(11) UNSIGNED NOT NULL,
  `name_app` varchar(45) NOT NULL,
  `icon_app` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `intro` text,
  `footer` text,
  `meta_description` text,
  `meta_keywords` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configurations`
--

INSERT INTO `configurations` (`id`, `name_app`, `icon_app`, `email`, `intro`, `footer`, `meta_description`, `meta_keywords`) VALUES
(1, 'CESPIDH', '', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_documento` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL COMMENT 'derecho de peticion, denuncia, etc',
  `id_estado` int(11) NOT NULL,
  `users_id` int(11) UNSIGNED NOT NULL,
  `id_sede` int(10) NOT NULL DEFAULT '1',
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `help` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_documento`, `id_tipo`, `id_estado`, `users_id`, `id_sede`, `fecha`, `help`) VALUES
(1, 2, 1, 1, 1, '2022-05-19 06:52:48', 'off'),
(4, 2, 3, 12345678, 1, '2022-05-19 09:12:34', 'off'),
(5, 2, 2, 23456, 1, '2022-05-24 16:01:33', 'off');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_estado`
--

CREATE TABLE `documento_estado` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `icono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `documento_estado`
--

INSERT INTO `documento_estado` (`id_estado`, `nombre`, `icono`) VALUES
(1, 'En proceso', 'sync'),
(2, 'Rechazados', 'clear'),
(3, 'Finalizados', 'check');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_tipo`
--

CREATE TABLE `documento_tipo` (
  `id_tipo` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `plantilla` text,
  `abreviacion` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `documento_tipo`
--

INSERT INTO `documento_tipo` (`id_tipo`, `descripcion`, `plantilla`, `abreviacion`) VALUES
(1, 'Derecho de petición', '<p>{{dp_direccion}}, {{created_document}}.</p>\r\n\r\n<p>Se&ntilde;or:</p>\r\n\r\n<p>{{dp_entidad}}</p>\r\n\r\n<p>{{dp_persona}}</p>\r\n\r\n<p><strong>Asunto</strong>: Derecho de Petici&oacute;n</p>\r\n\r\n<p>Cordial saludo. En ejercicio del Derecho de Petici&oacute;n consagrado en el art&iacute;culo 23 de la Constituci&oacute;n Pol&iacute;tica de Colombia y en los art&iacute;culos 13 y siguientes de la Ley 1755 de 2015, respetuosamente me dirijo a su Despacho, fundado en los siguientes:</p>\r\n\r\n<h3><strong>HECHOS 2</strong></h3>\r\n\r\n<ul>\r\n	<li>{{at_prueba.respuestas}}</li>\r\n</ul>\r\n\r\n<h3><strong>Derechos vulnerados</strong></h3>\r\n\r\n<ul>\r\n	<li>{{dp_derechos}}</li>\r\n</ul>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<h3><strong>Derecho vulnerado Unico</strong></h3>\r\n\r\n<p>Estimo que se encuentran en tensi&oacute;n son el derecho a:</p>\r\n\r\n<ol>\r\n	<li>{{dp_derecho}}</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>{{dp_derecho.detalles}}</li>\r\n</ul>\r\n\r\n<h3><strong>Fundamentos juridicos</strong></h3>\r\n\r\n<p>{{dp_derecho.complemento}}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>Derecho Prueba</strong></h3>\r\n\r\n<p>{{dp_radio}}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>{{dp_grupo_etnico}}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>{{at_prueba.titulo}}</strong></h3>\r\n\r\n<p>{{at_prueba.respuestas}}</p>\r\n', 'DP'),
(2, 'Acción de Tutela', '<p>{{at_direccion.respuesta}}, {{created_document}}.</p>\r\n\r\n<p>SE&Ntilde;OR:</p>\r\n\r\n<p><strong>JUEZ CONSTITUCIONAL DE TUTELA</strong></p>\r\n\r\n<p>E. S. D.</p>\r\n\r\n<p><strong>REF: </strong>Acci&oacute;n de Tutela</p>\r\n\r\n<p><strong>ACCIONANTE:</strong> <strong>{{user.nombre}}</strong></p>\r\n\r\n<p><strong>ACCIONADO:</strong> <strong>{{at_persona.respuesta}}</strong></p>\r\n\r\n<p><strong>{{user.nombre}}</strong>, identificado como aparece al pie de mi firma, actuando en nombre propio, invocando el art&iacute;culo 86 de la Constituci&oacute;n Pol&iacute;tica y el Decreto 2591 de 1991, acudo ante su Despacho para instaurar ACCI&Oacute;N DE TUTELA contra <strong>{{at_entidad.respuesta}}</strong> con el objeto de que se protejan los derechos constitucionales fundamentales a <strong>{{at_derechos.at_derecho_peticion}}, {{at_derechos.at_derecho_peticion_no}}, {{at_derechos.at_derecho_peticion_no_fondo}}, {{at_derechos.at_derecho_proceso}}, {{at_derechos.at_derecho_admin}}, {{at_derechos.at_derecho_defensa}}, {{at_derechos.at_derecho_vital}}, {{at_derechos.at_derecho_salud}}, {{at_derechos.at_derecho_salud_auto}}, {{at_derechos.at_derecho_salud_procedimiento}}, {{at_derechos.at_derecho_salud_medicamento}}</strong> los cuales se encuentran en tensi&oacute;n por la <strong>(OMISION O ACTUACION)</strong> del sujeto pasivo. De conformidad con lo expuesto, la presente acci&oacute;n se fundamenta en los siguientes:</p>\r\n\r\n<p>{{at_derechos.respuesta}}</p>\r\n\r\n<p>{{lola.at_derecho_peticion_no}}</p>\r\n\r\n<p>{{at_hechos.titulo}}</p>\r\n\r\n<ol>\r\n	<li>{{at_hechos.respuestas}}</li>\r\n</ol>\r\n\r\n<p>{{at_derechos.titulo}}</p>\r\n\r\n<ul>\r\n	<li>{{at_derechos.at_derecho_peticion}}\r\n	<ul>\r\n		<li>{{at_derechos.at_derecho_peticion_no}}</li>\r\n		<li>{{at_derechos.at_derecho_peticion_no_fondo}}</li>\r\n	</ul>\r\n	</li>\r\n	<li>{{at_derechos.at_derecho_proceso}}</li>\r\n	<li>{{at_derechos.at_derecho_admin}}</li>\r\n	<li>{{at_derechos.at_derecho_defensa}}</li>\r\n	<li>{{at_derechos.at_derecho_vital}}</li>\r\n	<li>{{at_derechos.at_derecho_salud}}\r\n	<ul>\r\n		<li>{{at_derechos.at_derecho_salud_auto}}</li>\r\n		<li>{{at_derechos.at_derecho_salud_procedimiento}}</li>\r\n		<li>{{at_derechos.at_derecho_salud_citas}}</li>\r\n		<li>{{at_derechos.at_derecho_salud_medicamento}}</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p><strong>Fundamentos Jur&iacute;dicos</strong></p>\r\n\r\n<p>Actuando en nombre propio, acudo ante su Despacho para solicitar la protecci&oacute;n de los derechos mencionados en el ac&aacute;pite anterior, fundado en los siguientes:</p>\r\n\r\n<p>{{at_derechos.at_derecho_peticion.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_peticion_no.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_proceso.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_admin.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_defensa.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_vital.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_salud.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_salud_auto.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_salud_procedimiento.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_salud_citas.complemento}}</p>\r\n\r\n<p>{{at_derechos.at_derecho_salud_medicamento.complemento}}</p>\r\n\r\n<ol>\r\n	<li>{{at_solicitudes.respuestas}}</li>\r\n</ol>\r\n\r\n<h3><strong>Pruebas</strong></h3>\r\n\r\n<p>Actuando en nombre propio, acudo ante su despacho para solicitar la protecci&oacute;n de los derechos mencionados en el ac&aacute;pite anterior, fundando en los siguientes:</p>\r\n\r\n<h3><strong>Pretensiones</strong></h3>\r\n\r\n<p>Primera: Tutelar el derecho fundamental a&nbsp;<strong>{{at_derechos.at_derecho_peticion}}, {{at_derechos.at_derecho_peticion_no}}, {{at_derechos.at_derecho_peticion_no_fondo}}, {{at_derechos.at_derecho_proceso}}, {{at_derechos.at_derecho_admin}}, {{at_derechos.at_derecho_defensa}}, {{at_derechos.at_derecho_vital}}, {{at_derechos.at_derecho_salud}}, {{at_derechos.at_derecho_salud_auto}}, {{at_derechos.at_derecho_salud_procedimiento}}, {{at_derechos.at_derecho_salud_medicamento}}</strong></p>\r\n\r\n<p>Segunda: Ordenar a la accinoada y/o quien corresponda, que&nbsp;<strong>{{at_derechos.at_derecho_peticion_adicional}}</strong>.</p>\r\n\r\n<p>{{at_solicitudes.respuestas.ordinal*3}}</p>\r\n\r\n<h3><strong>Juramento</strong></h3>\r\n\r\n<p>Manifiesto bajo la gravedad del juramento que no se ha presentado ninguna otra acci&oacute;n de tutela por los mismos hechos y derechos.</p>\r\n\r\n<h3><strong>Notificaci&oacute;n</strong></h3>\r\n\r\n<p>Direccion: {{user.direccion}}</p>\r\n\r\n<p>Municipio donde reside: {{user.ciudad}}</p>\r\n\r\n<p>Correo electr&oacute;nico: {{user.email}}</p>\r\n\r\n<p>Tel&eacute;fono de contacto: {{user.telefono}}</p>\r\n\r\n<p>Cordialmente:</p>\r\n\r\n<p>{{user.nombre}}</p>\r\n\r\n<p>____________________________</p>\r\n\r\n<p>Firma del Peticionario</p>\r\n\r\n<p>{{user.nombre}}</p>\r\n\r\n<p>C.C Nro {{user.cedula}}</p>\r\n', 'AT'),
(3, 'Denuncia General', '<p>{{dg_persona.respuesta}}, {{created_document}}.</p>\r\n\r\n<p>Entidad:</p>\r\n\r\n<p>{{dg_entidad.respuesta}}</p>\r\n\r\n<p>Asunto: Denuncia general</p>\r\n\r\n<p>Cordial saludo En cumplimiento del art&iacute;culo 67 del C&oacute;digo de Procedimiento Penal, Ley 906 del 2004, presento denuncia de los hechos que revisten la caracter&iacute;stica de delito para que conforme a su competencia derivada el art&iacute;culo 250 de la Constituci&oacute;n Pol&iacute;tica de 1991 y dem&aacute;s disposiciones constitucionales, adelante las actuaciones a que hubiere lugar, con la finalidad de lograr el esclarecimiento de los hechos y el lograr la protecci&oacute;n y restablecimientos de mis derechos, conforme a los siguientes.</p>\r\n\r\n<p>{{dg_grupo_etnico.titulo}}</p>\r\n\r\n<ul>\r\n	<li>{{dg_grupo_etnico.respuesta}}</li>\r\n</ul>\r\n\r\n<p>{{dg_genero.titulo}}</p>\r\n\r\n<ul>\r\n	<li>{{dg_genero.respuesta}}</li>\r\n</ul>\r\n\r\n<p>{{dg_derechos.titulo}}</p>\r\n\r\n<ul>\r\n	<li>{{dg_derechos.dg_derecho_vida}}:{{dg_derechos.dg_derecho_vida.complemento}}</li>\r\n	<li>{{dg_derechos.dg_derecho_trabajo}} {{dg_derechos.dg_derecho_trabajo.complemento}}</li>\r\n	<li>{{dg_derechos.dg_derecho_expresion}}</li>\r\n</ul>\r\n\r\n<h3><strong>Notificaci&oacute;n</strong></h3>\r\n\r\n<p>Direccion: {{user.direccion}}</p>\r\n\r\n<p>Municipio donde reside: {{user.ciudad}}</p>\r\n\r\n<p>Correo electr&oacute;nico: {{user.email}}</p>\r\n\r\n<p>Tel&eacute;fono de contacto: {{user.telefono}}</p>\r\n\r\n<p>Cordialmente:</p>\r\n\r\n<p>{{user.nombre}}</p>\r\n\r\n<p>____________________________</p>\r\n\r\n<p>Firma del Peticionario</p>\r\n\r\n<p>{{user.nombre}}</p>\r\n\r\n<p>C.C Nro {{user.cedula}}</p>\r\n', 'DG'),
(4, 'Denuncia Corrupcion', NULL, 'DC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formularios`
--

CREATE TABLE `formularios` (
  `id` int(11) NOT NULL,
  `documento_tipo_id_tipo` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `formularios`
--

INSERT INTO `formularios` (`id`, `documento_tipo_id_tipo`, `title`, `orden`) VALUES
(1, 2, 'Formulario1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `name`, `orden`) VALUES
(1, 'Masculino', NULL),
(2, 'Femenino', NULL),
(3, 'Otro', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_etnia`
--

CREATE TABLE `grupo_etnia` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo_etnia`
--

INSERT INTO `grupo_etnia` (`id`, `name`, `orden`) VALUES
(1, 'Ninguno', NULL),
(2, 'Indigena', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(11) UNSIGNED NOT NULL,
  `option` varchar(40) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `position` int(3) DEFAULT NULL,
  `type` enum('primario','secundario','tercero') NOT NULL DEFAULT 'primario',
  `references` int(11) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `component` enum('table','controller') NOT NULL DEFAULT 'table',
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `table` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `option`, `url`, `icon`, `position`, `type`, `references`, `status`, `component`, `title`, `description`, `table`) VALUES
(2, 'Estados de documento', 'documento_estado', NULL, 2, 'secundario', 4, 'active', 'table', 'Estados de documento', NULL, 'documento_estado'),
(3, 'Tipos de documento', 'documento_tipo', NULL, 1, 'secundario', 4, 'active', 'table', 'Tipos de documento', NULL, 'documento_tipo'),
(4, 'Configuración Formulario', '', 'insert_drive_file', NULL, 'primario', NULL, 'active', 'table', NULL, NULL, NULL),
(5, 'Formulario', 'formularios', NULL, 3, 'secundario', 4, 'active', 'table', 'Formularios', NULL, 'formularios'),
(6, 'Secciones', 'secciones', NULL, 4, 'secundario', 4, 'active', 'table', 'Secciones', NULL, 'secciones'),
(7, 'Preguntas', 'preguntas', NULL, 6, 'secundario', 4, 'active', 'table', 'Preguntas', NULL, 'preguntas'),
(8, 'Tipo de pregunta', 'tipo_pregunta', NULL, 5, 'secundario', 4, 'active', 'table', 'Tipo de pregunta', NULL, 'tipo_pregunta'),
(9, 'Ciudadanos', 'ciudadanos', 'people', 1, 'primario', NULL, 'active', 'controller', NULL, NULL, NULL),
(10, 'Preguntas detalle', '', NULL, 8, 'secundario', 4, 'active', 'table', 'Pregunta detalle', NULL, 'pregunta_detalle'),
(11, 'Preguntas Padre', 'pregunta_detalle/padre', NULL, NULL, 'tercero', 10, 'active', 'table', 'Preguntas padre', NULL, 'pregunta_detalle'),
(12, 'Preguntas hija', 'pregunta_detalle/hija', NULL, NULL, 'tercero', 10, 'active', 'table', 'Preguntas hijas', NULL, 'pregunta_detalle'),
(13, 'Entidad', 'entidad', 'insert_drive_file', 1, 'primario', NULL, 'active', 'controller', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `icon` varchar(45) NOT NULL,
  `color` enum('','cyan','amber','orange','purple','red darken-1') NOT NULL DEFAULT 'cyan',
  `created_at` datetime DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `menu_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `role_id`, `menu_id`) VALUES
(1, 2, 9),
(2, 2, 4),
(3, 2, 2),
(4, 2, 5),
(5, 2, 7),
(6, 2, 10),
(7, 2, 12),
(8, 2, 11),
(9, 2, 6),
(10, 2, 8),
(11, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `formulario_id` int(11) DEFAULT NULL,
  `secciones_id` int(11) NOT NULL,
  `tipo_pregunta_id` int(11) NOT NULL,
  `pregunta` varchar(100) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `obligatorio` enum('Si','No') NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `campo_formulario` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `formulario_id`, `secciones_id`, `tipo_pregunta_id`, `pregunta`, `descripcion`, `titulo`, `obligatorio`, `orden`, `campo_formulario`) VALUES
(1, 1, 1, 1, 'Derecho titulo', NULL, NULL, 'Si', 1, 'at_derechos'),
(2, 1, 2, 4, 'Pregunta2', NULL, NULL, 'Si', 1, 'lola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_detalle`
--

CREATE TABLE `pregunta_detalle` (
  `id` int(11) NOT NULL,
  `formulario_id` int(11) NOT NULL,
  `seccion_id` int(11) NOT NULL,
  `preguntas_id` int(11) NOT NULL,
  `tipo_pregunta_id` int(11) NOT NULL,
  `pregunta_padre` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `complemento` text NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `campo_formulario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pregunta_detalle`
--

INSERT INTO `pregunta_detalle` (`id`, `formulario_id`, `seccion_id`, `preguntas_id`, `tipo_pregunta_id`, `pregunta_padre`, `description`, `complemento`, `orden`, `campo_formulario`) VALUES
(1, 1, 1, 1, 1, NULL, 'Padre', '', 1, 'formulario'),
(2, 1, 2, 2, 4, 4, 'Hija', '<p>Esta es la hija</p>\r\n', 1, 'at_derecho_peticion_no'),
(3, 1, 1, 1, 1, NULL, 'Peticion', '', 1, '{{at_derechos.at_derecho_peticion}}'),
(4, 1, 2, 2, 4, NULL, 'Padre2', '', 1, 'at_derechos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL,
  `preguntas_id` int(11) NOT NULL,
  `pregunta_detalle_id` int(11) DEFAULT NULL,
  `documento_id_documento` int(11) NOT NULL,
  `formulario_id` int(11) DEFAULT NULL,
  `secciones_id` int(11) DEFAULT NULL,
  `respuesta` text,
  `documento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id`, `preguntas_id`, `pregunta_detalle_id`, `documento_id_documento`, `formulario_id`, `secciones_id`, `respuesta`, `documento`) VALUES
(1, 1, NULL, 1, 1, 1, 'hgbh', NULL),
(2, 1, NULL, 4, 1, 1, '2', NULL),
(6, 2, 4, 4, 1, 2, NULL, NULL),
(7, 2, 2, 4, 1, 2, NULL, NULL),
(8, 1, NULL, 5, 1, 1, '2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Superadministrador'),
(2, 'Administrador'),
(3, 'Ciudadano'),
(4, 'Colaborador'),
(5, 'Revisor'),
(6, 'Entidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `id` int(11) NOT NULL,
  `formulario_id` int(11) NOT NULL,
  `title` varchar(60) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id`, `formulario_id`, `title`, `orden`) VALUES
(1, 1, 'Secciones1', 1),
(2, 1, 'Secciones2', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(10) NOT NULL,
  `nombre` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pregunta`
--

CREATE TABLE `tipo_pregunta` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL COMMENT '1 - Pregunta abierta\\\\n2 - Select\\\\n3 - Radio\\\\n4 - Checkbox\\\\n5 - Lista texto\\\\n6 - Lista texto y Documento\\\\n7 - Derechos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_pregunta`
--

INSERT INTO `tipo_pregunta` (`id`, `tipo`) VALUES
(1, '1 - Pregunta abierta'),
(2, '2 - Selección'),
(3, '3 - Radio'),
(4, '4 - Checkbox'),
(5, '5 - Lista texto'),
(6, '6 - Lista documentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) UNSIGNED NOT NULL,
  `genero_id` int(11) NOT NULL,
  `grupo_etnia_id` int(11) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `id_sede` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `status`, `photo`, `created_at`, `role_id`, `genero_id`, `grupo_etnia_id`, `ciudad`, `direccion`, `phone`, `id_sede`) VALUES
(1, 'Fernando Rodriguez', 'iplanet@iplanetcolombia.com', 'pruebas', '$2y$10$HQ0VNjCJar6YsaT8rbGlFuFsVDVRhC3lQYldxb6R.8taGzOm7XTgO', 'active', '', '2022-04-07 10:56:58', 1, 1, 1, '', '', '', 1),
(2, 'Laura (ADMN)', 'admin@prueba.com', 'admin_prueba', '$2y$10$dzLWtR/xxXfYJGs4iZCFne37LqUSiXAZO4CGR9qAuKYYCe8tNIrEu', 'active', NULL, '2022-04-07 10:56:58', 2, 1, 1, '', '', '', 1),
(3, 'Ciudadano', 'ciudadano@prueba.com', 'ciudadano_prueba', '$2y$10$YruXyX4Kgz9W19xfnrjKSusjU6wfKdX5ZSJkTac6ns/g7zH8I2xMO', 'active', NULL, '2022-04-07 10:56:58', 3, 2, 1, '', '', '', 1),
(4, 'Colaborador', 'colaborador@prueba.com', 'colaborador_prueba', '$2y$10$LdSkpWGjE9hkJ.SXqktzJu3QVeTdiY76K5tK0VhOwygPRk9epmGLu', 'active', NULL, '2022-04-07 10:56:58', 4, 1, 1, '', '', '', 1),
(5, 'Revisor', 'revisor@prueba.com', 'revisor_prueba', '$2y$10$s5X..nE5asAaD4QlU2Lz1eQgA2CCsXOyc2KbewjARKwkoi9FhyOpK', 'active', NULL, '2022-04-07 10:56:58', 5, 1, 2, '', '', '', 1),
(6, 'Entidad', 'entidad@prueba.com', 'entidad_prueba', '$2y$10$G/n6MC71E.RR2QB1xCCALusDBH6O86/JAuWktQkBPKY.6Cne9bUYm', 'active', NULL, '2022-04-07 10:56:58', 6, 1, 1, '', '', '', 1),
(23456, 'Jennifer Narvaez', 'iplanet@iplanetcolombia.com', 'iplanet', '$2y$10$aW7gZd1Mj0L2CjmU4TzBZOtrU5nCbzmIg1F5j82waK7OTSJ7iR/36', 'active', NULL, '2022-05-24 16:01:33', 3, 2, 2, 'Neiva', 'cra 39', '', 1),
(12345678, 'Felipe Perez', 'iplanet@iplanetcolombia.com', 'iplanet', '$2y$10$1A.jWgMKNnKJ6B0Q8NUOP.rW8VtFkD6FQiOu6ttwL/HTc/w8Z0g3u', 'active', NULL, '2022-05-19 09:12:34', 3, 1, 2, 'Neiva', 'cra 37', '', 1),
(1003811367, 'Cespidh', 'Cespidh@gmail.com', 'cespidh', '$2y$10$wpJOkOdzg6M0edWudNPMnugP0nuS1mc4HATNoFRJpeOWUKg71h6y2', 'active', NULL, '2022-04-27 00:12:46', 2, 1, 2, 'Neiva', 'Calle 57 # 1c - 22', '', 1),
(1003811368, 'William Bonilla', 'wsbonilladiaz@gmail.com', 'wsbonilladiaz', '$2y$10$QgHJe.nNrRWw7.bSHKlZAeFX.Kx1ic60LUGLFjbVRHPye5vcyPiFK', 'active', NULL, '2022-04-26 17:28:52', 1, 1, 2, 'Neiva', 'Calle 57 # 1c - 22', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `work`
--

CREATE TABLE `work` (
  `id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `finish_at` datetime DEFAULT NULL,
  `observation` text,
  `document` varchar(45) DEFAULT NULL,
  `documento_id_documento` int(11) NOT NULL,
  `users_id` int(11) UNSIGNED NOT NULL,
  `work_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `work`
--

INSERT INTO `work` (`id`, `created_at`, `finish_at`, `observation`, `document`, `documento_id_documento`, `users_id`, `work_type_id`) VALUES
(1, '2022-05-19 09:12:34', '2022-05-22 00:00:00', 'Corrección de los hechos', 'AT4	', 4, 12345678, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `work_type`
--

CREATE TABLE `work_type` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `work_type`
--

INSERT INTO `work_type` (`id`, `name`) VALUES
(1, 'documento');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_documento`),
  ADD KEY `fk_documento_a_tipo_idx` (`id_tipo`),
  ADD KEY `fk_documento_estado_idx` (`id_estado`),
  ADD KEY `fk_documento_users1_idx` (`users_id`);

--
-- Indices de la tabla `documento_estado`
--
ALTER TABLE `documento_estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `documento_tipo`
--
ALTER TABLE `documento_tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `formularios`
--
ALTER TABLE `formularios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_formulario_prueba_documento_tipo1_idx` (`documento_tipo_id_tipo`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo_etnia`
--
ALTER TABLE `grupo_etnia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_role_id_foreign` (`role_id`),
  ADD KEY `permissions_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_preguntas_secciones1_idx` (`secciones_id`),
  ADD KEY `fk_preguntas_tipo_pregunta1_idx` (`tipo_pregunta_id`),
  ADD KEY `fk_preguntas_formularios_idx` (`formulario_id`);

--
-- Indices de la tabla `pregunta_detalle`
--
ALTER TABLE `pregunta_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pregunta_detalle_preguntas1_idx` (`preguntas_id`),
  ADD KEY `fk_pregunta_detalle_pregunta_padre1_idx` (`pregunta_padre`) USING BTREE,
  ADD KEY `fk_pregunta_padre_formulario_id1_idx` (`formulario_id`),
  ADD KEY `fk_pregunta_detalle_seccion_id1_idx` (`seccion_id`),
  ADD KEY `fk_pregunta_detalle_tipo_pregunta_id1_idx` (`tipo_pregunta_id`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_respuestas_preguntas1_idx` (`preguntas_id`),
  ADD KEY `fk_respuestas_pregunta_detalle1_idx` (`pregunta_detalle_id`),
  ADD KEY `fk_respuestas_formulario_idx` (`formulario_id`),
  ADD KEY `fk_respuesta_secciones_idx` (`secciones_id`),
  ADD KEY `fk_respuestas_documento1_idx` (`documento_id_documento`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_secciones_formulario_prueba1_idx` (`formulario_id`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `tipo_pregunta`
--
ALTER TABLE `tipo_pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `fk_users_genero1` (`genero_id`),
  ADD KEY `fk_users_grupo_etnia1` (`grupo_etnia_id`);

--
-- Indices de la tabla `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_work_documento1_idx` (`documento_id_documento`),
  ADD KEY `fk_work_users1_idx` (`users_id`),
  ADD KEY `fk_work_work_type1_idx` (`work_type_id`);

--
-- Indices de la tabla `work_type`
--
ALTER TABLE `work_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `documento_estado`
--
ALTER TABLE `documento_estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `documento_tipo`
--
ALTER TABLE `documento_tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `formularios`
--
ALTER TABLE `formularios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grupo_etnia`
--
ALTER TABLE `grupo_etnia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pregunta_detalle`
--
ALTER TABLE `pregunta_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `id_sede` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_pregunta`
--
ALTER TABLE `tipo_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003811369;

--
-- AUTO_INCREMENT de la tabla `work`
--
ALTER TABLE `work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `work_type`
--
ALTER TABLE `work_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `fk_documento_a_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `documento_tipo` (`id_tipo`),
  ADD CONSTRAINT `fk_documento_estado` FOREIGN KEY (`id_estado`) REFERENCES `documento_estado` (`id_estado`),
  ADD CONSTRAINT `fk_documento_user` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formularios`
--
ALTER TABLE `formularios`
  ADD CONSTRAINT `fk_formulario_prueba_documento_tipo1` FOREIGN KEY (`documento_tipo_id_tipo`) REFERENCES `documento_tipo` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `fk_preguntas_formularios` FOREIGN KEY (`formulario_id`) REFERENCES `secciones` (`formulario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_preguntas_secciones1` FOREIGN KEY (`secciones_id`) REFERENCES `secciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_preguntas_tipo_pregunta1` FOREIGN KEY (`tipo_pregunta_id`) REFERENCES `tipo_pregunta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta_detalle`
--
ALTER TABLE `pregunta_detalle`
  ADD CONSTRAINT `fk_pregunta_detalle_preguntas1` FOREIGN KEY (`preguntas_id`) REFERENCES `preguntas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_respuesta_secciones` FOREIGN KEY (`secciones_id`) REFERENCES `preguntas` (`secciones_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_respuestas_documento1` FOREIGN KEY (`documento_id_documento`) REFERENCES `documento` (`id_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_respuestas_formulario` FOREIGN KEY (`formulario_id`) REFERENCES `preguntas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_respuestas_pregunta_detalle1` FOREIGN KEY (`pregunta_detalle_id`) REFERENCES `pregunta_detalle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_respuestas_preguntas1` FOREIGN KEY (`preguntas_id`) REFERENCES `preguntas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `fk_secciones_formulario_prueba1` FOREIGN KEY (`formulario_id`) REFERENCES `formularios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_genero1` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `fk_users_grupo_etnia1` FOREIGN KEY (`grupo_etnia_id`) REFERENCES `grupo_etnia` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `fk_work_documento1` FOREIGN KEY (`documento_id_documento`) REFERENCES `documento` (`id_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_work_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_work_work_type1` FOREIGN KEY (`work_type_id`) REFERENCES `work_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
