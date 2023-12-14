-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2023 a las 17:03:03
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `django_reservas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add mesa', 8, 'add_mesa'),
(30, 'Can change mesa', 8, 'change_mesa'),
(31, 'Can delete mesa', 8, 'delete_mesa'),
(32, 'Can view mesa', 8, 'view_mesa'),
(33, 'Can add reserva', 9, 'add_reserva'),
(34, 'Can change reserva', 9, 'change_reserva'),
(35, 'Can delete reserva', 9, 'delete_reserva'),
(36, 'Can view reserva', 9, 'view_reserva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$VKH5CQChJBQXIO9ZIUEsPu$t24k6euEJsmP00acdJIE3P2LEaMa3eTDwUcPrGyJdR4=', '2023-12-14 09:21:43.389570', 1, 'admin', '', '', '', 1, 1, '2023-12-14 09:21:29.356285');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-12-14 09:21:56.898556', '1', 'Keanu Reeves', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-12-14 09:22:03.656523', '2', 'Ryan Gosling', 1, '[{\"added\": {}}]', 7, 1),
(3, '2023-12-14 09:22:11.505703', '3', 'Axel Mondaca', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-12-14 09:22:18.034390', '1', 'Mesa 1', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-12-14 09:22:35.474106', '2', 'Mesa 2', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-12-14 09:22:42.474601', '3', 'Mesa 3', 1, '[{\"added\": {}}]', 8, 1),
(7, '2023-12-14 09:22:49.709905', '4', 'Mesa 4', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-12-14 09:22:58.405912', '5', 'Mesa 5', 1, '[{\"added\": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'taller_app', 'cliente'),
(8, 'taller_app', 'mesa'),
(9, 'taller_app', 'reserva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-12-14 09:20:27.737436'),
(2, 'auth', '0001_initial', '2023-12-14 09:20:33.823268'),
(3, 'admin', '0001_initial', '2023-12-14 09:20:35.621853'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-12-14 09:20:35.651454'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-14 09:20:35.677355'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-12-14 09:20:36.107193'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-12-14 09:20:37.282053'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-12-14 09:20:37.357167'),
(9, 'auth', '0004_alter_user_username_opts', '2023-12-14 09:20:37.402305'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-12-14 09:20:37.873847'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-12-14 09:20:37.898011'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-12-14 09:20:37.934944'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-12-14 09:20:38.148073'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-12-14 09:20:38.233297'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-12-14 09:20:38.316111'),
(16, 'auth', '0011_update_proxy_permissions', '2023-12-14 09:20:38.360121'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-12-14 09:20:38.483365'),
(18, 'sessions', '0001_initial', '2023-12-14 09:20:39.052027'),
(19, 'taller_app', '0001_initial', '2023-12-14 09:20:40.575941'),
(20, 'taller_app', '0002_alter_reserva_nombre_cliente', '2023-12-14 09:20:41.967644'),
(21, 'taller_app', '0003_alter_cliente_telefono', '2023-12-14 09:33:21.548366'),
(22, 'taller_app', '0004_alter_reserva_telefono', '2023-12-14 09:34:36.025290'),
(23, 'taller_app', '0005_alter_reserva_options', '2023-12-14 13:45:13.820292');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('24nsod3ie4nd3hyo4gjyyg0uxb2knyo8', '.eJxVjMEOwiAQBf-FsyEsCAsevfcbCCwgVQNJaU_Gf9cmPej1zcx7MR-2tfpt5MXPiV0YsNPvFgM9cttBuod265x6W5c58l3hBx186ik_r4f7d1DDqN86giAtI6KSTlgVkykWNAnQQWuQBZVxKA3Ys6SoEYuR6AhMNoRB5cTeH665Nrk:1rDhuZ:BEVaUH9iG1I9kF58F8x43fpkM29MsEsehmsYCp8neuI', '2023-12-28 09:21:43.414661');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller_app_cliente`
--

CREATE TABLE `taller_app_cliente` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `taller_app_cliente`
--

INSERT INTO `taller_app_cliente` (`id`, `nombre`, `telefono`) VALUES
(1, 'Keanu Reeves', '994562361'),
(2, 'Ryan Gosling', '956982336'),
(3, 'Axel Mondaca', '994952369');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller_app_mesa`
--

CREATE TABLE `taller_app_mesa` (
  `id` bigint(20) NOT NULL,
  `numero` int(11) NOT NULL,
  `capacidad_personas` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `taller_app_mesa`
--

INSERT INTO `taller_app_mesa` (`id`, `numero`, `capacidad_personas`, `estado`) VALUES
(1, 1, 5, 1),
(2, 2, 10, 0),
(3, 3, 15, 0),
(4, 4, 4, 0),
(5, 5, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller_app_reserva`
--

CREATE TABLE `taller_app_reserva` (
  `id` bigint(20) NOT NULL,
  `nombre_cliente_id` bigint(20) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `hora_reserva` time(6) NOT NULL,
  `cantidad_personas` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `observacion` longtext NOT NULL,
  `mesa_asignada_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `taller_app_reserva`
--

INSERT INTO `taller_app_reserva` (`id`, `nombre_cliente_id`, `telefono`, `fecha_reserva`, `hora_reserva`, `cantidad_personas`, `estado`, `observacion`, `mesa_asignada_id`) VALUES
(1, 3, '', '2023-12-20', '18:00:00.000000', 2, 'RESERVADO', '', 5),
(5, 3, '', '2023-12-14', '18:00:00.000000', 15, 'ANULADA', '', 5),
(6, 2, '', '2023-12-17', '18:00:00.000000', 2, 'COMPLETADA', '', 1),
(7, 2, '', '2023-12-20', '18:00:00.000000', 2, 'RESERVADO', '', 1),
(8, 1, '', '2023-12-20', '18:00:00.000000', 2, 'RESERVADO', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `taller_app_cliente`
--
ALTER TABLE `taller_app_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `taller_app_mesa`
--
ALTER TABLE `taller_app_mesa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Indices de la tabla `taller_app_reserva`
--
ALTER TABLE `taller_app_reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taller_app_reserva_mesa_asignada_id_282cadfc_fk_taller_ap` (`mesa_asignada_id`),
  ADD KEY `taller_app_reserva_nombre_cliente_id_9fffbc29` (`nombre_cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `taller_app_cliente`
--
ALTER TABLE `taller_app_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `taller_app_mesa`
--
ALTER TABLE `taller_app_mesa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `taller_app_reserva`
--
ALTER TABLE `taller_app_reserva`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `taller_app_reserva`
--
ALTER TABLE `taller_app_reserva`
  ADD CONSTRAINT `taller_app_reserva_mesa_asignada_id_282cadfc_fk_taller_ap` FOREIGN KEY (`mesa_asignada_id`) REFERENCES `taller_app_mesa` (`id`),
  ADD CONSTRAINT `taller_app_reserva_nombre_cliente_id_9fffbc29_fk_taller_ap` FOREIGN KEY (`nombre_cliente_id`) REFERENCES `taller_app_cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
