-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Okt 2022 pada 18.04
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_chainwin_v2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `approvals`
--

CREATE TABLE `approvals` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `user_approval_1` varchar(30) DEFAULT NULL,
  `user_approval_2` varchar(30) DEFAULT NULL,
  `user_approval_3` varchar(30) DEFAULT NULL,
  `user_approval_4` varchar(30) DEFAULT NULL,
  `user_approval_5` varchar(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barcode_divides`
--

CREATE TABLE `barcode_divides` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `reff` varchar(50) DEFAULT NULL,
  `label_no` varchar(50) DEFAULT NULL,
  `label_divided` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT 0,
  `type` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barcode_divides`
--

INSERT INTO `barcode_divides` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `reff`, `label_no`, `label_divided`, `qty`, `type`, `status`) VALUES
('a4df2097c84d460497bf25d3cd0619', 'admin', '2022-10-13 18:02:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010001', 'POR-2210-0000010001-01', 5, 'SUPPLY', 0),
('dcdff5215b054294b3132aadb87d01', 'admin', '2022-10-13 18:02:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010001', 'POR-2210-0000010001-02', 5, 'BALANCE', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bom`
--

CREATE TABLE `bom` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `customer_id` varchar(30) DEFAULT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `component_id` varchar(30) DEFAULT NULL,
  `qpa` decimal(10,2) DEFAULT 0.00,
  `operation` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bom`
--

INSERT INTO `bom` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `customer_id`, `item_id`, `component_id`, `qpa`, `operation`, `status`) VALUES
('275abb9a5d204a22abec2aa587c5fa', 'admin', '2022-10-11 18:58:27', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '8ee1c3d0d3654c0194cba18cffaae9', '9a21160eec3f47f5a5ae1932627c3e', '0.56', 'P1', 0),
('4b32cab69080476f987af9eeb4f545', 'admin', '2022-10-11 19:02:44', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'c15ac21a3c8a498ebc4705b941b24f', '579a5b6ab1f047a8afcaa31d27e957', '0.61', 'P2', 0),
('6cc1fdd0279b4f059aeed7e263116d', 'admin', '2022-10-11 19:02:41', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'c15ac21a3c8a498ebc4705b941b24f', 'ef19b617f6454eeda06b0ce8029bb0', '0.15', 'P2', 0),
('84b1e50bc9c44c679e7b5d0ff971cc', 'admin', '2022-10-11 19:02:54', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'c15ac21a3c8a498ebc4705b941b24f', 'df6c9c0da472463b9dfe1de7cf0518', '1.20', 'P2', 0),
('97676130f17045509fedd026fba774', 'admin', '2022-10-11 19:02:19', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '8ee1c3d0d3654c0194cba18cffaae9', '12d216f47b9b4d09ab393337234653', '0.41', 'P1', 0),
('a9fb4835c5f547498a162f2f41ad7f', 'admin', '2022-10-11 19:02:36', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'c15ac21a3c8a498ebc4705b941b24f', '970957b7cbea47c78fea4f6e66b78e', '0.23', 'P2', 0),
('bbdc3373786c46ddba521067613caa', 'admin', '2022-10-11 18:58:18', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '8ee1c3d0d3654c0194cba18cffaae9', '1c90482587c74f7a96c8912df36bc9', '0.25', 'P1', 0),
('fc153f709bb441b5b0d8fcbda3cd7f', 'admin', '2022-10-11 19:03:04', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'c15ac21a3c8a498ebc4705b941b24f', '6728a46bee4748ceb6a2e1652f0c50', '0.09', 'P2', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `config`
--

CREATE TABLE `config` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `number` varchar(30) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `favicon` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `config`
--

INSERT INTO `config` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `address`, `logo`, `favicon`, `image`, `theme`, `status`) VALUES
('4c9a9e62-3ff6-11ed-a526-7085c2', 'admin', '2022-10-01 06:31:13', NULL, NULL, 0, 'CHAINWIN', 'PT CHAINWIN INDONESIA', 'ENTERPRISE RESOURCE PLANNING', 'CIKARANG - JAWABARAT', 'http://localhost:8080/erp_chainwin_v2/assets/image/config/logo/1665155179.png', 'http://localhost:8080/erp_chainwin_v2/assets/image/config/favicon/1665155179.png', 'http://localhost:8080/erp_chainwin_v2/assets/image/config/login/1665155179.jpg', 'gray', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `currencies`
--

CREATE TABLE `currencies` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `symbol` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `currencies`
--

INSERT INTO `currencies` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `symbol`, `status`) VALUES
('11df1bbf41d24a0b8dc6b92697bf77', 'admin', '2022-10-07 18:23:49', NULL, NULL, 0, 'USD', 'AMERICA', '', '$', 0),
('9cfaf364f9fd42829caf25f5b6dfa1', 'admin', '2022-10-07 18:24:16', NULL, NULL, 0, 'EUR', 'EUROPE', '', '€', 0),
('c155b7c80ccc48f49d3e8f5f8db4fd', 'admin', '2022-10-07 18:24:35', NULL, NULL, 0, 'JPY', 'JAPAN', '', '¥', 0),
('e7b7cf37985b40a787735830a1ec1e', 'admin', '2022-10-07 18:24:25', NULL, NULL, 0, 'IDR', 'INDONESIA', '', 'Rp', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `attention` varchar(30) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `telp_billing` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `bank_account` varchar(30) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `address`, `attention`, `telp`, `telp_billing`, `email`, `website`, `payment_term`, `bank_account`, `bank_name`, `currency`, `type`, `status`) VALUES
('cd99d601af964ea7bb702262222bbd', 'admin', '2022-10-07 18:42:56', 'admin', '2022-10-11 16:05:42', 0, 'A151', 'PT. ASIA ELECTRIC / TIGA BERLIAN ELECTRIC', NULL, 'JAKARTA', 'Mr Hilman', '082212049123', '', '-', '', 30, '', '', 'IDR', 'LOCAL', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer_items`
--

CREATE TABLE `customer_items` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `customer_id` varchar(30) DEFAULT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `max_order` int(11) NOT NULL DEFAULT 0,
  `ar_balance` int(11) NOT NULL DEFAULT 0,
  `expired` date DEFAULT NULL,
  `price` int(11) NOT NULL,
  `remarks` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer_items`
--

INSERT INTO `customer_items` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `customer_id`, `item_id`, `max_order`, `ar_balance`, `expired`, `price`, `remarks`, `status`) VALUES
('12078871a9a84949960406f74ac8c9', 'admin', '2022-10-11 17:10:40', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '8ee1c3d0d3654c0194cba18cffaae9', 100, 20, '2022-10-31', 15000, '', 0),
('2e22d67390b6488d9fe9f14b0d2349', 'admin', '2022-10-11 17:10:59', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'c15ac21a3c8a498ebc4705b941b24f', 100, 20, '2022-10-31', 20000, '', 0),
('77c7e3b868c34baea3365c748fd2c7', 'admin', '2022-10-11 17:13:55', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '8e664c010bb44d44b7ea462fa2c311', 100, 20, '2022-10-31', 16200, '', 0),
('9d04d4499aec49c3849ea2f27e1aff', 'admin', '2022-10-11 17:14:05', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'f153854844024fa499c0e62d165d7b', 100, 20, '2022-10-31', 10600, '', 0),
('fa0705b8e7084742a3ecf67065d05e', 'admin', '2022-10-11 17:13:49', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '816befb7a6aa44cc986c29b4286610', 100, 20, '2022-10-31', 5200, '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `issued_materials`
--

CREATE TABLE `issued_materials` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `item_id` varchar(50) NOT NULL,
  `component_id` varchar(50) NOT NULL,
  `request_no` varchar(30) DEFAULT NULL,
  `period` varchar(6) DEFAULT NULL,
  `wp` varchar(10) DEFAULT NULL,
  `workorder` varchar(30) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `issued_materials`
--

INSERT INTO `issued_materials` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `item_id`, `component_id`, `request_no`, `period`, `wp`, `workorder`, `qty`, `status`) VALUES
('12014fe8761e4a94813b', 'admin', '2022-10-13 17:08:20', NULL, NULL, 0, '8ee1c3d0d3654c0194cba18cffaae9', '12d216f47b9b4d09ab393337234653', 'SH-221011-0001', '202108', '01/22', 'WO221011-00001', 41, 0),
('5ec1f86fe6a94c02b63f', 'admin', '2022-10-13 17:08:20', NULL, NULL, 0, '8ee1c3d0d3654c0194cba18cffaae9', '9a21160eec3f47f5a5ae1932627c3e', 'SH-221011-0001', '202108', '01/22', 'WO221011-00001', 56, 0),
('61a7258e18fc4038a62f', 'admin', '2022-10-13 17:08:20', NULL, NULL, 0, '8ee1c3d0d3654c0194cba18cffaae9', '1c90482587c74f7a96c8912df36bc9', 'SH-221011-0001', '202108', '01/22', 'WO221011-00001', 25, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `issued_material_details`
--

CREATE TABLE `issued_material_details` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `request_no` varchar(50) NOT NULL,
  `label_no` varchar(50) NOT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `issued_material_details`
--

INSERT INTO `issued_material_details` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `request_no`, `label_no`, `item_id`, `qty`, `status`) VALUES
('00b5833201da49f683ef34b6fa2d2d', 'admin', '2022-10-13 17:26:00', NULL, NULL, 0, 'SH-221011-0001', 'POR-2210-0000010001', '1c90482587c74f7a96c8912df36bc9', 10, 0),
('056a0943ff9543a5a1ffd6fb77bc9d', 'admin', '2022-10-13 17:28:09', NULL, NULL, 0, 'SH-221011-0001', 'POR-2210-0000020004', '9a21160eec3f47f5a5ae1932627c3e', 10, 0),
('4b8ebc5aa14343edb2836c66b797ec', 'admin', '2022-10-13 17:28:27', NULL, NULL, 0, 'SH-221011-0001', 'POR-2210-0000010005', '1c90482587c74f7a96c8912df36bc9', 10, 0),
('546cd5619b7e416a994bde2d85c1d5', 'admin', '2022-10-13 17:28:54', NULL, NULL, 0, 'SH-221011-0001', 'POR-2210-0000020005', '9a21160eec3f47f5a5ae1932627c3e', 10, 0),
('63ea245762604d4b92cda4e3589d3f', 'admin', '2022-10-13 17:27:52', NULL, NULL, 0, 'SH-221011-0001', 'POR-2210-0000020008', '9a21160eec3f47f5a5ae1932627c3e', 10, 0),
('7a4b406c4333479ab4c99eb004ea35', 'admin', '2022-10-13 17:28:45', NULL, NULL, 0, 'SH-221011-0001', 'POR-2210-0000020015', '9a21160eec3f47f5a5ae1932627c3e', 10, 0),
('c01a2fb003134a45ac98e0d6896810', 'admin', '2022-10-13 17:27:30', NULL, NULL, 0, 'SH-221011-0001', 'POR-2210-0000020001', '9a21160eec3f47f5a5ae1932627c3e', 10, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `item_family_id` varchar(30) DEFAULT NULL,
  `uom_id` varchar(30) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `leadtime` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `item_family_id`, `uom_id`, `number`, `name`, `description`, `leadtime`, `status`) VALUES
('12c814714a5e4271b680400dd5205c', 'admin', '2022-10-11 17:06:12', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-016', 'FINISH GOOD 016', '', 0, 0),
('12d216f47b9b4d09ab393337234653', 'admin', '2022-10-11 16:38:32', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-003', 'RAW MATERIAL 003', '', 0, 0),
('1375d964fb904127a0a5cb484eb295', 'admin', '2022-10-11 16:55:55', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-019', 'RAW MATERIAL 019', '', 0, 0),
('1c90482587c74f7a96c8912df36bc9', 'admin', '2022-10-11 16:38:00', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-001', 'RAW MATERIAL 001', '', 0, 0),
('3960ae033412408d8b7ef970ff7a4f', 'admin', '2022-10-11 17:06:12', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-020', 'FINISH GOOD 020', '', 0, 0),
('3ee9aa1736084945834308c7549eab', 'admin', '2022-10-11 16:55:55', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-018', 'RAW MATERIAL 018', '', 0, 0),
('48bda0a53a3b42f38b2fbff9bdaae0', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-006', 'FINISH GOOD 006', '', 0, 0),
('579a5b6ab1f047a8afcaa31d27e957', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-006', 'RAW MATERIAL 006', '', 0, 0),
('5fce1a3ad5ae46d5acc25225feb03c', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-015', 'RAW MATERIAL 015', '', 0, 0),
('646a10c3721546b4a7f802cdae940f', 'admin', '2022-10-11 17:06:12', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-015', 'FINISH GOOD 015', '', 0, 0),
('6728a46bee4748ceb6a2e1652f0c50', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-008', 'RAW MATERIAL 008', '', 0, 0),
('7385afe518214239969640a292a74e', 'admin', '2022-10-11 17:06:12', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-017', 'FINISH GOOD 017', '', 0, 0),
('816befb7a6aa44cc986c29b4286610', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-003', 'FINISH GOOD 003', '', 0, 0),
('8286a95a36dd42c9bdd73d193c392a', 'admin', '2022-10-11 17:06:12', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-019', 'FINISH GOOD 019', '', 0, 0),
('875027b74a994c21b637dab39edfc5', 'admin', '2022-10-11 17:06:12', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-018', 'FINISH GOOD 018', '', 0, 0),
('898bac535bff49e382e853324953cf', 'admin', '2022-10-11 17:06:12', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-014', 'FINISH GOOD 014', '', 0, 0),
('8e664c010bb44d44b7ea462fa2c311', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-004', 'FINISH GOOD 004', '', 0, 0),
('8ee1c3d0d3654c0194cba18cffaae9', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-001', 'FINISH GOOD 001', '', 0, 0),
('970957b7cbea47c78fea4f6e66b78e', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-004', 'RAW MATERIAL 004', '', 0, 0),
('9a21160eec3f47f5a5ae1932627c3e', 'admin', '2022-10-11 16:38:21', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-002', 'RAW MATERIAL 002', '', 0, 0),
('9aab1f97471c41dc90128dba9166a0', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-007', 'FINISH GOOD 007', '', 0, 0),
('b41e1edc057a47e5aa5c423d63aeb0', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-009', 'FINISH GOOD 009', '', 0, 0),
('b765b9e1a8824a46be116747fd1a61', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-012', 'RAW MATERIAL 012', '', 0, 0),
('b777bdf2046c4b6eb9df12187116d2', 'admin', '2022-10-11 16:55:55', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-017', 'RAW MATERIAL 017', '', 0, 0),
('b913d5534d1d4960bf74ecabb89eb7', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-010', 'FINISH GOOD 010', '', 0, 0),
('c056dde7f720401e9f7f50798ea0ef', 'admin', '2022-10-11 16:55:55', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-016', 'RAW MATERIAL 016', '', 0, 0),
('c15ac21a3c8a498ebc4705b941b24f', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-002', 'FINISH GOOD 002', '', 0, 0),
('c363a2d893f748119af73c55b4861d', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-011', 'RAW MATERIAL 011', '', 0, 0),
('c5639e95f4d940dca611a9daa446da', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-013', 'RAW MATERIAL 013', '', 0, 0),
('d342de95fafa4329818495eda9dad4', 'admin', '2022-10-11 16:55:55', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-020', 'RAW MATERIAL 020', '', 0, 0),
('d8c7ce8b47d3448e9dc5547abd9e0b', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-012', 'FINISH GOOD 012', '', 0, 0),
('dbf77dfe00894b2a8316b395f1356e', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-008', 'FINISH GOOD 008', '', 0, 0),
('df6c9c0da472463b9dfe1de7cf0518', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-007', 'RAW MATERIAL 007', '', 0, 0),
('e7afbf4fe729445da9bb6ee21d8d8b', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-011', 'FINISH GOOD 011', '', 0, 0),
('ead8fe088fa74d7aa2197f682b0c6a', 'admin', '2022-10-11 17:06:12', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-013', 'FINISH GOOD 013', '', 0, 0),
('ecb190892f534d3eb66a0e03eb6d71', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-014', 'RAW MATERIAL 014', '', 0, 0),
('ee13c666ed9c4f97a4444c48c0ff6d', 'admin', '2022-10-11 16:55:55', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-021', 'RAW MATERIAL 021', '', 0, 0),
('ef19b617f6454eeda06b0ce8029bb0', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-005', 'RAW MATERIAL 005', '', 0, 0),
('f153854844024fa499c0e62d165d7b', 'admin', '2022-10-11 17:06:11', NULL, NULL, 0, '9016430cc47a455ba3a900f9d0b5d8', '86c081e423324443860d07ea0ccefe', 'FG-005', 'FINISH GOOD 005', '', 0, 0),
('f35ecaf2910a4c9a9879f2ce31af28', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-010', 'RAW MATERIAL 010', '', 0, 0),
('f6af8201cbff4edf9651790946eda9', 'admin', '2022-10-11 16:55:55', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-022', 'RAW MATERIAL 022', '', 0, 0),
('ffdf31aac2f9463d9637b474a1e09c', 'admin', '2022-10-11 16:55:54', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '86c081e423324443860d07ea0ccefe', 'RAW-009', 'RAW MATERIAL 009', '', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_categories`
--

CREATE TABLE `item_categories` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `item_categories`
--

INSERT INTO `item_categories` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('b5ff19fc1b1c492c837ed4f3a1ced7', 'admin', '2022-10-07 17:58:29', NULL, NULL, 0, '1', 'HARNESS WIRE', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_colors`
--

CREATE TABLE `item_colors` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_familys`
--

CREATE TABLE `item_familys` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `item_familys`
--

INSERT INTO `item_familys` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('860ace29426e456bb7884f77dcaf8a', 'admin', '2022-10-11 16:27:25', NULL, NULL, 0, 'OE', 'OFFICE EQUIPMENT', '', 0),
('9016430cc47a455ba3a900f9d0b5d8', 'admin', '2022-10-11 16:27:01', NULL, NULL, 0, 'FG', 'FINISH GOOD', '', 0),
('bfdc4fe7a043452486bf3090d8d74c', 'admin', '2022-10-11 16:27:09', NULL, NULL, 0, 'CON', 'CONSUMABLE', '', 0),
('f26818522f0345a2b01aae3087a2d1', 'admin', '2022-10-11 16:26:56', NULL, NULL, 0, 'RAW', 'RAW MATERIAL', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_makers`
--

CREATE TABLE `item_makers` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_options`
--

CREATE TABLE `item_options` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `item_options`
--

INSERT INTO `item_options` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('16ef73f9ef50415c91d592fb9c56e0', 'admin', '2022-10-07 17:55:03', NULL, NULL, 0, '4', 'ORANGE', '', 0),
('20b3582b10bf4e3387b9f82b4c777f', 'admin', '2022-10-07 17:54:52', NULL, NULL, 0, '2', 'BROWN', '', 0),
('27b2b98a3f0b4a40aecb482a347b81', 'admin', '2022-10-07 17:54:58', NULL, NULL, 0, '3', 'RED', '', 0),
('3a88b4e884414d92b356dbc6616475', 'admin', '2022-10-07 17:54:46', NULL, NULL, 0, '1', 'BLACK', '', 0),
('f6adec9f3f734bc8a9511ce347588d', 'admin', '2022-10-07 17:54:38', NULL, NULL, 0, '0', 'NONE', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_sizes`
--

CREATE TABLE `item_sizes` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_specifications`
--

CREATE TABLE `item_specifications` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_types`
--

CREATE TABLE `item_types` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lines`
--

CREATE TABLE `lines` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `lines`
--

INSERT INTO `lines` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('1958c14d5b8f404291f9c003080c13', 'admin', '2022-10-07 18:19:08', 'admin', '2022-10-07 18:19:23', 0, 'CT', 'Line Cutting', '', 0),
('eabcbf3797854aefb4c3b3639d912a', 'admin', '2022-10-07 18:19:18', NULL, NULL, 0, 'CR', 'Line Crimping', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `logs`
--

CREATE TABLE `logs` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `ip_address` varchar(30) NOT NULL,
  `action` varchar(30) NOT NULL,
  `menu` varchar(30) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `logs`
--

INSERT INTO `logs` (`id`, `created_by`, `created_date`, `deleted`, `ip_address`, `action`, `menu`, `description`) VALUES
('00aaf137efc948e983a25ce0c30268', NULL, '2022-10-11 15:38:43', 0, '::1', 'Login', 'Login', '{\"id\":\"86f9f296025243ed953fe6014ff765\",\"name\":\"Administrator\",\"username\":\"admin\",\"position\":\"Admin System\"}'),
('0130487a33164ddbbc02692c22b59b', 'admin', '2022-10-07 17:32:39', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:39\"}'),
('022c2435d56e4c3fa02836d8900df5', 'admin', '2022-10-07 18:06:31', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Supplier Items\",\"link\":\"master\\/supplier_items\",\"sort\":\"8\",\"state\":\"\",\"id\":\"c98376ce677644eea31e91bcb49438dd\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:06:31\"}'),
('03384cae20554a87b686ad97c3277e', 'admin', '2022-10-07 18:18:32', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:18:32\"}'),
('03d121e609f44a65a0e8547fb6df84', 'admin', '2022-10-11 19:47:36', 0, '::1', 'Delete', 'supply_sheets', '{\"id\":\"e9d95d18c7384e96bc378055321e7d\"}'),
('040c7c9f9f864eb2a399982262746c', 'admin', '2022-10-07 17:32:43', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:43\"}'),
('04ae59852ac6401c92aa547b7f5f37', 'admin', '2022-10-07 21:40:01', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:01\"}'),
('04c93456d1d84f2e9f3d70d89ff105', 'admin', '2022-10-07 18:42:56', 0, '::1', 'Create', 'customers', '{\"number\":\"A151\",\"name\":\"PT. ASIA ELECTRIC \\/ TIGA BERLIAN ELECTRIC\",\"type\":\"LOCAL\",\"address\":\"JAKARTA\",\"telp\":\"-\",\"telp_billing\":\"\",\"email\":\"-\",\"website\":\"\",\"currency\":\"IDR\",\"payment_term\":\"30\",\"bank_account\":\"\",\"bank_name\":\"\",\"id\":\"cd99d601af964ea7bb702262222bbdb5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:42:56\"}'),
('04e8831674ab4f10be52c34c4231c9', 'admin', '2022-10-07 21:37:16', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"\",\"name\":\"Planning\",\"link\":\"\",\"sort\":\"3\",\"state\":\"closed\",\"id\":\"93d8c32f689c41399f7ccb5ce434c3a6\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:37:16\"}'),
('057df13ac17b4895a3bf8a494dcd13', 'admin', '2022-10-11 16:38:32', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-003\",\"name\":\"RAW MATERIAL 003\",\"description\":\"\",\"leadtime\":\"\",\"uom\":\"Pcs\",\"status\":\"\",\"id\":\"12d216f47b9b4d09ab39333723465324\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:38:32\"}'),
('0595a6f7be0740f48114a120c876a7', 'admin', '2022-10-07 17:32:27', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:27\"}'),
('05c84c2b73dd4c5a9a9d89c898b840', 'admin', '2022-10-07 17:32:31', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:31\"}'),
('0775fcfb2acb4e059ecfa57e500bd3', 'admin', '2022-10-11 18:19:46', 0, '::1', 'Create', 'sales_orders', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"customer_po\":\"asdasdasd\",\"number\":\"SOA151-2210-0001\",\"trans_date\":\"2022-10-11\",\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"qty\":\"10\",\"price\":\"15000\",\"total\":\"150000\",\"vat\":\"NON VAT\",\"delivery\":\"2022-10-11\",\"id\":\"a6f73bf456e3435e93c29d890db51fa5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:19:46\"}'),
('0784e849678c45d08e49211a693105', 'admin', '2022-10-07 17:22:46', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Makers\",\"link\":\"master\\/item_makers\",\"sort\":\"3\",\"state\":\"\",\"id\":\"612df21b8cd34fb5869011b0e92f8135\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:22:46\"}'),
('07ce91dca261439cbd01246e554d4c', 'admin', '2022-10-07 17:51:11', 0, '::1', 'Delete', 'item_makers', '{\"id\":\"2490992e68134e908b72\"}'),
('0820fed12eb54ad5b59e38adff4fd8', 'admin', '2022-10-07 21:01:37', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:01:37\"}'),
('084870d203934e45b64a5728f80c74', 'admin', '2022-10-12 04:54:07', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"\",\"name\":\"Purchasing\",\"link\":\"\",\"sort\":\"3\",\"state\":\"closed\",\"id\":\"c10a8ffd0165455989b58f9090798c45\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:54:07\"}'),
('089ce57fb1594760b6f42dab97422b', 'admin', '2022-10-07 17:31:35', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"3dd1a46ef2834b79a8da5080c496e4\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"b0e891c3fe6a447f97150702d185d0d3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:35\"}'),
('08bf734bc2d84104a55e337510224f', 'admin', '2022-10-07 17:32:49', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:49\"}'),
('08ca43dcf1ca4b1ba4428a1a8aae41', 'admin', '2022-10-07 18:51:55', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:51:55\"}'),
('090e94f40f654149ba7e2d2507d356', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-015\",\"name\":\"RAW MATERIAL 015\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"5fce1a3ad5ae46d5acc25225feb03c67\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('092846998f874ee2a5e2c76f365780', 'admin', '2022-10-07 18:54:29', 0, '::1', 'Create', 'suppliers', '{\"number\":\"E\",\"name\":\"PT EWINDO\",\"type\":\"LOCAL\",\"address\":\"BANDUNG\",\"telp\":\"\",\"email\":\"\",\"website\":\"\",\"currency\":\"IDR\",\"payment_term\":\"\",\"incoterm\":\"\",\"vat_status\":\"\",\"vat\":\"10\",\"tax\":\"\",\"bank_account\":\"\",\"bank_name\":\"\",\"id\":\"d8dacae0dee347178a6bfea917a278c3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:54:29\"}'),
('096069b85f1b4c22aac092ff94c57b', 'admin', '2022-10-11 17:06:12', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-020\",\"name\":\"FINISH GOOD 020\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"3960ae033412408d8b7ef970ff7a4f4d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:12\"}'),
('09d255d138c94a62907a4b04ab5258', 'admin', '2022-09-29 15:49:58', 0, '::1', 'Update', 'users', '{\"name\":\"Administrator\",\"position\":\"Senior Programer\",\"email\":\"hilman@pixelphy.id\",\"phone\":\"82217465425\",\"actived\":\"0\",\"avatar\":null,\"updated_by\":\"admin\",\"updated_date\":\"2022-09-29 15:49:58\"}'),
('09fdacb809924aa3b5303a19b5bb7e', 'admin', '2022-10-07 18:51:46', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"a5d9db23534f44fa9d58a7f996ce2a\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"36cf6d128e674c2e969c97e28e1f0911\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:51:46\"}'),
('0ac7f37c70b04fb4b23332b3317abc', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020013\",\"qty\":\"10\",\"id\":\"0773391d2ccf461e8c77c5fa41c3ba18\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('0b89d22b0a904b6b83bb33c3dc5ba0', 'admin', '2022-10-11 19:15:59', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"56\",\"qty_act\":\"56\",\"qty_bal\":\"0\",\"id\":\"e9d95d18c7384e96bc378055321e7d1c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:15:59\"}'),
('0c1f73265b5f4ce6981e62e729955a', 'admin', '2022-10-13 11:02:07', 0, '::1', 'Create', 'purchase_order_receipts', '{\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"receipt_date\":\"2022-10-13\",\"receipt_no\":\"POR-221013-0001\",\"po_no\":\"PO-RAW2210-0001\",\"bc_kind\":\"asdasd\",\"bc_document\":\"asdasd\",\"bc_date\":\"2022-10-13\",\"awb_no\":\"\",\"awb_date\":\"\",\"qty_po\":\"150\",\"qty_os\":\"150\",\"qty_receipt\":\"150\",\"qty_mpq\":\"10\",\"qty_label\":\"15\",\"receipt_id\":null,\"id\":\"2b7b81dabd0d4f9281f65b3c39c27292\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:02:07\"}'),
('0c79d73a8c1c4dc39d20af00c4dff2', 'admin', '2022-10-07 18:12:41', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:12:41\"}'),
('0cb444046b3045b6bdfa00a6bf3050', 'admin', '2022-10-07 21:39:46', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"7b3fd71d12d04dfdbfe4323903def5\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"e75ef54184a4402d89eeef5776f3423a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:39:46\"}'),
('0e67da1c42104cba91b45b87f21137', 'admin', '2022-10-07 17:32:46', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:46\"}'),
('103e77aa14ae4e2bbea323db86cb72', 'admin', '2022-10-07 23:20:19', 0, '::1', 'Delete', 'sales_orders', '{\"number\":\"SOA151-2210-0001\"}'),
('104aa753abb24100be2add1a88d858', 'admin', '2022-10-07 17:44:14', 0, '::1', 'Create', 'item_sizes', '{\"number\":\"07\",\"name\":\"0.70 Sqm\",\"description\":\"\",\"id\":\"37264ee8db454523a8c16b5018165ef2\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:44:14\"}'),
('10952cf0f2db44b28aa5a948a7c6ff', 'admin', '2022-10-07 21:40:00', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:00\"}'),
('114ca82fb4334580b2bcc3e3b0a36b', 'admin', '2022-10-11 19:49:26', 0, '::1', 'Delete', 'supply_sheets', '{\"id\":\"d96d482f954f4a9f9f3a4b06510d50\"}'),
('11a3139db1eb408f941f2358490a68', 'admin', '2022-10-07 18:25:29', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:25:29\"}'),
('12e6cc77f0df466fa1b049ac4d378e', 'admin', '2022-10-11 17:10:40', 0, '::1', 'Create', 'customer_items', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"ar_balance\":\"20\",\"max_order\":\"100\",\"expired\":\"2022-10-31\",\"price\":\"15000\",\"remarks\":\"\",\"id\":\"12078871a9a84949960406f74ac8c9c7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:10:40\"}'),
('13183b096fb844c59534591e411065', 'admin', '2022-10-07 17:32:50', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:50\"}'),
('13394a13eaff40af85502e6d6ab822', 'admin', '2022-10-13 15:57:00', 0, '::1', 'Create', 'supply_materials', '{\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"579a5b6ab1f047a8afcaa31d27e957\",\"workorder\":\"WO221011-00002\",\"request_date\":\"2022-10-13\",\"request_no\":\"REQ-221013-0001\",\"request_name\":\"Administrator\",\"qty_wo\":\"92\",\"qty_req\":\"92\",\"qty_bal\":\"0\",\"id\":\"8ae2025ecc144fe788bb0374f1ac3c15\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:57:00\"}'),
('1351e47cbd194a0cbce434d237bdc4', 'admin', '2022-10-12 04:57:48', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:48\"}'),
('1367f3e769ba41b990e2ced70e479b', 'admin', '2022-10-12 06:31:43', 0, '::1', 'Delete', 'purchase_requests', '{\"id\":\"ed098c4194cc419c9b557ca6c11a08\"}'),
('13f4dd0c9d884ca4b51fb59d7f28df', 'admin', '2022-10-07 21:39:58', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:39:58\"}'),
('152cf9b9e0604d9499811ef545e172', 'admin', '2022-10-07 18:24:35', 0, '::1', 'Create', 'currencies', '{\"number\":\"JPY\",\"name\":\"JAPAN\",\"description\":\"\",\"symbol\":\"\\u00a5\",\"id\":\"c155b7c80ccc48f49d3e8f5f8db4fd26\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:24:35\"}'),
('153b93cfb031425d88e0c4335a05aa', 'admin', '2022-10-07 18:51:56', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:51:56\"}'),
('1544b9a605ab49dbb07db04df8b91c', 'admin', '2022-10-07 17:34:12', 0, '::1', 'Create', 'item_specifications', '{\"number\":\"V\",\"name\":\"OVAL CORD 2 INTI CORE\",\"description\":\"\",\"id\":\"9cea2248b0084a24946476295d6df712\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:34:12\"}'),
('163f00c3ecb744689e4ea2f7864573', 'admin', '2022-10-07 17:32:27', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:27\"}'),
('168d86489da94d51b9169351fea112', 'admin', '2022-10-11 17:06:12', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-017\",\"name\":\"FINISH GOOD 017\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"7385afe518214239969640a292a74e98\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:12\"}'),
('1733fdcaf75f4ede824406aec30a34', 'admin', '2022-10-07 20:42:10', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"c98376ce677644eea31e91bcb49438\",\"id\":\"0160c0915f6044468c58cebed251581d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 20:42:10\"}'),
('175567bdd4a04fa2906ea90429f14e', 'admin', '2022-10-12 06:20:33', 0, '::1', 'Create', 'purchase_requests', '{\"request_no\":\"PR-RAW2210-0001\",\"request_date\":\"2022-10-12\",\"request_name\":\"Administrator\",\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"qty\":\"200\",\"remarks\":\"\",\"id\":\"c779c85ee24645468ac0df1040dbe630\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 06:20:33\"}'),
('176922cf6bab4766879f0c07691539', 'admin', '2022-10-07 17:32:41', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:41\"}'),
('17b18661f8e74965b5bd65fc9b32b8', 'admin', '2022-10-12 10:16:06', 0, '::1', 'Create', 'purchase_requests', '{\"request_no\":\"PR-RAW2210-0001\",\"request_date\":\"2022-10-12\",\"request_name\":\"Administrator\",\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"qty\":\"100\",\"remarks\":\"TESTING 1\",\"id\":\"305711c8b876445dad5c8b226ca3bc7e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 10:16:06\"}'),
('1818bbe470da4c8b8fe0f1811976b4', 'admin', '2022-10-11 19:03:04', 0, '::1', 'Create', 'bom', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"6728a46bee4748ceb6a2e1652f0c50\",\"qpa\":\"0.09\",\"operation\":\"P2\",\"id\":\"fc153f709bb441b5b0d8fcbda3cd7f6b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:03:04\"}'),
('18ae7c4e9f51436c9673af4332009d', 'admin', '2022-10-07 20:14:11', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"a98a56d8e07944d4a5a3d628358f03\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_upload\":\"on\",\"m_download\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"61b6723f47044f729ae6d30c3547f921\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 20:14:11\"}'),
('194db40da5944159af240b4349ef2c', 'admin', '2022-10-11 17:11:20', 0, '::1', 'Delete', 'customer_items', '{\"id\":\"816af460e0404921b6148a2a6eeed3\"}'),
('1acaaefa4d86494490b27002180476', 'admin', '2022-10-07 17:23:06', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Sizes\",\"link\":\"master\\/item_sizes\",\"sort\":\"5\",\"state\":\"\",\"id\":\"39894a92c9e9456997bb6af3b21bd3c0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:23:06\"}'),
('1bff6b536adf476fb64bae6688d25c', 'admin', '2022-10-13 15:38:32', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"4f841c89e8274fd88335b2346d1ee2\",\"name\":\"Supply Materials\",\"link\":\"production\\/supply_materials\",\"sort\":\"1\",\"state\":\"\",\"id\":\"c5e3a7bb003a42309c42907778173d4f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:38:32\"}'),
('1c19506145a6410e996a317550c7fd', 'admin', '2022-10-07 17:32:47', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:47\"}'),
('1cb4860f5de948c38cdea7eea2f23f', 'admin', '2022-10-13 16:22:35', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"5ad1d62d08a3408d9ab3a84c105d15\",\"id\":\"9b830bdcd7f5457980742d0349d4113a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:22:35\"}'),
('1cc8e0d953114004a5e599164c50df', 'admin', '2022-10-07 17:48:42', 0, '::1', 'Create', 'item_colors', '{\"number\":\"1\",\"name\":\"BLACK (BK)\",\"description\":\"\",\"id\":\"c7e23d9c05a3468ab8642a21af5a8c54\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:48:42\"}'),
('1d77370450fd48c29271ffa0da20bc', 'admin', '2022-10-07 21:39:55', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"e780677ba5764a128f4ae77e3b720e\",\"id\":\"7e99a42af43943efabea7257e51917e5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:39:55\"}'),
('1d95ecad88b647ac96e10219731cec', 'admin', '2022-10-07 17:42:27', 0, '::1', 'Create', 'item_types', '{\"number\":\"1007\",\"name\":\"1007\",\"description\":\"\",\"id\":\"b37cf6257a1841188594f9829e2c564d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:42:27\"}'),
('1dd34fe5cf29469aaf88d5b416fc91', 'admin', '2022-10-07 21:15:04', 0, '::1', 'Create', 'supplier_items', '{\"suppliers_number\":\"E\",\"items_number\":\"RAW-0002\",\"mpq\":\"10\",\"moq\":\"10\",\"price\":\"500000\",\"remarks\":\"\",\"id\":\"ed14d1a75cb747b3a939268a1eda6681\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:15:04\"}'),
('1df2a6809bbb4bd9ac1c133a43491e', 'admin', '2022-10-07 20:42:14', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:42:14\"}'),
('1ec47f39162f4fd780c17e884989fb', 'admin', '2022-10-07 17:32:25', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:25\"}'),
('20aff912d2b044eea33e58f4eed062', 'admin', '2022-10-12 04:57:52', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:52\"}'),
('20bd4f8e1bfc4605ad1556c6431f25', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020003\",\"qty\":\"10\",\"id\":\"3ad5c0f2840642138f77c0765eb9d9b1\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('20c6b5125b464803803c47a9bb94ea', 'admin', '2022-10-11 18:43:20', 0, '::1', 'Create', 'production_schedules', '{\"month\":\"08\",\"year\":\"2021\",\"wp\":\"01\\/22\",\"trans_date\":\"2022-10-11\",\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"line_id\":\"1958c14d5b8f404291f9c003080c13\",\"qty\":\"150\",\"workorder\":\"WO221011-00002\",\"period\":\"202108\",\"id\":\"799dff843b894b6590c34d0253c4da92\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:43:20\"}'),
('21932d7d30584dd9a0fa0bbae0c817', 'admin', '2022-10-07 17:32:23', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:23\"}'),
('22816809d5914211a69d6006c62b88', 'admin', '2022-10-13 16:14:00', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"9c04c7dfcf6c44cc9a0ec44b1c7691\",\"name\":\"Issued Materials\",\"link\":\"warehouse\\/issued_materials\",\"sort\":\"1\",\"state\":\"\",\"id\":\"5ad1d62d08a3408d9ab3a84c105d1576\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:14:00\"}'),
('22ce4269749f457287edf8ad220c53', 'admin', '2022-10-11 16:53:34', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"301ba08e5d934624932ecb23cb252a72\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:53:34\"}'),
('22faaa36fb934725b93af88e2f17c9', 'admin', '2022-10-07 18:04:43', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Currencys\",\"link\":\"master\\/currencys\",\"sort\":\"4\",\"state\":\"\",\"id\":\"d188047ab21d45979c64c990a91e23cd\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:04:43\"}'),
('235080fb4c104b12bb3253818d2540', 'admin', '2022-10-07 17:42:37', 0, '::1', 'Create', 'item_types', '{\"number\":\"1032\",\"name\":\"1032\",\"description\":\"\",\"id\":\"e0142ad3066248e5bc76b3ee6dd44e53\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:42:37\"}'),
('23f3d066c0e844e7b04dbcf0f76fba', 'admin', '2022-10-13 15:57:00', 0, '::1', 'Create', 'supply_materials', '{\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"970957b7cbea47c78fea4f6e66b78e\",\"workorder\":\"WO221011-00002\",\"request_date\":\"2022-10-13\",\"request_no\":\"REQ-221013-0001\",\"request_name\":\"Administrator\",\"qty_wo\":\"35\",\"qty_req\":\"35\",\"qty_bal\":\"0\",\"id\":\"933c6628613c48f7847a99958d145b76\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:57:00\"}'),
('242f59c7430b40f0a76b863ebf255a', 'admin', '2022-10-07 20:14:23', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:14:23\"}'),
('24c0461e08394f0c83c85ab4e12d61', 'admin', '2022-10-11 19:02:54', 0, '::1', 'Create', 'bom', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"df6c9c0da472463b9dfe1de7cf0518\",\"qpa\":\"1.20\",\"operation\":\"P2\",\"id\":\"84b1e50bc9c44c679e7b5d0ff971cc42\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:02:54\"}'),
('25cab05eda8849fd8fd2a43e91019f', 'admin', '2022-10-12 04:55:32', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"c10a8ffd0165455989b58f9090798c\",\"name\":\"Purchase Orders\",\"link\":\"purchase\\/purchase_orders\",\"sort\":\"2\",\"state\":\"\",\"id\":\"8f2e2ea5fa0649619863e4a30f1cbc69\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:55:32\"}'),
('25ce9fd3b2e24f2f8215bc3a11c646', 'admin', '2022-10-07 20:14:22', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:14:22\"}'),
('25eee8815b094b6e86b7a8ea365dd6', 'admin', '2022-10-13 15:39:26', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 15:39:26\"}'),
('2608f330c5c64e6aa004aabfb74517', 'admin', '2022-10-07 17:32:06', 0, '::1', 'Delete', 'setting_menus', '{\"id\":\"b2cf8b7f4a76477bac1256ff7bab8a\"}'),
('26ea53a42b1a4b0fa3257ccf344969', 'admin', '2022-10-11 19:14:11', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"undefined\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"25\",\"qty_act\":\"25\",\"qty_bal\":\"0\",\"id\":\"cffa47c7ceff4ac5a9055dabab66d32f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:14:11\"}'),
('279fad45b3be45f1bde2cc18fab58b', 'admin', '2022-10-11 16:05:42', 0, '::1', 'Update', 'customers', '{\"number\":\"A151\",\"name\":\"PT. ASIA ELECTRIC \\/ TIGA BERLIAN ELECTRIC\",\"type\":\"LOCAL\",\"address\":\"JAKARTA\",\"attention\":\"Mr Hilman\",\"telp\":\"082212049123\",\"telp_billing\":\"\",\"email\":\"-\",\"website\":\"\",\"currency\":\"IDR\",\"payment_term\":\"30\",\"bank_account\":\"\",\"bank_name\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 16:05:42\"}'),
('27f3311c57c0425cb71f09df34bf37', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-007\",\"name\":\"RAW MATERIAL 007\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"df6c9c0da472463b9dfe1de7cf05180b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('27f3463901394922a444dcd71d592d', 'admin', '2022-10-13 16:22:39', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 16:22:39\"}'),
('289893039af84240a5f116af854f62', 'admin', '2022-10-11 19:55:54', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"1c90482587c74f7a96c8912df36bc9\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"25\",\"qty_act\":\"25\",\"qty_bal\":\"0\",\"id\":\"34561721d68f4b7fb9b7c991e07808c0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:55:54\"}'),
('28df5977ed6c41a7a4bcc53f87057c', 'admin', '2022-10-07 18:12:45', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:12:45\"}'),
('2971720c92fc415080485c632e4525', 'admin', '2022-10-07 17:31:56', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"3ca074598cf94973b83bb1facb1190\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"65359b84216a4160b69f7ce8cc5e5fa3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:56\"}'),
('29ab0b66f075477babd1effd883d46', 'admin', '2022-10-07 17:51:20', 0, '::1', 'Delete', 'item_colors', '{\"id\":\"ca2cf6627b0a40d08025\"}'),
('2a3371cd8b1d4b1a927bd0d27f6336', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010008\",\"qty\":\"10\",\"id\":\"0e11fe0f2b764fab9ba78170e924de0a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('2aa5fba131e94a7c9d9bffe24832a4', 'admin', '2022-10-12 04:57:16', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"8f2e2ea5fa0649619863e4a30f1cbc\",\"id\":\"ae95699aa9e74cb290b815d3297258ca\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:57:16\"}'),
('2b380cadd11947699c9eb372fb2671', 'admin', '2022-10-13 17:28:27', 0, '::1', 'Create', 'issued_material_details', '{\"request_no\":\"SH-221011-0001\",\"label_no\":\"POR-2210-0000010005\",\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"qty\":\"10\",\"id\":\"4b8ebc5aa14343edb2836c66b797ec59\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:28:27\"}'),
('2be357c3f0514c889997b183c66003', 'admin', '2022-10-13 10:39:20', 0, '::1', 'Create', 'purchase_order_receipts', '{\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"receipt_date\":\"2022-10-13\",\"receipt_no\":\"POR-221013-0001\",\"po_no\":\"PO-RAW2210-0001\",\"bc_kind\":\"123123\",\"bc_document\":\"asdasd\",\"bc_date\":\"2022-10-20\",\"awb_no\":\"\",\"awb_date\":\"\",\"qty_po\":\"150\",\"qty_os\":\"150\",\"qty_receipt\":\"150\",\"qty_mpq\":\"10\",\"qty_label\":\"15\",\"id\":\"9714aebc54414f69a296db59fc64cce7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 10:39:20\"}'),
('2c05c5c9ec2648cb8526d31ba57b39', 'admin', '2022-10-07 19:48:47', 0, '::1', 'Create', 'items', '{\"product_family_number\":\"RAW\",\"number\":\"RAW-0002\",\"name\":\"MOTHERBOARD INTEL H61\",\"description\":\"\",\"leadtime\":\"10\",\"uom\":\"Pcs\",\"status\":\"0\",\"id\":\"66ad31627a834fdfa5e2137de5829979\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 19:48:47\"}'),
('2c3dfe4a3d10479dba7b0975d97985', 'admin', '2022-10-07 21:01:38', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:01:38\"}'),
('2c9431b3c4df486f8100c26e413edc', 'admin', '2022-10-07 21:39:59', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:39:59\"}'),
('2cc4917e62974cf28f70b855800e11', 'admin', '2022-10-12 04:57:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:57\"}'),
('2ce43ffe52ef4aa4b4e5912633d934', 'admin', '2022-10-13 17:46:49', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-10003\",\"qty\":\"5\",\"type\":\"BALANCE\",\"id\":\"d00865af18144f778cb4a1f913f65f6f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:46:49\"}'),
('2d8560cef8594c3aad8db46d5f5541', 'admin', '2022-10-11 18:43:27', 0, '::1', 'Create', 'production_schedules', '{\"month\":\"08\",\"year\":\"2021\",\"wp\":\"01\\/22\",\"trans_date\":\"2022-10-11\",\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"816befb7a6aa44cc986c29b4286610\",\"line_id\":\"1958c14d5b8f404291f9c003080c13\",\"qty\":\"200\",\"workorder\":\"WO221011-00003\",\"period\":\"202108\",\"id\":\"2ea0d3e9805241589c97160275627233\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:43:27\"}'),
('2f6704b49a364001bc19f3cec19a40', 'admin', '2022-10-07 18:10:00', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:10:00\"}'),
('2fa82217897344a18b5f10de8128a7', 'admin', '2022-10-11 19:52:44', 0, '::1', 'Delete', 'supply_sheets', '{\"id\":\"56e36c3c881e467283f3edd756cffc\"}'),
('30139ed130c04489bcb56db8589e6c', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020004\",\"qty\":\"10\",\"id\":\"07da4ea6c86d4b7796d9fa850ff4bc73\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('30c46726c4844a9b9511310e81093a', 'admin', '2022-10-07 17:51:20', 0, '::1', 'Delete', 'item_colors', '{\"id\":\"6bc24dc893d34138b58f\"}'),
('311707d9975746319a5115490ddf38', 'admin', '2022-10-11 16:51:02', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"26f72761c3ae423da80bbd923bc7a57b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:51:02\"}'),
('31adc44481ae4a2eaef98e08ac8dbc', 'admin', '2022-10-07 18:12:42', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:12:42\"}'),
('31ea39ae4b8f49b2960b4ab30157a6', 'admin', '2022-10-13 15:34:01', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"\",\"name\":\"Production\",\"link\":\"\",\"sort\":\"5\",\"state\":\"closed\",\"id\":\"4f841c89e8274fd88335b2346d1ee24c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:34:01\"}'),
('31f4f3541bdf49439117d9bb87ed02', 'admin', '2022-10-07 18:25:25', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"7d7f997ca58f425c8783ff7a7f994c\",\"id\":\"29d380dad4434a93a9295df1e38e5cba\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:25:25\"}'),
('3288eb5162094770b26c8ff5a59884', 'admin', '2022-10-11 19:49:26', 0, '::1', 'Update', 'production_schedules', '{\"status\":0,\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 19:49:26\"}'),
('332775b0260a4c37aa134b14ed8309', 'admin', '2022-10-13 18:02:03', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-02\",\"qty\":\"5\",\"type\":\"BALANCE\",\"id\":\"dcdff5215b054294b3132aadb87d01de\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 18:02:03\"}'),
('3383e6bb5d1944739ac423b5ef81a6', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-006\",\"name\":\"RAW MATERIAL 006\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"579a5b6ab1f047a8afcaa31d27e95738\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('33f01e3003ea4c6a9ad03f6a0c5cc4', 'admin', '2022-10-12 04:57:46', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:46\"}'),
('3421f9097c7243fb9a2c811680c609', 'admin', '2022-10-07 17:31:54', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"90af5528e9a4458585b2d74bb73b05\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"f6d82192e5e5435584db2ba80b9f037f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:54\"}'),
('35c225d6d78140ba80e1310bc95e0c', 'admin', '2022-10-11 19:02:19', 0, '::1', 'Create', 'bom', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"12d216f47b9b4d09ab393337234653\",\"qpa\":\"0.41\",\"operation\":\"P1\",\"id\":\"97676130f17045509fedd026fba7740a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:02:19\"}'),
('36dc987ba649493ea58c3457d0f27f', 'admin', '2022-10-07 20:42:12', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:42:12\"}'),
('36fb4729ee8a4e18af7eeba29f5107', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-005\",\"name\":\"FINISH GOOD 005\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"f153854844024fa499c0e62d165d7b44\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('3787a9d17c0d4d4cbb0f9a778ad5f8', 'admin', '2022-09-29 15:49:33', 0, '::1', 'Update', 'users', '{\"name\":\"Administrator\",\"position\":\"Senior Programer\",\"email\":\"hilman@pixelphy.id\",\"phone\":\"82217465425\",\"actived\":\"0\",\"avatar\":null,\"updated_by\":\"admin\",\"updated_date\":\"2022-09-29 15:49:33\"}'),
('37e5b3f819bb48aab3f9e6f50e6ce1', 'admin', '2022-10-07 18:28:25', 0, '::1', 'Update', 'product_familys', '{\"number\":\"RAW\",\"name\":\"RAW MATERIAL\",\"description\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:28:25\"}'),
('380b8fa55b8248f09bab09cedabe03', 'admin', '2022-10-11 17:11:09', 0, '::1', 'Create', 'customer_items', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"ar_balance\":\"20\",\"max_order\":\"100\",\"expired\":\"2022-10-31\",\"price\":\"15300\",\"remarks\":\"\",\"id\":\"983439b433d14324a5f29b98d95b35b7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:11:09\"}'),
('3844b5843dcb4a27a0e27fc6ddf67e', 'admin', '2022-10-07 17:51:14', 0, '::1', 'Delete', 'item_types', '{\"id\":\"2928f4a91cc24fd182f8\"}'),
('3bbd29914d714bd7a6be33303ed9c7', 'admin', '2022-10-07 21:39:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:39:57\"}'),
('3c32b4ba688a4d50b58b696536c7d7', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-008\",\"name\":\"RAW MATERIAL 008\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"6728a46bee4748ceb6a2e1652f0c50d7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('3c630d6ad0c145c0b5b42b4c7b1cfe', 'admin', '2022-10-11 19:55:54', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"12d216f47b9b4d09ab393337234653\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"41\",\"qty_act\":\"41\",\"qty_bal\":\"0\",\"id\":\"e5f39c5c205d47eca277f74519eaa95b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:55:54\"}'),
('3c8d926f20c4434f929d3c6e512e06', 'admin', '2022-10-11 19:50:47', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"12d216f47b9b4d09ab393337234653\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"41\",\"qty_act\":\"41\",\"qty_bal\":\"0\",\"id\":\"56e36c3c881e467283f3edd756cffc64\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:50:47\"}'),
('3cb76ce3c0fb448781643696df73c3', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010003\",\"qty\":\"10\",\"id\":\"33823625aa7b45c0a8edd9782d0b5ced\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('3d841cca4fcc47c9b70dd35579f3ea', 'admin', '2022-10-07 17:51:11', 0, '::1', 'Delete', 'item_makers', '{\"id\":\"ca5ffab4824640c982a2\"}'),
('3d9173c8efd74da289f26eb22fd85e', 'admin', '2022-10-07 18:38:27', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:38:27\"}'),
('3ddc0cae44da46ee81b4b94a624760', 'admin', '2022-10-07 18:20:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:20:57\"}'),
('3e3f89e631954ee8af7911781f214d', 'admin', '2022-10-07 17:54:58', 0, '::1', 'Create', 'item_options', '{\"number\":\"3\",\"name\":\"RED\",\"description\":\"\",\"id\":\"27b2b98a3f0b4a40aecb482a347b811d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:54:58\"}'),
('3e463856271c4e899f991671a97e41', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-006\",\"name\":\"FINISH GOOD 006\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"48bda0a53a3b42f38b2fbff9bdaae039\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('3eb49d9c754248c0a408e755b84f55', 'admin', '2022-10-07 23:21:03', 0, '::1', 'Create', 'sales_orders', '{\"customers_number\":\"A151\",\"customers_po\":\"INV\\/220511\\/SOC\\/001\",\"number\":\"SOA151-2210-0001\",\"trans_date\":\"2022-10-07\",\"items_number\":\"PC-GAME-001\",\"qty\":\"5\",\"price\":\"3700000\",\"total\":\"18500000\",\"vat\":\"NON VAT\",\"delivery\":\"2022-10-10\",\"id\":\"0d8f2be9132c47dcbcc7c466ceebb878\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 23:21:03\"}'),
('3f7dc7fb3bff40b1a34e6ba30b70b4', 'admin', '2022-10-12 04:57:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:57\"}'),
('3fabbedd21b04a8fb39a8f0baec441', 'admin', '2022-10-13 15:39:21', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 15:39:21\"}'),
('411596863683481da1e5166608b608', 'admin', '2022-10-07 17:32:35', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:35\"}'),
('41c1309f9cb04270be195b37937da9', 'admin', '2022-10-07 18:38:26', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:38:26\"}'),
('42ba86a586b04c98aa656cc9081371', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-011\",\"name\":\"FINISH GOOD 011\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"e7afbf4fe729445da9bb6ee21d8d8b70\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('42c776a6f75c401bb86dd2a3451f05', 'admin', '2022-10-07 17:32:37', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:37\"}'),
('42eeef075362412ea801be470963ed', 'admin', '2022-10-07 21:17:53', 0, '::1', 'Create', 'bom', '{\"customers_number\":\"A151\",\"items_number\":\"PC-GAME-001\",\"component_number\":\"RAW-0002\",\"qpa\":\"1.000\",\"operation\":\"P2\",\"id\":\"9ba4abd983884ae5a31513d78d7fbaef\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:17:53\"}'),
('430b48497b2b4778b2beba16bf57e7', 'admin', '2022-10-13 16:22:35', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"9c04c7dfcf6c44cc9a0ec44b1c7691\",\"id\":\"84ca9c1ad91b4a50a5ba9893763a7303\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:22:35\"}'),
('4428a0f1033e42faab67bb8d90d6bb', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010001\",\"qty\":\"10\",\"id\":\"8b56dc42882f4fdfa03fd488ec44ed29\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('4442651c590a480f8d8650e3ef7f76', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020015\",\"qty\":10,\"id\":\"905df1dcc5324d869300511bd53f18be\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('4501b150dfe44d33a7331fc5bc345d', 'admin', '2022-10-07 18:28:21', 0, '::1', 'Create', 'product_familys', '{\"number\":\"RAW\",\"name\":\"RAW MATERIALS\",\"description\":\"\",\"id\":\"649ec96c6828416187d328de6925fc7e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:28:21\"}'),
('458d70072ab04a0d826aad6bccdee6', 'admin', '2022-10-07 18:05:36', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Suppliers\",\"link\":\"master\\/suppliers\",\"sort\":\"6\",\"state\":\"\",\"id\":\"a5d9db23534f44fa9d58a7f996ce2a7b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:05:36\"}'),
('4632472b51ac4431909f2bc04b3b56', 'admin', '2022-10-07 17:32:21', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:21\"}'),
('4643c0256cd14e01b05e8e31817fa2', 'admin', '2022-10-11 19:54:29', 0, '::1', 'Delete', 'supply_sheets', '{\"id\":\"75e4a08faf4f4ddb87c58ac26035f0\"}'),
('4704e48617f641d08a396e2acb639b', 'admin', '2022-10-12 04:57:16', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"b3caa83cf1534926a614edc17ed055\",\"id\":\"1461f733ff9b45e5aea449d22811db6d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:57:16\"}'),
('4856d82059934d79971c30883449d4', 'admin', '2022-10-07 17:40:27', 0, '::1', 'Create', 'item_makers', '{\"number\":\"S\",\"name\":\"SUMIMOTO\",\"description\":\"\",\"id\":\"2490992e68134e908b72ceb7f87a75b9\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:40:27\"}'),
('48bcc59828bf43feb187594e00d03c', 'admin', '2022-10-07 17:32:19', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:19\"}'),
('48f52f2f468f42098cacf17e214ee1', 'admin', '2022-10-07 18:09:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:09:57\"}'),
('49665fbbb39247fba1e49009500d76', 'admin', '2022-10-07 18:51:55', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:51:55\"}'),
('4a00c44b6ac94e69b13c50536a995c', 'admin', '2022-09-29 16:06:30', 0, '::1', 'Delete', 'menus', '{\"id\":\"MNU-2021120006\"}');
INSERT INTO `logs` (`id`, `created_by`, `created_date`, `deleted`, `ip_address`, `action`, `menu`, `description`) VALUES
('4a6257056ea84c58b58753c6764bf5', 'admin', '2022-10-13 11:02:07', 0, '::1', 'Create', 'purchase_order_receipts', '{\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"receipt_date\":\"2022-10-13\",\"receipt_no\":\"POR-221013-0001\",\"po_no\":\"PO-RAW2210-0001\",\"bc_kind\":\"asdasd\",\"bc_document\":\"asdasd\",\"bc_date\":\"2022-10-13\",\"awb_no\":\"\",\"awb_date\":\"\",\"qty_po\":\"100\",\"qty_os\":\"100\",\"qty_receipt\":\"100\",\"qty_mpq\":\"10\",\"qty_label\":\"10\",\"receipt_id\":null,\"id\":\"3a915c28a6c64f399a7d829d5c2fe8a4\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:02:07\"}'),
('4bb94ccaae004ba08d1f24e008382c', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-014\",\"name\":\"RAW MATERIAL 014\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"ecb190892f534d3eb66a0e03eb6d71f5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('4bbe29ab04934b61864055564319af', 'admin', '2022-10-07 18:18:29', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"3c5e75290ca947eab000aa09269753\",\"id\":\"008d68ea392946b0a647a91eae2ef0dd\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:18:29\"}'),
('4c1f9a81ec7942ed8969b92cbc5599', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020012\",\"qty\":\"10\",\"id\":\"c6a80825f9d14e18aaf921b163435a15\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('4c708bdd56a2452ebae6685e01d219', 'admin', '2022-10-13 15:38:59', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"4f841c89e8274fd88335b2346d1ee2\",\"m_view\":\"on\",\"id\":\"0ca3131a3aef48e3ba23c07612b77186\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:38:59\"}'),
('4cb4c52d43cf4f4faa8b77133b3a3b', 'admin', '2022-10-11 16:55:55', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-018\",\"name\":\"RAW MATERIAL 018\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"3ee9aa1736084945834308c7549eaba6\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:55\"}'),
('4d4455e529dd41b1b4198690edd773', 'admin', '2022-10-13 16:14:50', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"9c04c7dfcf6c44cc9a0ec44b1c7691\",\"m_view\":\"on\",\"id\":\"880ea658785d44929df3fe128c661778\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:14:50\"}'),
('4d814c2895d64e50bee73fb3347693', 'admin', '2022-10-07 17:38:42', 0, '::1', 'Create', 'item_specifications', '{\"number\":\"P\",\"name\":\"POWER RECORD\",\"description\":\"\",\"id\":\"9c7bc52310514a3ea3cab0bc0df5ce5a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:38:42\"}'),
('4daf73d1b1b54b208bfa946e558746', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"id\":\"a209beb99b2f45d78dccf0f59e1ce8f1\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('4e7b30f8cfb347509772e69da3b4da', 'admin', '2022-10-07 18:08:03', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Supplier Items\",\"link\":\"master\\/supplier_items\",\"sort\":\"7\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:08:03\"}'),
('4e95620011de4988b06c6f89dbf9a2', 'admin', '2022-09-29 16:04:44', 0, '::1', 'Delete', 'menus', '{\"id\":\"MNU-2021120002\"}'),
('4f0de32c59104f92b42204b46e43b0', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-007\",\"name\":\"FINISH GOOD 007\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"9aab1f97471c41dc90128dba9166a0b3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('4f577197d72545e38b83901028bfad', 'admin', '2022-10-07 17:49:22', 0, '::1', 'Create', 'item_colors', '{\"number\":\"3\",\"name\":\"RED (RD)\",\"description\":\"\",\"id\":\"ca2cf6627b0a40d08025e8908772aa99\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:49:22\"}'),
('50dd178de9bc46188ee9d970b222c7', 'admin', '2022-10-13 17:50:07', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-01\",\"qty\":\"5\",\"type\":\"SUPPLY\",\"id\":\"82a41d39428449e5a8c738cc34eddc6a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:50:07\"}'),
('512161b5076049fd865a4e6a2805c7', 'admin', '2022-10-13 17:27:30', 0, '::1', 'Create', 'issued_material_details', '{\"request_no\":\"SH-221011-0001\",\"label_no\":\"POR-2210-0000020001\",\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"qty\":\"10\",\"id\":\"c01a2fb003134a45ac98e0d689681061\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:27:30\"}'),
('513c5183aa064b7ca883a378fcaadc', 'admin', '2022-10-07 17:42:31', 0, '::1', 'Create', 'item_types', '{\"number\":\"1015\",\"name\":\"1015\",\"description\":\"\",\"id\":\"2928f4a91cc24fd182f8b56776261a62\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:42:31\"}'),
('51ab074f47d04d8395bcfcc9e60a7f', 'admin', '2022-10-12 04:57:54', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:54\"}'),
('51fb7227cb704310a06276837e5984', 'admin', '2022-10-12 04:57:56', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:56\"}'),
('52bf651bafd849bea0654e297c20a3', 'admin', '2022-10-07 21:39:33', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"0e4bb0451f1d4a64a4f7be6be13708\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"cde64e8c82e14a68b55bc131931c472e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:39:33\"}'),
('54b349ba755c4d37a0700961339dd6', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020006\",\"qty\":\"10\",\"id\":\"94e71406b9ed47f0b3a106831671a5f9\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('555a0f8ef44a4749bcbf7e191db42b', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020005\",\"qty\":\"10\",\"id\":\"c9199ea41a6245b2a48c5121a13a33bc\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('55a6e918800b4be996f159c1cab593', 'admin', '2022-10-07 18:51:56', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:51:56\"}'),
('55af670a3baf46a7b719043c595159', 'admin', '2022-10-07 21:40:04', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:04\"}'),
('55cfae46d80642b093cf33758f4731', 'admin', '2022-10-07 17:32:20', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:20\"}'),
('568a60a7603d4cd4ab1176017a8013', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"62309884bfe74e5696f10f32243d97\",\"id\":\"52af4273642244679c1df3379fe1048d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('568f9c74bb8243f6ac8944fc3c13fd', 'admin', '2022-10-09 13:02:57', 0, '::1', 'Create', 'production_schedules', '{\"month\":\"01\",\"year\":\"2017\",\"wp\":\"2022\\/01\",\"trans_date\":\"2022-10-19\",\"customers_number\":\"A151\",\"items_number\":\"PC-GAME-001\",\"lines_number\":\"CT\",\"qty\":\"200\",\"workorder\":\"WO221009-00001\",\"period\":\"201701\",\"id\":\"6abdee4591544a649fb1315670b333d1\",\"created_by\":\"admin\",\"created_date\":\"2022-10-09 13:02:57\"}'),
('56b7612eaa3d4996be6dd5c313051c', 'admin', '2022-10-07 21:40:01', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:01\"}'),
('57aa8c9f8be3456eb06fd0e227817e', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020014\",\"qty\":\"10\",\"id\":\"ef48dd1b6853461ca8f9a80efcf20fbc\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('57b9e7fab85a47c5bbdd7b04d3266a', 'admin', '2022-10-07 17:23:39', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Options\",\"link\":\"master\\/item_options\",\"sort\":\"7\",\"state\":\"\",\"id\":\"a015669f743f49d18be7541f4e9e4f9a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:23:39\"}'),
('580e332388824aab866a1b0322d85c', 'admin', '2022-10-07 20:42:13', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:42:13\"}'),
('5889011fba7841439c71eddd1061c8', 'admin', '2022-10-11 17:06:12', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-015\",\"name\":\"FINISH GOOD 015\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"646a10c3721546b4a7f802cdae940f52\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:12\"}'),
('5899b0ba9cc94dcdbcd108aa21fd39', 'admin', '2022-10-07 18:16:10', 0, '::1', 'Create', 'uom', '{\"number\":\"Pcs\",\"name\":\"Pieces\",\"description\":\"\",\"id\":\"86c081e423324443860d07ea0ccefe12\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:16:10\"}'),
('5962b53293804755bfa3efcc7c78c7', NULL, '2022-10-13 14:12:52', 0, '::1', 'Login', 'Login', '{\"id\":\"86f9f296025243ed953fe6014ff765\",\"name\":\"Administrator\",\"username\":\"admin\",\"position\":\"Admin System\"}'),
('59bd2c24bd8347e89117e52f1efa67', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"90af5528e9a4458585b2d74bb73b05\",\"id\":\"1b6ba97e74b84b289dfda76069a836b6\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('5a087ab6cef94398876fd84914de5a', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010010\",\"qty\":10,\"id\":\"4bd6d4a3c87d4bcc871859aeee981326\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('5b2ed4ca9e2d4c8593292ac16b588c', 'admin', '2022-10-07 17:40:18', 0, '::1', 'Create', 'item_makers', '{\"number\":\"E\",\"name\":\"EWINDO\",\"description\":\"\",\"id\":\"c625c7e7072948f3b6faaa13c9116867\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:40:18\"}'),
('5b60657db53e4268869fa3f7a34661', 'admin', '2022-10-07 21:39:59', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:39:59\"}'),
('5c8a97610a334760a57788602d5fd3', 'admin', '2022-10-07 21:39:55', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"7b3fd71d12d04dfdbfe4323903def5\",\"id\":\"0362a1a4d2484b3db9ee86236171823f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:39:55\"}'),
('5ce3801d0166484d95ccd4481f7da5', 'admin', '2022-10-07 17:32:39', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:39\"}'),
('5d0a432e11ea4e6f98b1c85bab2420', 'admin', '2022-10-07 18:07:49', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Customer Items\",\"link\":\"master\\/customer_items\",\"sort\":\"5\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:07:49\"}'),
('5e0ef04057954c8e85d316c15f0a7f', 'admin', '2022-10-11 17:06:12', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-013\",\"name\":\"FINISH GOOD 013\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"ead8fe088fa74d7aa2197f682b0c6a2c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:12\"}'),
('5e81c025b5ae45c38c4cd368a21765', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-005\",\"name\":\"RAW MATERIAL 005\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"ef19b617f6454eeda06b0ce8029bb07a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('5ed6d19f66b14680ac4284d6c30493', 'admin', '2022-10-13 15:39:22', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 15:39:22\"}'),
('5f65aa5216434170a0aff15313a0ca', 'admin', '2022-10-07 18:25:32', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:25:32\"}'),
('5f676da3b0854f37bfef60ec06da94', 'admin', '2022-10-11 16:55:55', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-016\",\"name\":\"RAW MATERIAL 016\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"c056dde7f720401e9f7f50798ea0ef6c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:55\"}'),
('5fe2cb68e11a487aa14b813e501001', 'admin', '2022-10-07 17:54:47', 0, '::1', 'Create', 'item_options', '{\"number\":\"1\",\"name\":\"BLACK\",\"description\":\"\",\"id\":\"3a88b4e884414d92b356dbc661647516\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:54:46\"}'),
('5fff2d4488054038bdd26361bad519', 'admin', '2022-10-07 17:31:25', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_upload\":\"on\",\"m_download\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"b2cf8b7f4a76477bac1256ff7bab8a9c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:25\"}'),
('604335690b434d59b50bd867eb2f45', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020001\",\"qty\":\"10\",\"id\":\"813f96d8dfeb4fb9a1e8d04bbd07b15a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('61b78f65287e458bb2c9992296d7ab', 'admin', '2022-10-07 18:09:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:09:57\"}'),
('6216737c03a049ad806bec4035346d', 'admin', '2022-10-13 17:27:52', 0, '::1', 'Create', 'issued_material_details', '{\"request_no\":\"SH-221011-0001\",\"label_no\":\"POR-2210-0000020008\",\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"qty\":\"10\",\"id\":\"63ea245762604d4b92cda4e3589d3fa0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:27:52\"}'),
('6225dd784a174bc4bc8262ba777e50', 'admin', '2022-10-13 16:15:03', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"3f423b73a7b04367853767d7de4bc5\",\"m_view\":\"on\",\"id\":\"4d7eea6d7e404774980591dd58541cbb\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:15:03\"}'),
('62b1560ea5834ddb8beb9e404369e9', 'admin', '2022-10-07 17:32:38', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:38\"}'),
('62b673297d6f499685a82b3f2b430b', 'admin', '2022-10-07 21:01:39', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:01:39\"}'),
('62ced1582d0247e3a087a48cd98c77', 'admin', '2022-10-07 18:20:50', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"d188047ab21d45979c64c990a91e23\",\"id\":\"75ab83a3d56647f898f3dbaf951b46e6\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:20:50\"}'),
('632a7d47eeae433ba42ec486112809', 'admin', '2022-10-07 17:51:08', 0, '::1', 'Delete', 'item_specifications', '{\"id\":\"9cea2248b0084a249464\"}'),
('635820a423bf4d19bd9bece3cb4225', 'admin', '2022-10-07 20:42:14', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:42:14\"}'),
('639149981e0c46f7ad1a0c72646b9b', 'admin', '2022-10-07 17:44:10', 0, '::1', 'Create', 'item_sizes', '{\"number\":\"05\",\"name\":\"0.50 Sqm\",\"description\":\"\",\"id\":\"7c223fad495241dcae0e45a7fa0ac6bb\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:44:10\"}'),
('63936e45d1bb422fb6cafa2f8a0cba', 'admin', '2022-10-07 18:12:35', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"3038d96df22048608bbbb8762bbe24\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"53f9a3dfd3094c909a6db12186e7bc77\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:12:35\"}'),
('63c58149614b4e8bb9f15c27d8f6be', 'admin', '2022-10-07 17:32:33', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:33\"}'),
('64682d3bd48e48f1ba8e05772ed518', 'admin', '2022-10-12 04:57:47', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:47\"}'),
('64bdfc035afd44759bb83279952a4a', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020009\",\"qty\":\"10\",\"id\":\"8f3a033b53cd4ca99e4fd28d018c62f5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('64c135acc8524198aadf94713213f0', 'admin', '2022-10-11 18:58:27', 0, '::1', 'Create', 'bom', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"qpa\":\"0.561\",\"operation\":\"P1\",\"id\":\"275abb9a5d204a22abec2aa587c5fad8\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:58:27\"}'),
('65104a66175244389b432a9d94e6e7', 'admin', '2022-10-07 17:32:27', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:27\"}'),
('662d6a6f64d6499a92af049fff00f1', 'admin', '2022-10-12 04:55:52', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"c10a8ffd0165455989b58f9090798c\",\"name\":\"Purchase Order Receipts\",\"link\":\"purchase\\/purchase_order_receipts\",\"sort\":\"3\",\"state\":\"\",\"id\":\"670141b0c0ac4f61bba46f0c85acd641\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:55:52\"}'),
('665edb7c79af41d88a3981c570de8a', 'admin', '2022-10-07 21:01:34', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"8001792212e640eb8e67b13a16a26d\",\"id\":\"f800beac22864c05983d0ef492ee10d0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:01:34\"}'),
('66782aef79d444fd93243be187d06a', 'admin', '2022-10-11 19:14:11', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"undefined\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"41\",\"qty_act\":\"41\",\"qty_bal\":\"0\",\"id\":\"a0eb1dd110af4b9eb017e715154a655c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:14:11\"}'),
('66eac938cef74c9dbe8527eb182d55', NULL, '2022-10-09 12:47:01', 0, '::1', 'Login', 'Login', '{\"id\":\"86f9f296025243ed953fe6014ff765\",\"name\":\"Administrator\",\"username\":\"admin\",\"position\":\"Admin System\"}'),
('67e6cc0ff27c4f3dbb4efb0d85aacf', 'admin', '2022-10-07 21:01:41', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:01:41\"}'),
('67ffff20464245338eec32d1a4080f', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020010\",\"qty\":\"10\",\"id\":\"0f7bf4e8b8a54cb3bcc035b91919f79d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('68703d2e135147a58581266329cf9f', 'admin', '2022-10-07 18:06:19', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Customer Items\",\"link\":\"master\\/customer_items\",\"sort\":\"7\",\"state\":\"\",\"id\":\"a98a56d8e07944d4a5a3d628358f03e3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:06:19\"}'),
('687420f3457a4f36b8e558036f319f', 'admin', '2022-10-13 15:39:26', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 15:39:26\"}'),
('696f3807b88e451ba1877a7eb84fae', 'admin', '2022-10-12 04:57:45', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:45\"}'),
('6a019d4ce8104adeab652bb57205ae', 'admin', '2022-10-07 21:40:04', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:04\"}'),
('6a16ee06c00e49c98ae7268df049e4', 'admin', '2022-10-07 20:56:39', 0, '::1', 'Create', 'supplier_items', '{\"suppliers_number\":\"E\",\"items_number\":\"RAW-0001\",\"mpq\":\"10\",\"moq\":\"10\",\"price\":\"1500000\",\"remarks\":\"\",\"id\":\"434587b66d154c698cf3d00005f1c802\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 20:56:39\"}'),
('6b5d2723c51e44978309122073ecb1', 'admin', '2022-10-07 17:32:42', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:42\"}'),
('6b862525e66a4d1783a51346645adf', 'admin', '2022-10-07 18:25:31', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:25:31\"}'),
('6b9d5eb5b1eb4b5bb1066bd0ae26f6', 'admin', '2022-10-07 21:39:55', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"0e4bb0451f1d4a64a4f7be6be13708\",\"id\":\"f748fa0619a349a798ba30d049495150\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:39:55\"}'),
('6d0fb50587854a16b93d7516941b30', 'admin', '2022-10-07 21:37:33', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"93d8c32f689c41399f7ccb5ce434c3\",\"name\":\"Sales Order\",\"link\":\"planning\\/sales_order\",\"sort\":\"1\",\"state\":\"\",\"id\":\"e780677ba5764a128f4ae77e3b720e1a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:37:33\"}'),
('6d166739aa17489b8950a3f3756773', 'admin', '2022-10-07 21:39:06', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"93d8c32f689c41399f7ccb5ce434c3\",\"m_view\":\"on\",\"id\":\"eba912bd48844e1dbe5689737f6ea93a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:39:06\"}'),
('6d1be7c0c76c4b3295d60de446b290', 'admin', '2022-10-11 16:27:25', 0, '::1', 'Create', 'item_familys', '{\"number\":\"OE\",\"name\":\"OFFICE EQUIPMENT\",\"description\":\"\",\"id\":\"860ace29426e456bb7884f77dcaf8a19\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:27:25\"}'),
('6d9266e0caae4e0e98289ff663a740', 'admin', '2022-10-13 15:39:16', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"4f841c89e8274fd88335b2346d1ee2\",\"id\":\"28a44740a9144404a62818c2c9b3c3bf\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:39:16\"}'),
('6db9fbde6d964d1e9a68a933dea7fa', 'admin', '2022-10-07 17:32:38', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:38\"}'),
('6dfadf9faced4f5187c9bd4f7e2346', 'admin', '2022-10-12 10:57:57', 0, '::1', 'Create', 'purchase_orders', '{\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"request_no\":\"PR-RAW2210-0001\",\"request_date\":\"2022-10-12\",\"request_name\":\"Administrator\",\"po_no\":\"PO-RAW2210-0001\",\"po_date_from\":\"2022-10-12\",\"po_date_to\":\"2022-10-12\",\"po_name\":\"Administrator\",\"qty\":\"100\",\"remarks\":\"TESTING 1\",\"id\":\"e47a18c448a24279bd258fa6c1d9f791\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 10:57:57\"}'),
('6e5de6989dd447298aa85c04235ab3', 'admin', '2022-10-07 17:32:32', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:32\"}'),
('6f1ca7ecffa643b8ad03b5dbac9394', 'admin', '2022-10-07 21:38:43', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"93d8c32f689c41399f7ccb5ce434c3\",\"name\":\"Sales Orders\",\"link\":\"planning\\/sales_orders\",\"sort\":\"1\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:38:43\"}'),
('6f532e975d8942f29c75f7454cad48', 'admin', '2022-10-07 21:14:58', 0, '::1', 'Create', 'supplier_items', '{\"suppliers_number\":\"E\",\"items_number\":\"RAW-0001\",\"mpq\":\"10\",\"moq\":\"10\",\"price\":\"1700000\",\"remarks\":\"\",\"id\":\"8588e1fff5d847d48777d5c9ab36dbb6\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:14:58\"}'),
('6f709afb78234bc698f4349426316c', 'admin', '2022-10-07 17:54:38', 0, '::1', 'Create', 'item_options', '{\"number\":\"0\",\"name\":\"NONE\",\"description\":\"\",\"id\":\"f6adec9f3f734bc8a9511ce347588dd5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:54:38\"}'),
('6f757383199b47bebbe62c1a760e44', 'admin', '2022-10-07 17:32:48', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:48\"}'),
('7013439fecff4bc8b0261675be6a04', 'admin', '2022-10-11 16:55:55', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-019\",\"name\":\"RAW MATERIAL 019\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"1375d964fb904127a0a5cb484eb29506\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:55\"}'),
('7165c020c27d41b49de66608da1a08', 'admin', '2022-10-07 21:01:38', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:01:38\"}'),
('71d8e2caa077462d881d8daf8bd2c8', 'admin', '2022-10-07 18:06:43', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Unit Of Measure\",\"link\":\"master\\/uom\",\"sort\":\"9\",\"state\":\"\",\"id\":\"3038d96df22048608bbbb8762bbe2401\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:06:43\"}'),
('71f944bce3d14231b54818469326a1', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-012\",\"name\":\"FINISH GOOD 012\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"d8c7ce8b47d3448e9dc5547abd9e0b5f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('723f35e387a3448cb89e2dba2a9d43', 'admin', '2022-10-13 11:04:56', 0, '::1', 'Create', 'purchase_order_receipts', '{\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"receipt_date\":\"2022-10-13\",\"receipt_no\":\"POR-221013-0001\",\"po_no\":\"PO-RAW2210-0001\",\"bc_kind\":\"asdasd\",\"bc_document\":\"asd\",\"bc_date\":\"2022-10-14\",\"awb_no\":\"\",\"awb_date\":\"\",\"qty_po\":\"150\",\"qty_os\":\"150\",\"qty_receipt\":\"150\",\"qty_mpq\":\"10\",\"qty_label\":\"15\",\"receipt_id\":\"POR-2210-000002\",\"id\":\"91d33c682e2448d7a8b783842e78e976\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:04:56\"}'),
('72c30f64229d4fe38e81f90a822202', 'admin', '2022-10-11 19:02:41', 0, '::1', 'Create', 'bom', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"ef19b617f6454eeda06b0ce8029bb0\",\"qpa\":\"0.15\",\"operation\":\"P2\",\"id\":\"6cc1fdd0279b4f059aeed7e263116d1d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:02:41\"}'),
('733239f6e5674708a62a31166e0d4b', 'admin', '2022-10-11 19:45:13', 0, '::1', 'Delete', 'supply_sheets', '{\"id\":\"WO221011-00001\"}'),
('7388a8b01b8242a08e449ec2d9ad14', 'admin', '2022-10-07 20:14:20', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:14:20\"}'),
('7418526d6a6243e2a9cefb445f310e', 'admin', '2022-10-07 21:17:49', 0, '::1', 'Create', 'bom', '{\"customers_number\":\"A151\",\"items_number\":\"PC-GAME-001\",\"component_number\":\"RAW-0001\",\"qpa\":\"1.000\",\"operation\":\"P1\",\"id\":\"2e35eeb85e9546658e56cc09f59aec07\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:17:49\"}'),
('7450bebae66c4a0a9fe2b11de74d9b', 'admin', '2022-10-07 17:51:14', 0, '::1', 'Delete', 'item_types', '{\"id\":\"e0142ad3066248e5bc76\"}'),
('74779ec28101490ea1ddca86a8a3a9', 'admin', '2022-10-11 16:38:00', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-001\",\"name\":\"RAW MATERIAL 001\",\"description\":\"\",\"leadtime\":\"0\",\"uom\":\"Pcs\",\"status\":\"\",\"id\":\"1c90482587c74f7a96c8912df36bc989\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:38:00\"}'),
('74899e168a9542a182cf735687046e', 'admin', '2022-10-07 20:58:29', 0, '::1', 'Create', 'supplier_items', '{\"suppliers_number\":\"E\",\"items_number\":\"RAW-0002\",\"mpq\":\"10\",\"moq\":\"10\",\"price\":\"500000\",\"remarks\":\"\",\"id\":\"658f3cd5052c48fd874dfdac0344bb84\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 20:58:29\"}'),
('74e13761d64542fbbbba8c4c3c1f0e', 'admin', '2022-10-07 18:20:55', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:20:55\"}'),
('74e5d45d82ba48b89ce81fd643a540', 'admin', '2022-10-07 18:38:19', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"255bcee4fb4c45d8aa938b8279893c\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"ac40bf63b16d4aeab224d7d7dfb13057\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:38:19\"}'),
('75005ace4b9743318f3d874d58d114', 'admin', '2022-10-13 17:08:20', 0, '::1', 'Create', 'issued_materials', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"12d216f47b9b4d09ab393337234653\",\"request_no\":\"SH-221011-0001\",\"period\":\"202108\",\"wp\":\"01\\/22\",\"workorder\":\"WO221011-00001\",\"qty\":\"41\",\"id\":\"12014fe8761e4a94813bfbc07f49499b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:08:20\"}'),
('7622c4249f0540b9a432951d09228d', 'admin', '2022-10-13 16:22:39', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 16:22:39\"}'),
('76429093c0b74c67839989e27fe24c', 'admin', '2022-10-12 04:58:31', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"\",\"name\":\"Purchasing\",\"link\":\"\",\"sort\":\"4\",\"state\":\"closed\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:58:31\"}'),
('76777886260749daaa557483414a56', 'admin', '2022-10-07 17:32:31', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:31\"}'),
('769b090f53a840efa6c02b766eb306', 'admin', '2022-10-07 17:32:48', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:48\"}'),
('76df3abb90e34226a6571e8865b3af', 'admin', '2022-10-11 17:10:59', 0, '::1', 'Create', 'customer_items', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"ar_balance\":\"20\",\"max_order\":\"100\",\"expired\":\"2022-10-31\",\"price\":\"20000\",\"remarks\":\"\",\"id\":\"2e22d67390b6488d9fe9f14b0d234934\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:10:59\"}'),
('79782bb3388e4df5ab0d76bfcf93a4', 'admin', '2022-10-09 14:22:20', 0, '::1', 'Create', 'supply_sheets', '{\"items_number\":\"PC-GAME-001\",\"component_number\":\"RAW-0001\",\"workorder\":\"WO221009-00001\",\"request_date\":\"2022-10-09\",\"request_no\":\"SH-221009-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"200\",\"qty_act\":\"200\",\"qty_bal\":\"0\",\"id\":\"425d2bdc2ac343fd824e832f1bb67cc3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-09 14:22:20\"}'),
('7b2ea98cdda04967934c799462bbf3', 'admin', '2022-10-07 17:32:34', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:34\"}'),
('7b31af6f307b4e9bb577b48ac95d53', 'admin', '2022-10-07 17:32:26', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:26\"}'),
('7b6b2d3fe4de4de4b9ec558b9b6e77', 'admin', '2022-10-07 18:24:25', 0, '::1', 'Create', 'currencies', '{\"number\":\"IDR\",\"name\":\"INDONESIA\",\"description\":\"\",\"symbol\":\"Rp\",\"id\":\"e7b7cf37985b40a787735830a1ec1e9c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:24:25\"}'),
('7bed315974604794a0cd2b22e51934', 'admin', '2022-10-07 20:14:22', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:14:22\"}'),
('7ce6c6081e314e7ab4e701c8072ef3', 'admin', '2022-10-07 21:38:10', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"93d8c32f689c41399f7ccb5ce434c3\",\"name\":\"Production Schedule\",\"link\":\"planning\\/production_schedules\",\"sort\":\"2\",\"state\":\"\",\"id\":\"0e4bb0451f1d4a64a4f7be6be1370807\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:38:10\"}'),
('7dccef5173c741f2bad7e9bb7f8aec', 'admin', '2022-10-11 16:38:21', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-002\",\"name\":\"RAW MATERIAL 002\",\"description\":\"\",\"leadtime\":\"\",\"uom\":\"Pcs\",\"status\":\"\",\"id\":\"9a21160eec3f47f5a5ae1932627c3e19\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:38:21\"}'),
('7edce384f3cc4018bd1aee1d9478f7', 'admin', '2022-10-07 17:32:43', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:43\"}'),
('7f2179272157487bbd9b5f7f7012fd', 'admin', '2022-10-07 17:31:18', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"m_view\":\"on\",\"id\":\"20a062c23b1d4c17aa1c2708fb69ca7b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:18\"}'),
('7f7e95a3eec34258a00ad5f8fc9e97', 'admin', '2022-10-07 17:51:20', 0, '::1', 'Delete', 'item_colors', '{\"id\":\"e9ac03ab289e489fa5f2\"}'),
('7f92dbaa8acf4a7b939a2e43dbc38c', 'admin', '2022-10-11 19:50:47', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"56\",\"qty_act\":\"56\",\"qty_bal\":\"0\",\"id\":\"75e4a08faf4f4ddb87c58ac26035f0a8\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:50:47\"}'),
('7fdb746b6caf4ab6bce90d394dc7a5', 'admin', '2022-10-07 18:09:55', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"8a5ae39e16a54354bd0ea87c1ff963\",\"id\":\"ac542dc754354f7a8c20cf48a747f14b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:09:55\"}'),
('7fefb28cb63149d6b5979d7f30def0', 'admin', '2022-10-12 04:57:16', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"670141b0c0ac4f61bba46f0c85acd6\",\"id\":\"a6b14fcb4bf547ff89694b2155cc4bae\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:57:16\"}'),
('801bc616cb5748939b9e561e23e2b3', 'admin', '2022-10-07 17:32:24', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:24\"}'),
('806c576580d2467ebc63a14088c0ce', 'admin', '2022-10-07 18:18:36', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:18:36\"}'),
('806f019245b9400499751e6065ca5b', 'admin', '2022-10-11 18:19:46', 0, '::1', 'Create', 'sales_orders', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"customer_po\":\"asdasdasd\",\"number\":\"SOA151-2210-0001\",\"trans_date\":\"2022-10-11\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"qty\":\"15\",\"price\":\"20000\",\"total\":\"300000\",\"vat\":\"NON VAT\",\"delivery\":\"2022-10-12\",\"id\":\"70e2b28401334a058a74a1f27af5c3e6\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:19:46\"}'),
('81ed559fc66c4be09c0b4c63cb5709', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-011\",\"name\":\"RAW MATERIAL 011\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"c363a2d893f748119af73c55b4861da7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('8307e0b3a0cb45b18c53ff65e7d7aa', 'admin', '2022-10-07 17:32:26', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:26\"}'),
('8385abcaa4e745d99eceb5d35c1319', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010007\",\"qty\":\"10\",\"id\":\"f26793fc8a174fd7a6d4ba08d0e2f836\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('85074d0712ca4710b51d5f560a6bda', 'admin', '2022-10-07 20:42:16', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:42:16\"}'),
('851d8368d1a14f33831da0dedc2f73', 'admin', '2022-10-07 17:32:42', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:42\"}'),
('868207184d9d4bdd832c471e600545', 'admin', '2022-10-07 18:18:26', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"3c5e75290ca947eab000aa09269753\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"edae5d40129f4bd2b4ac567c020497dc\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:18:26\"}'),
('869ab3f3169a495a8939b4f3a17a81', 'admin', '2022-10-13 17:53:04', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210-0000010001\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-02\",\"qty\":\"5\",\"type\":\"BALANCE\",\"id\":\"45fdd2331fbd4c938f8f38cbbdf9d959\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:53:04\"}'),
('8714af2c88b246bfaf38105125c058', 'admin', '2022-10-07 19:48:29', 0, '::1', 'Create', 'items', '{\"product_family_number\":\"RAW\",\"number\":\"RAW-0001\",\"name\":\"CORE I7 2600\",\"description\":\"\",\"leadtime\":\"10\",\"uom\":\"Pcs\",\"status\":\"0\",\"id\":\"2bc198f449f443ca9c5dd984c7959e5b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 19:48:29\"}'),
('8717a567752e4da1a3c2abafba7583', 'admin', '2022-10-13 15:39:12', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"c5e3a7bb003a42309c42907778173d\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"81957b7cf9f04900ad67e0005fce771b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:39:12\"}'),
('8783b3b6dc47430ba22a8c0e77e68f', 'admin', '2022-10-11 17:11:05', 0, '::1', 'Create', 'customer_items', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"ar_balance\":\"20\",\"max_order\":\"100\",\"expired\":\"2022-10-31\",\"price\":\"14500\",\"remarks\":\"\",\"id\":\"816af460e0404921b6148a2a6eeed37e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:11:05\"}'),
('8799d495aac34486b44c0d5589be62', 'admin', '2022-10-07 18:09:58', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:09:58\"}'),
('88a6051a9d604dd98cbd5eeefab18b', 'admin', '2022-10-07 18:12:44', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:12:44\"}'),
('8949c25d35654668a2d2016d09129d', 'admin', '2022-10-07 17:54:52', 0, '::1', 'Create', 'item_options', '{\"number\":\"2\",\"name\":\"BROWN\",\"description\":\"\",\"id\":\"20b3582b10bf4e3387b9f82b4c777f71\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:54:52\"}'),
('89db5e642a40491bac12752f0c0df5', 'admin', '2022-10-12 06:20:33', 0, '::1', 'Create', 'purchase_requests', '{\"request_no\":\"PR-RAW2210-0001\",\"request_date\":\"2022-10-12\",\"request_name\":\"Administrator\",\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"qty\":\"150\",\"remarks\":\"\",\"id\":\"ed098c4194cc419c9b557ca6c11a0837\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 06:20:33\"}'),
('8ae2f4761e694e36bac235e76627f2', 'admin', '2022-10-07 18:25:29', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:25:29\"}'),
('8b912889ed73479d926f60aa53796b', 'admin', '2022-10-07 21:38:36', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"93d8c32f689c41399f7ccb5ce434c3\",\"name\":\"Production Schedules\",\"link\":\"planning\\/production_schedules\",\"sort\":\"2\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:38:36\"}'),
('8badc80f18bc423b861b322d1d7a14', 'admin', '2022-10-12 04:56:58', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"670141b0c0ac4f61bba46f0c85acd6\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"3e462a4127e04978b64100d8521297fb\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:56:58\"}'),
('8c0cf821793f48728466bcbce93fa5', 'admin', '2022-10-11 18:19:46', 0, '::1', 'Create', 'sales_orders', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"customer_po\":\"asdasdasd\",\"number\":\"SOA151-2210-0001\",\"trans_date\":\"2022-10-11\",\"item_id\":\"f153854844024fa499c0e62d165d7b\",\"qty\":\"30\",\"price\":\"10600\",\"total\":\"318000\",\"vat\":\"NON VAT\",\"delivery\":\"2022-10-15\",\"id\":\"21f2152cfa2140ac916aaaf71eaa89df\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:19:46\"}'),
('8c98483b0666411290ae3f71e6c727', 'admin', '2022-10-11 16:26:35', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Item Familys\",\"link\":\"master\\/item_familys\",\"sort\":\"3\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 16:26:35\"}'),
('8d7b565a4caf45de97e86ac1af794f', 'admin', '2022-10-13 17:57:31', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-01\",\"qty\":\"5\",\"type\":\"SUPPLY\",\"id\":\"73c30d0cada949caa954ce795b6fae8e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:57:31\"}'),
('8e5f091674ea4f3492067d943a41a6', 'admin', '2022-10-07 18:12:43', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:12:43\"}'),
('8e8a7d570da641659a252712056b75', 'admin', '2022-10-12 04:57:49', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:49\"}'),
('900146ff91a2448cb81a648a80c0c3', 'admin', '2022-10-13 15:57:00', 0, '::1', 'Create', 'supply_materials', '{\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"df6c9c0da472463b9dfe1de7cf0518\",\"workorder\":\"WO221011-00002\",\"request_date\":\"2022-10-13\",\"request_no\":\"REQ-221013-0001\",\"request_name\":\"Administrator\",\"qty_wo\":\"180\",\"qty_req\":\"180\",\"qty_bal\":\"0\",\"id\":\"45ac15878d0447f794a9b3d209037605\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:57:00\"}'),
('91f58e1986c24d6bbbbebb3569590e', 'admin', '2022-10-07 20:55:16', 0, '::1', 'Create', 'suppliers', '{\"number\":\"E\",\"name\":\"PT EWINDO\",\"type\":\"LOCAL\",\"address\":\"BANDUNG\",\"telp\":\"\",\"email\":\"\",\"website\":\"\",\"currency\":\"IDR\",\"payment_term\":\"30\",\"incoterm\":\"100\",\"vat_status\":\"VAT\",\"vat\":\"10\",\"tax\":\"\",\"bank_account\":\"\",\"bank_name\":\"\",\"id\":\"128d849be37d4ffe92082dc47196d449\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 20:55:16\"}');
INSERT INTO `logs` (`id`, `created_by`, `created_date`, `deleted`, `ip_address`, `action`, `menu`, `description`) VALUES
('92067f806ad9446080171c9e5ad970', 'admin', '2022-10-07 18:20:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:20:57\"}'),
('946a0a9669224dc08ba478f443cc1e', 'admin', '2022-10-07 18:19:18', 0, '::1', 'Create', 'lines', '{\"number\":\"CR\",\"name\":\"Line Crimping\",\"description\":\"\",\"id\":\"eabcbf3797854aefb4c3b3639d912a2d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:19:18\"}'),
('951e057bf77f4984a50ec654c2cb45', 'admin', '2022-10-13 15:39:16', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"c5e3a7bb003a42309c42907778173d\",\"id\":\"bf6aa4a180e349099e8a29456a7e269f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:39:16\"}'),
('9535f4cd15884adaac6410a1a1210d', 'admin', '2022-10-13 10:53:40', 0, '::1', 'Create', 'purchase_order_receipts', '{\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"receipt_date\":\"2022-10-13\",\"receipt_no\":\"POR-221013-0001\",\"po_no\":\"PO-RAW2210-0001\",\"bc_kind\":\"asdas\",\"bc_document\":\"asd\",\"bc_date\":\"2022-10-13\",\"awb_no\":\"\",\"awb_date\":\"\",\"qty_po\":\"100\",\"qty_os\":\"100\",\"qty_receipt\":\"100\",\"qty_mpq\":\"10\",\"qty_label\":\"10\",\"id\":\"6c655e4929f44cbabe77bfd618b712f7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 10:53:40\"}'),
('954b786c498b4ad99b67dc8831c937', 'admin', '2022-10-07 17:22:15', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Item Cards\",\"link\":\"master\\/items\",\"sort\":\"1\",\"state\":\"\",\"id\":\"62309884bfe74e5696f10f32243d971c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:22:15\"}'),
('95fc29549308457e84a172ce3b37af', 'admin', '2022-10-11 19:02:36', 0, '::1', 'Create', 'bom', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"970957b7cbea47c78fea4f6e66b78e\",\"qpa\":\"0.23\",\"operation\":\"P2\",\"id\":\"a9fb4835c5f547498a162f2f41ad7ff4\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:02:36\"}'),
('9600bfc6fa4748cc84333cac9141ef', 'admin', '2022-10-07 18:04:20', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Product Familys\",\"link\":\"master\\/product_familys\",\"sort\":\"3\",\"state\":\"\",\"id\":\"7d7f997ca58f425c8783ff7a7f994ca7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:04:20\"}'),
('96d9bce623b44937ba1616b77c8e9d', 'admin', '2022-10-07 17:32:33', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:33\"}'),
('973ead9ca613462eb74cb3b030a44a', NULL, '2022-10-10 17:42:23', 0, '::1', 'Login', 'Login', '{\"id\":\"86f9f296025243ed953fe6014ff765\",\"name\":\"Administrator\",\"username\":\"admin\",\"position\":\"Admin System\"}'),
('9778e860eff9407f96103362350795', 'admin', '2022-10-07 18:38:28', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:38:28\"}'),
('977ee749041f40f5bd9b3894ce36a2', 'admin', '2022-10-07 18:18:34', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:18:34\"}'),
('97d25b3b8270404991eddd98beaa24', 'admin', '2022-10-11 18:43:38', 0, '::1', 'Create', 'production_schedules', '{\"month\":\"08\",\"year\":\"2021\",\"wp\":\"01\\/22\",\"trans_date\":\"2022-10-11\",\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"f153854844024fa499c0e62d165d7b\",\"line_id\":\"1958c14d5b8f404291f9c003080c13\",\"qty\":\"130\",\"workorder\":\"WO221011-00005\",\"period\":\"202108\",\"id\":\"d7ad7f79f566498ca4cc98bd02211ebf\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:43:38\"}'),
('983414c0fd9040cea0dedb8628e83a', 'admin', '2022-10-07 18:19:23', 0, '::1', 'Update', 'lines', '{\"number\":\"CT\",\"name\":\"Line Cutting\",\"description\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:19:23\"}'),
('9969a44e7a684ae5a93710aebc44f9', 'admin', '2022-10-12 10:58:02', 0, '::1', 'Create', 'purchase_orders', '{\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"request_no\":\"PR-RAW2210-0001\",\"request_date\":\"2022-10-12\",\"request_name\":\"Administrator\",\"po_no\":\"PO-RAW2210-0001\",\"po_date_from\":\"2022-10-12\",\"po_date_to\":\"2022-10-12\",\"po_name\":\"Administrator\",\"qty\":\"150\",\"remarks\":\"TESTING 2\",\"id\":\"572aaf7a0b4e483b939cb8ad6782e460\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 10:58:02\"}'),
('99954f4bdfa14a219e5e6abb4c32b2', 'admin', '2022-10-13 15:57:00', 0, '::1', 'Create', 'supply_materials', '{\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"ef19b617f6454eeda06b0ce8029bb0\",\"workorder\":\"WO221011-00002\",\"request_date\":\"2022-10-13\",\"request_no\":\"REQ-221013-0001\",\"request_name\":\"Administrator\",\"qty_wo\":\"23\",\"qty_req\":\"23\",\"qty_bal\":\"0\",\"id\":\"c7d1cdbb93974929a01094f6f6fc2b03\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:57:00\"}'),
('99deab08d8d845d4b6a61d218973da', 'admin', '2022-10-12 04:57:50', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:50\"}'),
('9a0f1095b2394984807cd3af9425fb', 'admin', '2022-10-11 19:54:29', 0, '::1', 'Delete', 'supply_sheets', '{\"id\":\"e0a8e2d7a9b34c8cb2cc1cd72e0039\"}'),
('9a281d8896fb44a5867ac8e456c902', 'admin', '2022-10-12 04:57:51', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:51\"}'),
('9a37c365f99b4396878fab00c64365', 'admin', '2022-10-07 18:02:48', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Bill Of Materials\",\"link\":\"master\\/bom\",\"sort\":\"2\",\"state\":\"\",\"id\":\"8001792212e640eb8e67b13a16a26da3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:02:48\"}'),
('9a445866bf0d4562acea3f4e7300c9', 'admin', '2022-10-11 19:15:59', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"12d216f47b9b4d09ab393337234653\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"41\",\"qty_act\":\"41\",\"qty_bal\":\"0\",\"id\":\"5ab63b58603f4bf6a2cead1ee591670d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:15:59\"}'),
('9a6aab0f42054d8bb1917f34651b84', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"3dd1a46ef2834b79a8da5080c496e4\",\"id\":\"67b92be10bca45438aff838eebab5581\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('9ab9573acda341f9a970958873b4d3', NULL, '2022-10-13 05:16:01', 0, '::1', 'Login', 'Login', '{\"id\":\"86f9f296025243ed953fe6014ff765\",\"name\":\"Administrator\",\"username\":\"admin\",\"position\":\"Admin System\"}'),
('9ae0535f70c7480fbb0bcecd356334', 'admin', '2022-10-07 21:01:40', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:01:40\"}'),
('9c1168b5c25040158fa47ec2b0e442', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-001\",\"name\":\"FINISH GOOD 001\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"8ee1c3d0d3654c0194cba18cffaae942\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('9c22d8bef7204ab794b998753db0a4', 'admin', '2022-10-11 19:02:44', 0, '::1', 'Create', 'bom', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"579a5b6ab1f047a8afcaa31d27e957\",\"qpa\":\"0.61\",\"operation\":\"P2\",\"id\":\"4b32cab69080476f987af9eeb4f545a1\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:02:44\"}'),
('9cc8b78e7cae4e5f9c0d9ca6b9a458', 'admin', '2022-10-13 16:06:35', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"\",\"name\":\"Warehouse\",\"link\":\"\",\"sort\":\"6\",\"state\":\"closed\",\"id\":\"9c04c7dfcf6c44cc9a0ec44b1c76913d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:06:35\"}'),
('9e3bf171ddfa430c938e4cd33a5e01', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-010\",\"name\":\"FINISH GOOD 010\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"b913d5534d1d4960bf74ecabb89eb76e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('9ff9e92db1fb40508bb645d3e470f0', 'admin', '2022-10-07 17:47:28', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Colors\",\"link\":\"master\\/item_colors\",\"sort\":\"6\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:47:28\"}'),
('a02bc69d4f234172bdd1276ed01702', 'admin', '2022-10-07 17:32:19', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:19\"}'),
('a063efad8fca4e3c8949a535f58d05', 'admin', '2022-10-11 16:27:01', 0, '::1', 'Create', 'item_familys', '{\"number\":\"FG\",\"name\":\"FINISH GOOD\",\"description\":\"\",\"id\":\"9016430cc47a455ba3a900f9d0b5d8d3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:27:01\"}'),
('a0ec41526d0644f8bd8af76edb6829', 'admin', '2022-10-11 17:32:18', 0, '::1', 'Create', 'supplier_items', '{\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"mpq\":\"10\",\"moq\":\"50\",\"price\":\"2500\",\"remarks\":\"\",\"id\":\"fb2dc745e61847a89a2fd9a083128dba\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:32:18\"}'),
('a239dbe263194edda9f3053928bb22', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-004\",\"name\":\"RAW MATERIAL 004\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"970957b7cbea47c78fea4f6e66b78e4a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('a2ab4c41c55245e9a3ec36eb00b4ec', 'admin', '2022-10-11 19:54:29', 0, '::1', 'Update', 'production_schedules', '{\"status\":0,\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 19:54:29\"}'),
('a2c1bc32a2a64afd88d02c1fbe6a00', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020002\",\"qty\":\"10\",\"id\":\"e0f9730717c8491b8a78107e61e61587\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('a35a53ce708d467ab7161000f53ae4', 'admin', '2022-10-07 18:20:45', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"d188047ab21d45979c64c990a91e23\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"3355d1d6a3fb4ccb86c18bd5911c8995\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:20:45\"}'),
('a367cd00e8064c398590da8f151b0d', 'admin', '2022-10-07 18:20:27', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Currencies\",\"link\":\"master\\/currencies\",\"sort\":\"8\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:20:27\"}'),
('a374b9cb57624a7b966a11c1005360', 'admin', '2022-09-29 16:05:52', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"\",\"name\":\"Administrator\",\"link\":\"\",\"sort\":\"1\",\"state\":\"closed\",\"id\":\"cf98f97766f6405590b26daa586e0053\",\"created_by\":\"admin\",\"created_date\":\"2022-09-29 16:05:52\"}'),
('a380bcc64ee640adbf64e36301ee5f', 'admin', '2022-10-07 18:28:13', 0, '::1', 'Create', 'product_familys', '{\"number\":\"FG\",\"name\":\"FINISH GOOD\",\"description\":\"\",\"id\":\"ae53ac25684f42729a66408ae11bf392\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:28:13\"}'),
('a3a91b53a26047f6a105a20c163c58', 'admin', '2022-10-07 17:21:33', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Items\",\"link\":\"\",\"sort\":\"\",\"state\":\"closed\",\"id\":\"e9d8310044d3481f81834d14f91bd7a3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:21:33\"}'),
('a422bd0e6705466482e6e9fe07d0ae', NULL, '2022-10-12 04:42:22', 0, '::1', 'Login', 'Login', '{\"id\":\"86f9f296025243ed953fe6014ff765\",\"name\":\"Administrator\",\"username\":\"admin\",\"position\":\"Admin System\"}'),
('a46ecde1ce7442bebcc57c544ab152', 'admin', '2022-10-13 17:26:00', 0, '::1', 'Create', 'issued_material_details', '{\"request_no\":\"SH-221011-0001\",\"label_no\":\"POR-2210-0000010001\",\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"qty\":\"10\",\"id\":\"00b5833201da49f683ef34b6fa2d2d56\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:26:00\"}'),
('a4c32fa1cc5b4638bc46c2eeb1ee2e', 'admin', '2022-10-12 04:57:56', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:56\"}'),
('a58f654643ac426fa6fecead1ff6a0', 'admin', '2022-10-07 18:18:32', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"0\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:18:32\"}'),
('a757d416d69241e4ab7bf3a0981694', 'admin', '2022-10-07 21:40:04', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:04\"}'),
('a831a990ac524ebfbdac7deb793da0', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010006\",\"qty\":\"10\",\"id\":\"9e515ddb8eda4419b5b885a143491696\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('a8442966bbcc44a5856a0998df5079', 'admin', '2022-10-11 19:54:29', 0, '::1', 'Update', 'production_schedules', '{\"status\":0,\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 19:54:29\"}'),
('a8c53a98ca35499e8507d3e05b9fb5', 'admin', '2022-10-07 21:39:36', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"e780677ba5764a128f4ae77e3b720e\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"c5174669b5724457ad9036fdc17bec3e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:39:36\"}'),
('a8f5a402da6249ffb1454dcd4bd620', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-012\",\"name\":\"RAW MATERIAL 012\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"b765b9e1a8824a46be116747fd1a6170\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('a905934cd3aa4abda2b7ad757f84fb', 'admin', '2022-10-13 17:08:20', 0, '::1', 'Create', 'issued_materials', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"1c90482587c74f7a96c8912df36bc9\",\"request_no\":\"SH-221011-0001\",\"period\":\"202108\",\"wp\":\"01\\/22\",\"workorder\":\"WO221011-00001\",\"qty\":\"25\",\"id\":\"61a7258e18fc4038a62febc65d69f6f6\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:08:20\"}'),
('a9592268fbab425c91101514d4d899', 'admin', '2022-10-07 18:12:39', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"3038d96df22048608bbbb8762bbe24\",\"id\":\"29d98c205c7a49bb8957c57fcf2194f2\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:12:39\"}'),
('a984b781a4de46db88ddffa6023d2a', 'admin', '2022-10-13 15:39:24', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 15:39:24\"}'),
('a9e946174a954936b48e823fa65c7d', 'admin', '2022-10-07 17:32:49', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:49\"}'),
('aa2c45a60d254f94909ff4934e1f5c', 'admin', '2022-10-07 21:40:03', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:03\"}'),
('aad63c3be12e461fb1b1b7a6adb80e', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020008\",\"qty\":\"10\",\"id\":\"04e49253faa14e81b267f3982aaa2def\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('ab000c5b5407467daca7c3cf87c4ed', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010009\",\"qty\":\"10\",\"id\":\"4fa40dd0243542dd835b183cf8b062cc\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('ab144707c8434cc4b7046d9fe6c625', 'admin', '2022-10-07 18:07:57', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Currencys\",\"link\":\"master\\/currencys\",\"sort\":\"8\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:07:57\"}'),
('ab158dbb3c2f46eba2525844bba5e0', 'admin', '2022-10-11 18:43:32', 0, '::1', 'Create', 'production_schedules', '{\"month\":\"08\",\"year\":\"2021\",\"wp\":\"01\\/22\",\"trans_date\":\"2022-10-11\",\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"8e664c010bb44d44b7ea462fa2c311\",\"line_id\":\"1958c14d5b8f404291f9c003080c13\",\"qty\":\"120\",\"workorder\":\"WO221011-00004\",\"period\":\"202108\",\"id\":\"e123c566dddd4887a2526320dab04e1e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:43:32\"}'),
('ab858817112f431d953caf1e7d17c1', 'admin', '2022-10-07 17:43:58', 0, '::1', 'Create', 'item_sizes', '{\"number\":\"03\",\"name\":\"0.35 Sqm\",\"description\":\"\",\"id\":\"3e7e3f5826f041bca93f1d4ecc683b4b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:43:58\"}'),
('ab8f466b8cb148509fe0f87b8ccff5', 'admin', '2022-10-07 17:51:17', 0, '::1', 'Delete', 'item_sizes', '{\"id\":\"3e7e3f5826f041bca93f\"}'),
('abfe6f49493b4df69016e905d98b88', 'admin', '2022-10-11 17:13:55', 0, '::1', 'Create', 'customer_items', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"8e664c010bb44d44b7ea462fa2c311\",\"ar_balance\":\"20\",\"max_order\":\"100\",\"expired\":\"2022-10-31\",\"price\":\"16200\",\"remarks\":\"\",\"id\":\"77c7e3b868c34baea3365c748fd2c7c9\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:13:55\"}'),
('ac9829d0424c4777a4554f5c84a831', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"a015669f743f49d18be7541f4e9e4f\",\"id\":\"d46f5c5e7d7f43188e2cbf8daefff64e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('ac9f761db8e541ec8e4c20d9060265', 'admin', '2022-10-07 18:07:01', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Line Productions\",\"link\":\"master\\/lines\",\"sort\":\"10\",\"state\":\"\",\"id\":\"3c5e75290ca947eab000aa09269753cd\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:07:01\"}'),
('ad1a609bc9e4414c8eef4b2dd5b23b', 'admin', '2022-10-13 18:02:03', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-01\",\"qty\":\"5\",\"type\":\"SUPPLY\",\"id\":\"a4df2097c84d460497bf25d3cd061973\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 18:02:03\"}'),
('ad218349095b4da89e3c6deebeab55', 'admin', '2022-10-13 16:14:28', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"9c04c7dfcf6c44cc9a0ec44b1c7691\",\"name\":\"Barcode Divides\",\"link\":\"warehouse\\/barcode_devides\",\"sort\":\"2\",\"state\":\"\",\"id\":\"3f423b73a7b04367853767d7de4bc553\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:14:28\"}'),
('ad7e7c4e4041456896532475d18c03', 'admin', '2022-10-13 10:39:20', 0, '::1', 'Create', 'purchase_order_receipts', '{\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"receipt_date\":\"2022-10-13\",\"receipt_no\":\"POR-221013-0001\",\"po_no\":\"PO-RAW2210-0001\",\"bc_kind\":\"123123\",\"bc_document\":\"asdasd\",\"bc_date\":\"2022-10-20\",\"awb_no\":\"\",\"awb_date\":\"\",\"qty_po\":\"100\",\"qty_os\":\"100\",\"qty_receipt\":\"100\",\"qty_mpq\":\"10\",\"qty_label\":\"10\",\"id\":\"95ecbf39fdd046858f9ac51de54dc4be\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 10:39:20\"}'),
('adc638dbb9274195870589299884f9', 'admin', '2022-10-13 16:22:35', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"3f423b73a7b04367853767d7de4bc5\",\"id\":\"cd05cdd05cba4139943c629a73ce9ae7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:22:35\"}'),
('adcd5242bb164004812bdd4d672cbf', 'admin', '2022-10-07 17:51:17', 0, '::1', 'Delete', 'item_sizes', '{\"id\":\"37264ee8db454523a8c1\"}'),
('adf27368accc47ce97bb6449b2a60e', 'admin', '2022-10-07 17:31:48', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"612df21b8cd34fb5869011b0e92f81\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"c47b2d67ddb444edb8e1ade2ff78f021\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:48\"}'),
('af0914c6c4564aceacc490fca5e74e', 'admin', '2022-10-07 17:31:43', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"62309884bfe74e5696f10f32243d97\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_upload\":\"on\",\"m_download\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"dc02c9c9237e4f3fad8b8787691f6357\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:43\"}'),
('b0e7c8501dc448db84c9e936854c0f', 'admin', '2022-10-07 18:09:41', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"8a5ae39e16a54354bd0ea87c1ff963\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"009202e6989647abb9d7c3c322d87a3c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:09:41\"}'),
('b16485b2a9184e809a7056bf5eaa36', 'admin', '2022-10-11 17:13:49', 0, '::1', 'Create', 'customer_items', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"816befb7a6aa44cc986c29b4286610\",\"ar_balance\":\"20\",\"max_order\":\"100\",\"expired\":\"2022-10-31\",\"price\":\"5200\",\"remarks\":\"\",\"id\":\"fa0705b8e7084742a3ecf67065d05ea2\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:13:49\"}'),
('b1ded16ad8f54546baca47360a04b3', 'admin', '2022-10-11 17:32:38', 0, '::1', 'Create', 'supplier_items', '{\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"mpq\":\"10\",\"moq\":\"50\",\"price\":\"2500\",\"remarks\":\"\",\"id\":\"1a012f752ade4b408b02b863f2fcbb71\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:32:38\"}'),
('b1fd043061c7441eb0821276359aa6', 'admin', '2022-10-12 04:57:48', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"0\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:48\"}'),
('b27c4d4747b3450084149157de3318', 'admin', '2022-10-13 17:44:43', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-10003\",\"qty\":\"5\",\"type\":\"BALANCE\",\"id\":\"5d509f33166e49ceb19348a9f6eb59ee\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:44:43\"}'),
('b299f3a5d0814f1e801c448d593c5f', 'admin', '2022-10-13 15:57:00', 0, '::1', 'Create', 'supply_materials', '{\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"component_id\":\"6728a46bee4748ceb6a2e1652f0c50\",\"workorder\":\"WO221011-00002\",\"request_date\":\"2022-10-13\",\"request_no\":\"REQ-221013-0001\",\"request_name\":\"Administrator\",\"qty_wo\":\"14\",\"qty_req\":\"14\",\"qty_bal\":\"0\",\"id\":\"7dc47b3feae84fb6a684713d924616c0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 15:57:00\"}'),
('b2a84ed6b9d944d09f94b8201f3d58', 'admin', '2022-10-07 17:32:50', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:50\"}'),
('b354a08094dd4e05bb463d2e295974', 'admin', '2022-10-07 18:24:16', 0, '::1', 'Create', 'currencies', '{\"number\":\"EUR\",\"name\":\"EUROPE\",\"description\":\"\",\"symbol\":\"\\u20ac\",\"id\":\"9cfaf364f9fd42829caf25f5b6dfa17c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:24:16\"}'),
('b37bad3848a848d68aa75ad7022c59', 'admin', '2022-10-07 18:38:30', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:38:30\"}'),
('b3b5aa359f0d42dd96b641dca12612', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-003\",\"name\":\"FINISH GOOD 003\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"816befb7a6aa44cc986c29b42866105c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('b4093408b9934d1d80264e005ccd7b', 'admin', '2022-10-11 16:26:56', 0, '::1', 'Create', 'item_familys', '{\"number\":\"RAW\",\"name\":\"RAW MATERIAL\",\"description\":\"\",\"id\":\"f26818522f0345a2b01aae3087a2d1a1\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:26:56\"}'),
('b42ba4c4148c403cad1bc74194d2b7', 'admin', '2022-10-11 19:52:44', 0, '::1', 'Update', 'production_schedules', '{\"status\":0,\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 19:52:44\"}'),
('b475aad100f540ceb6c7d70cdac8a0', 'admin', '2022-10-11 16:55:55', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-021\",\"name\":\"RAW MATERIAL 021\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"ee13c666ed9c4f97a4444c48c0ff6d20\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:55\"}'),
('b5673ca62d7f476785bf3b7110d2b9', 'admin', '2022-10-07 17:49:33', 0, '::1', 'Create', 'item_colors', '{\"number\":\"0\",\"name\":\"WHITE (WH)\",\"description\":\"\",\"id\":\"f54b23f6126a4298af17494571d99973\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:49:33\"}'),
('b580c342be804a4faa4f0ce24ea343', 'admin', '2022-10-13 17:28:54', 0, '::1', 'Create', 'issued_material_details', '{\"request_no\":\"SH-221011-0001\",\"label_no\":\"POR-2210-0000020005\",\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"qty\":\"10\",\"id\":\"546cd5619b7e416a994bde2d85c1d530\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:28:54\"}'),
('b66b42fa29b5493896859e112fef71', 'admin', '2022-10-11 17:06:12', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-018\",\"name\":\"FINISH GOOD 018\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"875027b74a994c21b637dab39edfc5ce\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:12\"}'),
('b7ae8797341e4b03b7b9ed88f6c881', 'admin', '2022-10-07 18:38:27', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:38:27\"}'),
('b7e2c70ad0784afeb6e6ea6505bb97', 'admin', '2022-10-07 18:51:51', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"a5d9db23534f44fa9d58a7f996ce2a\",\"id\":\"5374cfce8d1142f6b5bb30b12e34fbb2\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:51:51\"}'),
('b7fbb0b3d331429cb4f8c1f8aca45c', 'admin', '2022-10-13 11:04:56', 0, '::1', 'Create', 'purchase_order_receipts', '{\"item_id\":\"1c90482587c74f7a96c8912df36bc9\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"receipt_date\":\"2022-10-13\",\"receipt_no\":\"POR-221013-0001\",\"po_no\":\"PO-RAW2210-0001\",\"bc_kind\":\"asdasd\",\"bc_document\":\"asd\",\"bc_date\":\"2022-10-14\",\"awb_no\":\"\",\"awb_date\":\"\",\"qty_po\":\"100\",\"qty_os\":\"100\",\"qty_receipt\":\"100\",\"qty_mpq\":\"10\",\"qty_label\":\"10\",\"receipt_id\":\"POR-2210-000001\",\"id\":\"0bca6f0cc886448692e9227661fb5784\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:04:56\"}'),
('b7fdafab3c784a68809295dd69bc96', 'admin', '2022-10-11 18:19:46', 0, '::1', 'Create', 'sales_orders', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"customer_po\":\"asdasdasd\",\"number\":\"SOA151-2210-0001\",\"trans_date\":\"2022-10-11\",\"item_id\":\"8e664c010bb44d44b7ea462fa2c311\",\"qty\":\"25\",\"price\":\"16200\",\"total\":\"405000\",\"vat\":\"NON VAT\",\"delivery\":\"2022-10-14\",\"id\":\"78bb8e88d6b749398d2acd3fb3a0c467\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:19:46\"}'),
('bb9ac7030f244834bfd0526ab856e0', 'admin', '2022-10-11 18:58:18', 0, '::1', 'Create', 'bom', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"1c90482587c74f7a96c8912df36bc9\",\"qpa\":\"0.250\",\"operation\":\"P1\",\"id\":\"bbdc3373786c46ddba521067613caaaa\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:58:18\"}'),
('bbb30aecd66a4b68be3a2f7b322da7', 'admin', '2022-10-13 17:46:49', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-10002\",\"qty\":\"5\",\"type\":\"SUPPLY\",\"id\":\"acc791c754dd469198ca41469ba7ddb5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:46:49\"}'),
('bbde00ca82f14248b2f671c2d583bd', 'admin', '2022-10-07 17:58:29', 0, '::1', 'Create', 'item_categories', '{\"number\":\"1\",\"name\":\"HARNESS WIRE\",\"description\":\"\",\"id\":\"b5ff19fc1b1c492c837ed4f3a1ced709\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:58:29\"}'),
('bc41daa68aaa402eb6fb381263b2d7', 'admin', '2022-10-07 17:32:44', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:44\"}'),
('bcea7986fc154ea0b2870eb06cf8ff', 'admin', '2022-10-11 19:49:31', 0, '::1', 'Delete', 'supply_sheets', '{\"id\":\"d96d482f954f4a9f9f3a4b06510d50\"}'),
('bd8b0f45d2a24c4ab6c9889ece505d', 'admin', '2022-10-07 18:11:18', 0, '::1', 'Create', 'plants', '{\"number\":\"2\",\"name\":\"LEOCO INDONESIA\",\"description\":\"\",\"id\":\"07e1c89ff47d4ec8895ad0e906908ff4\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:11:18\"}'),
('bdabea17438c407da0efef0fa303de', 'admin', '2022-10-07 17:23:26', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Colours\",\"link\":\"master\\/item_colours\",\"sort\":\"6\",\"state\":\"\",\"id\":\"3dd1a46ef2834b79a8da5080c496e453\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:23:26\"}'),
('bde548509e864ea3a0e958d9cd65f3', 'admin', '2022-10-07 17:51:17', 0, '::1', 'Delete', 'item_sizes', '{\"id\":\"7c223fad495241dcae0e\"}'),
('beaa86a5760d4d6389a73f5fe702d1', 'admin', '2022-10-07 17:32:22', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:22\"}'),
('bed09e5206a14dd0bf2c92f496f356', 'admin', '2022-10-07 18:07:27', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Items\",\"link\":\"\",\"sort\":\"1\",\"state\":\"closed\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:07:27\"}'),
('bf2a0d0004054f4ca85bb2ef4f31e1', 'admin', '2022-10-11 19:55:54', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"56\",\"qty_act\":\"56\",\"qty_bal\":\"0\",\"id\":\"52759cf31a9740bc8cff9f2b38e13853\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:55:54\"}'),
('bf7e8358c7954a5aa3246d44119fe6', 'admin', '2022-10-07 21:01:39', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:01:39\"}'),
('c0bb2ddfa4664a18b9a4ea4bb5dc9d', 'admin', '2022-10-07 17:31:50', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"a015669f743f49d18be7541f4e9e4f\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"b0050a24404c432d9116944bb3bc8cce\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:50\"}'),
('c0c05656229944329465048dae9481', 'admin', '2022-10-07 18:20:54', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:20:54\"}'),
('c1c349fdb1f746c7a8cc05d62fd01d', 'admin', '2022-10-07 17:51:14', 0, '::1', 'Delete', 'item_types', '{\"id\":\"b37cf6257a1841188594\"}'),
('c1c5c241fc0f465e914f2d4777bf2c', 'admin', '2022-10-12 04:57:35', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"c10a8ffd0165455989b58f9090798c\",\"m_view\":\"on\",\"id\":\"9353391666bb4d81bc4c678771b98b59\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:57:35\"}'),
('c29b672176e04505a2afeb2ea0f42c', 'admin', '2022-10-13 17:28:45', 0, '::1', 'Create', 'issued_material_details', '{\"request_no\":\"SH-221011-0001\",\"label_no\":\"POR-2210-0000020015\",\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"qty\":\"10\",\"id\":\"7a4b406c4333479ab4c99eb004ea357f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:28:45\"}'),
('c2b2ec2401c3452692bbcb651d2a53', 'admin', '2022-10-07 17:51:20', 0, '::1', 'Delete', 'item_colors', '{\"id\":\"f54b23f6126a4298af17\"}'),
('c3394f88d59e45c0bc28997e8da311', 'admin', '2022-10-07 21:40:03', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:03\"}'),
('c36e9118d55440419fae3ba13b515d', 'admin', '2022-10-07 17:31:32', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"ec436420c2734ec3a864eeedbe53c6\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"f10a5347cb5e4f38be8339258b589a44\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:32\"}'),
('c444aafa84e14a46a6061df946cd7a', 'admin', '2022-10-07 18:25:23', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"7d7f997ca58f425c8783ff7a7f994c\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"eff15051ce0149beb6b5dc8acd36b831\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:25:23\"}'),
('c444d3cf07014cf38913cee36d8cc5', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010004\",\"qty\":\"10\",\"id\":\"16fb5184d2a349b1aa94cc738ae1a015\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('c4f20b74a6104e2fa73f92d6fc02c2', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-004\",\"name\":\"FINISH GOOD 004\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"8e664c010bb44d44b7ea462fa2c3114c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('c6adaf27ca6944e6943cfa9615fcf1', 'admin', '2022-09-29 16:06:30', 0, '::1', 'Delete', 'menus', '{\"id\":\"MNU-2021120008\"}'),
('c73d5053635440e1b2d85cc15c551a', 'admin', '2022-10-07 17:32:26', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:26\"}'),
('c76da9ebc0894fa7bcce4535aac388', 'admin', '2022-10-11 19:15:59', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"1c90482587c74f7a96c8912df36bc9\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"25\",\"qty_act\":\"25\",\"qty_bal\":\"0\",\"id\":\"d96d482f954f4a9f9f3a4b06510d50be\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:15:59\"}'),
('c7a745c374b5419e99717814b59dba', 'admin', '2022-10-11 17:14:05', 0, '::1', 'Create', 'customer_items', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"f153854844024fa499c0e62d165d7b\",\"ar_balance\":\"20\",\"max_order\":\"100\",\"expired\":\"2022-10-31\",\"price\":\"10600\",\"remarks\":\"\",\"id\":\"9d04d4499aec49c3849ea2f27e1aff99\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:14:05\"}'),
('c7aec7bf75b845e683738acafeee26', 'admin', '2022-10-07 17:32:42', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:42\"}'),
('c8c1b39f19c044cdb03b3f6920f2fd', 'admin', '2022-10-13 17:42:35', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"9c04c7dfcf6c44cc9a0ec44b1c7691\",\"name\":\"Barcode Divides\",\"link\":\"warehouse\\/barcode_divides\",\"sort\":\"2\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 17:42:35\"}'),
('cab167f822d848f5a140c4de2a1ec2', 'admin', '2022-10-11 17:11:20', 0, '::1', 'Delete', 'customer_items', '{\"id\":\"8b2e397ef3c743e7917562658b4e70\"}'),
('cac61f7286414d5aba73f8bfe802a2', 'admin', '2022-10-07 20:14:19', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:14:19\"}'),
('cafdd975a816493db6289c9639def1', 'admin', '2022-10-07 17:32:24', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:24\"}'),
('cb8c9408b7a1477aacc6761afaca7b', 'admin', '2022-10-07 18:54:39', 0, '::1', 'Update', 'suppliers', '{\"number\":\"E\",\"name\":\"PT EWINDO\",\"type\":\"LOCAL\",\"address\":\"BANDUNG\",\"telp\":\"\",\"email\":\"\",\"website\":\"\",\"currency\":\"IDR\",\"payment_term\":\"30\",\"incoterm\":\"\",\"vat_status\":\"\",\"vat\":\"10\",\"tax\":\"\",\"bank_account\":\"\",\"bank_name\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:54:39\"}'),
('cba439e2e6344ff4b1b139c289776a', 'admin', '2022-10-11 19:50:47', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"1c90482587c74f7a96c8912df36bc9\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"25\",\"qty_act\":\"25\",\"qty_bal\":\"0\",\"id\":\"e0a8e2d7a9b34c8cb2cc1cd72e003967\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:50:47\"}'),
('cc430fba9c2c4c4796d50eb9b5feab', 'admin', '2022-10-11 19:14:11', 0, '::1', 'Create', 'supply_sheets', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"undefined\",\"workorder\":\"WO221011-00001\",\"request_date\":\"2022-10-11\",\"request_no\":\"SH-221011-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"56\",\"qty_act\":\"56\",\"qty_bal\":\"0\",\"id\":\"6424c863d9d94ca5972ddc80591c010a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 19:14:11\"}'),
('cc4905bf0bb34cc188da7d5fceaae1', 'admin', '2022-10-07 18:25:32', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"1\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:25:32\"}'),
('cca0c147984044f882b65f60e41b07', 'admin', '2022-10-07 18:18:35', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:18:35\"}'),
('ccc16635625c451fa084b0d6ff920d', 'admin', '2022-10-07 18:12:43', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:12:43\"}'),
('ccdf9c6960ca473e80cdb37edd22ba', 'admin', '2022-10-12 04:57:50', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:50\"}'),
('cd03916d83794ce7bfac303675f5ff', 'admin', '2022-10-07 17:21:14', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"\",\"name\":\"Master Data\",\"link\":\"\",\"sort\":\"2\",\"state\":\"closed\",\"id\":\"e0f3586f91ee4ab2952b6a8ad0f5db61\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:21:14\"}'),
('cd24bb7016e840259055444406a2a3', 'admin', '2022-10-07 18:51:53', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:51:53\"}'),
('cd3d5fd6171d40cea48a065a037836', 'admin', '2022-10-07 20:14:18', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:14:18\"}'),
('ce1aa36c51da44eab6943a784b7151', 'admin', '2022-10-07 17:32:30', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:30\"}'),
('cef16855bef14474a21793d2f7a014', 'admin', '2022-10-07 17:32:35', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:35\"}'),
('d0168ae569704a1d85edc2e76c8370', 'admin', '2022-10-07 18:05:21', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Customers\",\"link\":\"master\\/customers\",\"sort\":\"5\",\"state\":\"\",\"id\":\"255bcee4fb4c45d8aa938b8279893c24\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:05:21\"}'),
('d03cfff6464240919542c2fe4c624c', 'admin', '2022-10-07 18:19:08', 0, '::1', 'Create', 'lines', '{\"number\":\"C\",\"name\":\"Line Cutting\",\"description\":\"\",\"id\":\"1958c14d5b8f404291f9c003080c1301\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:19:08\"}'),
('d1776bc95b034280893aaedd3e532a', 'admin', '2022-10-11 17:06:12', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-016\",\"name\":\"FINISH GOOD 016\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"12c814714a5e4271b680400dd5205c5d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:12\"}'),
('d1ade8d70d2c48f8a9b5b292e79a32', 'admin', '2022-10-07 18:25:29', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:25:29\"}'),
('d202d0544d84455a9a5653bbaa8921', 'admin', '2022-10-07 20:14:18', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:14:18\"}'),
('d209b3ad907c4cceb320a24b30a3f2', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-013\",\"name\":\"RAW MATERIAL 013\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"c5639e95f4d940dca611a9daa446dafd\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('d2ffa9be86c24f2891c1756d7dbae7', 'admin', '2022-10-07 21:39:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:39:57\"}'),
('d300350be91e4698ad2ba8eaca0a30', 'admin', '2022-10-11 16:55:55', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-022\",\"name\":\"RAW MATERIAL 022\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"f6af8201cbff4edf9651790946eda93c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:55\"}'),
('d3a0481a88c7419ca50623f4ebd8b1', 'admin', '2022-10-07 18:07:11', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Plants\",\"link\":\"master\\/plants\",\"sort\":\"11\",\"state\":\"\",\"id\":\"8a5ae39e16a54354bd0ea87c1ff96352\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:07:11\"}'),
('d3ad8af4e0734eff85af6e50f76da0', 'admin', '2022-10-12 04:57:55', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:55\"}'),
('d3bd7ee8986e4f68af579315b0eb87', 'admin', '2022-10-07 22:02:41', 0, '::1', 'Create', 'sales_orders', '{\"customers_number\":\"A151\",\"customers_po\":\"ASDASD\",\"number\":\"SOA151-2210-0001\",\"trans_date\":\"2022-10-07\",\"items_number\":\"PC-GAME-001\",\"qty\":\"5\",\"price\":\"3700000\",\"total\":\"18500000\",\"vat\":\"NON VAT\",\"delivery\":\"2022-10-06\",\"id\":\"703f148ac5b646a9b0e05962cc74b192\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 22:02:41\"}'),
('d3ca77b2cd7d492dbbb32c2b735de8', 'admin', '2022-10-07 21:39:57', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:39:57\"}'),
('d3d86204392049b3a0293e287f2fe7', 'admin', '2022-10-12 10:16:06', 0, '::1', 'Create', 'purchase_requests', '{\"request_no\":\"PR-RAW2210-0001\",\"request_date\":\"2022-10-12\",\"request_name\":\"Administrator\",\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"qty\":\"150\",\"remarks\":\"TESTING 2\",\"id\":\"e12ffc5098e5443a8dde982042273cb7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 10:16:06\"}');
INSERT INTO `logs` (`id`, `created_by`, `created_date`, `deleted`, `ip_address`, `action`, `menu`, `description`) VALUES
('d5f070c5fe8d4e69853e05911c2c50', 'admin', '2022-10-13 17:50:07', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-02\",\"qty\":\"5\",\"type\":\"BALANCE\",\"id\":\"5f3b7efd435f4197b2af51f4ab6372f5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:50:07\"}'),
('d615b7143e194eca97c2f46cce7ea6', 'admin', '2022-10-07 18:25:27', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:25:27\"}'),
('d61af5fbc3d240998064f3aea4f1d3', 'admin', '2022-10-09 14:22:20', 0, '::1', 'Create', 'supply_sheets', '{\"items_number\":\"PC-GAME-001\",\"component_number\":\"RAW-0002\",\"workorder\":\"WO221009-00001\",\"request_date\":\"2022-10-09\",\"request_no\":\"SH-221009-0001\",\"request_name\":\"Administrator\",\"qty_req\":\"200\",\"qty_act\":\"200\",\"qty_bal\":\"0\",\"id\":\"b7f0a2cc014d4dfa80036381f84619fb\",\"created_by\":\"admin\",\"created_date\":\"2022-10-09 14:22:20\"}'),
('d678449a344c418eb82c09d3ed8990', 'admin', '2022-10-07 17:32:30', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:30\"}'),
('d6a4a59d3cd5441cbf066c39430a41', 'admin', '2022-10-07 18:38:25', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:38:25\"}'),
('d7410543c6a94154b21104adfd647e', 'admin', '2022-10-11 19:47:07', 0, '::1', 'Update', 'production_schedules', '{\"status\":0,\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 19:47:07\"}'),
('d7958d1e0d534117a6119d9fe980b1', 'admin', '2022-10-07 20:42:15', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:42:15\"}'),
('d80d9e02318f468fb157810c49cd83', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-009\",\"name\":\"RAW MATERIAL 009\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"ffdf31aac2f9463d9637b474a1e09c1f\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('d84bba40448a45979560612e220bd9', 'admin', '2022-10-07 17:40:22', 0, '::1', 'Create', 'item_makers', '{\"number\":\"G\",\"name\":\"GENERAL\",\"description\":\"\",\"id\":\"ca5ffab4824640c982a24a34e1c6bdf0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:40:22\"}'),
('d92a2f706e8b4945a88da103687948', 'admin', '2022-10-07 18:20:55', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:20:55\"}'),
('d96b9e29e8614def9648434e45bf4e', 'admin', '2022-10-13 10:53:41', 0, '::1', 'Create', 'purchase_order_receipts', '{\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"receipt_date\":\"2022-10-13\",\"receipt_no\":\"POR-221013-0001\",\"po_no\":\"PO-RAW2210-0001\",\"bc_kind\":\"asdas\",\"bc_document\":\"asd\",\"bc_date\":\"2022-10-13\",\"awb_no\":\"\",\"awb_date\":\"\",\"qty_po\":\"150\",\"qty_os\":\"150\",\"qty_receipt\":\"150\",\"qty_mpq\":\"10\",\"qty_label\":\"15\",\"id\":\"0b1a9462bf6c4c079536d00266803d45\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 10:53:41\"}'),
('d9aa95e2891b4d128c9df6e6dc5296', 'admin', '2022-10-07 17:32:29', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:29\"}'),
('da9c79adcfc146dfa0113be99ddafd', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020007\",\"qty\":\"10\",\"id\":\"58caa5a8d3a74dfe9d64d11666028f18\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('dafcb4504d9348a7a92ec1d004cdab', 'admin', '2022-10-07 21:01:40', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:01:40\"}'),
('db0c0558ed99419fb0a453da0491d8', 'admin', '2022-10-11 19:49:31', 0, '::1', 'Update', 'production_schedules', '{\"status\":0,\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 19:49:31\"}'),
('dbb398939c2c482c95d65888203cd5', 'admin', '2022-10-07 20:42:13', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:42:13\"}'),
('dc40ce5135fd4fb1b926c091817ee6', 'admin', '2022-10-11 18:19:46', 0, '::1', 'Create', 'sales_orders', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"customer_po\":\"asdasdasd\",\"number\":\"SOA151-2210-0001\",\"trans_date\":\"2022-10-11\",\"item_id\":\"816befb7a6aa44cc986c29b4286610\",\"qty\":\"20\",\"price\":\"5200\",\"total\":\"104000\",\"vat\":\"NON VAT\",\"delivery\":\"2022-10-13\",\"id\":\"89370f4a31934fffbed39c89c57ca6ba\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:19:46\"}'),
('dcc67641423f491d86ccb494835db4', 'admin', '2022-10-11 17:35:07', 0, '::1', 'Create', 'supplier_items', '{\"supplier_id\":\"128d849be37d4ffe92082dc47196d4\",\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"mpq\":\"10\",\"moq\":\"50\",\"price\":\"1740\",\"remarks\":\"\",\"id\":\"fb67eb19b8fd4fd8a46feae66f69da6e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:35:07\"}'),
('dcf7d4f3a6a74028af8e8fe83f56d3', 'admin', '2022-10-11 19:47:07', 0, '::1', 'Delete', 'supply_sheets', '{\"id\":\"5ab63b58603f4bf6a2cead1ee59167\"}'),
('dd234f27d8d44ec0b80eca5ed0ccb7', 'admin', '2022-10-12 04:56:51', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"8f2e2ea5fa0649619863e4a30f1cbc\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"7bb0f384334247f4a0dde2c61c688738\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:56:51\"}'),
('deaa3376eb044ee1bbb7053cf13f15', 'admin', '2022-10-11 19:47:36', 0, '::1', 'Update', 'production_schedules', '{\"status\":0,\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 19:47:36\"}'),
('deb0d69132a34e8996a9a792fa6169', 'admin', '2022-09-29 16:06:30', 0, '::1', 'Delete', 'menus', '{\"id\":\"MNU-2021120003\"}'),
('df16e5b53c0745a196d9b07c7589e1', 'admin', '2022-10-12 06:31:43', 0, '::1', 'Delete', 'purchase_requests', '{\"id\":\"c779c85ee24645468ac0df1040dbe6\"}'),
('dfec240f316543fab6826c2a6a4375', 'admin', '2022-10-07 17:49:11', 0, '::1', 'Create', 'item_colors', '{\"number\":\"4\",\"name\":\"ORANGE (OR)\",\"description\":\"\",\"id\":\"e9ac03ab289e489fa5f29f0c0199c10e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:49:11\"}'),
('e001ed6eae144634b17c77e9e6c210', 'admin', '2022-10-13 17:18:46', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000002\",\"label_no\":\"POR-2210-0000020011\",\"qty\":\"10\",\"id\":\"b5e6f19c2a9e4fd28969656ca7ff4e1a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:18:46\"}'),
('e03c2c5cb37b4a8f8eef85e9f1cb62', 'admin', '2022-10-07 17:51:11', 0, '::1', 'Delete', 'item_makers', '{\"id\":\"c625c7e7072948f3b6fa\"}'),
('e0b5e1da204843e3b6190149eb15e6', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"612df21b8cd34fb5869011b0e92f81\",\"id\":\"d27854e569df46aea40d4371dcd448d3\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('e176d574abb846e7bdcb08e13e399e', 'admin', '2022-10-07 17:22:38', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Specifications\",\"link\":\"master\\/item_specifications\",\"sort\":\"2\",\"state\":\"\",\"id\":\"90af5528e9a4458585b2d74bb73b054e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:22:38\"}'),
('e17b70d002dc4950a3b859fe92746f', 'admin', '2022-10-07 18:20:53', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:20:53\"}'),
('e1d8172766de4bad85a38ebfa822e0', 'admin', '2022-10-07 20:14:15', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"a98a56d8e07944d4a5a3d628358f03\",\"id\":\"00e168e4811c41ccaf1b6ffcefaef072\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 20:14:15\"}'),
('e1e9f086b8364d6eb9f43bcb33d17e', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-008\",\"name\":\"FINISH GOOD 008\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"dbf77dfe00894b2a8316b395f1356eb7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('e22142fb06e24da796667e129246f4', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"id\":\"3fdb778ddfa0463d9a08b70509f6a6a0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('e357ba75e2214cc984c7be5b07ff0d', 'admin', '2022-10-13 17:44:43', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-10002\",\"qty\":\"5\",\"type\":\"SUPPLY\",\"id\":\"35d448ab77e54d6c8453c1667be9681d\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:44:43\"}'),
('e455ba2936ef454499c03546742958', 'admin', '2022-10-07 17:32:23', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:23\"}'),
('e489033fa87a4e2191a4b301e73e25', 'admin', '2022-10-07 17:48:57', 0, '::1', 'Create', 'item_colors', '{\"number\":\"2\",\"name\":\"BROWN (BR)\",\"description\":\"\",\"id\":\"6bc24dc893d34138b58f699b924c81e5\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:48:57\"}'),
('e4a02305cf6e43e59f42a14295ecd8', 'admin', '2022-10-11 18:40:39', 0, '::1', 'Create', 'production_schedules', '{\"month\":\"08\",\"year\":\"2021\",\"wp\":\"01\\/22\",\"trans_date\":\"2022-10-11\",\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"line_id\":\"1958c14d5b8f404291f9c003080c13\",\"qty\":\"100\",\"workorder\":\"WO221011-00001\",\"period\":\"202108\",\"id\":\"1c2b8bd1253f49c6aee35dd802e81951\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 18:40:39\"}'),
('e57e0260d3764ddf82fa1be9fbc2b0', 'admin', '2022-10-07 19:46:05', 0, '::1', 'Create', 'items', '{\"product_family_number\":\"FG\",\"number\":\"PC-GAME-001\",\"name\":\"PC GAMING CROSS X\",\"description\":\"TESTING\",\"leadtime\":\"24\",\"uom\":\"Pcs\",\"status\":\"0\",\"id\":\"c6c4340049d240d6990a3b2644457187\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 19:46:05\"}'),
('e593da45d661467d81893fc8b5af97', 'admin', '2022-10-07 20:42:07', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"c98376ce677644eea31e91bcb49438\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_upload\":\"on\",\"m_download\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"fa602303fbd14b4ea23a3c84588123bc\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 20:42:07\"}'),
('e64f9f2e0a2b4055899d79680d2e55', 'admin', '2022-10-07 18:09:59', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:09:59\"}'),
('e6da14727e954c0283088d251f0d10', 'admin', '2022-10-11 17:06:12', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-014\",\"name\":\"FINISH GOOD 014\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"898bac535bff49e382e853324953cfa0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:12\"}'),
('e73ccb663d2e41869818f608658762', 'admin', '2022-10-12 06:31:39', 0, '::1', 'Delete', 'purchase_requests', '{\"id\":\"c779c85ee24645468ac0df1040dbe6\"}'),
('e7df5fed180846baace3326f022bf9', 'admin', '2022-10-12 04:57:42', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"c10a8ffd0165455989b58f9090798c\",\"id\":\"be9ffc3fd04247ab96d34ce8698539b2\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:57:42\"}'),
('e7ed1bba03c343f989aae6cace9c29', 'admin', '2022-10-07 20:16:34', 0, '::1', 'Create', 'customer_items', '{\"customers_number\":\"A151\",\"items_number\":\"PC-GAME-001\",\"ar_balance\":\"50\",\"max_order\":\"1000\",\"expired\":\"2022-10-08\",\"price\":\"3700000\",\"remarks\":\"\",\"id\":\"6c56edeab6084b8c9a7b44f5673b4158\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 20:16:34\"}'),
('e84e4bbeb00149a487f1599de42ebd', 'admin', '2022-10-07 17:55:03', 0, '::1', 'Create', 'item_options', '{\"number\":\"4\",\"name\":\"ORANGE\",\"description\":\"\",\"id\":\"16ef73f9ef50415c91d592fb9c56e025\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:55:03\"}'),
('e871dba2d4d749d6a3ae0a2cef7918', 'admin', '2022-10-07 17:32:45', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:45\"}'),
('e8b48ff85b6e45959eac244a489395', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010002\",\"qty\":\"10\",\"id\":\"2925016ea8cf463fb4f0338c3329ec47\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('e90d59d88fdd43deb5a43758900c1d', 'admin', '2022-10-11 16:55:55', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-020\",\"name\":\"RAW MATERIAL 020\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"d342de95fafa4329818495eda9dad4ee\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:55\"}'),
('e96941a8cbcf43feb4851c50d10f94', 'admin', '2022-10-13 17:53:04', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210-0000010001\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-01\",\"qty\":\"5\",\"type\":\"SUPPLY\",\"id\":\"6133caff8e00484cae999d83e4321968\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:53:04\"}'),
('e96c218ca75548efa32dfce36963cd', 'admin', '2022-09-29 16:06:30', 0, '::1', 'Delete', 'menus', '{\"id\":\"MNU-2021120005\"}'),
('e998ef9fea5146668a0f04bd0d6bfc', 'admin', '2022-10-12 04:55:22', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"c10a8ffd0165455989b58f9090798c\",\"name\":\"Purchase Requests\",\"link\":\"purchase\\/purchase_requests\",\"sort\":\"1\",\"state\":\"\",\"id\":\"b3caa83cf1534926a614edc17ed055ea\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:55:22\"}'),
('e9dc1d11897b471c8fba57553d856a', 'admin', '2022-10-13 16:22:38', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 16:22:38\"}'),
('e9f2d9ddb37f43e1a4c0b5519fa6f3', 'admin', '2022-10-07 21:01:29', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"8001792212e640eb8e67b13a16a26d\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_upload\":\"on\",\"m_download\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"8e712c0bec164331b1f2131b410425e9\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:01:29\"}'),
('ea60d9485527409a9bb0e1b867f1a4', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"39894a92c9e9456997bb6af3b21bd3\",\"id\":\"a67db1f75b28415a8499145f3f2556e8\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('ea8acdc833724ee2845d49ae2ba3c2', 'admin', '2022-10-07 18:07:44', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Customers\",\"link\":\"master\\/customers\",\"sort\":\"4\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:07:44\"}'),
('eac15f20b377419d8f53be7437b7a3', 'admin', '2022-10-11 19:45:13', 0, '::1', 'Update', 'production_schedules', '{\"status\":0,\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 19:45:13\"}'),
('ebc3b1aba9394a9ba55360c9a6c398', 'admin', '2022-10-07 17:51:20', 0, '::1', 'Delete', 'item_colors', '{\"id\":\"c7e23d9c05a3468ab864\"}'),
('ec2a33a4c1a94f5bb02c525858ae77', 'admin', '2022-10-07 17:32:45', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:45\"}'),
('ec5af91132244d1e8e36242fefd8aa', 'admin', '2022-10-07 17:32:06', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"m_view\":\"on\",\"id\":\"8cf9e31a44fd40efba4124fd293640be\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:06\"}'),
('ec798b59b5ac40fabd038eeb943498', 'admin', '2022-09-29 16:04:35', 0, '::1', 'Delete', 'menus', '{\"id\":\"MNU-2021120001\"}'),
('ed8265ca378b4ac8b3a862198d87d6', 'admin', '2022-10-07 18:11:11', 0, '::1', 'Create', 'plants', '{\"number\":\"1\",\"name\":\"CHAINWIN INDONESIA\",\"description\":\"\",\"id\":\"b2babb5620e94c03be4639ce5bbfbfc7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:11:11\"}'),
('edd6a8e15d1d4b1aad015e64341fc6', 'admin', '2022-10-13 17:28:09', 0, '::1', 'Create', 'issued_material_details', '{\"request_no\":\"SH-221011-0001\",\"label_no\":\"POR-2210-0000020004\",\"item_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"qty\":\"10\",\"id\":\"056a0943ff9543a5a1ffd6fb77bc9dc2\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:28:09\"}'),
('edf5c18e2a5644989a19a62639abf8', 'admin', '2022-10-07 18:23:49', 0, '::1', 'Create', 'currencies', '{\"number\":\"USD\",\"name\":\"AMERICA\",\"description\":\"\",\"symbol\":\"$\",\"id\":\"11df1bbf41d24a0b8dc6b92697bf77e8\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:23:49\"}'),
('ef0881f420d14e35b135c1e8357e93', 'admin', '2022-10-07 18:09:58', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:09:58\"}'),
('ef165e2ef388443b8229a54a3729b6', 'admin', '2022-10-07 18:38:22', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"255bcee4fb4c45d8aa938b8279893c\",\"id\":\"e5bfae8df613456e9404831a6f7fe21a\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:38:22\"}'),
('ef602dcc77b54194a0ee39a91e3051', 'admin', '2022-10-11 16:55:54', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-010\",\"name\":\"RAW MATERIAL 010\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"f35ecaf2910a4c9a9879f2ce31af28a0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:54\"}'),
('ef6e6707d3494b44a5dfdef051c6ec', 'admin', '2022-10-07 17:32:21', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:21\"}'),
('f0d8fe930d9e434d903ebb5ddb983a', 'admin', '2022-10-07 21:40:01', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:01\"}'),
('f0fb1d10ca2a4a188e1281a0be04f1', 'admin', '2022-10-11 16:55:55', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"f26818522f0345a2b01aae3087a2d1\",\"number\":\"RAW-017\",\"name\":\"RAW MATERIAL 017\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"b777bdf2046c4b6eb9df12187116d221\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:55:55\"}'),
('f19c7bb95d2c455bb392439a8b41be', 'admin', '2022-10-13 15:39:23', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-13 15:39:23\"}'),
('f1ef62c0efc74a038cbfab92cb3859', 'admin', '2022-10-11 16:26:31', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"e0f3586f91ee4ab2952b6a8ad0f5db\",\"name\":\"Product Familys\",\"link\":\"master\\/item_familys\",\"sort\":\"3\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-11 16:26:31\"}'),
('f29b4b4ffacf4cc2b35220a518bbac', 'admin', '2022-10-07 17:51:08', 0, '::1', 'Delete', 'item_specifications', '{\"id\":\"9c7bc52310514a3ea3ca\"}'),
('f3079df4a94b4f51ba8190ff67e0d2', 'admin', '2022-10-12 04:57:46', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"0\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:46\"}'),
('f307d9cd283d43f38ec020524ee469', 'admin', '2022-10-11 16:27:09', 0, '::1', 'Create', 'item_familys', '{\"number\":\"CON\",\"name\":\"CONSUMABLE\",\"description\":\"\",\"id\":\"bfdc4fe7a043452486bf3090d8d74c30\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 16:27:09\"}'),
('f329d2d0494a464d831090139f0e9f', 'admin', '2022-10-07 18:51:54', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:51:54\"}'),
('f44dcf5d1bbe4933b2cb2c54ae0a1d', 'admin', '2022-10-13 17:57:31', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-02\",\"qty\":\"5\",\"type\":\"BALANCE\",\"id\":\"6696378fd76742fab31f009e10ef45ce\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:57:31\"}'),
('f45f8d52babe44f7b8cd877f434672', 'admin', '2022-10-07 17:32:40', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:40\"}'),
('f497a8e6db2b4db8b28e33b37a7058', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-002\",\"name\":\"FINISH GOOD 002\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"c15ac21a3c8a498ebc4705b941b24f18\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('f50965156fa545428ab37999c29d70', 'admin', '2022-10-13 17:49:24', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-10003\",\"qty\":\"5\",\"type\":\"BALANCE\",\"id\":\"14801921efb5443a800e9dfd3dca20c4\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:49:24\"}'),
('f5751b77c0124d4cb1c17e41439562', 'admin', '2022-10-07 18:25:28', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:25:28\"}'),
('f6a05df67d174787924d24c193ae8b', 'admin', '2022-10-11 17:11:20', 0, '::1', 'Delete', 'customer_items', '{\"id\":\"983439b433d14324a5f29b98d95b35\"}'),
('f763c13847a64fac890be3f8762036', 'admin', '2022-10-12 04:56:26', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"b3caa83cf1534926a614edc17ed055\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_delete\":\"on\",\"m_upload\":\"on\",\"m_download\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"9a0cc190ac884f20865c3894ea18b3b9\",\"created_by\":\"admin\",\"created_date\":\"2022-10-12 04:56:26\"}'),
('f76baac3a73e41a4b48102fd31309c', 'admin', '2022-10-11 17:06:11', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-009\",\"name\":\"FINISH GOOD 009\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"b41e1edc057a47e5aa5c423d63aeb0af\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:11\"}'),
('f77b577743034a4e8570819e0472f0', 'admin', '2022-10-13 16:15:05', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"5ad1d62d08a3408d9ab3a84c105d15\",\"m_view\":\"on\",\"id\":\"0cf3c3b165dc492a9cfae284708dd1fc\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 16:15:05\"}'),
('f7ca0e7ae2fc4ac3b8749c7090081d', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"3ca074598cf94973b83bb1facb1190\",\"id\":\"69a9a95aa074429da6b3324109a0e556\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('f7e6d806d78b4107b00b29ab711a54', 'admin', '2022-10-07 21:39:55', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"93d8c32f689c41399f7ccb5ce434c3\",\"id\":\"c8ddef0df0764958b9d1b106c757615e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:39:55\"}'),
('f7efc44c73da46eaa12c0b07af1733', 'admin', '2022-10-13 17:08:20', 0, '::1', 'Create', 'issued_materials', '{\"item_id\":\"8ee1c3d0d3654c0194cba18cffaae9\",\"component_id\":\"9a21160eec3f47f5a5ae1932627c3e\",\"request_no\":\"SH-221011-0001\",\"period\":\"202108\",\"wp\":\"01\\/22\",\"workorder\":\"WO221011-00001\",\"qty\":\"56\",\"id\":\"5ec1f86fe6a94c02b63f10fe55c462d7\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:08:20\"}'),
('f8cf560559514a1799c47d7a14fe49', 'admin', '2022-10-07 17:32:17', 0, '::1', 'Create', 'setting_users', '{\"users_id\":\"admin\",\"menus_id\":\"ec436420c2734ec3a864eeedbe53c6\",\"id\":\"cae14167836c4678a4c5b7501ab132b6\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:32:17\"}'),
('f8feddcbaf7840cf8f3df293f578e8', 'admin', '2022-10-07 17:31:52', 0, '::1', 'Create', 'setting_menus', '{\"menus_id\":\"39894a92c9e9456997bb6af3b21bd3\",\"m_view\":\"on\",\"m_add\":\"on\",\"m_edit\":\"on\",\"m_delete\":\"on\",\"m_print\":\"on\",\"m_excel\":\"on\",\"id\":\"e6df2154c7544bee9028c45ee2c73247\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:31:52\"}'),
('f90d2a6feeba4607bc106fb988f279', 'admin', '2022-10-07 18:16:05', 0, '::1', 'Create', 'uom', '{\"number\":\"Kg\",\"name\":\"Kilogram\",\"description\":\"\",\"id\":\"09efc8bcc8cf41a09f5a71246c0a529c\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 18:16:05\"}'),
('f94755f60dcb407ba8cc269d5f2761', 'admin', '2022-10-07 21:38:32', 0, '::1', 'Update', 'menus', '{\"menus_id\":\"93d8c32f689c41399f7ccb5ce434c3\",\"name\":\"Supply Sheets\",\"link\":\"planning\\/supply_sheets\",\"sort\":\"3\",\"state\":\"\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:38:32\"}'),
('f973cc193e914bbf85efaf8275f958', 'admin', '2022-10-11 17:11:01', 0, '::1', 'Create', 'customer_items', '{\"customer_id\":\"cd99d601af964ea7bb702262222bbd\",\"item_id\":\"c15ac21a3c8a498ebc4705b941b24f\",\"ar_balance\":\"20\",\"max_order\":\"100\",\"expired\":\"2022-10-31\",\"price\":\"30000\",\"remarks\":\"\",\"id\":\"8b2e397ef3c743e7917562658b4e704b\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:11:01\"}'),
('f978da9919e841d68a2803ed40a45c', 'admin', '2022-10-07 21:38:23', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"93d8c32f689c41399f7ccb5ce434c3\",\"name\":\"Supply Sheets\",\"link\":\"planning\\/supply_sheets\",\"sort\":\"2\",\"state\":\"\",\"id\":\"7b3fd71d12d04dfdbfe4323903def5c2\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 21:38:23\"}'),
('fa33fee773c644ada2d4fa7ae48142', 'admin', '2022-10-11 17:06:12', 0, '::1', 'Create', 'items', '{\"item_family_id\":\"9016430cc47a455ba3a900f9d0b5d8\",\"number\":\"FG-019\",\"name\":\"FINISH GOOD 019\",\"description\":\"\",\"leadtime\":\"0\",\"uom_id\":\"86c081e423324443860d07ea0ccefe\",\"id\":\"8286a95a36dd42c9bdd73d193c392a45\",\"created_by\":\"admin\",\"created_date\":\"2022-10-11 17:06:12\"}'),
('fb0d4663ee5f4d4f8c4c06a72d3b26', 'admin', '2022-10-07 18:18:34', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"0\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 18:18:34\"}'),
('fb8c2fbe9b474608ae642543434b72', 'admin', '2022-10-07 17:32:36', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 17:32:36\"}'),
('fbf01c7a25e14b0aab749a5e94e95c', 'admin', '2022-09-29 15:52:33', 0, '::1', 'Create', 'users', '{\"number\":\"201602262\",\"name\":\"Hilman Fadillah\",\"username\":\"hilman\",\"password\":\"123456\",\"position\":\"Staff IT\",\"email\":\"hilmanf11@gmail.com\",\"phone\":\"8559299000\",\"actived\":\"0\",\"avatar\":null,\"id\":\"86f9f296025843ed953fe6094ff76525\",\"created_by\":\"admin\",\"created_date\":\"2022-09-29 15:52:33\"}'),
('fc10f3857e35473e8534db15bfac64', 'admin', '2022-10-07 17:22:58', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Types\",\"link\":\"master\\/item_types\",\"sort\":\"4\",\"state\":\"\",\"id\":\"3ca074598cf94973b83bb1facb119080\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:22:58\"}'),
('fcab6ebfcd194aafad622d47960598', 'admin', '2022-10-13 17:49:24', 0, '::1', 'Create', 'barcode_divides', '{\"reff\":\"POR-2210\",\"label_no\":\"POR-2210-0000010001\",\"label_divided\":\"POR-2210-0000010001-10002\",\"qty\":\"5\",\"type\":\"SUPPLY\",\"id\":\"4a44367b7f0546328ddae2fa472d199e\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 17:49:24\"}'),
('fce0912f84f04008b0358f20a7b929', 'admin', '2022-10-13 11:12:03', 0, '::1', 'Create', 'purchase_order_labels', '{\"receipt_id\":\"POR-2210-000001\",\"label_no\":\"POR-2210-0000010005\",\"qty\":\"10\",\"id\":\"646b7167f1fb4a47af269da9fd651ea0\",\"created_by\":\"admin\",\"created_date\":\"2022-10-13 11:12:03\"}'),
('fd00354e4a194856a0be3793a4ff48', 'admin', '2022-10-07 20:42:15', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:42:15\"}'),
('fd8ed1c0159549b0b8262fc67cb825', 'admin', '2022-10-07 21:40:02', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"0\",\"v_download\":\"0\",\"v_print\":\"1\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 21:40:02\"}'),
('fe1b95f126af4585aa5ba6767779b4', 'admin', '2022-10-12 04:57:53', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"0\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"1\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-12 04:57:53\"}'),
('ffd13f62afc04facb1702753494e45', 'admin', '2022-10-07 17:25:13', 0, '::1', 'Create', 'menus', '{\"menus_id\":\"e9d8310044d3481f81834d14f91bd7\",\"name\":\"Categories\",\"link\":\"master\\/item_categories\",\"sort\":\"8\",\"state\":\"\",\"id\":\"ec436420c2734ec3a864eeedbe53c6ca\",\"created_by\":\"admin\",\"created_date\":\"2022-10-07 17:25:13\"}'),
('ffe30891ace24e90be459e961531a0', 'admin', '2022-10-07 20:14:21', 0, '::1', 'Update', 'setting_users', '{\"v_view\":\"1\",\"v_add\":\"1\",\"v_edit\":\"1\",\"v_delete\":\"1\",\"v_upload\":\"1\",\"v_download\":\"0\",\"v_print\":\"0\",\"v_excel\":\"0\",\"updated_by\":\"admin\",\"updated_date\":\"2022-10-07 20:14:21\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `menus_id` varchar(30) NOT NULL,
  `number` varchar(20) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` text DEFAULT NULL,
  `link` text NOT NULL,
  `sort` int(11) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `flag` varchar(10) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `menus_id`, `number`, `name`, `description`, `link`, `sort`, `icon`, `flag`, `color`, `state`, `status`) VALUES
('0e4bb0451f1d4a64a4f7be6be13708', 'admin', '2022-10-07 21:38:10', 'admin', '2022-10-07 21:38:36', 0, '93d8c32f689c41399f7ccb5ce434c3', NULL, 'Production Schedules', NULL, 'planning/production_schedules', 2, '', NULL, NULL, '', 0),
('255bcee4fb4c45d8aa938b8279893c', 'admin', '2022-10-07 18:05:21', 'admin', '2022-10-07 18:07:44', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Customers', NULL, 'master/customers', 4, '', NULL, NULL, '', 0),
('3038d96df22048608bbbb8762bbe24', 'admin', '2022-10-07 18:06:43', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Unit Of Measure', NULL, 'master/uom', 9, '', NULL, NULL, '', 0),
('39894a92c9e9456997bb6af3b21bd3', 'admin', '2022-10-07 17:23:06', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Sizes', NULL, 'master/item_sizes', 5, '', NULL, NULL, '', 0),
('3c5e75290ca947eab000aa09269753', 'admin', '2022-10-07 18:07:01', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Line Productions', NULL, 'master/lines', 10, '', NULL, NULL, '', 0),
('3ca074598cf94973b83bb1facb1190', 'admin', '2022-10-07 17:22:58', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Types', NULL, 'master/item_types', 4, '', NULL, NULL, '', 0),
('3dd1a46ef2834b79a8da5080c496e4', 'admin', '2022-10-07 17:23:26', 'admin', '2022-10-07 17:47:28', 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Colors', NULL, 'master/item_colors', 6, '', NULL, NULL, '', 0),
('3f423b73a7b04367853767d7de4bc5', 'admin', '2022-10-13 16:14:28', 'admin', '2022-10-13 17:42:35', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Barcode Divides', NULL, 'warehouse/barcode_divides', 2, '', NULL, NULL, '', 0),
('44964312f0264429978158ada88843', 'admin', '2022-09-29 16:12:08', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Users', NULL, 'admin/users', 2, '', NULL, NULL, '', 0),
('4f841c89e8274fd88335b2346d1ee2', 'admin', '2022-10-13 15:34:01', NULL, NULL, 0, '', NULL, 'Production', NULL, '', 5, '', NULL, NULL, 'closed', 0),
('5ad1d62d08a3408d9ab3a84c105d15', 'admin', '2022-10-13 16:14:00', NULL, NULL, 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Issued Materials', NULL, 'warehouse/issued_materials', 1, '', NULL, NULL, '', 0),
('612df21b8cd34fb5869011b0e92f81', 'admin', '2022-10-07 17:22:46', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Makers', NULL, 'master/item_makers', 3, '', NULL, NULL, '', 0),
('62309884bfe74e5696f10f32243d97', 'admin', '2022-10-07 17:22:15', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Item Cards', NULL, 'master/items', 1, '', NULL, NULL, '', 0),
('670141b0c0ac4f61bba46f0c85acd6', 'admin', '2022-10-12 04:55:52', NULL, NULL, 0, 'c10a8ffd0165455989b58f9090798c', NULL, 'Purchase Order Receipts', NULL, 'purchase/purchase_order_receipts', 3, '', NULL, NULL, '', 0),
('6ccd20c54d1d415189120ec5cc6c81', 'admin', '2022-09-29 16:41:40', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Config', NULL, 'admin/config', 7, '', NULL, NULL, '', 0),
('7b3fd71d12d04dfdbfe4323903def5', 'admin', '2022-10-07 21:38:23', 'admin', '2022-10-07 21:38:32', 0, '93d8c32f689c41399f7ccb5ce434c3', NULL, 'Supply Sheets', NULL, 'planning/supply_sheets', 3, '', NULL, NULL, '', 0),
('7d7f997ca58f425c8783ff7a7f994c', 'admin', '2022-10-07 18:04:20', 'admin', '2022-10-11 16:26:35', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Item Familys', NULL, 'master/item_familys', 3, '', NULL, NULL, '', 0),
('8001792212e640eb8e67b13a16a26d', 'admin', '2022-10-07 18:02:48', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Bill Of Materials', NULL, 'master/bom', 2, '', NULL, NULL, '', 0),
('8a5ae39e16a54354bd0ea87c1ff963', 'admin', '2022-10-07 18:07:11', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Plants', NULL, 'master/plants', 11, '', NULL, NULL, '', 0),
('8f2e2ea5fa0649619863e4a30f1cbc', 'admin', '2022-10-12 04:55:32', NULL, NULL, 0, 'c10a8ffd0165455989b58f9090798c', NULL, 'Purchase Orders', NULL, 'purchase/purchase_orders', 2, '', NULL, NULL, '', 0),
('90af5528e9a4458585b2d74bb73b05', 'admin', '2022-10-07 17:22:38', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Specifications', NULL, 'master/item_specifications', 2, '', NULL, NULL, '', 0),
('93d8c32f689c41399f7ccb5ce434c3', 'admin', '2022-10-07 21:37:16', NULL, NULL, 0, '', NULL, 'Planning', NULL, '', 3, '', NULL, NULL, 'closed', 0),
('9c04c7dfcf6c44cc9a0ec44b1c7691', 'admin', '2022-10-13 16:06:35', NULL, NULL, 0, '', NULL, 'Warehouse', NULL, '', 6, '', NULL, NULL, 'closed', 0),
('a015669f743f49d18be7541f4e9e4f', 'admin', '2022-10-07 17:23:39', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Options', NULL, 'master/item_options', 7, '', NULL, NULL, '', 0),
('a5d9db23534f44fa9d58a7f996ce2a', 'admin', '2022-10-07 18:05:36', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Suppliers', NULL, 'master/suppliers', 6, '', NULL, NULL, '', 0),
('a98a56d8e07944d4a5a3d628358f03', 'admin', '2022-10-07 18:06:19', 'admin', '2022-10-07 18:07:49', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Customer Items', NULL, 'master/customer_items', 5, '', NULL, NULL, '', 0),
('b3caa83cf1534926a614edc17ed055', 'admin', '2022-10-12 04:55:22', NULL, NULL, 0, 'c10a8ffd0165455989b58f9090798c', NULL, 'Purchase Requests', NULL, 'purchase/purchase_requests', 1, '', NULL, NULL, '', 0),
('b679033b3256414b8f916c69f17674', 'admin', '2022-09-29 16:22:01', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Approval', NULL, 'admin/approvals', 1, '', NULL, NULL, '', 0),
('c10a8ffd0165455989b58f9090798c', 'admin', '2022-10-12 04:54:07', 'admin', '2022-10-12 04:58:31', 0, '', NULL, 'Purchasing', NULL, '', 4, '', NULL, NULL, 'closed', 0),
('c5e3a7bb003a42309c42907778173d', 'admin', '2022-10-13 15:38:32', NULL, NULL, 0, '4f841c89e8274fd88335b2346d1ee2', NULL, 'Supply Materials', NULL, 'production/supply_materials', 1, '', NULL, NULL, '', 0),
('c8f8362a5f6c432ab27d37213f15d4', 'admin', '2022-09-29 16:35:49', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Setting Users', NULL, 'admin/setting_users', 6, '', NULL, NULL, '', 0),
('c98376ce677644eea31e91bcb49438', 'admin', '2022-10-07 18:06:31', 'admin', '2022-10-07 18:08:03', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Supplier Items', NULL, 'master/supplier_items', 7, '', NULL, NULL, '', 0),
('cf98f97766f6405590b26daa586e00', 'admin', '2022-09-29 16:05:52', NULL, NULL, 0, '', NULL, 'Administrator', NULL, '', 1, '', NULL, NULL, 'closed', 0),
('d13439e3f2324450a69b4e0e50159a', 'admin', '2022-09-29 16:15:42', 'admin', '2022-09-29 16:36:50', 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Menu', NULL, 'admin/menus', 3, '', NULL, NULL, '', 0),
('d188047ab21d45979c64c990a91e23', 'admin', '2022-10-07 18:04:43', 'admin', '2022-10-07 18:20:27', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Currencies', NULL, 'master/currencies', 8, '', NULL, NULL, '', 0),
('de3f6855009e49deb7fd2fdd0f3b3d', 'admin', '2022-09-29 16:32:23', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Logs', NULL, 'admin/logs', 4, '', NULL, NULL, '', 0),
('e0f3586f91ee4ab2952b6a8ad0f5db', 'admin', '2022-10-07 17:21:14', NULL, NULL, 0, '', NULL, 'Master Data', NULL, '', 2, '', NULL, NULL, 'closed', 0),
('e3c31e10b6c64e119b068ae4b73be6', 'admin', '2022-09-29 16:35:33', 'admin', '2022-09-29 16:36:31', 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Setting Menu', NULL, 'admin/setting_menus', 5, '', NULL, NULL, '', 0),
('e780677ba5764a128f4ae77e3b720e', 'admin', '2022-10-07 21:37:33', 'admin', '2022-10-07 21:38:43', 0, '93d8c32f689c41399f7ccb5ce434c3', NULL, 'Sales Orders', NULL, 'planning/sales_orders', 1, '', NULL, NULL, '', 0),
('e9d8310044d3481f81834d14f91bd7', 'admin', '2022-10-07 17:21:33', 'admin', '2022-10-07 18:07:27', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Items', NULL, '', 1, '', NULL, NULL, 'closed', 0),
('ec436420c2734ec3a864eeedbe53c6', 'admin', '2022-10-07 17:25:13', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Categories', NULL, 'master/item_categories', 8, '', NULL, NULL, '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `approvals_id` varchar(30) DEFAULT NULL,
  `users_id_from` varchar(30) DEFAULT NULL,
  `users_id_to` varchar(30) DEFAULT NULL,
  `table_id` varchar(30) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `plants`
--

CREATE TABLE `plants` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `plants`
--

INSERT INTO `plants` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('07e1c89ff47d4ec8895ad0e906908f', 'admin', '2022-10-07 18:11:18', NULL, NULL, 0, '2', 'LEOCO INDONESIA', '', 0),
('b2babb5620e94c03be4639ce5bbfbf', 'admin', '2022-10-07 18:11:11', NULL, NULL, 0, '1', 'CHAINWIN INDONESIA', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `production_schedules`
--

CREATE TABLE `production_schedules` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `customer_id` varchar(30) DEFAULT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `line_id` varchar(30) DEFAULT NULL,
  `workorder` varchar(30) DEFAULT NULL,
  `trans_date` date DEFAULT NULL,
  `period` varchar(6) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `wp` varchar(10) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `production_schedules`
--

INSERT INTO `production_schedules` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `customer_id`, `item_id`, `line_id`, `workorder`, `trans_date`, `period`, `month`, `year`, `wp`, `qty`, `status`) VALUES
('1c2b8bd1253f49c6aee35dd802e819', 'admin', '2022-10-11 18:40:39', 'admin', '2022-10-11 19:54:29', 0, 'cd99d601af964ea7bb702262222bbd', '8ee1c3d0d3654c0194cba18cffaae9', '1958c14d5b8f404291f9c003080c13', 'WO221011-00001', '2022-10-11', '202108', '08', '2021', '01/22', 100, 1),
('2ea0d3e9805241589c971602756272', 'admin', '2022-10-11 18:43:27', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '816befb7a6aa44cc986c29b4286610', '1958c14d5b8f404291f9c003080c13', 'WO221011-00003', '2022-10-11', '202108', '08', '2021', '01/22', 200, 0),
('799dff843b894b6590c34d0253c4da', 'admin', '2022-10-11 18:43:20', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'c15ac21a3c8a498ebc4705b941b24f', '1958c14d5b8f404291f9c003080c13', 'WO221011-00002', '2022-10-11', '202108', '08', '2021', '01/22', 150, 1),
('d7ad7f79f566498ca4cc98bd02211e', 'admin', '2022-10-11 18:43:38', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'f153854844024fa499c0e62d165d7b', '1958c14d5b8f404291f9c003080c13', 'WO221011-00005', '2022-10-11', '202108', '08', '2021', '01/22', 130, 0),
('e123c566dddd4887a2526320dab04e', 'admin', '2022-10-11 18:43:32', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '8e664c010bb44d44b7ea462fa2c311', '1958c14d5b8f404291f9c003080c13', 'WO221011-00004', '2022-10-11', '202108', '08', '2021', '01/22', 120, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `supplier_id` varchar(30) DEFAULT NULL,
  `item_id` varchar(30) NOT NULL,
  `request_no` varchar(30) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `request_name` varchar(50) DEFAULT NULL,
  `po_no` varchar(30) DEFAULT NULL,
  `po_date_from` date DEFAULT NULL,
  `po_date_to` date DEFAULT NULL,
  `po_name` varchar(50) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `supplier_id`, `item_id`, `request_no`, `request_date`, `request_name`, `po_no`, `po_date_from`, `po_date_to`, `po_name`, `qty`, `remarks`, `status`) VALUES
('572aaf7a0b4e483b939cb8ad6782e4', 'admin', '2022-10-12 10:58:02', NULL, NULL, 0, '128d849be37d4ffe92082dc47196d4', '9a21160eec3f47f5a5ae1932627c3e', 'PR-RAW2210-0001', '2022-10-12', 'Administrator', 'PO-RAW2210-0001', '2022-10-12', '2022-10-12', 'Administrator', 150, 'TESTING 2', 1),
('e47a18c448a24279bd258fa6c1d9f7', 'admin', '2022-10-12 10:57:57', NULL, NULL, 0, '128d849be37d4ffe92082dc47196d4', '1c90482587c74f7a96c8912df36bc9', 'PR-RAW2210-0001', '2022-10-12', 'Administrator', 'PO-RAW2210-0001', '2022-10-12', '2022-10-12', 'Administrator', 100, 'TESTING 1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_order_labels`
--

CREATE TABLE `purchase_order_labels` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `receipt_id` varchar(50) DEFAULT NULL,
  `label_no` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `purchase_order_labels`
--

INSERT INTO `purchase_order_labels` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `receipt_id`, `label_no`, `qty`, `status`) VALUES
('04e49253faa14e81b267f3982aaa2d', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020008', 10, 0),
('0773391d2ccf461e8c77c5fa41c3ba', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020013', 10, 0),
('07da4ea6c86d4b7796d9fa850ff4bc', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020004', 10, 0),
('0e11fe0f2b764fab9ba78170e924de', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010008', 10, 0),
('0f7bf4e8b8a54cb3bcc035b91919f7', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020010', 10, 0),
('16fb5184d2a349b1aa94cc738ae1a0', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010004', 10, 0),
('2925016ea8cf463fb4f0338c3329ec', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010002', 10, 0),
('33823625aa7b45c0a8edd9782d0b5c', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010003', 10, 0),
('3ad5c0f2840642138f77c0765eb9d9', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020003', 10, 0),
('4bd6d4a3c87d4bcc871859aeee9813', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010010', 10, 0),
('4fa40dd0243542dd835b183cf8b062', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010009', 10, 0),
('58caa5a8d3a74dfe9d64d11666028f', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020007', 10, 0),
('646b7167f1fb4a47af269da9fd651e', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010005', 10, 0),
('813f96d8dfeb4fb9a1e8d04bbd07b1', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020001', 10, 0),
('8b56dc42882f4fdfa03fd488ec44ed', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010001', 10, 0),
('8f3a033b53cd4ca99e4fd28d018c62', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020009', 10, 0),
('905df1dcc5324d869300511bd53f18', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020015', 10, 0),
('94e71406b9ed47f0b3a106831671a5', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020006', 10, 0),
('9e515ddb8eda4419b5b885a1434916', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010006', 10, 0),
('b5e6f19c2a9e4fd28969656ca7ff4e', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020011', 10, 0),
('c6a80825f9d14e18aaf921b163435a', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020012', 10, 0),
('c9199ea41a6245b2a48c5121a13a33', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020005', 10, 0),
('e0f9730717c8491b8a78107e61e615', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020002', 10, 0),
('ef48dd1b6853461ca8f9a80efcf20f', 'admin', '2022-10-13 17:18:46', NULL, NULL, 0, 'POR-2210-000002', 'POR-2210-0000020014', 10, 0),
('f26793fc8a174fd7a6d4ba08d0e2f8', 'admin', '2022-10-13 11:12:03', NULL, NULL, 0, 'POR-2210-000001', 'POR-2210-0000010007', 10, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_order_receipts`
--

CREATE TABLE `purchase_order_receipts` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `supplier_id` varchar(30) DEFAULT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `receipt_date` date DEFAULT NULL,
  `receipt_no` varchar(50) DEFAULT NULL,
  `receipt_id` varchar(30) DEFAULT NULL,
  `po_no` varchar(50) DEFAULT NULL,
  `bc_kind` varchar(30) DEFAULT NULL,
  `bc_document` varchar(50) DEFAULT NULL,
  `bc_date` date DEFAULT NULL,
  `awb_no` varchar(50) DEFAULT NULL,
  `awb_date` date DEFAULT NULL,
  `qty_po` int(11) DEFAULT 0,
  `qty_os` int(11) NOT NULL DEFAULT 0,
  `qty_receipt` int(11) NOT NULL DEFAULT 0,
  `qty_mpq` int(11) NOT NULL DEFAULT 0,
  `qty_label` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `purchase_order_receipts`
--

INSERT INTO `purchase_order_receipts` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `supplier_id`, `item_id`, `receipt_date`, `receipt_no`, `receipt_id`, `po_no`, `bc_kind`, `bc_document`, `bc_date`, `awb_no`, `awb_date`, `qty_po`, `qty_os`, `qty_receipt`, `qty_mpq`, `qty_label`, `status`) VALUES
('0bca6f0cc886448692e9227661fb57', 'admin', '2022-10-13 11:04:56', NULL, NULL, 0, '128d849be37d4ffe92082dc47196d4', '1c90482587c74f7a96c8912df36bc9', '2022-10-13', 'POR-221013-0001', 'POR-2210-000001', 'PO-RAW2210-0001', 'asdasd', 'asd', '2022-10-14', '', '0000-00-00', 100, 100, 100, 10, 10, 0),
('91d33c682e2448d7a8b783842e78e9', 'admin', '2022-10-13 11:04:56', NULL, NULL, 0, '128d849be37d4ffe92082dc47196d4', '9a21160eec3f47f5a5ae1932627c3e', '2022-10-13', 'POR-221013-0001', 'POR-2210-000002', 'PO-RAW2210-0001', 'asdasd', 'asd', '2022-10-14', '', '0000-00-00', 150, 150, 150, 10, 15, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase_requests`
--

CREATE TABLE `purchase_requests` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `item_id` varchar(30) NOT NULL,
  `request_no` varchar(30) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `request_name` varchar(50) DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `purchase_requests`
--

INSERT INTO `purchase_requests` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `item_id`, `request_no`, `request_date`, `request_name`, `expected_date`, `qty`, `remarks`, `status`) VALUES
('305711c8b876445dad5c8b226ca3bc', 'admin', '2022-10-12 10:16:06', NULL, NULL, 0, '1c90482587c74f7a96c8912df36bc9', 'PR-RAW2210-0001', '2022-10-12', 'Administrator', NULL, 100, 'TESTING 1', 1),
('e12ffc5098e5443a8dde982042273c', 'admin', '2022-10-12 10:16:06', NULL, NULL, 0, '9a21160eec3f47f5a5ae1932627c3e', 'PR-RAW2210-0001', '2022-10-12', 'Administrator', NULL, 150, 'TESTING 2', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `customer_id` varchar(30) DEFAULT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `trans_date` date DEFAULT NULL,
  `customer_po` varchar(100) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `vat` varchar(10) DEFAULT NULL,
  `delivery` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `customer_id`, `item_id`, `number`, `trans_date`, `customer_po`, `qty`, `price`, `total`, `vat`, `delivery`, `status`) VALUES
('21f2152cfa2140ac916aaaf71eaa89', 'admin', '2022-10-11 18:19:46', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'f153854844024fa499c0e62d165d7b', 'SOA151-2210-0001', '2022-10-11', 'asdasdasd', 30, 10600, 318000, 'NON VAT', '2022-10-15', 0),
('70e2b28401334a058a74a1f27af5c3', 'admin', '2022-10-11 18:19:46', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', 'c15ac21a3c8a498ebc4705b941b24f', 'SOA151-2210-0001', '2022-10-11', 'asdasdasd', 15, 20000, 300000, 'NON VAT', '2022-10-12', 0),
('78bb8e88d6b749398d2acd3fb3a0c4', 'admin', '2022-10-11 18:19:46', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '8e664c010bb44d44b7ea462fa2c311', 'SOA151-2210-0001', '2022-10-11', 'asdasdasd', 25, 16200, 405000, 'NON VAT', '2022-10-14', 0),
('89370f4a31934fffbed39c89c57ca6', 'admin', '2022-10-11 18:19:46', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '816befb7a6aa44cc986c29b4286610', 'SOA151-2210-0001', '2022-10-11', 'asdasdasd', 20, 5200, 104000, 'NON VAT', '2022-10-13', 0),
('a6f73bf456e3435e93c29d890db51f', 'admin', '2022-10-11 18:19:46', NULL, NULL, 0, 'cd99d601af964ea7bb702262222bbd', '8ee1c3d0d3654c0194cba18cffaae9', 'SOA151-2210-0001', '2022-10-11', 'asdasdasd', 10, 15000, 150000, 'NON VAT', '2022-10-11', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_menus`
--

CREATE TABLE `setting_menus` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `menus_id` varchar(30) DEFAULT NULL,
  `m_view` varchar(5) DEFAULT NULL,
  `m_add` varchar(5) DEFAULT NULL,
  `m_edit` varchar(5) DEFAULT NULL,
  `m_delete` varchar(5) DEFAULT NULL,
  `m_upload` varchar(5) DEFAULT NULL,
  `m_download` varchar(5) DEFAULT NULL,
  `m_print` varchar(5) DEFAULT NULL,
  `m_excel` varchar(5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `setting_menus`
--

INSERT INTO `setting_menus` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `menus_id`, `m_view`, `m_add`, `m_edit`, `m_delete`, `m_upload`, `m_download`, `m_print`, `m_excel`, `status`) VALUES
('009202e6989647abb9d7c3c322d87a', 'admin', '2022-10-07 18:09:41', NULL, NULL, 0, '8a5ae39e16a54354bd0ea87c1ff963', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('04a7682cc50247a8a75f609d17e14a', 'admin', '2022-09-29 17:03:33', NULL, NULL, 0, 'b679033b3256414b8f916c69f17674', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('0ca3131a3aef48e3ba23c07612b771', 'admin', '2022-10-13 15:38:59', NULL, NULL, 0, '4f841c89e8274fd88335b2346d1ee2', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('0cf3c3b165dc492a9cfae284708dd1', 'admin', '2022-10-13 16:15:05', NULL, NULL, 0, '5ad1d62d08a3408d9ab3a84c105d15', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('0fddaa1405bf4a6081704dba2da56b', 'admin', '2022-09-29 17:01:01', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('18944e423a144c35b0c76050a4d74d', 'admin', '2022-09-29 17:04:17', NULL, NULL, 0, 'c8f8362a5f6c432ab27d37213f15d4', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('20a062c23b1d4c17aa1c2708fb69ca', 'admin', '2022-10-07 17:31:18', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('3355d1d6a3fb4ccb86c18bd5911c89', 'admin', '2022-10-07 18:20:45', NULL, NULL, 0, 'd188047ab21d45979c64c990a91e23', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('36cf6d128e674c2e969c97e28e1f09', 'admin', '2022-10-07 18:51:46', NULL, NULL, 0, 'a5d9db23534f44fa9d58a7f996ce2a', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('3e462a4127e04978b64100d8521297', 'admin', '2022-10-12 04:56:58', NULL, NULL, 0, '670141b0c0ac4f61bba46f0c85acd6', 'on', 'on', NULL, 'on', NULL, NULL, 'on', 'on', 0),
('4d7eea6d7e404774980591dd58541c', 'admin', '2022-10-13 16:15:03', NULL, NULL, 0, '3f423b73a7b04367853767d7de4bc5', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('53f9a3dfd3094c909a6db12186e7bc', 'admin', '2022-10-07 18:12:35', NULL, NULL, 0, '3038d96df22048608bbbb8762bbe24', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('61b6723f47044f729ae6d30c3547f9', 'admin', '2022-10-07 20:14:11', NULL, NULL, 0, 'a98a56d8e07944d4a5a3d628358f03', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('65359b84216a4160b69f7ce8cc5e5f', 'admin', '2022-10-07 17:31:56', NULL, NULL, 0, '3ca074598cf94973b83bb1facb1190', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('65bdf777a5564d5c94068feb0edcb9', 'admin', '2022-09-29 17:03:57', NULL, NULL, 0, 'de3f6855009e49deb7fd2fdd0f3b3d', 'on', NULL, NULL, 'on', NULL, NULL, 'on', 'on', 0),
('7bb0f384334247f4a0dde2c61c6887', 'admin', '2022-10-12 04:56:51', NULL, NULL, 0, '8f2e2ea5fa0649619863e4a30f1cbc', 'on', 'on', NULL, 'on', NULL, NULL, 'on', 'on', 0),
('81957b7cf9f04900ad67e0005fce77', 'admin', '2022-10-13 15:39:12', NULL, NULL, 0, 'c5e3a7bb003a42309c42907778173d', 'on', 'on', NULL, 'on', NULL, NULL, 'on', 'on', 0),
('836ff9fa6650482fbf81e4f49bb255', 'admin', '2022-09-29 17:03:46', NULL, NULL, 0, '6ccd20c54d1d415189120ec5cc6c81', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('880ea658785d44929df3fe128c6617', 'admin', '2022-10-13 16:14:50', NULL, NULL, 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('8cf9e31a44fd40efba4124fd293640', 'admin', '2022-10-07 17:32:06', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('8e712c0bec164331b1f2131b410425', 'admin', '2022-10-07 21:01:29', NULL, NULL, 0, '8001792212e640eb8e67b13a16a26d', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('9353391666bb4d81bc4c678771b98b', 'admin', '2022-10-12 04:57:35', NULL, NULL, 0, 'c10a8ffd0165455989b58f9090798c', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('962311b4039448699f25c8ef64f470', 'admin', '2022-09-29 17:04:22', NULL, NULL, 0, '44964312f0264429978158ada88843', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('972a76a5a04e416e92a9b4e225c19c', 'admin', '2022-09-29 17:04:02', NULL, NULL, 0, 'd13439e3f2324450a69b4e0e50159a', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('9a0cc190ac884f20865c3894ea18b3', 'admin', '2022-10-12 04:56:26', NULL, NULL, 0, 'b3caa83cf1534926a614edc17ed055', 'on', 'on', NULL, 'on', 'on', 'on', 'on', 'on', 0),
('ac40bf63b16d4aeab224d7d7dfb130', 'admin', '2022-10-07 18:38:19', NULL, NULL, 0, '255bcee4fb4c45d8aa938b8279893c', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('b0050a24404c432d9116944bb3bc8c', 'admin', '2022-10-07 17:31:50', NULL, NULL, 0, 'a015669f743f49d18be7541f4e9e4f', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('b0e891c3fe6a447f97150702d185d0', 'admin', '2022-10-07 17:31:35', NULL, NULL, 0, '3dd1a46ef2834b79a8da5080c496e4', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('c150682d482f4c25b613172ba9b880', 'admin', '2022-09-29 17:04:13', NULL, NULL, 0, 'e3c31e10b6c64e119b068ae4b73be6', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('c47b2d67ddb444edb8e1ade2ff78f0', 'admin', '2022-10-07 17:31:48', NULL, NULL, 0, '612df21b8cd34fb5869011b0e92f81', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('c5174669b5724457ad9036fdc17bec', 'admin', '2022-10-07 21:39:36', NULL, NULL, 0, 'e780677ba5764a128f4ae77e3b720e', 'on', 'on', NULL, 'on', NULL, NULL, 'on', 'on', 0),
('cde64e8c82e14a68b55bc131931c47', 'admin', '2022-10-07 21:39:33', NULL, NULL, 0, '0e4bb0451f1d4a64a4f7be6be13708', 'on', 'on', NULL, 'on', NULL, NULL, 'on', 'on', 0),
('dc02c9c9237e4f3fad8b8787691f63', 'admin', '2022-10-07 17:31:43', NULL, NULL, 0, '62309884bfe74e5696f10f32243d97', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('e6df2154c7544bee9028c45ee2c732', 'admin', '2022-10-07 17:31:52', NULL, NULL, 0, '39894a92c9e9456997bb6af3b21bd3', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('e75ef54184a4402d89eeef5776f342', 'admin', '2022-10-07 21:39:46', NULL, NULL, 0, '7b3fd71d12d04dfdbfe4323903def5', 'on', 'on', NULL, 'on', NULL, NULL, 'on', 'on', 0),
('eba912bd48844e1dbe5689737f6ea9', 'admin', '2022-10-07 21:39:06', NULL, NULL, 0, '93d8c32f689c41399f7ccb5ce434c3', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('edae5d40129f4bd2b4ac567c020497', 'admin', '2022-10-07 18:18:26', NULL, NULL, 0, '3c5e75290ca947eab000aa09269753', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('eff15051ce0149beb6b5dc8acd36b8', 'admin', '2022-10-07 18:25:23', NULL, NULL, 0, '7d7f997ca58f425c8783ff7a7f994c', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('f10a5347cb5e4f38be8339258b589a', 'admin', '2022-10-07 17:31:32', NULL, NULL, 0, 'ec436420c2734ec3a864eeedbe53c6', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('f6d82192e5e5435584db2ba80b9f03', 'admin', '2022-10-07 17:31:54', NULL, NULL, 0, '90af5528e9a4458585b2d74bb73b05', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('fa602303fbd14b4ea23a3c84588123', 'admin', '2022-10-07 20:42:07', NULL, NULL, 0, 'c98376ce677644eea31e91bcb49438', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_users`
--

CREATE TABLE `setting_users` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `users_id` varchar(30) DEFAULT NULL,
  `menus_id` varchar(30) DEFAULT NULL,
  `v_view` tinyint(1) NOT NULL DEFAULT 0,
  `v_add` tinyint(1) NOT NULL DEFAULT 0,
  `v_edit` tinyint(1) NOT NULL DEFAULT 0,
  `v_delete` tinyint(1) NOT NULL DEFAULT 0,
  `v_upload` tinyint(1) NOT NULL DEFAULT 0,
  `v_download` tinyint(1) NOT NULL DEFAULT 0,
  `v_print` tinyint(1) NOT NULL DEFAULT 0,
  `v_excel` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `setting_users`
--

INSERT INTO `setting_users` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `users_id`, `menus_id`, `v_view`, `v_add`, `v_edit`, `v_delete`, `v_upload`, `v_download`, `v_print`, `v_excel`, `status`) VALUES
('008d68ea392946b0a647a91eae2ef0', 'admin', '2022-10-07 18:18:29', 'admin', '2022-10-07 18:18:36', 0, 'admin', '3c5e75290ca947eab000aa09269753', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('00e168e4811c41ccaf1b6ffcefaef0', 'admin', '2022-10-07 20:14:15', 'admin', '2022-10-07 20:14:23', 0, 'admin', 'a98a56d8e07944d4a5a3d628358f03', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('0160c0915f6044468c58cebed25158', 'admin', '2022-10-07 20:42:10', 'admin', '2022-10-07 20:42:16', 0, 'admin', 'c98376ce677644eea31e91bcb49438', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('0362a1a4d2484b3db9ee8623617182', 'admin', '2022-10-07 21:39:55', 'admin', '2022-10-07 21:40:04', 0, 'admin', '7b3fd71d12d04dfdbfe4323903def5', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('1461f733ff9b45e5aea449d22811db', 'admin', '2022-10-12 04:57:16', 'admin', '2022-10-12 04:57:56', 0, 'admin', 'b3caa83cf1534926a614edc17ed055', 1, 1, 0, 1, 1, 1, 1, 1, 0),
('1b6ba97e74b84b289dfda76069a836', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:47', 0, 'admin', '90af5528e9a4458585b2d74bb73b05', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('28a44740a9144404a62818c2c9b3c3', 'admin', '2022-10-13 15:39:16', 'admin', '2022-10-13 15:39:22', 0, 'admin', '4f841c89e8274fd88335b2346d1ee2', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('29d380dad4434a93a9295df1e38e5c', 'admin', '2022-10-07 18:25:25', 'admin', '2022-10-07 18:25:32', 0, 'admin', '7d7f997ca58f425c8783ff7a7f994c', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('29d98c205c7a49bb8957c57fcf2194', 'admin', '2022-10-07 18:12:39', 'admin', '2022-10-07 18:12:45', 0, 'admin', '3038d96df22048608bbbb8762bbe24', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('2c192616c6374feebbbc2778dd4443', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:46', 0, 'admin', '44964312f0264429978158ada88843', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('3fdb778ddfa0463d9a08b70509f6a6', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:19', 0, 'admin', 'e0f3586f91ee4ab2952b6a8ad0f5db', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('52af4273642244679c1df3379fe104', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:46', 0, 'admin', '62309884bfe74e5696f10f32243d97', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('5374cfce8d1142f6b5bb30b12e34fb', 'admin', '2022-10-07 18:51:51', 'admin', '2022-10-07 18:51:56', 0, 'admin', 'a5d9db23534f44fa9d58a7f996ce2a', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('56c39e081a4d4d4c8db20e988f14cc', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:52', 0, 'admin', 'de3f6855009e49deb7fd2fdd0f3b3d', 1, 0, 0, 1, 0, 0, 1, 1, 0),
('62aa172fcf7c443aba135013fbcc54', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:26', 0, 'admin', 'cf98f97766f6405590b26daa586e00', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('67b92be10bca45438aff838eebab55', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:49', 0, 'admin', '3dd1a46ef2834b79a8da5080c496e4', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('67bf89a8259942d799ead773394497', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:31', 0, 'admin', 'c8f8362a5f6c432ab27d37213f15d4', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('69a9a95aa074429da6b3324109a0e5', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:48', 0, 'admin', '3ca074598cf94973b83bb1facb1190', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('746d6989a790471ca2e4de24a9f871', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:48', 0, 'admin', 'b679033b3256414b8f916c69f17674', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('75ab83a3d56647f898f3dbaf951b46', 'admin', '2022-10-07 18:20:50', 'admin', '2022-10-07 18:20:57', 0, 'admin', 'd188047ab21d45979c64c990a91e23', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('7e99a42af43943efabea7257e51917', 'admin', '2022-10-07 21:39:55', 'admin', '2022-10-07 21:40:04', 0, 'admin', 'e780677ba5764a128f4ae77e3b720e', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('84ca9c1ad91b4a50a5ba9893763a73', 'admin', '2022-10-13 16:22:35', 'admin', '2022-10-13 16:22:39', 0, 'admin', '9c04c7dfcf6c44cc9a0ec44b1c7691', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('9b830bdcd7f5457980742d0349d411', 'admin', '2022-10-13 16:22:35', 'admin', '2022-10-13 16:22:38', 0, 'admin', '5ad1d62d08a3408d9ab3a84c105d15', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('9b9c36848ff4460eb505761f37efaf', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:51', 0, 'admin', 'd13439e3f2324450a69b4e0e50159a', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('a209beb99b2f45d78dccf0f59e1ce8', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:19', 0, 'admin', 'e9d8310044d3481f81834d14f91bd7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('a67db1f75b28415a8499145f3f2556', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:49', 0, 'admin', '39894a92c9e9456997bb6af3b21bd3', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('a6b14fcb4bf547ff89694b2155cc4b', 'admin', '2022-10-12 04:57:16', 'admin', '2022-10-12 04:57:57', 0, 'admin', '670141b0c0ac4f61bba46f0c85acd6', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('ac542dc754354f7a8c20cf48a747f1', 'admin', '2022-10-07 18:09:55', 'admin', '2022-10-07 18:10:00', 0, 'admin', '8a5ae39e16a54354bd0ea87c1ff963', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('ae95699aa9e74cb290b815d3297258', 'admin', '2022-10-12 04:57:16', 'admin', '2022-10-12 04:57:57', 0, 'admin', '8f2e2ea5fa0649619863e4a30f1cbc', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('af473d04fefb479e967d32fd497e2e', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:53', 0, 'admin', 'e3c31e10b6c64e119b068ae4b73be6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('be9ffc3fd04247ab96d34ce8698539', 'admin', '2022-10-12 04:57:42', 'admin', '2022-10-12 04:57:45', 0, 'admin', 'c10a8ffd0165455989b58f9090798c', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('bf6aa4a180e349099e8a29456a7e26', 'admin', '2022-10-13 15:39:16', 'admin', '2022-10-13 15:39:26', 0, 'admin', 'c5e3a7bb003a42309c42907778173d', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('c8ddef0df0764958b9d1b106c75761', 'admin', '2022-10-07 21:39:55', 'admin', '2022-10-07 21:39:57', 0, 'admin', '93d8c32f689c41399f7ccb5ce434c3', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('c93d58aadd4b46ce94ac9e8af4f42c', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:30', 0, 'admin', '6ccd20c54d1d415189120ec5cc6c81', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('cae14167836c4678a4c5b7501ab132', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:50', 0, 'admin', 'ec436420c2734ec3a864eeedbe53c6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('cd05cdd05cba4139943c629a73ce9a', 'admin', '2022-10-13 16:22:35', 'admin', '2022-10-13 16:22:39', 0, 'admin', '3f423b73a7b04367853767d7de4bc5', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('d27854e569df46aea40d4371dcd448', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:48', 0, 'admin', '612df21b8cd34fb5869011b0e92f81', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('d46f5c5e7d7f43188e2cbf8daefff6', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:50', 0, 'admin', 'a015669f743f49d18be7541f4e9e4f', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('e5bfae8df613456e9404831a6f7fe2', 'admin', '2022-10-07 18:38:22', 'admin', '2022-10-07 18:38:30', 0, 'admin', '255bcee4fb4c45d8aa938b8279893c', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('f748fa0619a349a798ba30d0494951', 'admin', '2022-10-07 21:39:55', 'admin', '2022-10-07 21:40:04', 0, 'admin', '0e4bb0451f1d4a64a4f7be6be13708', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('f800beac22864c05983d0ef492ee10', 'admin', '2022-10-07 21:01:34', 'admin', '2022-10-07 21:01:41', 0, 'admin', '8001792212e640eb8e67b13a16a26d', 1, 1, 1, 1, 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `suppliers`
--

CREATE TABLE `suppliers` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `attention` varchar(100) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `payment_term` int(11) NOT NULL DEFAULT 0,
  `incoterm` varchar(30) DEFAULT NULL,
  `vat` int(11) NOT NULL DEFAULT 0,
  `vat_status` varchar(30) DEFAULT NULL,
  `tax` varchar(30) DEFAULT NULL,
  `bank_account` varchar(20) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `suppliers`
--

INSERT INTO `suppliers` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `address`, `attention`, `telp`, `fax`, `email`, `website`, `payment_term`, `incoterm`, `vat`, `vat_status`, `tax`, `bank_account`, `bank_name`, `currency`, `type`, `status`) VALUES
('128d849be37d4ffe92082dc47196d4', 'admin', '2022-10-07 20:55:16', NULL, NULL, 0, 'E', 'PT EWINDO', NULL, 'BANDUNG', NULL, '', NULL, '', '', 30, '100', 10, 'VAT', '', '', '', 'IDR', 'LOCAL', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_items`
--

CREATE TABLE `supplier_items` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `supplier_id` varchar(30) DEFAULT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `mpq` varchar(50) DEFAULT NULL,
  `moq` varchar(50) DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier_items`
--

INSERT INTO `supplier_items` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `supplier_id`, `item_id`, `mpq`, `moq`, `price`, `remarks`, `status`) VALUES
('1a012f752ade4b408b02b863f2fcbb', 'admin', '2022-10-11 17:32:38', NULL, NULL, 0, '128d849be37d4ffe92082dc47196d4', '1c90482587c74f7a96c8912df36bc9', '10', '50', 2500, '', 0),
('fb67eb19b8fd4fd8a46feae66f69da', 'admin', '2022-10-11 17:35:07', NULL, NULL, 0, '128d849be37d4ffe92082dc47196d4', '9a21160eec3f47f5a5ae1932627c3e', '10', '50', 1740, '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supply_materials`
--

CREATE TABLE `supply_materials` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `component_id` varchar(30) DEFAULT NULL,
  `workorder` varchar(30) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `request_no` varchar(20) DEFAULT NULL,
  `request_name` varchar(50) DEFAULT NULL,
  `qty_wo` int(11) NOT NULL DEFAULT 0,
  `qty_req` int(11) NOT NULL DEFAULT 0,
  `qty_bal` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supply_materials`
--

INSERT INTO `supply_materials` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `item_id`, `component_id`, `workorder`, `request_date`, `request_no`, `request_name`, `qty_wo`, `qty_req`, `qty_bal`, `status`) VALUES
('45ac15878d0447f794a9b3d2090376', 'admin', '2022-10-13 15:57:00', NULL, NULL, 0, 'c15ac21a3c8a498ebc4705b941b24f', 'df6c9c0da472463b9dfe1de7cf0518', 'WO221011-00002', '2022-10-13', 'REQ-221013-0001', 'Administrator', 180, 180, 0, 0),
('7dc47b3feae84fb6a684713d924616', 'admin', '2022-10-13 15:57:00', NULL, NULL, 0, 'c15ac21a3c8a498ebc4705b941b24f', '6728a46bee4748ceb6a2e1652f0c50', 'WO221011-00002', '2022-10-13', 'REQ-221013-0001', 'Administrator', 14, 14, 0, 0),
('8ae2025ecc144fe788bb0374f1ac3c', 'admin', '2022-10-13 15:57:00', NULL, NULL, 0, 'c15ac21a3c8a498ebc4705b941b24f', '579a5b6ab1f047a8afcaa31d27e957', 'WO221011-00002', '2022-10-13', 'REQ-221013-0001', 'Administrator', 92, 92, 0, 0),
('933c6628613c48f7847a99958d145b', 'admin', '2022-10-13 15:57:00', NULL, NULL, 0, 'c15ac21a3c8a498ebc4705b941b24f', '970957b7cbea47c78fea4f6e66b78e', 'WO221011-00002', '2022-10-13', 'REQ-221013-0001', 'Administrator', 35, 35, 0, 0),
('c7d1cdbb93974929a01094f6f6fc2b', 'admin', '2022-10-13 15:57:00', NULL, NULL, 0, 'c15ac21a3c8a498ebc4705b941b24f', 'ef19b617f6454eeda06b0ce8029bb0', 'WO221011-00002', '2022-10-13', 'REQ-221013-0001', 'Administrator', 23, 23, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `supply_sheets`
--

CREATE TABLE `supply_sheets` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `item_id` varchar(30) NOT NULL,
  `component_id` varchar(30) NOT NULL,
  `workorder` varchar(30) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `request_no` varchar(20) DEFAULT NULL,
  `request_name` varchar(50) DEFAULT NULL,
  `qty_req` int(11) NOT NULL DEFAULT 0,
  `qty_act` int(11) NOT NULL DEFAULT 0,
  `qty_bal` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supply_sheets`
--

INSERT INTO `supply_sheets` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `item_id`, `component_id`, `workorder`, `request_date`, `request_no`, `request_name`, `qty_req`, `qty_act`, `qty_bal`, `status`) VALUES
('34561721d68f4b7fb9b7c991e07808', 'admin', '2022-10-11 19:55:54', NULL, NULL, 0, '8ee1c3d0d3654c0194cba18cffaae9', '1c90482587c74f7a96c8912df36bc9', 'WO221011-00001', '2022-10-11', 'SH-221011-0001', 'Administrator', 25, 25, 0, 0),
('52759cf31a9740bc8cff9f2b38e138', 'admin', '2022-10-11 19:55:54', NULL, NULL, 0, '8ee1c3d0d3654c0194cba18cffaae9', '9a21160eec3f47f5a5ae1932627c3e', 'WO221011-00001', '2022-10-11', 'SH-221011-0001', 'Administrator', 56, 56, 0, 0),
('e5f39c5c205d47eca277f74519eaa9', 'admin', '2022-10-11 19:55:54', NULL, NULL, 0, '8ee1c3d0d3654c0194cba18cffaae9', '12d216f47b9b4d09ab393337234653', 'WO221011-00001', '2022-10-11', 'SH-221011-0001', 'Administrator', 41, 41, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `uom`
--

CREATE TABLE `uom` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `number` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `uom`
--

INSERT INTO `uom` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('09efc8bcc8cf41a09f5a71246c0a52', 'admin', '2022-10-07 18:16:05', NULL, NULL, 0, 'Kg', 'Kilogram', '', 0),
('86c081e423324443860d07ea0ccefe', 'admin', '2022-10-07 18:16:10', NULL, NULL, 0, 'Pcs', 'Pieces', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `number` varchar(30) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `actived` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `username`, `password`, `email`, `phone`, `position`, `avatar`, `actived`, `status`) VALUES
('86f9f296025243ed953fe6014ff765', 'admin', '2021-12-26 11:24:58', 'admin', '2022-10-07 17:09:10', 0, '1', 'Administrator', '', 'admin', 'admin@123#', 'admin@aeconsys.com', '88888888888', 'Admin System', NULL, 0, 0),
('86f9f296025843ed953fe6094ff765', 'admin', '2022-09-29 15:52:33', 'admin', '2022-10-07 17:07:44', 1, '201602262', 'Hilman Fadillah', NULL, 'hilman', '123456', 'hilmanf11@gmail.com', '8559299000', 'Staff IT', NULL, 0, 0),
('e52beaefb5b14b6a95f0936c1aabc5', 'admin', '2022-09-30 04:47:29', 'admin', '2022-10-07 17:07:44', 1, '201602264', 'Dani Fahrizal Sucipto', NULL, 'danifs', '123456', 'danifs@gmail.com', '8222466562', 'Staff Engineering', NULL, 0, 0),
('fc39bff493944935b50cd620e3214d', 'admin', '2022-09-30 04:36:04', 'admin', '2022-10-07 17:07:44', 1, '201602263', 'Sri Nuraeni', NULL, 'sri_nura', 'nuraeni', 'srinuraeni204@gmail.com', '82249564622', 'Staff Accounting', NULL, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `approvals`
--
ALTER TABLE `approvals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `barcode_divides`
--
ALTER TABLE `barcode_divides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `bom`
--
ALTER TABLE `bom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `customers_number` (`customer_id`),
  ADD KEY `items_number` (`item_id`),
  ADD KEY `component_number` (`component_id`);

--
-- Indeks untuk tabel `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `customer_items`
--
ALTER TABLE `customer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `customers_number` (`customer_id`),
  ADD KEY `items_number` (`item_id`);

--
-- Indeks untuk tabel `issued_materials`
--
ALTER TABLE `issued_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `request_no` (`request_no`);

--
-- Indeks untuk tabel `issued_material_details`
--
ALTER TABLE `issued_material_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `request_no` (`request_no`),
  ADD KEY `label_no` (`label_no`);

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `number_2` (`number`),
  ADD KEY `item_familys_id` (`item_family_id`),
  ADD KEY `uom_id` (`uom_id`);

--
-- Indeks untuk tabel `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `item_colors`
--
ALTER TABLE `item_colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `item_familys`
--
ALTER TABLE `item_familys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `item_makers`
--
ALTER TABLE `item_makers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `item_options`
--
ALTER TABLE `item_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `item_sizes`
--
ALTER TABLE `item_sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `item_specifications`
--
ALTER TABLE `item_specifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `item_types`
--
ALTER TABLE `item_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `lines`
--
ALTER TABLE `lines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `approvals_id` (`approvals_id`);

--
-- Indeks untuk tabel `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `production_schedules`
--
ALTER TABLE `production_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `customers_number` (`customer_id`),
  ADD KEY `items_number` (`item_id`),
  ADD KEY `line_id` (`line_id`);

--
-- Indeks untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `request_no` (`request_no`);

--
-- Indeks untuk tabel `purchase_order_labels`
--
ALTER TABLE `purchase_order_labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `receipt_no` (`receipt_id`),
  ADD KEY `label_no` (`label_no`);

--
-- Indeks untuk tabel `purchase_order_receipts`
--
ALTER TABLE `purchase_order_receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `receipt_id` (`receipt_id`),
  ADD KEY `receipt_no` (`receipt_no`);

--
-- Indeks untuk tabel `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `request_no` (`request_no`);

--
-- Indeks untuk tabel `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `customer_id` (`customer_id`,`item_id`),
  ADD KEY `sales_orders_ibfk_4` (`item_id`);

--
-- Indeks untuk tabel `setting_menus`
--
ALTER TABLE `setting_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `menus_id` (`menus_id`);

--
-- Indeks untuk tabel `setting_users`
--
ALTER TABLE `setting_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `menus_id` (`menus_id`);

--
-- Indeks untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `supplier_items`
--
ALTER TABLE `supplier_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `suppliers_number` (`supplier_id`),
  ADD KEY `items_number` (`item_id`);

--
-- Indeks untuk tabel `supply_materials`
--
ALTER TABLE `supply_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `component_id` (`component_id`);

--
-- Indeks untuk tabel `supply_sheets`
--
ALTER TABLE `supply_sheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `components_number` (`component_id`),
  ADD KEY `items_number` (`item_id`);

--
-- Indeks untuk tabel `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `approvals`
--
ALTER TABLE `approvals`
  ADD CONSTRAINT `approvals_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `approvals_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `barcode_divides`
--
ALTER TABLE `barcode_divides`
  ADD CONSTRAINT `barcode_divides_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barcode_divides_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bom`
--
ALTER TABLE `bom`
  ADD CONSTRAINT `bom_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bom_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bom_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bom_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bom_ibfk_5` FOREIGN KEY (`component_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `config`
--
ALTER TABLE `config`
  ADD CONSTRAINT `config_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `config_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `currencies_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customer_items`
--
ALTER TABLE `customer_items`
  ADD CONSTRAINT `customer_items_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_items_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_items_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_items_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `issued_materials`
--
ALTER TABLE `issued_materials`
  ADD CONSTRAINT `issued_material_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_material_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_material_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_material_ibfk_4` FOREIGN KEY (`component_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `issued_material_details`
--
ALTER TABLE `issued_material_details`
  ADD CONSTRAINT `issued_material_details_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_material_details_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_material_details_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_material_details_ibfk_4` FOREIGN KEY (`request_no`) REFERENCES `issued_materials` (`request_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issued_material_details_ibfk_5` FOREIGN KEY (`label_no`) REFERENCES `purchase_order_labels` (`label_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_3` FOREIGN KEY (`item_family_id`) REFERENCES `item_familys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_4` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_categories_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_colors`
--
ALTER TABLE `item_colors`
  ADD CONSTRAINT `item_colors_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_colors_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_familys`
--
ALTER TABLE `item_familys`
  ADD CONSTRAINT `item_familys_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_familys_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_makers`
--
ALTER TABLE `item_makers`
  ADD CONSTRAINT `item_makers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_makers_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_options`
--
ALTER TABLE `item_options`
  ADD CONSTRAINT `item_options_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_options_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_sizes`
--
ALTER TABLE `item_sizes`
  ADD CONSTRAINT `item_sizes_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_sizes_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_specifications`
--
ALTER TABLE `item_specifications`
  ADD CONSTRAINT `item_specifications_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_specifications_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `item_types`
--
ALTER TABLE `item_types`
  ADD CONSTRAINT `item_types_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_types_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lines`
--
ALTER TABLE `lines`
  ADD CONSTRAINT `lines_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lines_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menus_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`approvals_id`) REFERENCES `approvals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `plants`
--
ALTER TABLE `plants`
  ADD CONSTRAINT `plants_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plants_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `production_schedules`
--
ALTER TABLE `production_schedules`
  ADD CONSTRAINT `production_schedule_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `production_schedule_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `production_schedule_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `production_schedule_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `production_schedule_ibfk_5` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_ibfk_4` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_ibfk_5` FOREIGN KEY (`request_no`) REFERENCES `purchase_requests` (`request_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase_order_labels`
--
ALTER TABLE `purchase_order_labels`
  ADD CONSTRAINT `purchase_order_labels_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_labels_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_labels_ibfk_4` FOREIGN KEY (`receipt_id`) REFERENCES `purchase_order_receipts` (`receipt_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase_order_receipts`
--
ALTER TABLE `purchase_order_receipts`
  ADD CONSTRAINT `purchase_order_receipts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_receipts_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_receipts_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_receipts_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase_requests`
--
ALTER TABLE `purchase_requests`
  ADD CONSTRAINT `purchase_requests_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_requests_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_requests_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD CONSTRAINT `sales_orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_orders_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_orders_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_orders_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `setting_menus`
--
ALTER TABLE `setting_menus`
  ADD CONSTRAINT `setting_menus_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_menus_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_menus_ibfk_3` FOREIGN KEY (`menus_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `setting_users`
--
ALTER TABLE `setting_users`
  ADD CONSTRAINT `setting_users_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_users_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_users_ibfk_3` FOREIGN KEY (`menus_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `setting_users_ibfk_4` FOREIGN KEY (`users_id`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `supplier_items`
--
ALTER TABLE `supplier_items`
  ADD CONSTRAINT `supplier_items_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_items_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_items_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supplier_items_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `supply_materials`
--
ALTER TABLE `supply_materials`
  ADD CONSTRAINT `supply_materials_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supply_materials_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supply_materials_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supply_materials_ibfk_4` FOREIGN KEY (`component_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `supply_sheets`
--
ALTER TABLE `supply_sheets`
  ADD CONSTRAINT `supply_sheets_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supply_sheets_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supply_sheets_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supply_sheets_ibfk_4` FOREIGN KEY (`component_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `uom`
--
ALTER TABLE `uom`
  ADD CONSTRAINT `uom_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uom_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
