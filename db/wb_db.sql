-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+deb12u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2025 at 05:01 PM
-- Server version: 10.11.14-MariaDB-0+deb12u2
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wb_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE `hr` (
  `id_hr` int(11) NOT NULL,
  `work_order` varchar(30) NOT NULL,
  `producto` varchar(30) NOT NULL,
  `cant_border` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hr`
--

INSERT INTO `hr` (`id_hr`, `work_order`, `producto`, `cant_border`) VALUES
(1, 'WO0001', 'OPB170', 1),
(2, 'WO0002', 'OPB823', 2),
(3, 'WO0003', 'OP 256', 2),
(4, 'WO0004', 'OPB304', 3),
(5, 'WO0005', 'OP 535', 1),
(6, 'WO0006', 'OPB629', 2),
(7, 'WO0007', 'OPB966', 3),
(8, 'WO0008', 'OP 259', 3),
(9, 'WO0009', 'OP 248', 3),
(10, 'WO0010', 'OPB494', 1),
(11, 'WO0011', 'OPB678', 2),
(12, 'WO0012', 'OPB622', 3),
(13, 'WO0013', 'OPB162', 3),
(14, 'WO0014', 'OPB937', 2),
(15, 'WO0015', 'OPB598', 2),
(16, 'WO0016', 'OPB243', 3),
(17, 'WO0017', 'OP 837', 1),
(18, 'WO0018', 'OPB362', 2),
(19, 'WO0019', 'OPB256', 3),
(20, 'WO0020', 'OP 176', 3),
(21, 'WO0021', 'OP 185', 3),
(22, 'WO0022', 'OPB392', 2),
(23, 'WO0023', 'OPB456', 2),
(24, 'WO0024', 'OP 938', 2),
(25, 'WO0025', 'OPB853', 3),
(26, 'WO0026', 'OP 802', 1),
(27, 'WO0027', 'OP 898', 2),
(28, 'WO0028', 'OP 893', 3),
(29, 'WO0029', 'OP 647', 1),
(30, 'WO0030', 'OPB872', 1);

-- --------------------------------------------------------

--
-- Table structure for table `maquina`
--

CREATE TABLE `maquina` (
  `id_maquina` int(11) NOT NULL,
  `no_maquina` varchar(30) NOT NULL,
  `flujo` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maquina`
--

INSERT INTO `maquina` (`id_maquina`, `no_maquina`, `flujo`, `tipo`) VALUES
(1, 'WB_001', 15, 'lateral'),
(2, 'WB_002', 16, 'lateral'),
(3, 'WB_003', 18, 'fotologico'),
(4, 'WB_004', 17, 'miniaxial'),
(5, 'WB_005', 14, 'maxiaxial');

-- --------------------------------------------------------

--
-- Table structure for table `operacion_maquina`
--

CREATE TABLE `operacion_maquina` (
  `id_operacion` int(11) NOT NULL,
  `id_maquina` int(11) NOT NULL,
  `id_operador` int(11) NOT NULL,
  `id_reel` int(11) NOT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_hr` int(11) DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `t_operacion` decimal(10,2) DEFAULT NULL,
  `consumo` decimal(10,3) DEFAULT NULL,
  `cant_piezas` int(11) DEFAULT NULL,
  `scrap` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `operacion_maquina`
--

INSERT INTO `operacion_maquina` (`id_operacion`, `id_maquina`, `id_operador`, `id_reel`, `id_tecnico`, `id_hr`, `fecha_inicio`, `fecha_fin`, `t_operacion`, `consumo`, `cant_piezas`, `scrap`) VALUES
(1, 1, 1, 9, 1, 9, '2025-09-18 06:01:00', '2025-09-10 11:49:00', 5.36, 98.300, 228, 3.400),
(2, 2, 2, 4, 1, 23, '2025-09-28 06:55:00', '2025-09-27 15:03:00', 11.18, 93.600, 213, 3.650),
(3, 3, 3, 9, 1, 15, '2025-09-16 06:23:00', '2025-09-22 09:17:00', 12.15, 79.700, 50, 2.630),
(4, 4, 4, 8, 2, 2, '2025-09-13 15:06:00', '2025-09-14 10:25:00', 12.43, 93.500, 274, 4.790),
(5, 5, 5, 2, 2, 30, '2025-09-30 13:06:00', '2025-09-26 15:35:00', 14.47, 84.000, 198, 0.820),
(6, 1, 1, 1, 3, 15, '2025-09-08 13:05:00', '2025-09-29 10:54:00', 11.53, 83.900, 151, 1.130),
(7, 2, 2, 12, 3, 24, '2025-09-06 12:01:00', '2025-09-16 13:01:00', 10.26, 77.900, 167, 4.930),
(8, 3, 3, 7, 3, 27, '2025-09-10 15:04:00', '2025-09-22 13:24:00', 12.98, 85.300, 106, 1.160),
(9, 4, 4, 6, 3, 6, '2025-09-22 15:23:00', '2025-09-23 12:59:00', 12.62, 93.600, 137, 1.120),
(10, 5, 5, 1, 3, 7, '2025-09-01 09:59:00', '2025-09-01 14:28:00', 10.58, 95.800, 237, 0.200),
(11, 1, 1, 12, 3, 16, '2025-09-19 10:05:00', '2025-09-09 07:53:00', 13.03, 82.900, 243, 0.700),
(12, 2, 2, 5, 2, 15, '2025-09-26 12:23:00', '2025-09-26 07:03:00', 11.41, 61.500, 289, 3.330),
(13, 3, 3, 6, 1, 7, '2025-09-06 07:20:00', '2025-09-06 11:28:00', 5.06, 71.700, 123, 2.890),
(14, 4, 4, 1, 1, 19, '2025-09-03 11:23:00', '2025-09-17 15:35:00', 8.76, 68.600, 251, 1.800),
(15, 5, 5, 5, 3, 10, '2025-09-26 07:41:00', '2025-09-13 11:46:00', 6.95, 86.900, 177, 2.640),
(16, 1, 1, 2, 3, 16, '2025-09-21 13:39:00', '2025-09-29 08:49:00', 3.90, 64.500, 263, 4.580),
(17, 2, 2, 1, 2, 28, '2025-09-10 14:39:00', '2025-09-15 13:10:00', 13.63, 83.800, 71, 3.230),
(18, 3, 3, 12, 3, 20, '2025-09-17 13:25:00', '2025-09-06 11:18:00', 6.26, 67.600, 92, 1.400),
(19, 4, 4, 11, 2, 13, '2025-09-07 13:50:00', '2025-09-13 11:31:00', 4.45, 81.200, 128, 4.830),
(20, 5, 5, 11, 2, 7, '2025-09-10 14:40:00', '2025-09-17 15:49:00', 14.50, 88.300, 58, 0.270),
(21, 1, 1, 2, 3, 26, '2025-09-08 12:52:00', '2025-09-24 12:44:00', 11.06, 67.500, 241, 1.260),
(22, 2, 2, 12, 1, 19, '2025-09-22 13:08:00', '2025-09-17 10:35:00', 2.00, 98.900, 268, 2.230),
(23, 3, 3, 8, 3, 25, '2025-09-29 07:07:00', '2025-09-26 13:40:00', 11.21, 60.600, 159, 0.720),
(24, 4, 4, 5, 2, 23, '2025-10-01 12:10:00', '2025-09-08 08:40:00', 4.24, 83.100, 94, 0.740),
(25, 5, 5, 3, 2, 13, '2025-09-09 06:25:00', '2025-09-14 06:44:00', 9.98, 68.300, 76, 4.520),
(26, 1, 1, 3, 1, 26, '2025-09-12 08:32:00', '2025-09-08 09:28:00', 6.48, 74.700, 150, 4.500),
(27, 2, 2, 4, 3, 29, '2025-09-16 12:24:00', '2025-09-24 13:58:00', 5.15, 97.300, 104, 1.410),
(28, 3, 3, 10, 3, 16, '2025-09-20 12:38:00', '2025-09-16 10:07:00', 10.37, 60.500, 288, 3.590),
(29, 4, 4, 9, 2, 15, '2025-09-24 10:11:00', '2025-09-26 14:21:00', 1.14, 80.600, 93, 1.550),
(30, 5, 5, 1, 1, 4, '2025-09-27 14:48:00', '2025-09-30 07:00:00', 9.07, 88.200, 127, 2.160),
(31, 1, 1, 3, 3, 21, '2025-09-24 12:57:00', '2025-09-10 10:27:00', 2.60, 89.500, 270, 0.880),
(32, 2, 2, 3, 3, 23, '2025-09-19 14:10:00', '2025-09-11 08:37:00', 7.45, 98.100, 150, 0.700),
(33, 3, 3, 7, 1, 29, '2025-09-17 12:52:00', '2025-10-01 13:24:00', 11.15, 86.400, 262, 1.260),
(34, 4, 4, 9, 3, 30, '2025-09-14 08:10:00', '2025-09-26 09:50:00', 4.63, 81.500, 249, 1.800),
(35, 5, 5, 5, 3, 21, '2025-09-13 15:34:00', '2025-09-23 12:11:00', 3.91, 98.000, 58, 1.630),
(36, 1, 1, 7, 2, 18, '2025-09-03 12:21:00', '2025-10-01 15:43:00', 1.16, 88.300, 63, 0.720),
(37, 2, 2, 7, 2, 6, '2025-09-25 09:34:00', '2025-09-16 09:16:00', 15.32, 86.400, 135, 3.610),
(38, 3, 3, 8, 3, 4, '2025-09-10 07:06:00', '2025-09-21 06:10:00', 5.21, 67.800, 138, 0.920),
(39, 4, 4, 11, 3, 5, '2025-09-15 15:06:00', '2025-09-08 10:41:00', 7.48, 64.100, 65, 0.010),
(40, 5, 5, 10, 1, 7, '2025-09-21 12:31:00', '2025-09-11 13:11:00', 11.71, 80.000, 142, 1.680),
(41, 1, 1, 7, 3, 23, '2025-09-01 14:31:00', '2025-09-10 14:54:00', 3.15, 68.900, 218, 3.410),
(42, 2, 2, 5, 3, 16, '2025-09-26 11:16:00', '2025-09-07 10:47:00', 2.41, 90.100, 180, 1.680),
(43, 3, 3, 2, 2, 21, '2025-09-18 13:44:00', '2025-09-09 15:27:00', 13.26, 95.500, 211, 2.780),
(44, 4, 4, 11, 2, 14, '2025-09-13 13:01:00', '2025-09-12 12:36:00', 4.48, 87.000, 281, 2.910),
(45, 5, 5, 2, 3, 17, '2025-09-24 07:14:00', '2025-09-12 10:28:00', 7.79, 83.400, 189, 0.140),
(46, 1, 1, 6, 1, 27, '2025-09-22 13:54:00', '2025-09-30 09:11:00', 9.69, 91.900, 278, 0.810),
(47, 2, 2, 1, 3, 7, '2025-09-12 07:59:00', '2025-09-29 06:37:00', 3.42, 84.900, 261, 1.770),
(48, 3, 3, 3, 1, 29, '2025-09-11 13:53:00', '2025-09-02 14:22:00', 15.44, 74.100, 161, 0.830),
(49, 4, 4, 6, 3, 13, '2025-09-06 11:38:00', '2025-09-12 07:49:00', 15.87, 74.700, 106, 0.110),
(50, 5, 5, 6, 1, 7, '2025-09-25 08:56:00', '2025-09-04 13:17:00', 5.64, 70.800, 158, 1.740);

-- --------------------------------------------------------

--
-- Table structure for table `operador`
--

CREATE TABLE `operador` (
  `id_operador` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_n` varchar(30) NOT NULL,
  `no_reloj` int(11) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `maquina_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `operador`
--

INSERT INTO `operador` (`id_operador`, `name`, `last_n`, `no_reloj`, `id_turno`, `maquina_id`) VALUES
(1, 'Ana', 'Lopez', 40, 1, 1),
(2, 'Bruno', 'Perez', 41, 1, 2),
(3, 'Carla', 'Reyes', 42, 1, 3),
(4, 'Diego', 'Moran', 43, 1, 4),
(5, 'Elena', 'Vega', 44, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reel`
--

CREATE TABLE `reel` (
  `id_reel` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `no_inventario` varchar(30) NOT NULL,
  `start` tinyint(1) NOT NULL DEFAULT 0,
  `maquina_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reel`
--

INSERT INTO `reel` (`id_reel`, `longitud`, `no_inventario`, `start`, `maquina_id`) VALUES
(1, 328, 'C230-057-001', 1, 1),
(2, 328, 'C230-057-002', 1, 2),
(3, 328, 'C230-057-003', 1, 3),
(4, 328, 'C230-057-004', 1, 4),
(5, 328, 'C230-057-005', 1, 5),
(6, 328, 'C230-057-006', 1, 1),
(7, 328, 'C230-057-007', 1, 2),
(8, 328, 'C230-057-008', 1, 3),
(9, 328, 'C230-057-009', 1, 4),
(10, 328, 'C230-057-010', 1, 5),
(11, 328, 'C230-057-011', 1, 1),
(12, 328, 'C230-057-012', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `registro_carrete`
--

CREATE TABLE `registro_carrete` (
  `id_registroC` int(11) NOT NULL,
  `id_operador` int(11) NOT NULL,
  `id_maquina` int(11) NOT NULL,
  `id_reel` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registro_carrete`
--

INSERT INTO `registro_carrete` (`id_registroC`, `id_operador`, `id_maquina`, `id_reel`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 1, 1, 1, '2025-09-06 15:15:00', '2025-09-08 09:59:00'),
(2, 1, 1, 1, '2025-09-04 12:52:00', '2025-09-08 06:24:00'),
(3, 1, 1, 1, '2025-09-08 13:33:00', '2025-09-06 10:58:00'),
(4, 1, 1, 1, '2025-09-22 08:48:00', '2025-09-13 06:53:00'),
(5, 1, 1, 6, '2025-09-01 09:38:00', '2025-09-25 13:33:00'),
(6, 1, 1, 6, '2025-09-04 06:45:00', '2025-09-03 08:02:00'),
(7, 1, 1, 6, '2025-09-29 10:44:00', '2025-09-22 15:33:00'),
(8, 1, 1, 6, '2025-09-27 15:36:00', '2025-09-13 06:17:00'),
(9, 1, 1, 6, '2025-09-09 13:45:00', '2025-09-05 09:36:00'),
(10, 1, 1, 6, '2025-09-21 09:01:00', '2025-09-17 13:11:00'),
(11, 1, 1, 6, '2025-09-05 11:20:00', '2025-09-09 13:30:00'),
(12, 1, 1, 6, '2025-09-08 10:45:00', '2025-09-23 08:15:00'),
(13, 1, 1, 11, '2025-09-18 09:37:00', '2025-09-04 10:36:00'),
(14, 1, 1, 11, '2025-09-19 15:37:00', '2025-09-05 12:59:00'),
(15, 1, 1, 11, '2025-09-20 13:23:00', '2025-09-27 15:45:00'),
(16, 1, 1, 11, '2025-10-01 12:44:00', '2025-09-17 12:06:00'),
(17, 2, 2, 2, '2025-09-15 15:06:00', '2025-09-09 11:31:00'),
(18, 2, 2, 2, '2025-09-10 11:46:00', '2025-10-01 08:12:00'),
(19, 2, 2, 2, '2025-09-29 08:27:00', '2025-09-16 13:09:00'),
(20, 2, 2, 12, '2025-09-17 08:52:00', '2025-09-26 09:09:00'),
(21, 2, 2, 12, '2025-09-01 07:11:00', '2025-09-18 10:53:00'),
(22, 2, 2, 12, '2025-09-02 07:26:00', '2025-09-19 11:14:00'),
(23, 2, 2, 12, '2025-09-15 14:35:00', '2025-09-01 11:12:00'),
(24, 2, 2, 12, '2025-09-30 08:39:00', '2025-09-16 12:19:00'),
(25, 3, 3, 3, '2025-09-16 10:44:00', '2025-09-29 07:32:00'),
(26, 3, 3, 3, '2025-09-05 06:28:00', '2025-09-25 13:10:00'),
(27, 3, 3, 3, '2025-09-11 13:54:00', '2025-09-01 12:22:00'),
(28, 3, 3, 8, '2025-09-01 10:37:00', '2025-09-11 09:00:00'),
(29, 3, 3, 8, '2025-09-11 09:55:00', '2025-09-30 12:02:00'),
(30, 3, 3, 8, '2025-09-02 12:14:00', '2025-09-04 11:44:00'),
(31, 3, 3, 8, '2025-09-04 14:52:00', '2025-09-06 07:28:00'),
(32, 3, 3, 8, '2025-09-18 08:34:00', '2025-09-19 07:57:00'),
(33, 3, 3, 8, '2025-09-11 07:48:00', '2025-09-28 14:15:00'),
(34, 3, 3, 8, '2025-09-05 06:51:00', '2025-09-02 15:28:00'),
(35, 3, 3, 8, '2025-09-11 13:01:00', '2025-09-20 15:15:00'),
(36, 4, 4, 4, '2025-09-05 09:24:00', '2025-09-10 11:40:00'),
(37, 4, 4, 4, '2025-09-16 15:39:00', '2025-09-14 08:40:00'),
(38, 4, 4, 4, '2025-09-09 08:53:00', '2025-09-21 10:35:00'),
(39, 4, 4, 4, '2025-09-04 12:49:00', '2025-09-04 11:28:00'),
(40, 4, 4, 4, '2025-09-06 13:57:00', '2025-09-17 07:44:00'),
(41, 4, 4, 9, '2025-09-28 12:26:00', '2025-09-19 15:49:00'),
(42, 4, 4, 9, '2025-09-02 11:31:00', '2025-09-23 14:42:00'),
(43, 4, 4, 9, '2025-09-22 12:47:00', '2025-09-12 13:43:00'),
(44, 4, 4, 9, '2025-09-13 13:10:00', '2025-09-16 08:57:00'),
(45, 5, 5, 5, '2025-09-04 11:31:00', '2025-09-15 12:59:00'),
(46, 5, 5, 5, '2025-09-15 15:04:00', '2025-09-09 11:32:00'),
(47, 5, 5, 10, '2025-09-12 14:24:00', '2025-09-05 08:08:00'),
(48, 5, 5, 10, '2025-09-05 06:17:00', '2025-09-24 12:22:00'),
(49, 5, 5, 10, '2025-09-22 12:45:00', '2025-09-13 15:06:00'),
(50, 5, 5, 10, '2025-09-08 06:25:00', '2025-09-15 08:12:00');

-- --------------------------------------------------------

--
-- Table structure for table `registro_operador`
--

CREATE TABLE `registro_operador` (
  `id_registroO` int(11) NOT NULL,
  `id_operador` int(11) NOT NULL,
  `id_maquina` int(11) NOT NULL,
  `id_turno` int(11) DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registro_operador`
--

INSERT INTO `registro_operador` (`id_registroO`, `id_operador`, `id_maquina`, `id_turno`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 1, 1, 1, '2025-09-14 07:51:00', '2025-09-19 10:54:00'),
(2, 2, 2, 1, '2025-09-17 14:21:00', '2025-09-22 14:49:00'),
(3, 3, 3, 1, '2025-09-09 07:31:00', '2025-10-01 10:29:00'),
(4, 4, 4, 1, '2025-09-06 15:32:00', '2025-09-11 13:58:00'),
(5, 5, 5, 1, '2025-09-22 09:05:00', '2025-09-17 13:44:00'),
(6, 1, 1, 1, '2025-09-02 09:48:00', '2025-09-26 14:53:00'),
(7, 2, 2, 1, '2025-09-23 09:33:00', '2025-09-20 07:06:00'),
(8, 3, 3, 1, '2025-09-19 08:18:00', '2025-09-13 08:48:00'),
(9, 4, 4, 1, '2025-09-08 10:47:00', '2025-09-24 09:58:00'),
(10, 5, 5, 1, '2025-10-01 06:27:00', '2025-09-09 08:15:00'),
(11, 1, 1, 1, '2025-09-25 07:11:00', '2025-09-07 12:41:00'),
(12, 2, 2, 1, '2025-09-18 12:11:00', '2025-09-16 12:41:00'),
(13, 3, 3, 1, '2025-09-29 08:54:00', '2025-09-22 12:07:00'),
(14, 4, 4, 1, '2025-09-25 07:15:00', '2025-09-10 08:02:00'),
(15, 5, 5, 1, '2025-09-11 12:51:00', '2025-09-17 11:33:00'),
(16, 1, 1, 1, '2025-09-12 07:45:00', '2025-09-26 11:11:00'),
(17, 2, 2, 1, '2025-09-13 09:32:00', '2025-09-21 07:43:00'),
(18, 3, 3, 1, '2025-09-21 14:11:00', '2025-09-07 11:15:00'),
(19, 4, 4, 1, '2025-09-06 07:05:00', '2025-10-01 12:01:00'),
(20, 5, 5, 1, '2025-09-21 15:22:00', '2025-09-27 09:24:00'),
(21, 1, 1, 1, '2025-09-29 15:20:00', '2025-09-03 10:58:00'),
(22, 2, 2, 1, '2025-09-28 11:51:00', '2025-09-11 14:48:00'),
(23, 3, 3, 1, '2025-09-17 09:09:00', '2025-09-01 07:50:00'),
(24, 4, 4, 1, '2025-09-09 07:21:00', '2025-09-27 14:07:00'),
(25, 5, 5, 1, '2025-09-09 12:32:00', '2025-09-18 14:25:00'),
(26, 1, 1, 1, '2025-09-03 14:34:00', '2025-09-04 15:19:00'),
(27, 2, 2, 1, '2025-09-02 07:08:00', '2025-09-14 14:12:00'),
(28, 3, 3, 1, '2025-09-17 08:25:00', '2025-09-21 11:21:00'),
(29, 4, 4, 1, '2025-09-26 06:52:00', '2025-09-30 11:28:00'),
(30, 5, 5, 1, '2025-09-14 12:52:00', '2025-09-08 07:05:00'),
(31, 1, 1, 1, '2025-09-13 14:03:00', '2025-09-29 06:35:00'),
(32, 2, 2, 1, '2025-09-15 13:41:00', '2025-09-17 08:48:00'),
(33, 3, 3, 1, '2025-10-01 11:56:00', '2025-09-04 13:32:00'),
(34, 4, 4, 1, '2025-10-01 11:21:00', '2025-09-25 09:23:00'),
(35, 5, 5, 1, '2025-09-16 12:26:00', '2025-09-24 13:38:00'),
(36, 1, 1, 1, '2025-09-20 10:07:00', '2025-09-07 13:04:00'),
(37, 2, 2, 1, '2025-09-30 12:09:00', '2025-09-11 13:52:00'),
(38, 3, 3, 1, '2025-09-06 08:21:00', '2025-09-20 10:09:00'),
(39, 4, 4, 1, '2025-09-25 08:39:00', '2025-09-01 09:04:00'),
(40, 5, 5, 1, '2025-09-10 07:56:00', '2025-09-03 13:51:00'),
(41, 1, 1, 1, '2025-09-05 11:58:00', '2025-09-20 09:27:00'),
(42, 2, 2, 1, '2025-09-26 13:50:00', '2025-09-18 09:54:00'),
(43, 3, 3, 1, '2025-09-07 08:14:00', '2025-09-16 14:31:00'),
(44, 4, 4, 1, '2025-09-05 10:59:00', '2025-09-04 06:34:00'),
(45, 5, 5, 1, '2025-09-04 06:09:00', '2025-09-24 13:10:00'),
(46, 1, 1, 1, '2025-09-19 15:14:00', '2025-09-29 13:51:00'),
(47, 2, 2, 1, '2025-09-20 10:52:00', '2025-09-20 12:37:00'),
(48, 3, 3, 1, '2025-09-06 11:46:00', '2025-09-13 09:07:00'),
(49, 4, 4, 1, '2025-09-19 06:14:00', '2025-09-12 13:12:00'),
(50, 5, 5, 1, '2025-09-16 15:25:00', '2025-09-09 11:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `registro_tecnico`
--

CREATE TABLE `registro_tecnico` (
  `id_registroT` int(11) NOT NULL,
  `id_maquina` int(11) NOT NULL,
  `id_tecnico` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registro_tecnico`
--

INSERT INTO `registro_tecnico` (`id_registroT`, `id_maquina`, `id_tecnico`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 3, 3, '2025-10-01 06:58:00', '2025-09-17 10:16:00'),
(2, 1, 2, '2025-09-11 11:55:00', '2025-09-01 08:13:00'),
(3, 4, 3, '2025-10-01 14:59:00', '2025-09-20 10:26:00'),
(4, 1, 1, '2025-09-19 14:42:00', '2025-09-21 12:14:00'),
(5, 1, 2, '2025-09-15 13:47:00', '2025-09-20 13:01:00'),
(6, 1, 3, '2025-09-21 14:44:00', '2025-09-14 11:25:00'),
(7, 2, 1, '2025-09-20 08:29:00', '2025-09-12 07:27:00'),
(8, 2, 3, '2025-09-25 14:25:00', '2025-09-28 15:10:00'),
(9, 4, 2, '2025-09-28 12:45:00', '2025-09-27 07:13:00'),
(10, 1, 1, '2025-09-24 08:08:00', '2025-09-25 08:43:00'),
(11, 5, 2, '2025-09-09 12:52:00', '2025-09-21 07:38:00'),
(12, 3, 3, '2025-09-17 13:02:00', '2025-10-01 13:49:00'),
(13, 4, 2, '2025-09-12 09:33:00', '2025-09-22 09:59:00'),
(14, 1, 3, '2025-09-29 06:55:00', '2025-09-23 09:43:00'),
(15, 1, 2, '2025-09-03 06:32:00', '2025-09-01 14:57:00'),
(16, 4, 3, '2025-09-11 07:29:00', '2025-09-23 07:31:00'),
(17, 2, 3, '2025-09-13 10:45:00', '2025-09-06 10:54:00'),
(18, 4, 1, '2025-09-26 10:54:00', '2025-09-01 12:18:00'),
(19, 4, 1, '2025-09-04 10:56:00', '2025-09-06 09:23:00'),
(20, 5, 1, '2025-09-25 11:12:00', '2025-09-11 06:40:00'),
(21, 2, 3, '2025-09-05 07:21:00', '2025-09-10 07:15:00'),
(22, 5, 2, '2025-09-21 15:32:00', '2025-09-27 10:09:00'),
(23, 1, 1, '2025-09-26 06:02:00', '2025-09-19 15:39:00'),
(24, 4, 1, '2025-09-16 07:32:00', '2025-09-09 14:43:00'),
(25, 2, 2, '2025-09-30 07:17:00', '2025-09-25 12:13:00'),
(26, 3, 3, '2025-09-08 13:33:00', '2025-09-06 12:18:00'),
(27, 1, 2, '2025-09-22 10:31:00', '2025-09-07 12:08:00'),
(28, 3, 1, '2025-09-19 08:07:00', '2025-09-11 15:58:00'),
(29, 5, 3, '2025-09-10 06:26:00', '2025-09-09 09:00:00'),
(30, 1, 3, '2025-09-30 07:16:00', '2025-09-26 12:35:00'),
(31, 2, 2, '2025-09-14 08:49:00', '2025-09-05 14:45:00'),
(32, 3, 3, '2025-09-19 06:56:00', '2025-09-22 08:00:00'),
(33, 4, 2, '2025-09-27 12:06:00', '2025-09-19 07:07:00'),
(34, 2, 3, '2025-09-10 11:09:00', '2025-09-23 07:15:00'),
(35, 3, 1, '2025-09-06 15:17:00', '2025-09-07 07:22:00'),
(36, 4, 1, '2025-09-01 10:41:00', '2025-09-12 10:54:00'),
(37, 1, 1, '2025-09-15 10:07:00', '2025-09-21 06:59:00'),
(38, 5, 1, '2025-09-21 09:46:00', '2025-10-01 14:10:00'),
(39, 2, 1, '2025-09-13 14:22:00', '2025-09-02 12:34:00'),
(40, 5, 1, '2025-09-20 07:44:00', '2025-09-01 11:41:00'),
(41, 1, 1, '2025-09-16 06:59:00', '2025-10-01 11:46:00'),
(42, 5, 2, '2025-09-13 08:33:00', '2025-09-02 11:15:00'),
(43, 4, 3, '2025-09-16 13:34:00', '2025-09-14 13:49:00'),
(44, 5, 2, '2025-09-12 15:06:00', '2025-09-19 07:27:00'),
(45, 5, 1, '2025-09-16 12:43:00', '2025-09-29 10:43:00'),
(46, 4, 2, '2025-09-14 12:49:00', '2025-09-07 15:09:00'),
(47, 1, 2, '2025-09-27 06:34:00', '2025-09-23 10:37:00'),
(48, 2, 2, '2025-09-05 09:21:00', '2025-09-09 09:50:00'),
(49, 2, 1, '2025-09-06 08:01:00', '2025-09-17 06:13:00'),
(50, 2, 1, '2025-09-27 13:39:00', '2025-09-12 10:42:00');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `id_supervisor` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_n` varchar(30) NOT NULL,
  `no_reloj` int(11) NOT NULL,
  `cuenta` varchar(30) NOT NULL,
  `clave` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`id_supervisor`, `name`, `last_n`, `no_reloj`, `cuenta`, `clave`) VALUES
(1, 'Mariana', 'Gonzalez', 120345, 'marigonz120345', '9472015638'),
(2, 'Pablo', 'Ramirez', 983421, 'pablrami983421', '3801672495'),
(3, 'Lucia', 'Hernandez', 450872, 'lucihern450872', '7529014683'),
(4, 'Sergio', 'Castillo', 775009, 'sergcast775009', '1029384756'),
(5, 'Nadia', 'Lozada', 664312, 'nadiloza664312', '5647382910'),
(6, 'Ruben', 'Cortes', 332198, 'rubecort332198', '9182736450');

-- --------------------------------------------------------

--
-- Table structure for table `tecnico`
--

CREATE TABLE `tecnico` (
  `id_tecnico` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_n` varchar(30) NOT NULL,
  `no_reloj` int(11) NOT NULL,
  `id_turno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tecnico`
--

INSERT INTO `tecnico` (`id_tecnico`, `name`, `last_n`, `no_reloj`, `id_turno`) VALUES
(1, 'Javier', 'Rios', 550101, 1),
(2, 'Paola', 'Suarez', 550102, 1),
(3, 'Hector', 'Beltran', 550103, 1);

-- --------------------------------------------------------

--
-- Table structure for table `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `tiempo_inicio` datetime NOT NULL,
  `tiempo_fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `turno`
--

INSERT INTO `turno` (`id_turno`, `tipo`, `tiempo_inicio`, `tiempo_fin`) VALUES
(1, 'matutino', '2025-09-01 06:00:00', '2025-09-01 16:00:00'),
(2, 'matutino', '2025-09-01 06:00:00', '2025-09-01 16:00:00'),
(3, 'matutino', '2025-09-01 06:00:00', '2025-09-01 16:00:00'),
(4, 'matutino', '2025-09-01 06:00:00', '2025-09-01 16:00:00'),
(5, 'matutino', '2025-09-01 06:00:00', '2025-09-01 16:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hr`
--
ALTER TABLE `hr`
  ADD PRIMARY KEY (`id_hr`);

--
-- Indexes for table `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`id_maquina`),
  ADD UNIQUE KEY `no_maquina` (`no_maquina`);

--
-- Indexes for table `operacion_maquina`
--
ALTER TABLE `operacion_maquina`
  ADD PRIMARY KEY (`id_operacion`),
  ADD KEY `fk_opmaq_reel` (`id_reel`),
  ADD KEY `fk_opmaq_tecnico` (`id_tecnico`),
  ADD KEY `fk_opmaq_hr` (`id_hr`),
  ADD KEY `idx_opmaq_fecha` (`fecha_inicio`,`fecha_fin`),
  ADD KEY `idx_opmaq_maquina` (`id_maquina`),
  ADD KEY `idx_opmaq_operador` (`id_operador`);

--
-- Indexes for table `operador`
--
ALTER TABLE `operador`
  ADD PRIMARY KEY (`id_operador`),
  ADD UNIQUE KEY `maquina_id` (`maquina_id`),
  ADD KEY `fk_operador_turno` (`id_turno`),
  ADD KEY `idx_operador_noreloj` (`no_reloj`);

--
-- Indexes for table `reel`
--
ALTER TABLE `reel`
  ADD PRIMARY KEY (`id_reel`),
  ADD KEY `fk_reel_maquina` (`maquina_id`),
  ADD KEY `idx_reel_inv` (`no_inventario`);

--
-- Indexes for table `registro_carrete`
--
ALTER TABLE `registro_carrete`
  ADD PRIMARY KEY (`id_registroC`),
  ADD KEY `fk_regc_operador` (`id_operador`),
  ADD KEY `fk_regc_maquina` (`id_maquina`),
  ADD KEY `fk_regc_reel` (`id_reel`),
  ADD KEY `idx_regc_rango` (`fecha_inicio`,`fecha_fin`);

--
-- Indexes for table `registro_operador`
--
ALTER TABLE `registro_operador`
  ADD PRIMARY KEY (`id_registroO`),
  ADD KEY `fk_regop_operador` (`id_operador`),
  ADD KEY `fk_regop_maquina` (`id_maquina`),
  ADD KEY `fk_regop_turno` (`id_turno`),
  ADD KEY `idx_regop_rango` (`fecha_inicio`,`fecha_fin`);

--
-- Indexes for table `registro_tecnico`
--
ALTER TABLE `registro_tecnico`
  ADD PRIMARY KEY (`id_registroT`),
  ADD KEY `fk_regt_maquina` (`id_maquina`),
  ADD KEY `fk_regt_tecnico` (`id_tecnico`),
  ADD KEY `idx_regt_rango` (`fecha_inicio`,`fecha_fin`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`id_supervisor`),
  ADD KEY `idx_superv_noreloj` (`no_reloj`);

--
-- Indexes for table `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`id_tecnico`),
  ADD KEY `fk_tecnico_turno` (`id_turno`),
  ADD KEY `idx_tecnico_noreloj` (`no_reloj`);

--
-- Indexes for table `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hr`
--
ALTER TABLE `hr`
  MODIFY `id_hr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `maquina`
--
ALTER TABLE `maquina`
  MODIFY `id_maquina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `operacion_maquina`
--
ALTER TABLE `operacion_maquina`
  MODIFY `id_operacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `operador`
--
ALTER TABLE `operador`
  MODIFY `id_operador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reel`
--
ALTER TABLE `reel`
  MODIFY `id_reel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `registro_carrete`
--
ALTER TABLE `registro_carrete`
  MODIFY `id_registroC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `registro_operador`
--
ALTER TABLE `registro_operador`
  MODIFY `id_registroO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `registro_tecnico`
--
ALTER TABLE `registro_tecnico`
  MODIFY `id_registroT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `id_supervisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `id_tecnico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `operacion_maquina`
--
ALTER TABLE `operacion_maquina`
  ADD CONSTRAINT `fk_opmaq_hr` FOREIGN KEY (`id_hr`) REFERENCES `hr` (`id_hr`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_opmaq_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  ADD CONSTRAINT `fk_opmaq_operador` FOREIGN KEY (`id_operador`) REFERENCES `operador` (`id_operador`),
  ADD CONSTRAINT `fk_opmaq_reel` FOREIGN KEY (`id_reel`) REFERENCES `reel` (`id_reel`),
  ADD CONSTRAINT `fk_opmaq_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id_tecnico`) ON DELETE SET NULL;

--
-- Constraints for table `operador`
--
ALTER TABLE `operador`
  ADD CONSTRAINT `fk_operador_maquina` FOREIGN KEY (`maquina_id`) REFERENCES `maquina` (`id_maquina`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_operador_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`);

--
-- Constraints for table `reel`
--
ALTER TABLE `reel`
  ADD CONSTRAINT `fk_reel_maquina` FOREIGN KEY (`maquina_id`) REFERENCES `maquina` (`id_maquina`);

--
-- Constraints for table `registro_carrete`
--
ALTER TABLE `registro_carrete`
  ADD CONSTRAINT `fk_regc_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  ADD CONSTRAINT `fk_regc_operador` FOREIGN KEY (`id_operador`) REFERENCES `operador` (`id_operador`),
  ADD CONSTRAINT `fk_regc_reel` FOREIGN KEY (`id_reel`) REFERENCES `reel` (`id_reel`);

--
-- Constraints for table `registro_operador`
--
ALTER TABLE `registro_operador`
  ADD CONSTRAINT `fk_regop_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  ADD CONSTRAINT `fk_regop_operador` FOREIGN KEY (`id_operador`) REFERENCES `operador` (`id_operador`),
  ADD CONSTRAINT `fk_regop_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`) ON DELETE SET NULL;

--
-- Constraints for table `registro_tecnico`
--
ALTER TABLE `registro_tecnico`
  ADD CONSTRAINT `fk_regt_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  ADD CONSTRAINT `fk_regt_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`id_tecnico`);

--
-- Constraints for table `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `fk_tecnico_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
