-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 29 Nov 2022 pada 19.47
-- Versi server: 10.2.44-MariaDB-cll-lve
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aecp6378_erp_chainwin`
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
('20221126000001', 'admin', '2022-11-26 23:16:52', 'WHS02', '2022-11-29 13:55:29', 0, 'POR-221117-000008', 'POR-221117-000008000001', 'POR-221117-000008000001-01', 500, 'SUPPLY', 1),
('20221126000002', 'admin', '2022-11-26 23:16:52', NULL, NULL, 0, 'POR-221117-000008', 'POR-221117-000008000001', 'POR-221117-000008000001-02', 99500, 'BALANCE', 0),
('20221126000003', 'admin', '2022-11-26 23:19:48', 'admin', '2022-11-26 23:35:13', 0, 'POR-221117-000008', 'POR-221117-000008000001-02', 'POR-221117-000008000001-003', 500, 'SUPPLY', 0),
('20221126000004', 'admin', '2022-11-26 23:19:49', NULL, NULL, 0, 'POR-221117-000008', 'POR-221117-000008000001-02', 'POR-221117-000008000001-04', 99000, 'BALANCE', 0),
('20221126000005', 'admin', '2022-11-26 23:28:39', 'admin', '2022-11-26 23:28:59', 0, 'POR-221117-000008', 'POR-221117-000008000001-04', 'POR-221117-000008000001-005', 500, 'SUPPLY', 0),
('20221126000006', 'admin', '2022-11-26 23:28:39', NULL, NULL, 0, 'POR-221117-000008', 'POR-221117-000008000001-04', 'POR-221117-000008000001-06', 98500, 'BALANCE', 0),
('20221127000001', 'admin', '2022-11-27 00:07:33', NULL, NULL, 0, 'POR-221117-000008', 'POR-221117-000008000001-06', 'POR-221117-000008000001-007', 500, 'SUPPLY', 0),
('20221127000002', 'admin', '2022-11-27 00:07:33', NULL, NULL, 0, 'POR-221117-000008', 'POR-221117-000008000001-06', 'POR-221117-000008000001-08', 98000, 'BALANCE', 0),
('20221128000001', 'WHS02', '2022-11-28 11:48:10', 'WHS02', '2022-11-29 14:04:42', 0, 'POR-221117-000009', 'POR-221117-000009000001', 'POR-221117-000009000001-001', 1500, 'SUPPLY', 1),
('20221128000002', 'WHS02', '2022-11-28 11:48:10', NULL, NULL, 0, 'POR-221117-000009', 'POR-221117-000009000001', 'POR-221117-000009000001-002', 142500, 'BALANCE', 0),
('20221128000003', 'WHS01', '2022-11-28 12:01:27', NULL, NULL, 0, 'POR-221117-000009', 'POR-221117-000009000001-002', 'POR-221117-000009000001-003', 1500, 'SUPPLY', 0),
('20221128000004', 'WHS01', '2022-11-28 12:01:27', NULL, NULL, 0, 'POR-221117-000009', 'POR-221117-000009000001-002', 'POR-221117-000009000001-004', 141000, 'BALANCE', 0),
('20221129000001', 'WHS01', '2022-11-29 11:16:28', 'WHS02', '2022-11-29 12:34:12', 0, 'POR-221117-000004', 'POR-221117-000004000001', 'POR-221117-000004000001-001', 500, 'SUPPLY', 1),
('20221129000002', 'WHS01', '2022-11-29 11:16:28', NULL, NULL, 0, 'POR-221117-000004', 'POR-221117-000004000001', 'POR-221117-000004000001-002', 3500, 'BALANCE', 0),
('20221129000005', 'WHS01', '2022-11-29 13:34:35', 'WHS02', '2022-11-29 13:41:08', 0, 'POR-221117-000012', 'POR-221117-000012000001', 'POR-221117-000012000001-001', 500, 'SUPPLY', 1),
('20221129000006', 'WHS01', '2022-11-29 13:34:35', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-000012000001', 'POR-221117-000012000001-002', 6500, 'BALANCE', 0),
('20221129000009', 'WHS01', '2022-11-29 13:45:42', 'WHS02', '2022-11-29 13:55:35', 0, 'POR-221117-000003', 'POR-221117-000003000001', 'POR-221117-000003000001-001', 500, 'SUPPLY', 1),
('20221129000010', 'WHS01', '2022-11-29 13:45:42', NULL, NULL, 0, 'POR-221117-000003', 'POR-221117-000003000001', 'POR-221117-000003000001-002', 4500, 'BALANCE', 0),
('20221129000011', 'WHS01', '2022-11-29 14:06:48', 'WHS02', '2022-11-29 14:08:53', 0, 'POR-20221116-0005-001', 'POR-20221116-00050010001', 'POR-20221116-00050010001-001', 500, 'SUPPLY', 1),
('20221129000012', 'WHS01', '2022-11-29 14:06:48', NULL, NULL, 0, 'POR-20221116-0005-001', 'POR-20221116-00050010001', 'POR-20221116-00050010001-002', 3500, 'BALANCE', 0),
('20221129000013', 'WHS01', '2022-11-29 14:59:21', NULL, NULL, 0, 'POR-221117-000011', 'POR-221117-00001000001', 'POR-221117-00001000001-001', 500, 'SUPPLY', 0),
('20221129000014', 'WHS01', '2022-11-29 14:59:21', NULL, NULL, 0, 'POR-221117-000011', 'POR-221117-00001000001', 'POR-221117-00001000001-002', 3500, 'BALANCE', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bc_kind`
--

CREATE TABLE `bc_kind` (
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
-- Dumping data untuk tabel `bc_kind`
--

INSERT INTO `bc_kind` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('425eb57636e94539a48a47dbffa25d', 'admin', '2022-10-16 14:01:15', NULL, NULL, 0, '003', 'BC 4.0', '', 0),
('49cd28c1ba9c4f759c81cf21312700', 'admin', '2022-10-16 14:01:11', NULL, NULL, 0, '002', 'BC 3.0', '', 0),
('c9db5a973094401c87337a04e076fa', 'admin', '2022-10-16 14:01:05', NULL, NULL, 0, '001', 'BC 2.3', '', 0);

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
('088c1328bf3040b7a877f2e6e4e8f7', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'bed6c03ec4bf41f5bcdcd425d6d528', '1.00', 'P3', 0),
('08d4515e2bbb4d35a7beee6404e34a', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '10af05969b8042799c703dcd435d08', '1.00', 'P3', 0),
('1aeba1ff632642bfad1a8df98fffe6', 'admin', '2022-10-28 08:51:03', 'samsudin', '2022-11-29 13:49:36', 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '624c4bd2693743b48ff8ec6a1011e8', '0.03', 'P3', 0),
('1edb1059fe764e61b6594cf7ea58b0', 'admin', '2022-10-28 08:51:02', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '19d58c090ea14cdc994a8baa312c33', '1.00', 'P3', 0),
('3137b6eb0d804fe28eb1ea2274d6bb', 'admin', '2022-10-28 08:51:02', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '959962f44c0f44a29761da251f3cf5', '1.59', 'P1', 0),
('42e68bd8997a4c04b7295ccb2453d7', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '57748ea624ea42f8a3d2c9ea9f8776', '0.80', 'P3', 0),
('440c698588b6464280b617ea254a4e', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'b0fd68d0868e4433acc74b897b5b18', '1.00', 'P3', 0),
('4dd6e8afd9314f47b08e6008be4e0a', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'f03f5c8efbba404b8abb41370965bf', '1.00', 'P3', 0),
('6fa266bf2727419f8ea98e13189dde', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'b5099016fd8c487ebdb5b7b4af1d67', '1.00', 'P3', 0),
('85e28b925cf84969b6951c306abef1', 'admin', '2022-10-28 08:51:03', 'samsudin', '2022-11-29 14:06:20', 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '614b430c9c2f4260b240e5cf44ad73', '0.02', 'P3', 0),
('87b672536710414f9b4f002ce4565c', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '258d134422724290aa869aed97c018', '1.00', 'P3', 0),
('915a4ac3372c4ff691817f1de42410', 'admin', '2022-10-28 08:51:03', 'ADM01', '2022-11-29 11:41:02', 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'e4b82d1b4e70476daf85aa5494b37c', '3.00', 'P2', 0),
('ae82bf5d9066464f9afc897fec8a7e', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '98a74ee45aa84fdea4a995a8f94c72', '0.25', 'P3', 0),
('b69fc9ee146a47518055d02a2e71c1', 'admin', '2022-10-28 08:51:02', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '9b9b4c19c11349b4bc1f059a1d4159', '1.00', 'P3', 0),
('cc20b7f72fd14c15b19b5913694326', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'a995527a67594ce0af5a2298712860', '0.07', 'P3', 0),
('cfb45b3d3dd34cceb35eff292cc247', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '3714e81e66f34ba5aa8da4579a9627', '1.00', 'P3', 0),
('cfed56c46d41485a9e88cfff939f6f', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'f6d94df71f99416591000e95fef385', '0.16', 'P3', 0),
('d4017a293f3747ad969f2c7dca90cf', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'ae1e4ae4b24d4f598f5390ead6be52', '0.45', 'P3', 0),
('d7d1d51e6c244c9db26e6a4f516a2d', 'admin', '2022-10-28 08:51:03', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '3e70bdfd80f5405780dbf3b530e009', '1.00', 'P3', 0);

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
('4c9a9e62-3ff6-11ed-a526-7085c2', 'admin', '2022-10-01 06:31:13', NULL, NULL, 0, 'CHAINWIN', 'PT. CHAINWIN INDONESIA', 'ENTERPRISE RESOURCE PLANNING', 'JL. INDUSTRI SELATAN BLOK HH-9 KAWASAN INDUSTRI JABABEKA 2 <br>DESA PASIRSARI, KEC. CIKARANG SELATAN <br> KAB. BEKASI, JAWA-BARAT INDONESIA', 'https://erp.chainwin.aeconsys.com/assets/image/config/logo/1665155179.png', 'https://erp.chainwin.aeconsys.com/assets/image/config/favicon/1665155179.png', 'https://erp.chainwin.aeconsys.com/assets/image/config/login/1665155179.jpg', 'gray', 0);

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
('11df1bbf41d24a0b8dc6b92697bf77', 'admin', '2022-10-07 18:23:49', 'admin', '2022-10-14 15:13:45', 0, 'USD', 'AMERICA', 'UNITED STATES DOLLAR', '$', 0),
('9cfaf364f9fd42829caf25f5b6dfa1', 'admin', '2022-10-07 18:24:16', 'admin', '2022-10-14 15:13:59', 0, 'EUR', 'EURO', 'EUROPE', '€', 0),
('c155b7c80ccc48f49d3e8f5f8db4fd', 'admin', '2022-10-07 18:24:35', 'admin', '2022-10-14 15:14:38', 0, 'JPY', 'YEN', 'JAPANESE YEN', '¥', 0),
('e7b7cf37985b40a787735830a1ec1e', 'admin', '2022-10-07 18:24:25', 'admin', '2022-10-14 15:14:21', 0, 'IDR', 'RUPIAH', 'INDONESIA RUPIAH', 'Rp', 0);

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
('5db876d3d3f74ce6876610abdaebb3', 'admin', '2022-10-20 09:53:55', NULL, NULL, 0, 'OC0001', 'PRIMECONN CORPORATION', NULL, '201 ROGERS OFFICE BUILDING,EDWIN WALLACE REY DRIVE, GEORGE HILL, ANGUILLA, B.W.I.', 'MAGGIE HUANG', '886-3-339-8841', '886-3-332-2246', 'maggie-hwang@leoco.com.tw', '', 0, '', '', 'USD', 'EXPORT', 0);

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
  `price` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `remarks` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer_items`
--

INSERT INTO `customer_items` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `customer_id`, `item_id`, `max_order`, `ar_balance`, `expired`, `price`, `remarks`, `status`) VALUES
('2edcb2d8a48840d29d45136f578583', 'ADM01', '2022-11-17 11:27:20', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 0, 0, '2024-10-31', '0.0011', '-', 0);

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
('20221129000001', 'WHS02', '2022-11-29 12:20:12', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '959962f44c0f44a29761da251f3cf5', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 795, 0),
('20221129000002', 'WHS02', '2022-11-29 12:20:12', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '258d134422724290aa869aed97c018', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 500, 0),
('20221129000003', 'WHS02', '2022-11-29 12:20:12', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '3e70bdfd80f5405780dbf3b530e009', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 500, 0),
('20221129000004', 'WHS02', '2022-11-29 12:20:12', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', 'f03f5c8efbba404b8abb41370965bf', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 500, 0),
('20221129000005', 'WHS02', '2022-11-29 12:20:12', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '10af05969b8042799c703dcd435d08', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 500, 0),
('20221129000006', 'WHS02', '2022-11-29 12:20:13', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '19d58c090ea14cdc994a8baa312c33', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 500, 0),
('20221129000007', 'WHS02', '2022-11-29 12:20:13', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', 'a995527a67594ce0af5a2298712860', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 35, 0),
('20221129000008', 'WHS02', '2022-11-29 12:20:13', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '9b9b4c19c11349b4bc1f059a1d4159', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 500, 0),
('20221129000009', 'WHS02', '2022-11-29 12:20:13', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', 'f6d94df71f99416591000e95fef385', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 80, 0),
('20221129000010', 'WHS02', '2022-11-29 12:20:13', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', 'e4b82d1b4e70476daf85aa5494b37c', 'SH-221129-0001', '202211', '1', 'WO221129-00001', 1500, 0);

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
('20221129000001', 'WHS02', '2022-11-29 12:20:57', NULL, NULL, 0, 'SH-221129-0001', 'POR-221117-000011000015', '959962f44c0f44a29761da251f3cf5', 1220, 0),
('20221129000002', 'WHS02', '2022-11-29 12:27:58', NULL, NULL, 0, 'SH-221129-0001', 'POR-221117-000001000001', 'f6d94df71f99416591000e95fef385', 1000, 0),
('20221129000003', 'WHS02', '2022-11-29 12:34:12', NULL, NULL, 0, 'SH-221129-0001', 'POR-221117-000004000001-001', '10af05969b8042799c703dcd435d08', 500, 0),
('20221129000004', 'WHS02', '2022-11-29 13:41:08', NULL, NULL, 0, 'SH-221129-0001', 'POR-221117-000012000001-001', '9b9b4c19c11349b4bc1f059a1d4159', 500, 0),
('20221129000005', 'WHS02', '2022-11-29 13:55:29', NULL, NULL, 0, 'SH-221129-0001', 'POR-221117-000008000001-01', '258d134422724290aa869aed97c018', 500, 0),
('20221129000006', 'WHS02', '2022-11-29 13:55:35', NULL, NULL, 0, 'SH-221129-0001', 'POR-221117-000003000001-001', 'f03f5c8efbba404b8abb41370965bf', 500, 0),
('20221129000007', 'WHS02', '2022-11-29 14:04:42', NULL, NULL, 0, 'SH-221129-0001', 'POR-221117-000009000001-001', 'e4b82d1b4e70476daf85aa5494b37c', 1500, 0),
('20221129000008', 'WHS02', '2022-11-29 14:08:53', NULL, NULL, 0, 'SH-221129-0001', 'POR-20221116-00050010001-001', '19d58c090ea14cdc994a8baa312c33', 500, 0);

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
  `item_category_id` varchar(30) DEFAULT NULL,
  `uom_id` varchar(30) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `leadtime` int(11) NOT NULL DEFAULT 0,
  `box` int(11) NOT NULL DEFAULT 0,
  `lot` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `item_family_id`, `item_category_id`, `uom_id`, `number`, `name`, `description`, `leadtime`, `box`, `lot`, `status`) VALUES
('04fe43996a1c4c36948c5242d9a7b8', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:22:37', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0011', 'MACHINE', 'CABLE WRAPPING &amp; WIRETIE', 30, 0, 0, 0),
('0d6841b5f98542179a5114022f0f59', 'admin', '2022-10-19 10:26:41', 'admin', '2022-10-27 10:20:59', 0, 'bfdc4fe7a043452486bf3090d8d74c', 'b5ff19fc1b1c492c837ed4f3a1ced7', '05c0b88ebdfa4799bb0563ee919965', 'TOOLS-TYPE-001', 'CABLE HANGER', 'CABLE HANGER TYPE 1', 60, 0, 0, 0),
('10af05969b8042799c703dcd435d08', 'admin', '2022-10-16 11:51:13', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', '8036S0000024100', 'BACK SHELL', 'BACK SHELLL；MATERIAL: HDPE(DOW 12450N)，NATURE COLOR,ID=4.83MM', 60, 0, 0, 0),
('1461a62f894140b8ac1fd858936796', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:22:55', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0006', 'MACHINE', 'O-RING CHECK + DOTTING MACHINE', 30, 0, 0, 0),
('19d58c090ea14cdc994a8baa312c33', 'admin', '2022-10-16 11:51:13', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', '8035G03N0004101', 'BASE A', 'PSU；UL94-HB；BLACK', 60, 0, 0, 0),
('19fae6bcaeaa4202bfa2944e5805ad', 'admin', '2022-10-21 06:52:27', 'admin', '2022-10-28 00:18:04', 0, '9016430cc47a455ba3a900f9d0b5d8', 'd0231aae870c42f4b02e931111e75e', 'cacb50a73a234e7191844506e3c7b5', '202221TES0120001', 'TEST01', 'TEST01', 0, 0, 500, 0),
('258d134422724290aa869aed97c018', 'admin', '2022-10-16 11:51:15', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', 'QR60E07618031AG', 'O-RING A', 'EPDM,SHORE A 60,AS568 NO.: -011,BLACK,￠1.78X￠7.65, PE BAG PACKING: 2000PCS/BAG', 60, 0, 0, 0),
('2a723738ac66458184f008b747dbd7', 'admin', '2022-10-16 11:51:14', 'admin', '2022-11-04 15:13:37', 0, '9016430cc47a455ba3a900f9d0b5d8', 'd0231aae870c42f4b02e931111e75e', '86c081e423324443860d07ea0ccefe', 'AWC605UW815XXX', 'CFG-0151-010 R002', 'CABLE ASSEMBLY 010605', 30, 0, 100, 0),
('3714e81e66f34ba5aa8da4579a9627', 'admin', '2022-10-16 11:51:14', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', 'PB16X15000001ZW', 'PE BAG', 'PE；400X381MM', 60, 0, 0, 0),
('3e70bdfd80f5405780dbf3b530e009', 'admin', '2022-10-16 11:51:15', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', 'QR60E12418031AG', 'O-RING B', 'EPDM,SHORE A 60, VENDOR PN#RE60AS568-014B0100,BLACK,￠1.78X￠12.42,PE BAG PACKING: 2000PCS/BAG', 60, 0, 0, 0),
('57748ea624ea42f8a3d2c9ea9f8776', 'admin', '2022-10-16 11:51:15', 'samsudin', '2022-11-29 09:07:14', 0, 'f26818522f0345a2b01aae3087a2d1', '35af2cb57227422cb32784399e1a3d', '57b25832f89144ed9b36bd11e602b0', 'RF1350M4B0031ZX', 'EV. ROBERTS P/N:1350M4 B,SPECIFIC GRAVITY1.04', 'EV. ROBERTS P/N:1350M4 B,SPECIFIC GRAVITY1.04', 60, 0, 0, 0),
('5bf5c56dea2745b9925d11cfbfa4a2', 'admin', '2022-10-19 10:38:42', 'admin', '2022-10-27 10:21:08', 0, 'bfdc4fe7a043452486bf3090d8d74c', 'b5ff19fc1b1c492c837ed4f3a1ced7', '05c0b88ebdfa4799bb0563ee919965', 'TOOLS-TYPE-002', 'CABLE HANGER', 'CABLE HANGER TYPE 2', 60, 0, 0, 0),
('5ed6a9df03334e65b29657a7051407', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:23:08', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0002', 'MACHINE', 'STRIPPING FOR INNER WIRE', 30, 0, 0, 0),
('614b430c9c2f4260b240e5cf44ad73', 'admin', '2022-10-16 11:51:15', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '57b25832f89144ed9b36bd11e602b0', 'YZ-GPL2060031ZV', 'GREASE', 'DUPONT # GPL 206', 7, 0, 0, 0),
('624c4bd2693743b48ff8ec6a1011e8', 'admin', '2022-10-16 11:51:14', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, 'b74a21780d4f4f03b022847ff07bc5', 'ETAPE0DW0053153', 'COPPER FOIL TAPE', 'COPPER FOIL；5X0.06MM', 60, 0, 0, 0),
('7a1631ccb6554010b9e6d7af7a2810', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:23:17', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0004', 'MACHINE', 'CRIMPING MACHINE', 30, 0, 0, 0),
('7bde0495d3b941cea886ad009bc9d2', 'admin', '2022-10-26 09:41:10', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '35af2cb57227422cb32784399e1a3d', 'cacb50a73a234e7191844506e3c7b5', 'TES0002', 'TES0002', 'TES0002', 30, 0, 1, 0),
('7d0c84c8a32545ab977aac1c568c0f', 'admin', '2022-10-19 10:39:53', 'admin', '2022-10-27 10:21:13', 0, 'bfdc4fe7a043452486bf3090d8d74c', 'b5ff19fc1b1c492c837ed4f3a1ced7', '05c0b88ebdfa4799bb0563ee919965', 'TOOLS-TYPE-003', 'MOISTURE ANALYZER', 'MOISTURE ANALYZER', 60, 0, 0, 0),
('84ed48f24e424cedbae66d03750af9', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:23:29', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0009', 'MACHINE', 'TESTING EQUIPMENT', 30, 0, 0, 0),
('91975e7b4d394c0a88563cc154d9c3', 'admin', '2022-10-16 11:51:14', NULL, NULL, 0, 'bfdc4fe7a043452486bf3090d8d74c', NULL, '86c081e423324443860d07ea0ccefe', 'NCARTON060B01ZW', 'CARTON (NO LOGO)', 'CARTON SIZE 480X360X210MM NO LOGO', 60, 0, 0, 0),
('959962f44c0f44a29761da251f3cf5', 'admin', '2022-10-16 11:51:13', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, 'b74a21780d4f4f03b022847ff07bc5', '302CM4722G031U2', 'CABLE', 'PVC JACKET;SR-PVC INSULATION;TIN PLATED COPPER CONDUCTOR; UL CM;JHOSIN:3C069-J;22AWGX3C;OD=4.24MM;JACKET GREY COLOR; CORE WIRE COLOR: BLACK/WHITE/RED', 60, 0, 0, 0),
('98a74ee45aa84fdea4a995a8f94c72', 'admin', '2022-10-16 11:51:15', 'samsudin', '2022-11-29 13:48:10', 0, 'f26818522f0345a2b01aae3087a2d1', '35af2cb57227422cb32784399e1a3d', '57b25832f89144ed9b36bd11e602b0', 'RTVGLUET39231ZV', 'RTV GLUE', 'RTV GLUE；MOMENTIVE(TOSHIBA) P/N:TSE392-C;333ML/CATR；SHELF LIFE：12 MONTHS（312G/PCS）', 60, 0, 0, 0),
('996b6ffe582c495494a1c45d179fd6', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:23:38', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0010', 'MACHINE', 'O-RING CHECKING MACHINE (DUST CAP)', 30, 0, 0, 0),
('9b9b4c19c11349b4bc1f059a1d4159', 'admin', '2022-10-16 11:51:13', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', '8036B03F00A4101', 'BASE B', 'PSU；HB；BLACK', 60, 0, 0, 0),
('9de0d8e732204c95a3b0cd192b01d8', 'admin', '2022-10-26 09:38:27', 'admin', '2022-10-26 09:41:49', 0, 'f26818522f0345a2b01aae3087a2d1', '35af2cb57227422cb32784399e1a3d', 'cacb50a73a234e7191844506e3c7b5', 'TES0001', 'TES0001', 'TES0001', 30, 0, 1, 0),
('a0f00c476c3447dc81d9450fa51a42', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:23:49', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0005', 'MACHINE', 'TERMINAL POSITIONING FIXTURE', 30, 0, 0, 0),
('a774118ebee04a768d457f5a8e7610', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:23:57', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0003', 'MACHINE', 'STRIPE BENDING FIXTURE', 30, 0, 0, 0),
('a995527a67594ce0af5a2298712860', 'admin', '2022-10-16 11:51:14', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, 'b74a21780d4f4f03b022847ff07bc5', 'PSTAPEW-W183153', 'SHEATHING PAPER', 'AESTHETIC PAPER；W=18MM', 60, 0, 0, 0),
('ae1e4ae4b24d4f598f5390ead6be52', 'admin', '2022-10-16 11:51:15', 'samsudin', '2022-11-29 09:07:03', 0, 'f26818522f0345a2b01aae3087a2d1', '35af2cb57227422cb32784399e1a3d', '57b25832f89144ed9b36bd11e602b0', 'RF1350M4A0031ZX', 'EV. ROBERTS P/N:1350M4 A,SPECIFIC GRAVITY1.15', 'EV. ROBERTS P/N:1350M4 A,SPECIFIC GRAVITY1.15', 60, 0, 0, 0),
('b0fd68d0868e4433acc74b897b5b18', 'admin', '2022-10-16 11:51:15', NULL, NULL, 0, 'bfdc4fe7a043452486bf3090d8d74c', NULL, '86c081e423324443860d07ea0ccefe', 'RF1350M4T0031KJ', 'GLUE MIXING PIPE', 'ACCESSIBILITY FOR EV.ROBERTS GLUE WHEN MIXTING；MS06-32(INCLUDING MIXING TUBE, ADAPTER, BENT NEEDLE)', 60, 0, 0, 0),
('b5099016fd8c487ebdb5b7b4af1d67', 'admin', '2022-10-16 11:51:14', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', 'LABEL-S900002ZW', 'BLANK LABLE', 'BLANK LABLE；80X70MM；WHITE COLOR', 60, 0, 0, 0),
('bed6c03ec4bf41f5bcdcd425d6d528', 'admin', '2022-10-16 11:51:15', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', 'Q-LABELYM5902ZW', 'LABLE', 'LABLE', 60, 0, 0, 0),
('c6f46c95ec004f819348ae736fb99c', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:24:07', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0008', 'MACHINE', 'POTTING MACHINE (A+B GLUE)', 30, 0, 0, 0),
('d0d2d181e9864f9e87d38bd8349f9f', 'admin', '2022-10-16 11:51:14', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', '8036TPBZ0006100', 'TERMINAL', 'PHOSPHOR BRONZE；GOLD PLATED 30Μ〞MIN OVER NI 50～80Μ〞OVERALL', 60, 0, 0, 0),
('da0b5a0b29be443e9b0a8d53045587', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:24:18', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0001', 'MACHINE', 'CABLE CUTTING &amp; STRIPPING MACHINE', 30, 0, 0, 0),
('e4b82d1b4e70476daf85aa5494b37c', 'admin', '2022-10-19 14:20:12', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', '35af2cb57227422cb32784399e1a3d', '86c081e423324443860d07ea0ccefe', '8036TPBZ00A7100', 'TERMINAL', 'PHOSPHOR BRONZE；GOLD PLATED 30Μ〞MIN OVER NI 50～80Μ〞OVERALL', 60, 0, 0, 0),
('f03f5c8efbba404b8abb41370965bf', 'admin', '2022-10-16 11:51:13', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, '86c081e423324443860d07ea0ccefe', '8036G03F0004101', 'DUST CAP', 'PSU,HB,BLACK', 60, 0, 0, 0),
('f6d94df71f99416591000e95fef385', 'admin', '2022-10-16 11:51:13', NULL, NULL, 0, 'f26818522f0345a2b01aae3087a2d1', NULL, 'b74a21780d4f4f03b022847ff07bc5', '74-0050000102ZW', 'WIRE TIE', 'PE+IRON WIRE (OVAL)；BLACK', 60, 0, 0, 0),
('f73c5828ffd742ff917c350b1f43ab', 'admin', '2022-10-16 11:51:14', 'admin', '2022-10-26 16:24:32', 0, '86f419d97d74437db89f66b1ce7b1c', '5b8b8879afdb49fb97933abbeea918', '05c0b88ebdfa4799bb0563ee919965', 'CI-MACHINE-0007', 'MACHINE', 'POTTING MACHINE (RTV GLUE)', 30, 0, 0, 0);

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
('35af2cb57227422cb32784399e1a3d', 'admin', '2022-10-18 14:03:48', NULL, NULL, 0, 'RAW', 'RAW MATERIAL', 'RAW MATERIAL', 0),
('5b8b8879afdb49fb97933abbeea918', 'admin', '2022-10-17 22:27:17', 'admin', '2022-10-18 14:03:59', 0, 'MC', 'MACHINE', 'MACHINE', 0),
('9ee59af352264c96b55f495e2943cb', 'admin', '2022-10-18 14:03:29', NULL, NULL, 0, 'OE', 'OFFICE EQUIPMENT', 'OFFICE EQUIPMENT', 0),
('b5ff19fc1b1c492c837ed4f3a1ced7', 'admin', '2022-10-07 17:58:29', 'admin', '2022-10-18 14:02:28', 0, 'CON', 'CONSUMABLE', 'CONSUMABLE', 0),
('d0231aae870c42f4b02e931111e75e', 'admin', '2022-10-17 22:27:21', 'admin', '2022-10-18 14:02:47', 0, 'FG', 'FINISHED GOOD', 'FINISHED GOOD', 0);

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

--
-- Dumping data untuk tabel `item_colors`
--

INSERT INTO `item_colors` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('0593abcc48b9406cbd80ba73dd3a35', 'admin', '2022-10-14 15:12:24', NULL, NULL, 0, '2', 'BROWN (BR)', '', 0),
('2e6e3ecaa362490ab37006d6607cbb', 'admin', '2022-10-14 15:12:29', NULL, NULL, 0, '4', 'ORANGE (OR)', '', 0),
('6212758d08fe4ccebc5499e5ac1969', 'admin', '2022-10-14 15:12:40', NULL, NULL, 0, '0', 'WHITE (WH)', '', 0),
('af112381faef4e6e8a57460b9b1b38', 'admin', '2022-10-14 15:12:19', NULL, NULL, 0, '1', 'BLACK (BK)', '', 0),
('ce73c315ce2e442389b6c05a1ccad3', 'admin', '2022-10-14 15:12:34', NULL, NULL, 0, '3', 'RED (RD)', '', 0);

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
('860ace29426e456bb7884f77dcaf8a', 'admin', '2022-10-11 16:27:25', 'admin', '2022-10-18 14:30:06', 0, '004', 'OFFICE EQUIPMENT', '', 0),
('86f419d97d74437db89f66b1ce7b1c', 'admin', '2022-10-14 15:13:24', 'admin', '2022-10-18 14:30:15', 0, '005', 'MACHINE', '', 0),
('9016430cc47a455ba3a900f9d0b5d8', 'admin', '2022-10-11 16:27:01', 'admin', '2022-10-18 14:28:54', 0, '001', 'FINISH GOOD', '', 0),
('bfdc4fe7a043452486bf3090d8d74c', 'admin', '2022-10-11 16:27:09', 'admin', '2022-10-18 14:29:55', 0, '003', 'CONSUMABLE', '', 0),
('f26818522f0345a2b01aae3087a2d1', 'admin', '2022-10-11 16:26:56', 'admin', '2022-10-18 14:29:45', 0, '002', 'RAW MATERIAL', '', 0);

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

--
-- Dumping data untuk tabel `item_makers`
--

INSERT INTO `item_makers` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('0008504fafd94b0ab6f206f6bed756', 'admin', '2022-10-14 15:10:00', NULL, NULL, 0, 'G', 'GENERAL', '', 0),
('21aa29cbcc8d456fbe656b82ce3b6a', 'admin', '2022-10-14 15:10:05', NULL, NULL, 0, 'S', 'SUMIMOTO', '', 0),
('6d7906d354d14b948b28784a3d2c0b', 'admin', '2022-10-14 15:09:52', NULL, NULL, 0, 'E', 'EWINDO', '', 0);

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
-- Struktur dari tabel `item_products`
--

CREATE TABLE `item_products` (
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
-- Dumping data untuk tabel `item_products`
--

INSERT INTO `item_products` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('1cd9883ef03a45ce9da24068001d5d', 'admin', '2022-10-17 22:30:31', NULL, NULL, 0, '1', 'HARNESS', '', 0);

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

--
-- Dumping data untuk tabel `item_sizes`
--

INSERT INTO `item_sizes` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('00dcf211c58b4db39846f8db932f05', 'admin', '2022-10-14 15:12:01', NULL, NULL, 0, '30', 'AWG 30', '', 0),
('0d5a719154954210b3371358f6d61c', 'admin', '2022-10-14 15:11:20', NULL, NULL, 0, '15', '1.50 Sqm', '', 0),
('32d17539f0534a20b08c5bacd5f25d', 'admin', '2022-10-14 15:10:59', NULL, NULL, 0, '07', '0.75 Sqm', '', 0),
('4bfe4ca647dc41468673157249c8df', 'admin', '2022-10-14 15:11:31', NULL, NULL, 0, '22', 'AWG 22', '', 0),
('66c54bfe81f94acbb05f7d4da97430', 'admin', '2022-10-14 15:10:44', NULL, NULL, 0, '03', '0.35 Sqm', '', 0),
('76d011f07fc842caaef661b94b3607', 'admin', '2022-10-14 15:11:53', NULL, NULL, 0, '28', 'AWG 28', '', 0),
('9274e0cddf944d5d82ec2d72c4458c', 'admin', '2022-10-14 15:10:50', NULL, NULL, 0, '05', '0.50 Sqm', '', 0),
('962d3336b8cc4e748d997c79a67551', 'admin', '2022-10-14 15:11:26', NULL, NULL, 0, '20', '2.00 Sqm', '', 0),
('a6fa004a19a746c58424ff66b13d01', 'admin', '2022-10-14 15:11:05', NULL, NULL, 0, '08', '0.85 Sqm', '', 0),
('dd380f515d904a248419ba7a0d7d24', 'admin', '2022-10-14 15:11:13', NULL, NULL, 0, '12', '1.25 Sqm', '', 0),
('f84bc64a975445d9888f04460c029c', 'admin', '2022-10-14 15:11:43', NULL, NULL, 0, '26', 'AWG 26', '', 0),
('f8ccff1b6ea54859a7139cf9f2d3d0', 'admin', '2022-10-14 15:11:37', NULL, NULL, 0, '24', 'AWG 24', '', 0);

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

--
-- Dumping data untuk tabel `item_specifications`
--

INSERT INTO `item_specifications` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('06ac5a95b1454a919bda6b8fb2d248', 'admin', '2022-10-14 15:07:30', NULL, NULL, 0, 'V', 'OVAL CORD 2 INTI CORE', '', 0),
('449ef28a6847421abac8bafd58c052', 'admin', '2022-10-14 15:09:27', NULL, NULL, 0, 'A', 'SINGLE WIRE (TA)', '', 0),
('4a8665c4dbcd48a2ac52ac294567aa', 'admin', '2022-10-14 15:08:08', NULL, NULL, 0, '4', 'SHIELD WIRE 4 CORE', '', 0),
('5faae3890b5a47a29aa6c19d40c75e', 'admin', '2022-10-14 15:07:37', NULL, NULL, 0, 'P', 'POWER RECORD', '', 0),
('67fc47c76fdc467db7ee584c241537', 'admin', '2022-10-14 15:08:13', NULL, NULL, 0, '5', 'SHIELD WIRE 5 CORE', '', 0),
('7cdbea9374c7499289e758ebee9a90', 'admin', '2022-10-14 15:09:34', NULL, NULL, 0, 'T', 'TWIN FLAT (TF)', '', 0),
('8b3d58b725a04a3bafca1f5d5790c1', 'admin', '2022-10-14 15:07:57', NULL, NULL, 0, '2', 'SHIELD WIRE 2 CORE', '', 0),
('982ed02eab9d49efad610dda532d52', 'admin', '2022-10-14 15:08:18', NULL, NULL, 0, 'C', 'SINGLE WIRE (DTC)', '', 0),
('e768e9b441904638b76c42fc6a022a', 'admin', '2022-10-14 15:08:02', NULL, NULL, 0, '3', 'SHIELD WIRE 3 CORE', '', 0),
('e7ccd6f038704751af3cea361191c8', 'admin', '2022-10-14 15:07:45', NULL, NULL, 0, 'R', 'ROW CABLE', '', 0),
('eaba3fe031d742448cdc37db9d1119', 'admin', '2022-10-14 15:07:51', NULL, NULL, 0, '1', 'SHIELD WIRE 1 CORE', '', 0);

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

--
-- Dumping data untuk tabel `item_types`
--

INSERT INTO `item_types` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('0462e3e25b624fb8ad179bfb7e84b6', 'admin', '2022-10-14 15:10:18', NULL, NULL, 0, '1015', '1015', '', 0),
('55081db7952146868f2d48209dd3be', 'admin', '2022-10-14 15:10:13', NULL, NULL, 0, '1007', '1007', '', 0),
('5f516d53e2a14dada42302fdcbf3dd', 'admin', '2022-10-14 15:10:29', NULL, NULL, 0, '1061', '1061', '', 0),
('ee6712a98ed74506a7f20c9756d87f', 'admin', '2022-10-14 15:10:24', NULL, NULL, 0, '1032', '1032', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_orders`
--

CREATE TABLE `job_orders` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `customer_id` varchar(30) DEFAULT NULL,
  `item_id` varchar(30) DEFAULT NULL,
  `circuit` varchar(10) DEFAULT NULL,
  `trans_date` date DEFAULT NULL,
  `wire` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `size` varchar(30) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `length` varchar(30) DEFAULT NULL,
  `a_terminal` varchar(30) DEFAULT NULL,
  `a_seal` varchar(30) DEFAULT NULL,
  `a_chi` varchar(20) DEFAULT NULL,
  `a_chc` varchar(30) DEFAULT NULL,
  `a_stripping` varchar(30) DEFAULT NULL,
  `a_process` varchar(30) DEFAULT NULL,
  `a_note` varchar(30) DEFAULT NULL,
  `b_terminal` varchar(30) DEFAULT NULL,
  `b_seal` varchar(30) DEFAULT NULL,
  `b_chi` varchar(30) DEFAULT NULL,
  `b_chc` varchar(30) DEFAULT NULL,
  `b_stripping` varchar(30) DEFAULT NULL,
  `b_process` varchar(30) DEFAULT NULL,
  `b_note` varchar(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `job_orders`
--

INSERT INTO `job_orders` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `customer_id`, `item_id`, `circuit`, `trans_date`, `wire`, `type`, `size`, `color`, `length`, `a_terminal`, `a_seal`, `a_chi`, `a_chc`, `a_stripping`, `a_process`, `a_note`, `b_terminal`, `b_seal`, `b_chi`, `b_chc`, `b_stripping`, `b_process`, `b_note`, `status`) VALUES
('b03a720892334b74be0d5d5f56ce85', 'admin', '2022-11-17 13:45:37', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '1', NULL, '302CM4722G031U2', 'UL CM GRAY', '22 AWG', '3C( R.B,W)', '1590', '8036TPBZ0006100', '', '', '', '5', 'P2', '', '', '', '', '', '12.7', 'P2', 'HALF STRIP', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_order_labels`
--

CREATE TABLE `job_order_labels` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `workorder` varchar(30) DEFAULT NULL,
  `label_no` varchar(50) DEFAULT NULL,
  `circuit` varchar(30) DEFAULT NULL,
  `qty` int(11) DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `job_order_labels`
--

INSERT INTO `job_order_labels` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `workorder`, `label_no`, `circuit`, `qty`, `status`) VALUES
('12839113814549c5b3b7bd835454ac', 'ADM01', '2022-11-17 14:52:19', NULL, NULL, 0, 'WO221117-00001', 'WO221117-00001003001', '1', 500, 0),
('1d6efba7314a4efab3f86ea3d487b7', 'admin', '2022-11-04 15:22:06', NULL, NULL, 0, 'WO221104-00002', 'WO221104-00002002001', NULL, 500, 0),
('1e610160350945089fa485bf3e5cfd', 'ADM01', '2022-11-17 14:52:19', NULL, NULL, 0, 'WO221117-00001', 'WO221117-00001002001', '1', 500, 0),
('20221123000001', 'ADM01', '2022-11-23 15:49:26', NULL, NULL, 0, 'WO221123-00001', 'WO221123-00001001001', '1', 250, 0),
('20221123000002', 'ADM01', '2022-11-23 15:49:26', NULL, NULL, 0, 'WO221123-00001', 'WO221123-00001002001', '1', 250, 0),
('20221123000003', 'ADM01', '2022-11-23 15:49:26', NULL, NULL, 0, 'WO221123-00001', 'WO221123-00001003001', '1', 250, 0),
('20221125000001', 'ADM01', '2022-11-25 13:13:31', NULL, NULL, 0, 'WO221125-00001', 'WO221125-00001001001', '1', 500, 0),
('20221125000002', 'ADM01', '2022-11-25 13:13:31', NULL, NULL, 0, 'WO221125-00001', 'WO221125-00001002001', '1', 500, 0),
('20221125000003', 'ADM01', '2022-11-25 13:13:31', NULL, NULL, 0, 'WO221125-00001', 'WO221125-00001003001', '1', 500, 0),
('20221125000004', 'ADM01', '2022-11-25 13:13:31', NULL, NULL, 0, 'WO221125-00001', 'WO221125-00001004001', '1', 500, 0),
('20221125000005', 'ADM01', '2022-11-25 13:13:31', NULL, NULL, 0, 'WO221125-00001', 'WO221125-00001005001', '1', 500, 0),
('20221125000006', 'ADM01', '2022-11-25 14:11:08', NULL, NULL, 0, 'WO221125-00002', 'WO221125-00002001001', '1', 500, 0),
('20221125000007', 'ADM01', '2022-11-25 14:11:08', NULL, NULL, 0, 'WO221125-00002', 'WO221125-00002002001', '1', 500, 0),
('20221125000008', 'ADM01', '2022-11-25 14:11:08', NULL, NULL, 0, 'WO221125-00002', 'WO221125-00002003001', '1', 500, 0),
('20221125000009', 'ADM01', '2022-11-25 14:11:08', NULL, NULL, 0, 'WO221125-00002', 'WO221125-00002004001', '1', 500, 0),
('20221125000010', 'ADM01', '2022-11-25 14:11:08', NULL, NULL, 0, 'WO221125-00002', 'WO221125-00002005001', '1', 500, 0),
('20221125000011', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003001001', '1', 1000, 0),
('20221125000012', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003002001', '1', 1000, 0),
('20221125000013', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003003001', '1', 1000, 0),
('20221125000014', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003004001', '1', 1000, 0),
('20221125000015', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003005001', '1', 1000, 0),
('20221125000016', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003006001', '1', 1000, 0),
('20221125000017', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003007001', '1', 1000, 0),
('20221125000018', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003008001', '1', 1000, 0),
('20221125000019', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003009001', '1', 1000, 0),
('20221125000020', 'ADM01', '2022-11-25 14:15:06', NULL, NULL, 0, 'WO221125-00003', 'WO221125-00003010001', '1', 1000, 0),
('20221128000001', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001001001', '1', 1000, 0),
('20221128000002', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001002001', '1', 1000, 0),
('20221128000003', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001003001', '1', 1000, 0),
('20221128000004', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001004001', '1', 1000, 0),
('20221128000005', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001005001', '1', 1000, 0),
('20221128000006', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001006001', '1', 1000, 0),
('20221128000007', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001007001', '1', 1000, 0),
('20221128000008', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001008001', '1', 1000, 0),
('20221128000009', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001009001', '1', 1000, 0),
('20221128000010', 'NURYUAN', '2022-11-28 16:34:19', NULL, NULL, 0, 'WO221128-00001', 'WO221128-00001010001', '1', 1000, 0),
('20221129000001', 'ADM01', '2022-11-29 15:20:48', NULL, NULL, 0, 'WO221129-00001', 'WO221129-00001001001', '1', 500, 0),
('20221129000002', 'ADM01', '2022-11-29 15:20:48', NULL, NULL, 0, 'WO221129-00001', 'WO221129-00001002001', '1', 500, 0),
('20221129000003', 'ADM01', '2022-11-29 15:20:48', NULL, NULL, 0, 'WO221129-00001', 'WO221129-00001003001', '1', 500, 0),
('20221129000004', 'ADM01', '2022-11-29 15:20:48', NULL, NULL, 0, 'WO221129-00001', 'WO221129-00001004001', '1', 500, 0),
('20221129000005', 'ADM01', '2022-11-29 15:20:48', NULL, NULL, 0, 'WO221129-00001', 'WO221129-00001005001', '1', 500, 0),
('2781e529ce7043ba86542d6b023ecd', 'ADM01', '2022-11-17 14:52:19', NULL, NULL, 0, 'WO221117-00001', 'WO221117-00001004001', '1', 500, 0),
('2c9a872e52044c70888c33818c15e4', 'admin', '2022-11-04 15:22:06', NULL, NULL, 0, 'WO221104-00002', 'WO221104-00002004001', NULL, 500, 0),
('429ad2e12bc045ada104b219784f03', 'admin', '2022-10-28 09:11:21', NULL, NULL, 0, 'WO221028-00001', 'WO221028-00001001001', NULL, 1000, 0),
('62d1b0ba28914add9462cbbfbabafa', 'admin', '2022-11-04 15:22:06', NULL, NULL, 0, 'WO221104-00002', 'WO221104-00002005001', NULL, 500, 0),
('65284058b0e34e138313a1251c23be', 'ADM01', '2022-11-17 14:52:19', NULL, NULL, 0, 'WO221117-00001', 'WO221117-00001001001', '1', 500, 0),
('753ad5cb77af4c4d9d458f2efa647a', 'admin', '2022-11-04 15:20:26', NULL, NULL, 0, 'WO221104-00001', 'WO221104-00001003001', NULL, 500, 0),
('9a6584dc216b4464aaebe9294af051', 'admin', '2022-11-04 15:22:06', NULL, NULL, 0, 'WO221104-00002', 'WO221104-00002001001', NULL, 500, 0),
('9c627dae01264e9eaf5f0ca3379b68', 'admin', '2022-11-04 14:53:22', NULL, NULL, 0, 'WO221104-00001', 'WO221104-00001001001', NULL, 500, 0),
('9e96cf7fe2c44c248d996f178dee6f', 'admin', '2022-11-04 15:20:26', NULL, NULL, 0, 'WO221104-00001', 'WO221104-00001002001', NULL, 500, 0),
('a5216b2124804892ba35d8e4ca8009', 'admin', '2022-10-28 00:43:08', NULL, NULL, 0, 'WO221021-00001', 'WO221021-00001004001', NULL, 2000, 0),
('a982d12bbe0048b081eb17b7f678c1', 'admin', '2022-11-04 15:22:06', NULL, NULL, 0, 'WO221104-00002', 'WO221104-00002003001', NULL, 500, 0),
('bada61e452e74bebb267b9dddec032', 'admin', '2022-10-28 00:43:08', NULL, NULL, 0, 'WO221021-00001', 'WO221021-00001003001', NULL, 2000, 0),
('d281a1dd1a0c496e8b6dec6deb8ac8', 'admin', '2022-10-28 09:11:21', NULL, NULL, 0, 'WO221028-00001', 'WO221028-00001002001', NULL, 1000, 0),
('d85ce75bce544b758a4fc1a85867a1', 'ADM01', '2022-11-17 14:52:19', NULL, NULL, 0, 'WO221117-00001', 'WO221117-00001005001', '1', 500, 0),
('e14a47eba7344d7786e4d4bf69225b', 'admin', '2022-10-28 00:43:08', NULL, NULL, 0, 'WO221021-00001', 'WO221021-00001001001', NULL, 2000, 0),
('e3eea6c330ea44dc80ef0001cb315c', 'admin', '2022-11-04 15:20:26', NULL, NULL, 0, 'WO221104-00001', 'WO221104-00001004001', NULL, 500, 0),
('f32c376bf5dd49ecafd5364f956a71', 'admin', '2022-11-04 15:20:26', NULL, NULL, 0, 'WO221104-00001', 'WO221104-00001005001', NULL, 500, 0),
('fa07d8d060d745ff9802cba3e284de', 'admin', '2022-10-28 00:43:08', NULL, NULL, 0, 'WO221021-00001', 'WO221021-00001002001', NULL, 2000, 0);

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
('1958c14d5b8f404291f9c003080c13', 'admin', '2022-10-07 18:19:08', 'admin', '2022-10-16 12:15:02', 0, 'P1', 'Line P1', '', 0),
('4801964cf0f74ea491c0a7f14fa903', 'ADM01', '2022-11-17 13:19:39', NULL, NULL, 0, 'P2', 'Line P2', '-', 0),
('57567023f7004c3e889704b0f9b1c7', 'ADM01', '2022-11-17 13:19:57', NULL, NULL, 0, 'P3', 'Line P3', '-', 0);

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
('059428c1b43c4e8ca99d7314a7575b', 'admin', '2022-10-16 12:40:26', 'admin', '2022-11-22 23:52:16', 0, '5f52889797034e918456da3c3a7971', NULL, 'Historical Transactions', NULL, 'warehouse/report_history_transactions', 1, '', NULL, NULL, '', 0),
('0bf49f569bb04892bda649b91bf21d', 'admin', '2022-10-16 12:46:14', NULL, NULL, 0, 'ae9dda6c8d9e4366a241528c7390ff', NULL, 'Pertanggung Jawaban Barang Jad', NULL, 'beacukai/pertanggung_jawaban_barang_jadi', 4, '', NULL, NULL, '', 0),
('0e4bb0451f1d4a64a4f7be6be13708', 'admin', '2022-10-07 21:38:10', 'admin', '2022-10-07 21:38:36', 0, '93d8c32f689c41399f7ccb5ce434c3', NULL, 'Production Schedules', NULL, 'planning/production_schedules', 2, '', NULL, NULL, '', 0),
('1bae0b2618ae47b5b7884c40519b61', 'admin', '2022-10-19 22:47:40', NULL, NULL, 0, 'da7ff9a6b87a4b77bf7d89ef1f0c62', NULL, 'Locations', NULL, 'warehouse/fg_locations', 1, '', NULL, NULL, '', 0),
('1d9918c716514cdfac598ba366aaef', 'admin', '2022-10-24 11:48:12', 'admin', '2022-10-28 00:11:45', 0, '76e9ec30b2274d13b6fd78bd9771b0', NULL, 'Job Order Parameter', NULL, 'engineering/job_orders', 3, '', NULL, NULL, '', 0),
('1f0d78d3e80a457bb0914831b94c7b', 'admin', '2022-10-16 12:42:52', NULL, NULL, 0, 'e7f55074baa54065bca03b77c62574', NULL, 'Delivery Orders', NULL, 'shipping/delivery_orders', 1, '', NULL, NULL, '', 0),
('23ce7975fd3a45abaf71ef4a805056', 'admin', '2022-10-16 12:38:59', 'admin', '2022-10-19 22:48:18', 0, 'da7ff9a6b87a4b77bf7d89ef1f0c62', NULL, 'Wip Receipts', NULL, 'warehouse/wip_receipts', 3, '', NULL, NULL, '', 0),
('255bcee4fb4c45d8aa938b8279893c', 'admin', '2022-10-07 18:05:21', 'admin', '2022-10-07 18:07:44', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Customers', NULL, 'master/customers', 4, '', NULL, NULL, '', 0),
('2a4389152cc646148f199267b768d0', 'admin', '2022-11-04 21:06:23', 'admin', '2022-11-05 23:22:26', 0, '834ee81f71d14a1ba35708d85f7526', NULL, 'Outstanding PR', NULL, 'purchase/report_outstanding_pr', 2, '', NULL, NULL, '', 0),
('2c33a59b7b6c41be80df4129f90b71', 'admin', '2022-10-26 11:41:41', 'admin', '2022-11-15 10:14:43', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Warehouse **', NULL, '', 1, '', NULL, NULL, '', 0),
('2d0a643865084c4ba9fbc7869370fa', 'admin', '2022-10-16 12:45:54', NULL, NULL, 0, 'ae9dda6c8d9e4366a241528c7390ff', NULL, 'Pertanggung Jawaban Penolong', NULL, 'beacukai/pertanggung_jawaban_penolong', 3, '', NULL, NULL, '', 0),
('3038d96df22048608bbbb8762bbe24', 'admin', '2022-10-07 18:06:43', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Unit Of Measure', NULL, 'master/uom', 9, '', NULL, NULL, '', 0),
('30baffda74154b428e3effd069d09e', 'admin', '2022-11-14 21:19:04', 'admin', '2022-11-14 21:33:06', 0, '4f841c89e8274fd88335b2346d1ee2', NULL, 'Scrap WIP **', NULL, '', 2, '', NULL, NULL, '', 0),
('3257e9a11a8543b8afd8e27c0a21d2', 'admin', '2022-11-14 22:24:23', NULL, NULL, 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Return Material **', NULL, '', 9, '', NULL, NULL, '', 0),
('3265ca2128e841a9ba488846de25f7', 'admin', '2022-10-16 12:44:03', NULL, NULL, 0, '8344f4bb673644908cf7f59e61f84d', NULL, 'A/P Aging Schedules', NULL, 'finance/ap_schedules', 2, '', NULL, NULL, '', 0),
('3562627a9d084609a7dea66faf8598', 'admin', '2022-10-17 22:24:53', 'admin', '2022-10-17 22:25:25', 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Products', NULL, 'master/item_products', 8, '', NULL, NULL, '', 0),
('37f8809007bf4f16aa993f6c0548e9', 'admin', '2022-11-04 21:26:14', 'admin', '2022-11-04 21:35:42', 0, '1288d74e8d834fd69abd1b7460dc15', NULL, 'Historical Transaction FG **', NULL, '', 1, '', NULL, NULL, '', 0),
('39894a92c9e9456997bb6af3b21bd3', 'admin', '2022-10-07 17:23:06', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Sizes', NULL, 'master/item_sizes', 5, '', NULL, NULL, '', 0),
('3c5e75290ca947eab000aa09269753', 'admin', '2022-10-07 18:07:01', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Line Productions', NULL, 'master/lines', 10, '', NULL, NULL, '', 0),
('3ca074598cf94973b83bb1facb1190', 'admin', '2022-10-07 17:22:58', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Types', NULL, 'master/item_types', 4, '', NULL, NULL, '', 0),
('3dd1a46ef2834b79a8da5080c496e4', 'admin', '2022-10-07 17:23:26', 'admin', '2022-10-07 17:47:28', 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Colors', NULL, 'master/item_colors', 6, '', NULL, NULL, '', 0),
('3f423b73a7b04367853767d7de4bc5', 'admin', '2022-10-13 16:14:28', 'admin', '2022-10-26 11:49:14', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Barcode Divides', NULL, 'warehouse/barcode_divides', 7, '', NULL, NULL, '', 0),
('42c5d26116ee453e9225b91d3c827d', 'admin', '2022-10-16 12:43:53', NULL, NULL, 0, '8344f4bb673644908cf7f59e61f84d', NULL, 'A/R Aging Schedules', NULL, 'finance/ar_schedules', 1, '', NULL, NULL, '', 0),
('4436260df6074dfb8676de448a1a89', 'admin', '2022-10-26 11:23:34', 'admin', '2022-11-14 20:56:50', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Transaction Type', NULL, 'master/transaction_types', 3, '', NULL, NULL, '', 0),
('44964312f0264429978158ada88843', 'admin', '2022-09-29 16:12:08', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Users', NULL, 'admin/users', 2, '', NULL, NULL, '', 0),
('48be2218f3134d0d900c14b875cd4b', 'admin', '2022-10-19 22:47:47', NULL, NULL, 0, 'da7ff9a6b87a4b77bf7d89ef1f0c62', NULL, 'Location Items', NULL, 'warehouse/fg_location_items', 2, '', NULL, NULL, '', 0),
('4f841c89e8274fd88335b2346d1ee2', 'admin', '2022-10-13 15:34:01', 'admin', '2022-10-24 11:23:35', 0, '', NULL, 'Production', NULL, '', 6, '', NULL, NULL, 'closed', 0),
('50db640c2a0f47ab8958d00958d1b7', 'admin', '2022-10-16 12:43:01', NULL, NULL, 0, 'e7f55074baa54065bca03b77c62574', NULL, 'Delivery Notes', NULL, 'shipping/delivery_notes', 2, '', NULL, NULL, '', 0),
('50f02a4e5e0845f4aab2b43bf63047', 'admin', '2022-10-26 11:48:34', NULL, NULL, 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Warehouse Transfer', NULL, '', 4, '', NULL, NULL, '', 0),
('5214613be76e4e08ab01a260c8ef55', 'admin', '2022-10-16 12:46:49', NULL, NULL, 0, 'ae9dda6c8d9e4366a241528c7390ff', NULL, 'Pertanggung Jawaban Mesin Kant', NULL, 'beacukai/pertanggung_jawaban_mesin_kantor', 6, '', NULL, NULL, '', 0),
('5666bae5c6254bab977fcd4fd7129e', 'admin', '2022-10-19 22:48:06', 'admin', '2022-10-26 11:42:06', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Locations', NULL, 'warehouse/rm_locations', 2, '', NULL, NULL, '', 0),
('5ad1d62d08a3408d9ab3a84c105d15', 'admin', '2022-10-13 16:14:00', 'admin', '2022-10-26 11:48:52', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Issued Materials', NULL, 'warehouse/issued_materials', 5, '', NULL, NULL, '', 0),
('5cf9545d619a497ab20036d1c587c6', 'admin', '2022-11-04 21:15:14', 'admin', '2022-11-14 19:39:53', 0, '5f52889797034e918456da3c3a7971', NULL, 'Check Serial No', NULL, 'warehouse/report_check_serialno', 3, '', NULL, NULL, '', 0),
('5f52889797034e918456da3c3a7971', 'admin', '2022-10-16 12:39:34', 'admin', '2022-11-28 22:35:35', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Reports', NULL, '', 12, '', NULL, NULL, 'closed', 0),
('612df21b8cd34fb5869011b0e92f81', 'admin', '2022-10-07 17:22:46', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Makers', NULL, 'master/item_makers', 3, '', NULL, NULL, '', 0),
('62309884bfe74e5696f10f32243d97', 'admin', '2022-10-07 17:22:15', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Item Cards', NULL, 'master/items', 1, '', NULL, NULL, '', 0),
('62482f126fe940939924a187d617ea', 'admin', '2022-11-04 20:55:41', 'admin', '2022-11-05 23:22:08', 0, 'f0546fc46bf54b9385492a0da1fbf2', NULL, 'Outstanding SO', NULL, 'planning/report_outstanding_so', 1, '', NULL, NULL, '', 0),
('670141b0c0ac4f61bba46f0c85acd6', 'admin', '2022-10-12 04:55:52', NULL, NULL, 0, 'c10a8ffd0165455989b58f9090798c', NULL, 'Purchase Order Receipts', NULL, 'purchase/purchase_order_receipts', 3, '', NULL, NULL, '', 0),
('687d6466b56c4d0f926dd655ae7ab9', 'admin', '2022-10-16 12:47:04', NULL, NULL, 0, 'ae9dda6c8d9e4366a241528c7390ff', NULL, 'Posisi WIP', NULL, 'beacukai/posisi_wip', 7, '', NULL, NULL, '', 0),
('6ccd20c54d1d415189120ec5cc6c81', 'admin', '2022-09-29 16:41:40', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Config', NULL, 'admin/config', 7, '', NULL, NULL, '', 0),
('7097c7632da5440994c39f828678ab', 'admin', '2022-10-16 12:46:32', NULL, NULL, 0, 'ae9dda6c8d9e4366a241528c7390ff', NULL, 'Pertanggung Jawaban Barang Scr', NULL, 'beacukai/pertanggung_jawaban_barang_scrap', 5, '', NULL, NULL, '', 0),
('76e9ec30b2274d13b6fd78bd9771b0', 'admin', '2022-10-24 11:20:53', 'admin', '2022-10-26 11:31:04', 0, '', NULL, 'Engineering', NULL, '', 2, '', NULL, NULL, 'closed', 0),
('77b2347e87ce44baab3508ea740325', 'admin', '2022-11-04 21:26:32', 'admin', '2022-11-04 21:37:15', 0, '1288d74e8d834fd69abd1b7460dc15', NULL, 'Stock Value  FG **', NULL, '', 2, '', NULL, NULL, '', 0),
('7b3fd71d12d04dfdbfe4323903def5', 'admin', '2022-10-07 21:38:23', 'admin', '2022-10-07 21:38:32', 0, '93d8c32f689c41399f7ccb5ce434c3', NULL, 'Supply Sheets', NULL, 'planning/supply_sheets', 3, '', NULL, NULL, '', 0),
('7d7f997ca58f425c8783ff7a7f994c', 'admin', '2022-10-07 18:04:20', 'admin', '2022-11-13 22:44:34', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Product Familys', NULL, 'master/item_familys', 1, '', NULL, NULL, '', 0),
('7e92720f68204d2b948412828a116b', 'admin', '2022-10-16 12:38:34', 'admin', '2022-10-26 11:49:04', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Item Receipts', NULL, 'warehouse/item_receipts', 6, '', NULL, NULL, '', 0),
('8001792212e640eb8e67b13a16a26d', 'admin', '2022-10-07 18:02:48', 'admin', '2022-10-24 11:30:32', 0, '76e9ec30b2274d13b6fd78bd9771b0', NULL, 'Bill Of Materials', NULL, 'master/bom', 2, '', NULL, NULL, '', 0),
('8344f4bb673644908cf7f59e61f84d', 'admin', '2022-10-16 12:42:09', 'admin', '2022-10-24 11:24:23', 0, '', NULL, 'Finance', NULL, '', 10, '', NULL, NULL, 'closed', 0),
('834ee81f71d14a1ba35708d85f7526', 'admin', '2022-10-26 11:53:43', 'admin', '2022-10-26 11:57:10', 0, 'c10a8ffd0165455989b58f9090798c', NULL, 'Report ', NULL, '', 4, '', NULL, NULL, 'closed', 0),
('865cff3b613848cebcc7cb9667fbb1', 'admin', '2022-10-16 12:45:08', NULL, NULL, 0, 'ae9dda6c8d9e4366a241528c7390ff', NULL, 'Pemasukan Pabean', NULL, 'beacukai/pemasukan_pabean', 1, '', NULL, NULL, '', 0),
('8a5ae39e16a54354bd0ea87c1ff963', 'admin', '2022-10-07 18:07:11', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Plants', NULL, 'master/plants', 11, '', NULL, NULL, '', 0),
('8f2e2ea5fa0649619863e4a30f1cbc', 'admin', '2022-10-12 04:55:32', NULL, NULL, 0, 'c10a8ffd0165455989b58f9090798c', NULL, 'Purchase Orders', NULL, 'purchase/purchase_orders', 2, '', NULL, NULL, '', 0),
('90af5528e9a4458585b2d74bb73b05', 'admin', '2022-10-07 17:22:38', 'admin', '2022-10-24 11:44:25', 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Specifications', NULL, 'master/item_specifications', 2, '', NULL, NULL, '', 0),
('92502b9d5bf7422d9e108068e2316c', 'admin', '2022-10-26 11:24:43', 'admin', '2022-11-04 21:17:46', 0, '76e9ec30b2274d13b6fd78bd9771b0', NULL, 'Where Used **', NULL, '', 4, '', NULL, NULL, '', 0),
('93d8c32f689c41399f7ccb5ce434c3', 'admin', '2022-10-07 21:37:16', 'admin', '2022-10-24 11:23:03', 0, '', NULL, 'Planning', NULL, '', 4, '', NULL, NULL, 'closed', 0),
('93d9f074b9e142eaa1103045d07273', 'admin', '2022-10-16 12:45:20', NULL, NULL, 0, 'ae9dda6c8d9e4366a241528c7390ff', NULL, 'Pengeluaran Pabean', NULL, 'beacukai/pengeluaran_pabean', 2, '', NULL, NULL, '', 0),
('955ae49b75df4f678ec2324489ae3d', 'admin', '2022-10-19 22:47:58', 'admin', '2022-10-26 11:42:14', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Location Items', NULL, 'warehouse/rm_location_items', 3, '', NULL, NULL, '', 0),
('9c04c7dfcf6c44cc9a0ec44b1c7691', 'admin', '2022-10-13 16:06:35', 'admin', '2022-10-24 11:23:51', 0, '', NULL, 'Warehouse RM', NULL, '', 7, '', NULL, NULL, 'closed', 0),
('a015669f743f49d18be7541f4e9e4f', 'admin', '2022-10-07 17:23:39', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', NULL, 'Options', NULL, 'master/item_options', 7, '', NULL, NULL, '', 0),
('a5d9db23534f44fa9d58a7f996ce2a', 'admin', '2022-10-07 18:05:36', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Suppliers', NULL, 'master/suppliers', 6, '', NULL, NULL, '', 0),
('a98a56d8e07944d4a5a3d628358f03', 'admin', '2022-10-07 18:06:19', 'admin', '2022-10-07 18:07:49', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Customer Items', NULL, 'master/customer_items', 5, '', NULL, NULL, '', 0),
('ac590aa34b8d4d85aebeaa6d6ee4a0', 'admin', '2022-11-14 21:36:49', 'admin', '2022-11-14 21:36:57', 0, 'da7ff9a6b87a4b77bf7d89ef1f0c62', NULL, 'Scrap FG **', NULL, '', 4, '', NULL, NULL, '', 0),
('ae9dda6c8d9e4366a241528c7390ff', 'admin', '2022-10-16 12:42:17', 'admin', '2022-10-24 11:24:40', 0, '', NULL, 'Beacukai', NULL, '', 11, '', NULL, NULL, 'closed', 0),
('b3caa83cf1534926a614edc17ed055', 'admin', '2022-10-12 04:55:22', NULL, NULL, 0, 'c10a8ffd0165455989b58f9090798c', NULL, 'Purchase Requests', NULL, 'purchase/purchase_requests', 1, '', NULL, NULL, '', 0),
('b679033b3256414b8f916c69f17674', 'admin', '2022-09-29 16:22:01', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Approval', NULL, 'admin/approvals', 1, '', NULL, NULL, '', 0),
('b7f1f62e48c34c73ba97bef9e22ffb', 'admin', '2022-11-12 23:20:20', NULL, NULL, 0, 'f0546fc46bf54b9385492a0da1fbf2', NULL, 'Outstanding WO', NULL, 'planning/report_outstanding_wo', 2, '', NULL, NULL, '', 0),
('c10a8ffd0165455989b58f9090798c', 'admin', '2022-10-12 04:54:07', 'admin', '2022-10-24 11:23:23', 0, '', NULL, 'Purchasing', NULL, '', 5, '', NULL, NULL, 'closed', 0),
('c5e3a7bb003a42309c42907778173d', 'admin', '2022-10-13 15:38:32', 'admin', '2022-11-28 22:34:49', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Supply Materials', NULL, 'production/supply_materials', 11, '', NULL, NULL, '', 0),
('c8f8362a5f6c432ab27d37213f15d4', 'admin', '2022-09-29 16:35:49', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Setting Users', NULL, 'admin/setting_users', 6, '', NULL, NULL, '', 0),
('c98376ce677644eea31e91bcb49438', 'admin', '2022-10-07 18:06:31', 'admin', '2022-10-07 18:08:03', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Supplier Items', NULL, 'master/supplier_items', 7, '', NULL, NULL, '', 0),
('cf98f97766f6405590b26daa586e00', 'admin', '2022-09-29 16:05:52', NULL, NULL, 0, '', NULL, 'Administrator', NULL, '', 1, '', NULL, NULL, 'closed', 0),
('d13439e3f2324450a69b4e0e50159a', 'admin', '2022-09-29 16:15:42', 'admin', '2022-09-29 16:36:50', 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Menu', NULL, 'admin/menus', 3, '', NULL, NULL, '', 0),
('d188047ab21d45979c64c990a91e23', 'admin', '2022-10-07 18:04:43', 'admin', '2022-10-07 18:20:27', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Currencies', NULL, 'master/currencies', 8, '', NULL, NULL, '', 0),
('da7ff9a6b87a4b77bf7d89ef1f0c62', 'admin', '2022-10-18 08:55:12', 'admin', '2022-10-24 11:24:04', 0, '', NULL, 'Warehouse FG', NULL, '', 8, '', NULL, NULL, 'closed', 0),
('de3f6855009e49deb7fd2fdd0f3b3d', 'admin', '2022-09-29 16:32:23', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Logs', NULL, 'admin/logs', 4, '', NULL, NULL, '', 0),
('de6779722f6347d798b07350eee0ef', 'admin', '2022-11-14 22:26:21', 'admin', '2022-11-14 22:30:05', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Part Request **', NULL, '', 10, '', NULL, NULL, '', 0),
('e0f3586f91ee4ab2952b6a8ad0f5db', 'admin', '2022-10-07 17:21:14', 'admin', '2022-10-24 11:22:48', 0, '', NULL, 'Master Data', NULL, '', 3, '', NULL, NULL, 'closed', 0),
('e3c31e10b6c64e119b068ae4b73be6', 'admin', '2022-09-29 16:35:33', 'admin', '2022-09-29 16:36:31', 0, 'cf98f97766f6405590b26daa586e00', NULL, 'Setting Menu', NULL, 'admin/setting_menus', 5, '', NULL, NULL, '', 0),
('e505e5e5d2564aa280b3d568c8dd6c', 'admin', '2022-11-14 20:57:28', 'admin', '2022-11-14 20:59:55', 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', NULL, 'Adjusment **', NULL, '', 8, '', NULL, NULL, '', 0),
('e780677ba5764a128f4ae77e3b720e', 'admin', '2022-10-07 21:37:33', 'admin', '2022-10-07 21:38:43', 0, '93d8c32f689c41399f7ccb5ce434c3', NULL, 'Sales Orders', NULL, 'planning/sales_orders', 1, '', NULL, NULL, '', 0),
('e7f55074baa54065bca03b77c62574', 'admin', '2022-10-16 12:41:56', 'admin', '2022-10-24 11:24:12', 0, '', NULL, 'Shipping', NULL, '', 9, '', NULL, NULL, 'closed', 0),
('e9d8310044d3481f81834d14f91bd7', 'admin', '2022-10-07 17:21:33', 'admin', '2022-10-24 11:42:19', 0, '76e9ec30b2274d13b6fd78bd9771b0', NULL, 'Items', NULL, '', 1, '', NULL, NULL, 'closed', 0),
('ec2cdc9e44cb4ccba8f21e9dac5a9e', 'admin', '2022-10-16 13:56:46', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'BC Kind', NULL, 'master/bc_kind', 12, '', NULL, NULL, '', 0),
('ec436420c2734ec3a864eeedbe53c6', 'admin', '2022-10-07 17:25:13', 'admin', '2022-10-26 11:21:27', 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', NULL, 'Categories', NULL, 'master/item_categories', 2, '', NULL, NULL, '', 0),
('f0546fc46bf54b9385492a0da1fbf2', 'admin', '2022-11-04 20:50:31', 'admin', '2022-11-04 20:58:15', 0, '93d8c32f689c41399f7ccb5ce434c3', NULL, 'Report', NULL, '', 4, '', NULL, NULL, 'closed', 0),
('fd04621539994742b73c6f4cbfa63e', 'admin', '2022-10-26 11:54:57', 'admin', '2022-11-05 23:22:17', 0, '834ee81f71d14a1ba35708d85f7526', NULL, 'Outstanding PO', NULL, 'purchase/report_outstanding_po', 1, '', NULL, NULL, '', 0);

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
  `so_number` varchar(30) DEFAULT NULL,
  `so_date` date DEFAULT NULL,
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

INSERT INTO `production_schedules` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `customer_id`, `item_id`, `line_id`, `so_number`, `so_date`, `workorder`, `trans_date`, `period`, `month`, `year`, `wp`, `qty`, `status`) VALUES
('20221129000001', 'ADM01', '2022-11-29 12:09:29', NULL, NULL, 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', '1958c14d5b8f404291f9c003080c13', 'SOOC0001-221125-0001', '2022-11-25', 'WO221129-00001', '2022-11-29', '202211', '11', '2022', '1', 500, 1);

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
  `po_date` date DEFAULT NULL,
  `po_name` varchar(50) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `qty` decimal(11,2) NOT NULL DEFAULT 0.00,
  `remarks` text DEFAULT NULL,
  `revision` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `supplier_id`, `item_id`, `request_no`, `request_date`, `request_name`, `po_no`, `po_date`, `po_name`, `delivery_date`, `qty`, `remarks`, `revision`, `status`) VALUES
('0c3c6d3fa79d46a189d3d63a530073', 'admin', '2022-10-19 10:31:57', 'WHS01', '2022-11-16 13:57:06', 0, '78daa32796a94d1fa37ba9e3db6451', '5ed6a9df03334e65b29657a7051407', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '2.00', '', 4, 1),
('16657497715e45c2a0b676fb7c830c', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', '959962f44c0f44a29761da251f3cf5', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '146400.00', '', 0, 1),
('1759277ac1434e6b845ef61d889267', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', 'f03f5c8efbba404b8abb41370965bf', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '100000.00', '', 0, 1),
('1d2c461a65b5412aa32d8d55e412af', 'admin', '2022-10-19 10:31:57', 'WHS01', '2022-11-16 13:57:06', 0, '78daa32796a94d1fa37ba9e3db6451', '84ed48f24e424cedbae66d03750af9', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '2.00', '', 6, 1),
('20ddd92166d44efe844f206209ee06', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:03', 0, '66cf921a21a54002a07722c1d9fc42', 'f6d94df71f99416591000e95fef385', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '16000.00', '', 0, 1),
('3b370d6d6a7c40be83aba0c157cb23', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', '3e70bdfd80f5405780dbf3b530e009', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '100000.00', '', 0, 1),
('3d14d9cfa1ea45b6b18f0f878c9518', 'admin', '2022-10-19 10:31:57', 'WHS01', '2022-11-16 13:57:06', 0, '78daa32796a94d1fa37ba9e3db6451', '04fe43996a1c4c36948c5242d9a7b8', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '2.00', '', 2, 1),
('4a8c1d2c0402419fbdf9da18d99b60', 'admin', '2022-10-19 10:31:57', 'WHS01', '2022-11-16 13:57:06', 0, '78daa32796a94d1fa37ba9e3db6451', 'c6f46c95ec004f819348ae736fb99c', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '1.00', '', 1, 1),
('5711c9b4565044e08a43d4208aa7ec', 'admin', '2022-10-19 10:31:57', 'admin', '2022-10-27 08:49:59', 0, '78daa32796a94d1fa37ba9e3db6451', '1461a62f894140b8ac1fd858936796', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '1.00', '', 1, 1),
('607e3cb409e84438827d4789349bc5', 'admin', '2022-10-19 11:10:32', 'admin', '2022-10-27 08:51:17', 0, '78daa32796a94d1fa37ba9e3db6451', '7d0c84c8a32545ab977aac1c568c0f', 'PR-003221019-0001', '2022-10-19', 'Administrator', 'PO-003221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '1.00', '', 1, 1),
('64d11acfc34f436683b78dfdc21ce1', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', 'b5099016fd8c487ebdb5b7b4af1d67', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '500.00', '', 0, 1),
('65b0dd159db84cf58ce89bb7f04659', 'admin', '2022-10-19 10:31:57', 'WHS01', '2022-11-16 13:57:06', 0, '78daa32796a94d1fa37ba9e3db6451', '996b6ffe582c495494a1c45d179fd6', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '1.00', '', 1, 1),
('6c419f1dafb14dc8911a5be686856b', 'admin', '2022-10-19 11:10:32', 'ADM01', '2022-11-16 08:14:21', 0, '78daa32796a94d1fa37ba9e3db6451', '5bf5c56dea2745b9925d11cfbfa4a2', 'PR-003221019-0001', '2022-10-19', 'Administrator', 'PO-003221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '20.00', '', 14, 1),
('6fca0ff0823a40c5822e13a5df28af', 'admin', '2022-10-19 10:31:57', 'WHS01', '2022-11-16 13:57:06', 0, '78daa32796a94d1fa37ba9e3db6451', 'da0b5a0b29be443e9b0a8d53045587', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '1.00', '', 1, 1),
('83dfb70c8f51462398b44630709397', 'admin', '2022-10-19 10:31:57', 'WHS01', '2022-11-16 13:57:06', 0, '78daa32796a94d1fa37ba9e3db6451', 'a0f00c476c3447dc81d9450fa51a42', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '1.00', '', 1, 1),
('8af08043950144aea436393f1c096d', 'admin', '2022-10-19 10:31:57', 'admin', '2022-10-27 08:50:41', 0, '78daa32796a94d1fa37ba9e3db6451', '7a1631ccb6554010b9e6d7af7a2810', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '2.00', '', 2, 1),
('8d5ce79f04ed44cca0511e3617bc39', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:03', 0, '66cf921a21a54002a07722c1d9fc42', '624c4bd2693743b48ff8ec6a1011e8', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '50.00', '', 0, 1),
('9238aff6b3704b95a5e6a6b1db232c', 'admin', '2022-10-18 15:03:54', 'admin', '2022-10-27 11:09:00', 0, '661774e2f9124620aa42da8c2c4ab9', '57748ea624ea42f8a3d2c9ea9f8776', 'PR-002221018-0001', '2022-10-18', 'Administrator', 'PO-002221018-0001', '2022-10-18', 'Administrator', '2022-10-14', '76.20', '', 5, 0),
('9a730065ce084ef2bb90ea52a6d325', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:03', 0, '66cf921a21a54002a07722c1d9fc42', '10af05969b8042799c703dcd435d08', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '104000.00', '', 0, 1),
('a3e24f51fcfb4164be9106f0681393', 'admin', '2022-10-20 11:26:30', 'admin', '2022-11-21 23:46:43', 0, 'cf55c130c8ae47a690c88382589ea2', '614b430c9c2f4260b240e5cf44ad73', 'PR-002221020-0002', '2022-10-20', 'Administrator', 'PO-002221020-0001', '2022-10-20', 'Administrator', '2022-11-14', '2000.00', '', 1, 1),
('a983ca5e80264df79ab0c469b5c0e0', 'admin', '2022-10-19 15:53:57', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', '91975e7b4d394c0a88563cc154d9c3', 'PR-003221019-0002', '2022-10-19', 'Administrator', 'PO-003221019-0002', '2022-10-19', 'Administrator', '2022-11-14', '350.00', '', 0, 1),
('a9d487ee7fc64c53acd0d4861f5412', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', 'a995527a67594ce0af5a2298712860', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '7200.00', '', 0, 1),
('b8ae024cc3dc451c9741b9fb934c03', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:03', 0, '66cf921a21a54002a07722c1d9fc42', 'e4b82d1b4e70476daf85aa5494b37c', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '288000.00', '', 0, 1),
('b9a8493764f9416192300757aafae4', 'admin', '2022-10-20 11:26:42', 'WHS01', '2022-11-21 10:10:38', 0, 'af5c257b9a2d4306ae07e9d6cbb80b', '98a74ee45aa84fdea4a995a8f94c72', 'PR-002221020-0003', '2022-10-20', 'Administrator', 'PO-002221020-0002', '2022-10-20', 'Administrator', '2022-11-14', '80.00', '', 2, 1),
('c1eb17ab90764e80a63ebef1e4b504', 'admin', '2022-10-19 11:10:32', 'ADM01', '2022-11-16 08:14:00', 0, '78daa32796a94d1fa37ba9e3db6451', '0d6841b5f98542179a5114022f0f59', 'PR-003221019-0001', '2022-10-19', 'Administrator', 'PO-003221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '10.00', '', 6, 1),
('d33a241a9c1d4255bc844c2e658ca2', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', '9b9b4c19c11349b4bc1f059a1d4159', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '105000.00', '', 0, 1),
('da01bab708884aaa909d4ec79308f2', 'admin', '2022-10-19 15:53:57', 'admin', '2022-11-14 23:59:26', 0, '66cf921a21a54002a07722c1d9fc42', 'b0fd68d0868e4433acc74b897b5b18', 'PR-003221019-0002', '2022-10-19', 'Administrator', 'PO-003221019-0002', '2022-10-19', 'Administrator', '2022-11-14', '0.00', '', 1, 0),
('dcde187dfef14f18bed8162792cbf8', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 14:57:34', 0, '66cf921a21a54002a07722c1d9fc42', '19d58c090ea14cdc994a8baa312c33', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '104000.00', '', 0, 1),
('e49c798ac06949c19a986d00cadf1a', 'admin', '2022-10-18 15:03:54', 'admin', '2022-10-27 11:09:00', 0, '661774e2f9124620aa42da8c2c4ab9', 'ae1e4ae4b24d4f598f5390ead6be52', 'PR-002221018-0001', '2022-10-18', 'Administrator', 'PO-002221018-0001', '2022-10-18', 'Administrator', '2022-10-14', '42.64', '', 3, 0),
('e7b1fedebbdd43d6a6d72843aaf276', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', '258d134422724290aa869aed97c018', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '100000.00', '', 0, 1),
('f1445231f18649b0b6c020fca93e21', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 14:57:34', 0, '66cf921a21a54002a07722c1d9fc42', 'bed6c03ec4bf41f5bcdcd425d6d528', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '5000.00', '', 0, 1),
('f4051c997bd54607af14e66e57b81a', 'admin', '2022-10-19 15:43:06', 'WHS01', '2022-11-17 12:40:04', 0, '66cf921a21a54002a07722c1d9fc42', '3714e81e66f34ba5aa8da4579a9627', 'PR-002221019-0001', '2022-10-19', 'Administrator', 'PO-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', '4500.00', '', 0, 1),
('f4078d2a7e24405fadea29cb5046f4', 'admin', '2022-10-19 10:31:57', 'WHS01', '2022-11-16 13:57:06', 0, '78daa32796a94d1fa37ba9e3db6451', 'f73c5828ffd742ff917c350b1f43ab', 'PR-005221019-0001', '2022-10-19', 'Administrator', 'PO-005221019-0001', '2022-10-19', 'Administrator', '2022-11-11', '2.00', '', 20, 1),
('f603895b20804cfa9e9356566ea09e', 'admin', '2022-10-26 16:36:33', 'admin', '2022-10-27 10:10:12', 0, 'af5c257b9a2d4306ae07e9d6cbb80b', '98a74ee45aa84fdea4a995a8f94c72', 'PR-002221026-0003', '2022-12-01', 'Administrator', 'PO-002221026-0001', '2022-10-26', 'Administrator', '2022-12-01', '70.00', '', 1, 0);

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
('20221129000001', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120001', 7000, 0),
('20221129000002', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120002', 7000, 0),
('20221129000003', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120003', 7000, 0),
('20221129000004', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120004', 7000, 0),
('20221129000005', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120005', 7000, 0),
('20221129000006', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120006', 7000, 0),
('20221129000007', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120007', 7000, 0),
('20221129000008', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120008', 7000, 0),
('20221129000009', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120009', 7000, 0),
('20221129000010', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120010', 7000, 0),
('20221129000011', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120011', 7000, 0),
('20221129000012', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120012', 7000, 0),
('20221129000013', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120013', 7000, 0),
('20221129000014', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120014', 7000, 0),
('20221129000015', 'admin', '2022-11-29 16:54:16', NULL, NULL, 0, 'POR-221117-000012', 'POR-221117-0000120015', 7000, 0),
('20221129000016', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140001', 10, 0),
('20221129000017', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140002', 10, 0),
('20221129000018', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140003', 10, 0),
('20221129000019', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140004', 10, 0),
('20221129000020', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140005', 10, 0),
('20221129000021', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140006', 10, 0),
('20221129000022', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140007', 10, 0),
('20221129000023', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140008', 10, 0),
('20221129000024', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140009', 10, 0),
('20221129000025', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140010', 10, 0),
('20221129000026', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140011', 10, 0),
('20221129000027', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140012', 10, 0),
('20221129000028', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140013', 10, 0),
('20221129000029', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140014', 10, 0),
('20221129000030', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140015', 10, 0),
('20221129000031', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140016', 10, 0),
('20221129000032', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140017', 10, 0),
('20221129000033', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140018', 10, 0),
('20221129000034', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140019', 10, 0),
('20221129000035', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140020', 10, 0),
('20221129000036', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140021', 10, 0),
('20221129000037', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140022', 10, 0),
('20221129000038', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140023', 10, 0),
('20221129000039', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140024', 10, 0),
('20221129000040', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140025', 10, 0),
('20221129000041', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140026', 10, 0),
('20221129000042', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140027', 10, 0),
('20221129000043', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140028', 10, 0),
('20221129000044', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140029', 10, 0),
('20221129000045', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140030', 10, 0),
('20221129000046', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140031', 10, 0),
('20221129000047', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140032', 10, 0),
('20221129000048', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140033', 10, 0),
('20221129000049', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140034', 10, 0),
('20221129000050', 'admin', '2022-11-29 16:57:27', NULL, NULL, 0, 'POR-221117-000014', 'POR-221117-0000140035', 10, 0),
('20221129000051', 'admin', '2022-11-29 16:57:46', NULL, NULL, 0, 'POR-221117-000013', 'POR-221117-0000130001', 2700, 0),
('20221129000052', 'admin', '2022-11-29 16:57:46', NULL, NULL, 0, 'POR-221117-000013', 'POR-221117-0000130002', 2700, 0),
('20221129000053', 'admin', '2022-11-29 16:57:46', NULL, NULL, 0, 'POR-221117-000013', 'POR-221117-0000130003', 1800, 0);

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
  `bc_aju` varchar(30) DEFAULT NULL,
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

INSERT INTO `purchase_order_receipts` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `supplier_id`, `item_id`, `receipt_date`, `receipt_no`, `receipt_id`, `po_no`, `bc_kind`, `bc_aju`, `bc_document`, `bc_date`, `awb_no`, `awb_date`, `qty_po`, `qty_os`, `qty_receipt`, `qty_mpq`, `qty_label`, `status`) VALUES
('104f1f48a08c4c5683a55272d1fd83', 'WHS01', '2022-11-17 15:09:03', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '91975e7b4d394c0a88563cc154d9c3', '2022-11-16', 'POR-20221116-0004', 'POR-221117-000014', 'PO-003221019-0002', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 350, 350, 350, 10, 35, 0),
('160ac8a375994286bea7b3858cbba1', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '10af05969b8042799c703dcd435d08', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000004', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 104000, 104000, 104000, 4000, 26, 0),
('20221121000001', 'admin', '2022-11-21 23:47:03', NULL, NULL, 0, 'cf55c130c8ae47a690c88382589ea2', '614b430c9c2f4260b240e5cf44ad73', '2022-11-17', 'POR-20221117-0002', 'POR-221117-000016', 'PO-002221020-0001', 'BC 4.0', '051040-030184-20221115-000001', '435/XI/2022', '2022-11-16', '-', '2022-11-16', 2000, 2000, 2000, 1000, 2, 0),
('20221122000001', 'admin', '2022-11-22 10:53:12', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '19d58c090ea14cdc994a8baa312c33', '2022-11-16', 'POR-20221116-0005', 'POR-20221116-0005-001', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 104000, 104000, 104000, 4000, 26, 0),
('20221122000002', 'admin', '2022-11-22 10:53:12', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', 'bed6c03ec4bf41f5bcdcd425d6d528', '2022-11-16', 'POR-20221116-0005', 'POR-20221116-0005-002', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 5000, 5000, 5000, 5000, 1, 0),
('20221124000001', 'WHS02', '2022-11-24 10:55:43', NULL, NULL, 0, 'af5c257b9a2d4306ae07e9d6cbb80b', '98a74ee45aa84fdea4a995a8f94c72', '2022-11-23', 'POR-20221123-0001', 'POR-20221123-0001-001', 'PO-002221020-0002', 'BC 4.0', '051040-030184-20221124-000004', '222001401', '2022-11-23', '', '2022-11-24', 80, 70, 70, 1, 70, 0),
('2556b8dcd85347629d19d1cb55f269', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '959962f44c0f44a29761da251f3cf5', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000011', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 146400, 146400, 146400, 1220, 120, 0),
('2b3b5009b71b4df3b4809086fb72a1', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', 'f03f5c8efbba404b8abb41370965bf', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000003', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 100000, 100000, 100000, 5000, 20, 0),
('33e658a774c9423490c99644b258e3', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', 'b5099016fd8c487ebdb5b7b4af1d67', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000002', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 500, 500, 500, 500, 1, 0),
('3a51bde5015447d7b0706333e25a24', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '3714e81e66f34ba5aa8da4579a9627', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000005', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 4500, 4500, 4500, 2000, 3, 0),
('3dea3cc79e2247b49e638dcc01f933', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', 'e4b82d1b4e70476daf85aa5494b37c', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000009', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 288000, 288000, 288000, 144000, 2, 0),
('51548a96956e47c697d2d62c1ef7fd', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', 'f6d94df71f99416591000e95fef385', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000001', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 16000, 16000, 16000, 1000, 16, 0),
('52115df5004f4544a61e47b6e89b82', 'WHS01', '2022-11-16 14:02:31', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', 'a0f00c476c3447dc81d9450fa51a42', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000011', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 1, 1, 1, 1, 1, 0),
('5591be1773124516b004cc4f929d79', 'WHS01', '2022-11-16 14:02:30', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '04fe43996a1c4c36948c5242d9a7b8', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000005', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 2, 2, 2, 1, 2, 0),
('5a1e7523283d47a08169764c0d1941', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', 'a995527a67594ce0af5a2298712860', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000013', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 7200, 7200, 7200, 2700, 3, 0),
('63b6ee8f2abc45e49469a9464af182', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '624c4bd2693743b48ff8ec6a1011e8', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000007', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 50, 50, 50, 50, 1, 0),
('7ac0dad429bf48e1a1250825523409', 'WHS01', '2022-11-21 09:51:33', NULL, NULL, 0, 'af5c257b9a2d4306ae07e9d6cbb80b', '98a74ee45aa84fdea4a995a8f94c72', '2022-11-17', 'POR-20221117-0001', 'POR-221117-000015', 'PO-002221020-0002', 'BC 4.0', '051040-030184-20221117-000002', '222001292', '2022-11-16', '-', '2022-11-16', 80, 80, 10, 1, 10, 0),
('7e35355604e3472396fc4f381c3399', 'WHS01', '2022-11-16 12:48:42', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '7d0c84c8a32545ab977aac1c568c0f', '2022-11-16', 'POR-20221116-0001', 'POR-221116-000002', 'PO-003221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 1, 1, 1, 1, 1, 0),
('7e671c2e8c4f4fbfbbb61ac3098135', 'WHS01', '2022-11-16 12:48:42', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '0d6841b5f98542179a5114022f0f59', '2022-11-16', 'POR-20221116-0001', 'POR-221116-000001', 'PO-003221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 10, 10, 10, 1, 10, 0),
('91e585f0815d486595737d26e8b8fb', 'WHS01', '2022-11-16 14:02:29', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '5ed6a9df03334e65b29657a7051407', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000004', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 2, 2, 2, 1, 2, 0),
('934e53506a9c46aaac26b0b316a167', 'WHS01', '2022-11-16 14:02:30', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', 'da0b5a0b29be443e9b0a8d53045587', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000008', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 1, 1, 1, 1, 1, 0),
('93b33c0f7fcd4f57a9fc38af9255d1', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '9b9b4c19c11349b4bc1f059a1d4159', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000012', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 105000, 105000, 105000, 7000, 15, 0),
('aed58883a92d4676bd65405c73fe93', 'WHS01', '2022-11-16 14:02:30', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '996b6ffe582c495494a1c45d179fd6', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000010', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 1, 1, 1, 1, 1, 0),
('c3464db182c4460b9f55cbdc2f318d', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '3e70bdfd80f5405780dbf3b530e009', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000010', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 100000, 100000, 100000, 100000, 1, 0),
('ce712bc81dc24cff97c8f12ba2f784', 'WHS01', '2022-11-16 14:02:31', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', 'f73c5828ffd742ff917c350b1f43ab', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000012', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 2, 2, 2, 1, 2, 0),
('e39fd26582314494b94046e42c4b6e', 'WHS01', '2022-11-16 14:02:30', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '84ed48f24e424cedbae66d03750af9', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000007', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 2, 2, 2, 1, 2, 0),
('e5e8d1fba3b341f791b4152bb59474', 'WHS01', '2022-11-16 14:02:31', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '7a1631ccb6554010b9e6d7af7a2810', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000013', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 2, 2, 2, 1, 2, 0),
('eed037fd305c4b6a81abfeb7d8735e', 'WHS01', '2022-11-16 12:48:42', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '5bf5c56dea2745b9925d11cfbfa4a2', '2022-11-16', 'POR-20221116-0001', 'POR-221116-000003', 'PO-003221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 20, 20, 20, 1, 20, 0),
('efa6bfd53c2f4954a70e8d990dab23', 'WHS01', '2022-11-16 14:02:30', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', 'c6f46c95ec004f819348ae736fb99c', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000006', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 1, 1, 1, 1, 1, 0),
('f45b663a0b9b4835b7371f97caf8c0', 'WHS01', '2022-11-16 14:02:30', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '1461a62f894140b8ac1fd858936796', '2022-11-16', 'POR-20221116-0002', 'POR-221116-000009', 'PO-005221019-0001', 'BC 2.3', '051023-030184-20221108-000001', 'SUGS2282199', '2022-10-25', 'CPC2210C05035', '2022-10-30', 1, 1, 1, 1, 1, 0),
('fa12103f55384bb6a50831e6742858', 'WHS01', '2022-11-17 12:45:09', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '258d134422724290aa869aed97c018', '2022-11-16', 'POR-20221116-0003', 'POR-221117-000008', 'PO-002221019-0001', 'BC 2.3', '051023-030184-20221109-000002', 'PTCW221001', '2022-10-20', 'CPC2210C05034', '2022-10-30', 100000, 100000, 100000, 100000, 1, 0);

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
('00aa5d1079e3497699eebb95906aac', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, '1461a62f894140b8ac1fd858936796', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('01e6e2cd026d4e26bd2ee19f5231ed', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '19d58c090ea14cdc994a8baa312c33', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('04affe09bd2a476582cce5933ba1fb', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, 'f03f5c8efbba404b8abb41370965bf', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('0750e3cbdabf4d80879086f82cfa31', 'admin', '2022-10-27 09:51:08', NULL, NULL, 0, '7bde0495d3b941cea886ad009bc9d2', 'PR-002221027-0001', '2022-10-28', 'Administrator', '2022-10-29', 2, '', 1),
('111cea075b3e4345879c445c8f6bbe', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, 'a995527a67594ce0af5a2298712860', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('131700a4dbea4e12ad41bce6f1bab2', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, '959962f44c0f44a29761da251f3cf5', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 146400, '', 1),
('19ead79b032a40f684666c30184deb', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, 'ae1e4ae4b24d4f598f5390ead6be52', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 450, '', 1),
('232d571428f5413c91ae1c693d0bcf', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, '996b6ffe582c495494a1c45d179fd6', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('27aa2e07a528411eafd9bd6672b6cf', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, 'c6f46c95ec004f819348ae736fb99c', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('2be58967ceb94af587a8284fbdceee', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, 'a0f00c476c3447dc81d9450fa51a42', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('2e8a7dc06efe4253af566948e269c3', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '98a74ee45aa84fdea4a995a8f94c72', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 250, '', 1),
('31d86f895d2141cab20ed6264ccae1', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '9b9b4c19c11349b4bc1f059a1d4159', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('37550504249240bab4da93fcd68168', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, '3e70bdfd80f5405780dbf3b530e009', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 100000, '', 1),
('3f28e229d7534449b9c0e13aec036f', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, '5ed6a9df03334e65b29657a7051407', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('4ea1287eab054ad789e2fdb4fc57af', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, 'a995527a67594ce0af5a2298712860', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 7200, '', 1),
('5469dec7cf3246db9bbd5fd14a01a5', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, '3714e81e66f34ba5aa8da4579a9627', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 4500, '', 1),
('59d934064c2b40818c465780dbe8eb', 'admin', '2022-10-20 11:23:58', NULL, NULL, 0, '614b430c9c2f4260b240e5cf44ad73', 'PR-002221020-0002', '2022-10-20', 'Administrator', '2022-11-14', 1, '', 1),
('5cfc406a8a7a4596804776198d68fb', 'admin', '2022-10-26 04:09:02', 'admin', '2022-10-26 04:22:07', 0, '959962f44c0f44a29761da251f3cf5', 'PR-002221026-0001', '2022-10-26', 'Administrator', '2022-10-05', 1000, 'TEST SAJA', 0),
('5f13ced9ecff4b4a989c2a8664cb0b', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, '10af05969b8042799c703dcd435d08', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 104000, '', 1),
('6070ecae27414b149810dbd04ca5bb', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, '04fe43996a1c4c36948c5242d9a7b8', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('681e0ba1fa7d47bd98b62ad94dfa6d', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, 'bed6c03ec4bf41f5bcdcd425d6d528', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 5000, '', 1),
('6847ada41c1f4b0c91098c43f43b6d', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, 'f6d94df71f99416591000e95fef385', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 160, '', 1),
('6aee420861054949aed62e09cbf484', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '624c4bd2693743b48ff8ec6a1011e8', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('736b83ea6bfa467f88ba3200f4cc02', 'admin', '2022-10-26 10:01:56', 'admin', '2022-10-26 16:20:37', 0, '9de0d8e732204c95a3b0cd192b01d8', 'PR-002221026-0002', '2022-10-27', 'Administrator', '2022-10-26', 100, '', 0),
('778789a2b3594360b862ef23315e98', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, 'bed6c03ec4bf41f5bcdcd425d6d528', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('7c2f8bed9d1c4b5f894929568acd9f', 'admin', '2022-10-18 15:03:14', NULL, NULL, 0, '57748ea624ea42f8a3d2c9ea9f8776', 'PR-002221018-0001', '2022-10-18', 'Administrator', NULL, 20, '', 1),
('7d540b20f6b54bd3956c8b2b983c60', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, '9b9b4c19c11349b4bc1f059a1d4159', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 105000, '', 1),
('8477ad68581143858dc9dcdbbe4cf6', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, 'd0d2d181e9864f9e87d38bd8349f9f', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 3000, '', 1),
('85919b5479124d8481c9d1348216df', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '57748ea624ea42f8a3d2c9ea9f8776', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 800, '', 1),
('8efd2d49afdc4206889f7848b9002f', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '10af05969b8042799c703dcd435d08', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('8fdd4bb19f54439a8f4d539ce3cfee', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '258d134422724290aa869aed97c018', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('90b8c5d04b9846b6a2f5c290241f81', 'admin', '2022-10-19 11:09:55', NULL, NULL, 0, '7d0c84c8a32545ab977aac1c568c0f', 'PR-003221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('93a937c5954b4611a3c0690f3ceedf', 'admin', '2022-10-20 11:25:21', NULL, NULL, 0, '98a74ee45aa84fdea4a995a8f94c72', 'PR-002221020-0003', '2022-10-20', 'Administrator', '2022-11-14', 10, '', 1),
('98d8ccec946c4e69a3aa25471fb7c0', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '3714e81e66f34ba5aa8da4579a9627', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('a0f4de394c88474e8e3682984a853f', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '614b430c9c2f4260b240e5cf44ad73', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 12000, '', 1),
('a32ef19b96f64c21ab53ae4405c694', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, 'da0b5a0b29be443e9b0a8d53045587', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('a77ea99cc6eb435b82325af7f098d8', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, '19d58c090ea14cdc994a8baa312c33', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 104000, '', 1),
('ad3426486a6d4e2cba55d5d0c90287', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, 'e4b82d1b4e70476daf85aa5494b37c', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 288000, '', 1),
('ad6ed4cdc0244c7abbb1b8a5d6f820', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, '258d134422724290aa869aed97c018', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 100000, '', 1),
('b71b619bcd424fa5864537bfc7160a', 'admin', '2022-10-26 10:01:56', 'admin', '2022-10-26 16:20:37', 0, '7bde0495d3b941cea886ad009bc9d2', 'PR-002221026-0002', '2022-10-27', 'Administrator', '2022-10-26', 200, '', 0),
('ba93037e54b9421f8a172430be991f', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, 'f03f5c8efbba404b8abb41370965bf', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 100000, '', 1),
('c5a04b959bf840b4b72d6dfe4cdc02', 'admin', '2022-10-19 15:53:34', NULL, NULL, 0, 'b0fd68d0868e4433acc74b897b5b18', 'PR-003221019-0002', '2022-10-19', 'Administrator', '2022-11-14', 300, '', 1),
('ce1048513167469e89c086a5bc6f5f', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, 'f73c5828ffd742ff917c350b1f43ab', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('ceef9e02b3474f6eae3d995a846018', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, 'b5099016fd8c487ebdb5b7b4af1d67', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 500, '', 1),
('d0cc2490f23d401fb9eab59eb5084f', 'admin', '2022-10-27 09:51:08', NULL, NULL, 0, '9de0d8e732204c95a3b0cd192b01d8', 'PR-002221027-0001', '2022-10-28', 'Administrator', '2022-10-29', 1, '', 1),
('d6d0b827c70a41a484f69288f7b114', 'admin', '2022-10-19 15:53:34', NULL, NULL, 0, '91975e7b4d394c0a88563cc154d9c3', 'PR-003221019-0002', '2022-10-19', 'Administrator', '2022-11-14', 350, '', 1),
('dae8973abf9344e6831f346ccdc734', 'admin', '2022-10-18 15:03:14', NULL, NULL, 0, 'ae1e4ae4b24d4f598f5390ead6be52', 'PR-002221018-0001', '2022-10-18', 'Administrator', NULL, 10, '', 1),
('dfd328492fdf4055bab5e1e76349a5', 'admin', '2022-10-26 16:35:21', NULL, NULL, 0, '98a74ee45aa84fdea4a995a8f94c72', 'PR-002221026-0003', '2022-12-01', 'Administrator', '2022-12-01', 23310, '', 1),
('e6a3195877ff4f588a93b53d76306f', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, '7a1631ccb6554010b9e6d7af7a2810', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('ea4cbddaa9df41f1ae725d35b39926', 'admin', '2022-10-19 11:09:55', NULL, NULL, 0, '5bf5c56dea2745b9925d11cfbfa4a2', 'PR-003221019-0001', '2022-10-19', 'Administrator', NULL, 20, '', 1),
('ebeb08ab74604190a695912a423172', 'admin', '2022-10-19 10:20:43', NULL, NULL, 0, '84ed48f24e424cedbae66d03750af9', 'PR-005221019-0001', '2022-10-19', 'Administrator', NULL, 1, '', 1),
('ee9100607a974344b8c6a90a182926', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '3e70bdfd80f5405780dbf3b530e009', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1000, '', 1),
('f1acc7acf23843e6937c57b96b778b', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, 'f6d94df71f99416591000e95fef385', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 1600, '', 1),
('fbcbc2a7eb6e44d99b92292ed0d509', 'admin', '2022-10-19 11:09:55', NULL, NULL, 0, '0d6841b5f98542179a5114022f0f59', 'PR-003221019-0001', '2022-10-19', 'Administrator', NULL, 10, '', 1),
('fbe169145e6d46e89fd2b47e1ca76e', 'admin', '2022-10-19 15:35:02', NULL, NULL, 0, '624c4bd2693743b48ff8ec6a1011e8', 'PR-002221019-0001', '2022-10-19', 'Administrator', '2022-11-14', 50, '', 1),
('fc24d5bde99744d99e1a639141b1ca', 'admin', '2022-10-28 10:21:25', NULL, NULL, 0, '959962f44c0f44a29761da251f3cf5', 'PR-002221028-0001', '2022-10-28', 'Administrator', '2022-10-28', 1590, '', 1);

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
  `price` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `vat` varchar(10) DEFAULT NULL,
  `delivery` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sales_orders`
--

INSERT INTO `sales_orders` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `customer_id`, `item_id`, `number`, `trans_date`, `customer_po`, `qty`, `price`, `total`, `vat`, `delivery`, `status`) VALUES
('20221125000001', 'ADM01', '2022-11-25 11:20:32', 'admin', '2022-11-26 22:15:28', 0, '5db876d3d3f74ce6876610abdaebb3', '2a723738ac66458184f008b747dbd7', 'SOOC0001-221125-0001', '2022-11-25', '221612-01', 10000, '0.0000', '0.0000', 'NON VAT', '2022-12-19', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `scan_item_receipts`
--

CREATE TABLE `scan_item_receipts` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `po_no` varchar(50) DEFAULT NULL,
  `receipt_no` varchar(50) DEFAULT NULL,
  `receipt_id` varchar(50) DEFAULT NULL,
  `label_no` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `scan_item_receipts`
--

INSERT INTO `scan_item_receipts` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `po_no`, `receipt_no`, `receipt_id`, `label_no`, `qty`, `status`) VALUES
('00a084c25bda45d7b0c778b9859829', 'WHS01', '2022-11-21 12:07:33', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('01b14be4fe8949d8bd29b4fe36b978', 'WHS01', '2022-11-17 14:31:54', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('01b80de9f6f34e3abd2b3b874c7a16', 'WHS01', '2022-11-17 14:19:15', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('03e07c69d30942b796620173469530', 'WHS01', '2022-11-17 12:59:35', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('041e7fb16b3e43eca398bbf20f7e39', 'WHS01', '2022-11-17 14:33:52', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000007', 'POR-221117-00001000001', 50, 0),
('048ba1f3e1e845cdbd43e68353e91f', 'WHS01', '2022-11-17 14:20:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('048da8a2c33c40aaa34a6c9968bbb6', 'WHS01', '2022-11-17 14:23:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('068156e4911648b09c25fccbbe9779', 'WHS01', '2022-11-17 14:16:02', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('09ac517bcf974547baf049eb5dec6e', 'WHS01', '2022-11-17 14:20:41', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('0a468521b2ae49a29696036f22c6aa', 'WHS01', '2022-11-17 11:32:23', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000007', 'POR-221117-00001000001', 1, 0),
('0a65e1075e6245c2821665dbef82e2', 'WHS01', '2022-11-16 15:10:00', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('0b993ec14c40477dbb34a9cadf87a6', 'WHS01', '2022-11-16 15:03:01', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('0d0ae7e011f74789b3d38c0cdec7cb', 'WHS01', '2022-11-17 14:26:03', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('0d3d714d5ff34f87a070de1fc77325', 'WHS01', '2022-11-17 13:53:25', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('10f34b2f256044cda89db48b46d353', 'WHS01', '2022-11-21 12:07:23', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('125d74b559f04d848d4ed8c98e192b', 'WHS02', '2022-11-18 13:08:05', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('125f3fdb4ceb4527a0af6f2ee950e0', 'WHS02', '2022-11-18 13:05:33', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('153708164c94435c99d224faf31751', 'WHS01', '2022-11-16 15:05:42', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('1738f48cb89e4cc69abc1e574aef3f', 'WHS01', '2022-11-17 12:59:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('173b8a6d97a14203b5958d79fe4b7e', 'WHS01', '2022-11-17 14:33:55', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000002', 'POR-221117-00001000001', 500, 0),
('17f86fa83bdf4252bcc90973ff5983', 'WHS01', '2022-11-17 14:23:30', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('18607327acfb4e31836a688aa79be7', 'WHS01', '2022-11-17 13:53:10', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('188db5f11609410687991e51ba065b', 'WHS01', '2022-11-17 14:17:09', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('199df5d3553f46fd97732de11a3fd3', 'WHS01', '2022-11-17 13:44:52', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('1a23f47da07641068c42bc1f47a0fb', 'WHS02', '2022-11-18 13:30:43', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('1a68bbe4aba646b3ade9c23befe7be', 'WHS01', '2022-11-17 14:34:08', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000005', 'POR-221117-00001000001', 2000, 0),
('1ab49948ce1547658a4cfe2f6e2f02', 'WHS01', '2022-11-17 14:16:04', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('1adfbbaa59c5448abb16dc548feced', 'WHS01', '2022-11-16 15:10:29', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('1b5a6b232dfd476f980e74b39562e4', 'WHS01', '2022-11-17 13:53:14', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('1d94fbbad9de4242af1fe526cf4cf9', 'WHS02', '2022-11-18 13:05:55', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('20221123000001', 'WHS02', '2022-11-23 11:13:22', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-002', 'POR-221117-00001000001', 5000, 0),
('20221123000002', 'WHS02', '2022-11-23 11:13:40', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000003', 'WHS02', '2022-11-23 11:13:50', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000004', 'WHS02', '2022-11-23 11:13:53', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000005', 'WHS02', '2022-11-23 11:13:55', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000006', 'WHS02', '2022-11-23 11:13:58', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000007', 'WHS02', '2022-11-23 11:14:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000008', 'WHS02', '2022-11-23 11:14:15', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000009', 'WHS02', '2022-11-23 11:14:20', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000010', 'WHS02', '2022-11-23 11:14:23', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000011', 'WHS02', '2022-11-23 11:14:25', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000012', 'WHS02', '2022-11-23 11:14:28', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000013', 'WHS02', '2022-11-23 11:14:31', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000014', 'WHS02', '2022-11-23 11:14:36', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000015', 'WHS02', '2022-11-23 11:14:39', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000016', 'WHS02', '2022-11-23 11:14:44', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000017', 'WHS02', '2022-11-23 11:14:51', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000018', 'WHS02', '2022-11-23 11:14:53', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000019', 'WHS02', '2022-11-23 11:14:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000020', 'WHS02', '2022-11-23 11:15:00', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000021', 'WHS02', '2022-11-23 11:15:03', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000022', 'WHS02', '2022-11-23 11:15:05', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000023', 'WHS02', '2022-11-23 11:15:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000024', 'WHS02', '2022-11-23 11:15:10', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000025', 'WHS02', '2022-11-23 11:15:12', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000026', 'WHS02', '2022-11-23 11:15:14', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221123000027', 'WHS02', '2022-11-23 11:15:16', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0005', 'POR-20221116-0005-001', 'POR-221117-00001000001', 4000, 0),
('20221124000001', 'WHS02', '2022-11-24 13:21:36', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000002', 'WHS02', '2022-11-24 13:22:07', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000003', 'WHS02', '2022-11-24 13:23:41', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000004', 'WHS02', '2022-11-24 13:23:47', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000005', 'WHS02', '2022-11-24 13:23:52', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000006', 'WHS02', '2022-11-24 13:31:12', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000007', 'WHS02', '2022-11-24 13:31:24', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000008', 'WHS02', '2022-11-24 13:31:28', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000009', 'WHS02', '2022-11-24 13:39:53', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000010', 'WHS02', '2022-11-24 13:39:58', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000011', 'WHS02', '2022-11-24 13:46:13', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000012', 'WHS02', '2022-11-24 13:46:19', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000013', 'WHS02', '2022-11-24 13:46:24', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000014', 'WHS02', '2022-11-24 13:46:27', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000015', 'WHS02', '2022-11-24 13:46:30', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000016', 'WHS02', '2022-11-24 13:48:50', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000017', 'WHS02', '2022-11-24 13:49:03', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000018', 'WHS02', '2022-11-24 13:49:06', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000019', 'WHS02', '2022-11-24 13:49:15', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000020', 'WHS02', '2022-11-24 13:49:21', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000021', 'WHS02', '2022-11-24 13:52:43', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000022', 'WHS02', '2022-11-24 13:52:47', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000023', 'WHS02', '2022-11-24 13:52:50', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000024', 'WHS02', '2022-11-24 13:52:53', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000025', 'WHS02', '2022-11-24 13:52:56', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000026', 'WHS02', '2022-11-24 13:54:35', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000027', 'WHS02', '2022-11-24 13:54:39', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000028', 'WHS02', '2022-11-24 13:54:41', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000029', 'WHS02', '2022-11-24 13:54:44', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000030', 'WHS02', '2022-11-24 13:54:46', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000031', 'WHS02', '2022-11-24 13:58:22', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000032', 'WHS02', '2022-11-24 13:58:27', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000033', 'WHS02', '2022-11-24 13:58:30', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000034', 'WHS02', '2022-11-24 13:58:34', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000035', 'WHS02', '2022-11-24 13:58:36', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000036', 'WHS02', '2022-11-24 14:00:49', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000037', 'WHS02', '2022-11-24 14:00:53', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000038', 'WHS02', '2022-11-24 14:00:56', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000039', 'WHS02', '2022-11-24 14:01:05', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000040', 'WHS02', '2022-11-24 14:01:17', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000041', 'WHS02', '2022-11-24 14:04:47', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000042', 'WHS02', '2022-11-24 14:04:55', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000043', 'WHS02', '2022-11-24 14:04:58', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000044', 'WHS02', '2022-11-24 14:05:01', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000045', 'WHS02', '2022-11-24 14:05:04', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000046', 'WHS02', '2022-11-24 14:06:53', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000047', 'WHS02', '2022-11-24 14:06:56', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000048', 'WHS02', '2022-11-24 14:06:59', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000049', 'WHS02', '2022-11-24 14:07:01', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000050', 'WHS02', '2022-11-24 14:07:03', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000051', 'WHS02', '2022-11-24 14:11:13', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000052', 'WHS02', '2022-11-24 14:11:16', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000053', 'WHS02', '2022-11-24 14:11:18', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000054', 'WHS02', '2022-11-24 14:11:22', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000055', 'WHS02', '2022-11-24 14:11:25', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000056', 'WHS02', '2022-11-24 14:13:54', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000057', 'WHS02', '2022-11-24 14:13:57', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000058', 'WHS02', '2022-11-24 14:14:00', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000059', 'WHS02', '2022-11-24 14:14:03', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000060', 'WHS02', '2022-11-24 14:14:06', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000061', 'WHS02', '2022-11-24 14:16:46', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000062', 'WHS02', '2022-11-24 14:16:56', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000063', 'WHS02', '2022-11-24 14:17:00', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000064', 'WHS02', '2022-11-24 14:17:03', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000065', 'WHS02', '2022-11-24 14:17:05', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000066', 'WHS02', '2022-11-24 14:19:15', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000067', 'WHS02', '2022-11-24 14:19:17', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000068', 'WHS02', '2022-11-24 14:19:20', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000069', 'WHS02', '2022-11-24 14:19:22', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20221124000070', 'WHS02', '2022-11-24 14:19:25', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221123-0001', 'POR-20221123-0001-001', 'POR-221117-00001000001', 1, 0),
('20c62f293a7a4a7c8592d4b351d6d8', 'WHS02', '2022-11-18 13:05:48', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('20f7b475f8c041a8a3fc3c5d5c272c', 'WHS01', '2022-11-17 14:17:14', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2105964de4bb4942be920b4783dbe1', 'WHS01', '2022-11-16 15:05:58', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('213e5fbbd5b048b19b1d6b08969971', 'WHS01', '2022-11-17 13:45:02', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('219da3335c2c4c0295972eff65bddb', 'WHS01', '2022-11-17 11:32:11', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000009', 'POR-221117-00001000001', 1, 0),
('22b8d651055142a29f5c490d5604dc', 'WHS01', '2022-11-17 14:21:09', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('23627738206d4baa99fb931cd518a0', 'WHS01', '2022-11-17 14:18:02', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('23659cebd6264850ade3e9b3e8fa53', 'WHS01', '2022-11-17 14:24:02', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('241c1c113bdf4fb69959966bb981ba', 'WHS01', '2022-11-17 14:32:08', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('27ca931f1ab5448eb4710b33f83afb', 'WHS01', '2022-11-17 13:53:26', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('28c042b3aee64e9c96c6c8069ef31b', 'WHS01', '2022-11-17 14:17:50', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('290739491c5548ee926bbcc9781e4f', 'WHS01', '2022-11-17 14:18:06', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('299ae5c334fa4cfb901517c9af1fa5', 'WHS01', '2022-11-17 14:06:21', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2a1d7a3a870348cf9312cb141467d9', 'WHS01', '2022-11-17 14:23:34', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2a5922ac156a40a7a5faf9ab1e1c56', 'WHS01', '2022-11-17 14:15:21', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2aadab95474d40cea9c86806bf563e', 'WHS01', '2022-11-17 14:17:29', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2b9de27ed37a4d37be19d2a9ba87a0', 'WHS01', '2022-11-17 14:32:10', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('2bd8aded7fe3431088e338858b92b7', 'WHS01', '2022-11-17 14:17:10', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2c3c5124107444d8b0a8dbb588f489', 'WHS01', '2022-11-17 14:21:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2d25e5a5734a4c36bf775834260807', 'WHS01', '2022-11-17 14:25:31', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2d95d7aac4024eb881d052774093f9', 'WHS01', '2022-11-17 14:16:23', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2dc17bb7e6f04043bf760980d0252d', 'WHS01', '2022-11-17 14:25:29', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('2dc36075729e471cb5f1a3845cd9d8', 'WHS01', '2022-11-16 15:10:05', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('2e3349efca1242768954fa6a823896', 'WHS01', '2022-11-17 14:31:52', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('2e683c6af3dc447e97170e60cf8064', 'WHS01', '2022-11-17 14:31:59', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('2e8b7504e86742b6b659da0dfe8e14', 'WHS01', '2022-11-17 14:21:00', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('3048fad02eb8499da1689d156dc0b6', 'WHS01', '2022-11-17 13:45:16', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('32f58296000a496295062ec7e72d6e', 'WHS01', '2022-11-17 14:31:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('32fb632c05e64950bb0d6a28d85f85', 'WHS01', '2022-11-17 14:24:46', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('333acd2950ca4fa8b67d23640d63c3', 'WHS01', '2022-11-17 13:53:11', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('347b29ed724640969d3a3f47acfafd', 'WHS01', '2022-11-21 12:07:35', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('3559d6b0156c43568367c9ffad0ce9', 'WHS01', '2022-11-17 11:17:14', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000004', 'POR-221117-00001000001', 1, 0),
('3643bf0feb2346139162ee158f76fd', 'WHS01', '2022-11-21 12:07:21', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('36936f567eb14984987d333c737743', 'WHS01', '2022-11-17 14:18:11', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('36ffacdac0e2459c923437a67a9348', 'WHS01', '2022-11-17 14:31:50', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('3720b369e4ba4a5c994a883867ecf0', 'WHS01', '2022-11-17 14:17:38', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('384ce1f03919421a9f53717f1681d3', 'WHS01', '2022-11-16 15:09:50', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('38d8ffeb71494b11a4597c9f702e5b', 'WHS01', '2022-11-17 14:19:42', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('3ad76dcf619849a6a5cbebfa3952c5', 'WHS01', '2022-11-17 14:23:35', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('3c8fd3fdd40d459b97a7f2e1322100', 'WHS01', '2022-11-17 13:09:04', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000011', 'POR-221117-00001000001', 1, 0),
('3c9a509e80094c90ade4233b638af1', 'WHS01', '2022-11-17 14:15:16', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('3d4ea069fcff419e9b8241b6a5cf27', 'WHS01', '2022-11-17 13:53:31', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('3f0fca728ecf48f88f36537af0aa36', 'WHS01', '2022-11-17 13:45:21', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('3f9dcbb736f84de59c985d984f8567', 'WHS01', '2022-11-16 15:10:17', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('443124dd8e76489b9937fb2f29d086', 'WHS01', '2022-11-17 14:24:11', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('469c2cc0c1dd4c5b8ed452ee506bdc', 'WHS01', '2022-11-17 14:32:06', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('478c6928904c483ead456de040cd40', 'WHS01', '2022-11-17 14:18:16', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('47e2e5544bca4a9a8955f1bd723a56', 'WHS01', '2022-11-16 15:10:34', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('48363c9198624518a158a40959bdc2', 'WHS01', '2022-11-17 12:59:56', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('48fce7b39d4e4b6e8dbfe8e7f14b88', 'WHS01', '2022-11-17 14:15:01', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('49d5fc9fec474f069ae67a89a5520a', 'WHS01', '2022-11-17 13:09:08', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000010', 'POR-221117-00001000001', 1, 0),
('4a328f4318414a82ad461ded715352', 'WHS02', '2022-11-18 13:05:25', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('4ad4af8fa1584106ab1784173a4498', 'WHS02', '2022-11-18 13:12:38', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('4d2f772596894362b663925c53ccbf', 'WHS02', '2022-11-18 13:05:38', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('5192eebd549c4c19bd33c1d5f7788f', 'WHS01', '2022-11-17 11:32:16', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000008', 'POR-221117-00001000001', 1, 0),
('51d12bcdd8074e02aca527beb47a3b', 'WHS01', '2022-11-17 14:23:21', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('5370a87fe1fa477aad7b9ae5e4e557', 'WHS01', '2022-11-17 12:59:26', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('5410345719d04d11aad94740944c84', 'WHS01', '2022-11-17 13:53:08', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('54be3a19b31b4f63bd54ae24472c90', 'WHS02', '2022-11-18 13:07:55', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('552d8f31404c412181668bde4bb6ed', 'WHS01', '2022-11-17 14:17:13', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('554154b84c5b4a08814d399b3d4c86', 'WHS01', '2022-11-21 12:07:26', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('55cf8d26ffcd4b56a40b32c3ce4669', 'WHS01', '2022-11-17 13:53:13', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('56912b6a040f4194bee1cb563f7bd3', 'WHS01', '2022-11-17 14:14:43', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('5a4594593f764feca21cec22f72410', 'WHS01', '2022-11-17 14:16:03', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('5bae61ad676343248f1fe400de06f9', 'WHS01', '2022-11-17 13:44:53', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('5c4ba35ee49f4e9cbe85065cec2432', 'WHS01', '2022-11-17 14:18:08', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('5cd43a518cb241c5ba70d4f73f842e', 'WHS01', '2022-11-17 14:19:11', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('5cf092ee0f3c4b52a9c4a6f03f0cbc', 'WHS01', '2022-11-16 15:06:18', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('5ec881bd874b4df49c1b99b4504cfb', 'WHS02', '2022-11-18 13:09:18', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('5ee12d97eab141a7a7c09e65c165ef', 'WHS02', '2022-11-18 13:07:58', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('5f88ecb06dc54c9782ce184f0b3d2d', 'WHS01', '2022-11-17 14:14:59', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('60d22ba1d8d54da287cb8f9ab368bd', 'WHS01', '2022-11-17 14:24:49', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('62d2aaa9440f47eead53b1f2887d9e', 'WHS01', '2022-11-17 13:53:04', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('637c21778f85444fbf4316f23ef3a8', 'WHS01', '2022-11-17 12:59:37', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('65597b5ae4df462794935c9dfd4881', 'WHS01', '2022-11-17 14:15:53', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('672807422a7a4682b7fcbdc4ff88d3', 'WHS01', '2022-11-17 13:08:21', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000012', 'POR-221117-00001000001', 1, 0),
('69c9f20ed5d441c9899f1e8f1188de', 'WHS01', '2022-11-17 14:19:41', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('6e4e2049760a4c71aadc321cb7a2e8', 'WHS01', '2022-11-17 14:33:49', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000008', 'POR-221117-00001000001', 100000, 0),
('6e6cecd8996842cd844c8bee45258e', 'WHS01', '2022-11-17 14:06:33', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('71946ace16614cbf93a56e7b34c346', 'WHS01', '2022-11-17 13:45:25', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('7203083a26414013b42172d484163a', 'WHS01', '2022-11-17 14:17:22', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('7210ffaba1264795ba824234b9aabf', 'WHS01', '2022-11-17 14:15:08', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('72a2375407cd485394081dde4ab46d', 'WHS01', '2022-11-17 14:15:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('73154ba2f11048a6a77ae9c4f77c04', 'WHS01', '2022-11-17 14:34:17', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000009', 'POR-221117-00001000001', 144000, 0),
('739507246fb742a49adacb9fb4679a', 'WHS01', '2022-11-17 13:44:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('73ab1b837411449ba88a202b1ec07a', 'WHS01', '2022-11-17 14:24:14', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('74c53d265d3148e1bc164c51a06ee7', 'WHS01', '2022-11-17 13:00:04', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('75857aa00d2f4cba88920ccdcec055', 'WHS01', '2022-11-17 14:21:17', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('7763c74ebf7640f7801eb1e7ddbcfa', 'WHS01', '2022-11-16 15:06:06', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('781d918d1bac4b238983bb0d58e8b3', 'WHS02', '2022-11-18 13:05:00', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('798196719563478fb1d36ee55fee81', 'WHS01', '2022-11-17 14:14:53', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('79b2fb8b4df845b2847bde18b6ac4a', 'WHS01', '2022-11-17 14:34:04', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000005', 'POR-221117-00001000001', 2000, 0),
('7a72e8e565c740329eed7f5b3d6da2', 'WHS01', '2022-11-17 14:17:19', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('7a92503831b14e74b9e09c3daf084f', 'WHS01', '2022-11-17 13:07:36', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000013', 'POR-221117-00001000001', 1, 0),
('7adcb201a0484d13a42919caac93a4', 'WHS01', '2022-11-17 14:16:30', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('7d0ba0f9ab444c1db3b4815bb67ec1', 'WHS01', '2022-11-16 15:06:16', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('7f80f2a3fac345ad95a88fc3a97a26', 'WHS01', '2022-11-17 14:16:44', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('80771ce26a4e4526896916612cee47', 'WHS01', '2022-11-17 14:17:34', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('808a956deaf540ed8a6e9721e205fe', 'WHS01', '2022-11-17 14:17:35', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('80deef395241450580184304afa1a5', 'WHS01', '2022-11-17 14:19:58', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('8148dde58d5b43a6b89ad9eb5f5477', 'WHS01', '2022-11-17 12:59:47', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('81d8363d5efb45c5aeef817e3abd81', 'WHS01', '2022-11-16 15:10:38', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('82158c1534bc4dba91f69d32dc5bee', 'WHS01', '2022-11-17 14:34:02', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000013', 'POR-221117-00001000001', 2700, 0),
('821e4e68e4a54769be821e30ec6cca', 'WHS01', '2022-11-17 14:18:04', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('858d464f6caa46a4bb1e6fc64f57ba', 'WHS01', '2022-11-17 14:19:05', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('867cb6a1525a42e3b095d113348684', 'WHS01', '2022-11-17 14:19:13', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('86f5b12febfd42b1944abb4aa4e382', 'WHS01', '2022-11-17 13:53:30', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('87097ab0d1b140bca485af818bf2b7', 'WHS01', '2022-11-17 14:18:37', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('879f2228c528471eb89c97ad02fbea', 'WHS01', '2022-11-16 15:02:28', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000002', 'POR-221117-00001000001', 1, 0),
('89ef5fa46c704e67b5338c30558dab', 'WHS01', '2022-11-17 12:59:50', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('89f58b71d12a4a18b2e7aa79c10a61', 'WHS01', '2022-11-17 14:24:20', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('8b06d32a1f0e4d4f93611b2f2fba38', 'WHS01', '2022-11-17 13:44:59', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('8bc587027bfd42a389e714c2de3174', 'WHS02', '2022-11-18 13:04:57', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('8c56280d96194deb81c1e489d08f4c', 'WHS02', '2022-11-18 13:29:59', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('8cde5aa8b9e3459491019f0773f105', 'WHS01', '2022-11-17 13:08:19', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000012', 'POR-221117-00001000001', 1, 0),
('8cf358ed6897434d87b796adeb5442', 'WHS01', '2022-11-17 14:20:44', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('8d03f3f275fa4c82a83f1cc80cc5c9', 'WHS01', '2022-11-16 15:10:40', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('8db3bbd7012e43bf821f40fe002146', 'WHS01', '2022-11-16 15:10:36', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('8e52ce05167a4638ba2bdef7063493', 'WHS01', '2022-11-17 13:45:29', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('8f064144f5c640b7b77bfe2802e561', 'WHS01', '2022-11-17 13:53:34', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('8ff17b6b05bc4a4fba3bcb2006e0b6', 'WHS01', '2022-11-17 14:16:37', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('901cda9ab2294f9bba7d9c975db840', 'WHS01', '2022-11-17 13:45:35', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('9205a55938644e50891dcec52a46e7', 'WHS01', '2022-11-17 13:45:31', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('92430bc6f8e24bf89699b483cd7c0c', 'WHS02', '2022-11-18 13:09:07', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('927223182e434674b2d1ead8983a6e', 'WHS01', '2022-11-16 15:09:56', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('93cc8cc87c74440db5551b99a9b449', 'WHS01', '2022-11-17 14:14:40', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('948d63e499524a8997df4c936b4b8a', 'WHS02', '2022-11-18 13:08:56', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('94a3fbc5cb344612a1908d22d334c4', 'WHS01', '2022-11-17 14:17:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('94d60fcc12304a4e8feeb2448a9adc', 'WHS01', '2022-11-16 15:10:30', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('96400b2f39ac4a64bcc8d368f0b032', 'WHS01', '2022-11-16 15:10:04', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('967caf6695f146cfa9767fbde25eb2', 'WHS01', '2022-11-17 12:59:49', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('969977ccb6614f86b2417fcd8cc7c6', 'WHS01', '2022-11-17 14:34:00', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000013', 'POR-221117-00001000001', 2700, 0),
('976b7dd7c4314148bd6073b5d61902', 'WHS01', '2022-11-17 14:31:53', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('97fab96123d0460ca0f6c07d1d745e', 'WHS01', '2022-11-17 14:24:04', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('98192dab9ab44df29896eed83bc9ab', 'WHS01', '2022-11-17 13:53:00', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('9862807f1ac6413795c2a1b343399c', 'WHS02', '2022-11-18 13:08:02', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('9a4484418e2c45a8a3de127db66141', 'WHS01', '2022-11-17 14:18:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('9b36d3c3fb4846628621c8018229f6', 'WHS01', '2022-11-16 15:06:12', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('9c7933c5ed504475a19ce30b46970e', 'WHS01', '2022-11-17 14:32:13', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('9d046033ab9e47afa1f2a9c91811c7', 'WHS02', '2022-11-18 13:04:54', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('9d94a6accb3f439e986ea3804d4d0e', 'WHS01', '2022-11-17 14:16:42', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('9da15da63d454d18bdfcbd56d998ab', 'WHS01', '2022-11-17 14:26:05', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('9e5ba79bedbb48b2b05fbe25ddf3fe', 'WHS01', '2022-11-17 14:17:54', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('9e7d9f00f8674a4893e3fe0b0a435c', 'WHS01', '2022-11-17 14:33:51', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000005', 'POR-221117-00001000001', 500, 0),
('9fcb1ccda9564167bff6f75be3d2b8', 'WHS02', '2022-11-18 13:09:14', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('a00f0d7c90c04b81933894acb7fedf', 'WHS01', '2022-11-17 14:32:11', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('a21228a8fee74ccaa04755622f71ac', 'WHS02', '2022-11-18 13:05:07', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('a2544aa39b8845149ca963606638fa', 'WHS02', '2022-11-18 13:09:16', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('a2cbb0fbb1504dcea2f037aa1d0f67', 'WHS01', '2022-11-16 15:10:24', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('a482f5553752460e9e6880cf67cf70', 'WHS01', '2022-11-17 14:26:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('a576bc07909348669f975b8a680881', 'WHS01', '2022-11-17 14:16:29', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('a74da84815054b209d5ce01686e103', 'WHS01', '2022-11-21 12:07:31', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('a795afb5a5ef4090841470f41a1152', 'WHS01', '2022-11-17 12:59:59', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('a8ae7e16210c45d89455a140b163ec', 'WHS01', '2022-11-17 14:25:41', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('a94ec529fec747c9aa31ec7eb13a03', 'WHS02', '2022-11-18 13:08:58', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('ac25384b893e4fd79618bf20805bda', 'WHS01', '2022-11-17 14:17:21', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('ad69134db6f94a88b0c6374e3b97ce', 'WHS01', '2022-11-17 14:17:28', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('ae4f912004b64f5493924a0c6fa526', 'WHS01', '2022-11-17 14:31:48', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('b08e4fde15e04e6ea3905ebc8e0e5d', 'WHS01', '2022-11-17 13:45:03', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0);
INSERT INTO `scan_item_receipts` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `po_no`, `receipt_no`, `receipt_id`, `label_no`, `qty`, `status`) VALUES
('b09fbdffb0fa4be1a3b71ef9bc9343', 'WHS01', '2022-11-17 11:32:39', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000006', 'POR-221117-00001000001', 1, 0),
('b0ea2d9af6ee4aef9d0dc4b939b08d', 'WHS01', '2022-11-17 14:25:45', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('b1f9d0876447461996a1c6533c267a', 'WHS01', '2022-11-16 15:06:00', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('b2732acf89244da68a30da358e8fac', 'WHS01', '2022-11-17 11:32:57', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000005', 'POR-221117-00001000001', 1, 0),
('b28d3dfe9b4540aa80f574932f1f16', 'WHS02', '2022-11-18 13:09:03', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('b2bc4dda727349dea083cce1fc2e40', 'WHS01', '2022-11-17 14:16:26', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('b3e6204e78f3467a9de17f8459b720', 'WHS01', '2022-11-16 15:06:07', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('b3efec9e190e49ffa96988479cb2a3', 'WHS01', '2022-11-17 13:45:05', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('b5d9f96315e449978ecf4d0c469c50', 'WHS01', '2022-11-17 14:15:18', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('b7d3f548acd0405aba77367c200974', 'WHS01', '2022-11-17 14:17:31', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('b85b52c6e80e497884b708fc66ac3a', 'WHS01', '2022-11-21 12:07:29', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('ba082da2d1934dcf9ef78273b0a7d3', 'WHS01', '2022-11-17 14:21:20', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('baac2827837742d492cd977cdf37ef', 'WHS01', '2022-11-17 14:23:54', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('bad9ef02c24f4bc0bd735459528b8f', 'WHS01', '2022-11-17 14:18:54', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('baf53d2e0d9146ed9299967d525e59', 'WHS01', '2022-11-17 11:32:21', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000007', 'POR-221117-00001000001', 1, 0),
('bb5882e1ae1c4e36b72d5b2a385161', 'WHS01', '2022-11-17 12:59:39', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('bb747af09a6e4bffbba8d4642f08fd', 'WHS01', '2022-11-17 14:18:58', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('bc2104f0da034923a29c2a62a140e6', 'WHS01', '2022-11-16 15:10:22', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('bc9a734ddfd649e08c591c8b95c390', 'WHS01', '2022-11-17 14:24:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('bd4bc9384f7e4239b915ea82efce6d', 'WHS02', '2022-11-18 13:05:43', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('be046e102e8f40bca8b8656678790f', 'WHS01', '2022-11-16 15:10:18', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('be41f47041754916b3deac294d9fdb', 'WHS01', '2022-11-17 14:19:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('becad2535a494dfd94660c2ce4181b', 'WHS01', '2022-11-17 13:07:39', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000013', 'POR-221117-00001000001', 1, 0),
('bf066a030d224eb99ac044fc0f89c1', 'WHS01', '2022-11-17 11:17:23', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000004', 'POR-221117-00001000001', 1, 0),
('c03d11c0baa846abb9b73430834c3c', 'WHS01', '2022-11-17 14:16:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('c0cb0cac32914b1d911bf2c60a1f76', 'WHS01', '2022-11-17 14:23:25', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('c147f28fee224c75818efc0eb156c6', 'WHS01', '2022-11-17 14:19:03', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('c1d2167e64864205807139aa7a7436', 'WHS01', '2022-11-16 15:09:47', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('c40220c0a60844ddaa6ea9d98f39f7', 'WHS01', '2022-11-17 13:53:06', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('c4796c55b4404894a3930cad70ec65', 'WHS01', '2022-11-17 13:53:23', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('c4ae770aff0746cb95bca5543f0890', 'WHS01', '2022-11-17 13:45:44', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('c4e8d662245a40e888abd522d1d933', 'WHS01', '2022-11-17 14:17:44', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('c53bc6aa372541a49010f7864ca594', 'WHS01', '2022-11-16 15:09:44', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('c53e1268dcc34721a6e8b766f73da6', 'WHS01', '2022-11-17 13:45:27', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('c571b69527de4e1eb062c150476b8b', 'WHS01', '2022-11-21 12:07:38', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('c5bf7052846e4a66aece2e40134879', 'WHS01', '2022-11-17 14:16:46', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('c76a20260bba47709ff60f747b1461', 'WHS02', '2022-11-18 13:05:03', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('c7b7c19cb1eb4cb79148c6a231132a', 'WHS01', '2022-11-16 15:10:09', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('c97083c474544a74ad9e1a5d5f4043', 'WHS01', '2022-11-17 14:19:38', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('ca96f49bad244cec92965af5842a30', 'WHS01', '2022-11-17 14:25:47', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('ca9f44d5de7e4a988c3880192e2a76', 'WHS01', '2022-11-17 14:15:10', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('cae494b707464fafbffc816d95fb9f', 'WHS02', '2022-11-18 13:07:24', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('caf382c36d36479aa712ae5e61f59a', 'WHS01', '2022-11-17 13:45:20', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('cb5600d156264fc191285df162c393', 'WHS01', '2022-11-17 14:31:56', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('cbee00949e454fd3ab2f5597e28ad2', 'WHS02', '2022-11-18 13:09:12', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('cc6da6018b974f71b8bc8f53c979c9', 'WHS02', '2022-11-18 13:08:00', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('cd985b622a2b48d1841cf5e337c241', 'WHS01', '2022-11-17 13:53:28', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('ce2f0107f6124c39aa91d1af263212', 'WHS01', '2022-11-17 11:32:59', NULL, NULL, 0, 'PO-005221019-0001', 'POR-20221116-0002', 'POR-221116-000005', 'POR-221117-00001000001', 1, 0),
('ce7593415d5141e1b9e6976376cfd9', 'WHS01', '2022-11-17 14:18:00', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('cf98869eab604bbdbd5d58e02204b8', 'WHS01', '2022-11-17 14:33:58', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000013', 'POR-221117-00001000001', 1800, 0),
('d1d02a2a7b09439d8b2545e5b898e3', 'WHS01', '2022-11-17 12:59:52', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('d2228ef5bb544b11b9e2ca914b97db', 'WHS02', '2022-11-18 13:31:19', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('d26950ca425c49cd9a0423417de805', 'WHS01', '2022-11-17 14:23:41', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('d49b3cab9a304fc68993b8a952cd0d', 'WHS02', '2022-11-18 13:09:21', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('d5632e2a95cc42dd8ed7fa24cfc190', 'WHS01', '2022-11-17 14:30:50', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('d5be52613cf34f12ad64eb9fec565c', 'WHS01', '2022-11-17 14:16:49', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('d5eca2db2f974af3b31e3747e135c6', 'WHS01', '2022-11-17 14:16:48', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('d84164f596944fc18bc3fab6e0f3b5', 'WHS02', '2022-11-18 13:08:07', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('d87c5a8f7ac44da4b6f5b7c441e69a', 'WHS01', '2022-11-17 13:45:36', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('d8bb4094d9264e0a939f0ea39db05f', 'WHS01', '2022-11-17 12:59:41', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('d8f3692375194df9867a2af704921f', 'WHS01', '2022-11-16 15:09:52', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('d9550a7008e24cc788e4077aca40ce', 'WHS01', '2022-11-17 14:14:46', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('d95af6f88c3047388b35348ff72852', 'WHS01', '2022-11-17 13:44:55', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('da66f1fbc45d4d3aac65af83dee8fb', 'WHS01', '2022-11-17 12:59:54', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('daa4f20c226a4155ba6eec5a95ee38', 'WHS01', '2022-11-17 14:21:21', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('daa786ecbedf44f68110fc3c1877f0', 'WHS01', '2022-11-17 13:45:09', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('daad5efd1ee943ff935449c8aeb49b', 'WHS01', '2022-11-17 14:30:47', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('dc7bd445ada3461e8723237afb93f3', 'WHS01', '2022-11-17 12:59:42', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('dcd46ed1435949ffae84cf1a677992', 'WHS01', '2022-11-17 14:34:19', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000009', 'POR-221117-00001000001', 144000, 0),
('dd90d1bd697f4943bfc5de5cfafab4', 'WHS01', '2022-11-17 13:45:33', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('de2b605bb9444944abb6d44ed0dbb3', 'WHS01', '2022-11-17 14:23:40', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('de431d4eb388454b9ae7a602dd5852', 'WHS01', '2022-11-17 14:23:43', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('dfbb641e05624e8ab7b53af1171e4b', 'WHS01', '2022-11-17 13:53:19', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('e04dc0d2a12740e887baa28cbe19d3', 'WHS01', '2022-11-21 12:07:40', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('e2b66e4a06ae4cf89376b63f4678fa', 'WHS01', '2022-11-17 14:32:07', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('e2b8640457a24511a863a8758d96d8', 'WHS01', '2022-11-17 14:23:27', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('e3123a4ff76f4b29b8ffc9d5266280', 'WHS01', '2022-11-17 14:15:50', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('e31863f6b1e443a7857a180796205f', 'WHS01', '2022-11-17 13:53:21', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('e48bb50228ef4c3c9ffcf03d2b00c7', 'WHS02', '2022-11-18 13:09:05', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('e4a76d6260d84714bb8c861e47fde4', 'WHS01', '2022-11-17 14:31:38', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000012', 'POR-221117-00001000001', 7000, 0),
('e53f0a8f2bba43ca9e23ccfe8b3ae6', 'WHS01', '2022-11-17 13:45:14', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('e566e4dd4faa4078a493ef8808964b', 'WHS01', '2022-11-17 14:15:06', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('e5696f9b9de14abeab1a89ecab6efe', 'WHS01', '2022-11-17 14:20:53', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('e5fe46500cc24d6288a4c6c85c7dba', 'WHS01', '2022-11-17 14:21:05', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('e721e7066a984cecb5fc188424cc82', 'WHS01', '2022-11-17 13:45:39', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('e977e28a2ca140cdb61dffe9ff043b', 'WHS01', '2022-11-17 13:44:47', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('e9b37f1d408a49c6820ea3ef1e8f8c', 'WHS01', '2022-11-21 12:07:36', NULL, NULL, 0, 'PO-002221020-0002', 'POR-20221117-0001', 'POR-221117-000015', 'POR-221117-00001000001', 1, 0),
('ebd5589b038e42a594ea9f4a2288a3', 'WHS01', '2022-11-17 14:06:08', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('edf6ce190eac4e3d8a02d041fd21d4', 'WHS01', '2022-11-17 14:17:16', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('ee2658e5a3d14650b5e3f764221774', 'WHS01', '2022-11-16 15:06:13', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000001', 'POR-221117-00001000001', 1, 0),
('ee917f8a3e414ec7984ccaf37153eb', 'WHS01', '2022-11-17 13:52:57', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('f0b0f67e7ac24b23b3b9b53cf71c81', 'WHS02', '2022-11-18 13:05:52', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('f0c8c7f7b2a2478ea62ee52d143d17', 'WHS01', '2022-11-17 14:16:08', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('f28c7abfcf3f4335b12e89529c05ec', 'WHS01', '2022-11-17 13:45:08', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('f614d1eb79bc4a6e8cf68388ff449c', 'WHS01', '2022-11-16 15:10:11', NULL, NULL, 0, 'PO-003221019-0001', 'POR-20221116-0001', 'POR-221116-000003', 'POR-221117-00001000001', 1, 0),
('f643cfbf41db474bad77a60e3b8b5a', 'WHS01', '2022-11-17 13:45:24', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('f72e9640bf314ff1823e7e8bc7dee2', 'WHS01', '2022-11-17 13:53:33', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('f7b5c3be7ad345e88564f26145d594', 'WHS01', '2022-11-17 13:45:18', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000004', 'POR-221117-00001000001', 4000, 0),
('f85146b9409348a78d3008db1139a0', 'WHS01', '2022-11-17 14:23:55', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('f87788db648843df9485db3ee35129', 'WHS02', '2022-11-18 13:09:01', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('f97527830b7141efa0e22cb4957678', 'WHS01', '2022-11-17 14:33:43', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000010', 'POR-221117-00001000001', 100000, 0),
('fa8a61d18af1446bba91109e5ca934', 'WHS01', '2022-11-17 14:18:41', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('fac7d607a3b14da6bb0b02fb3a0625', 'WHS01', '2022-11-17 14:25:25', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('fbfb8655029a41f4936abe3d398448', 'WHS01', '2022-11-17 14:23:23', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('fc1feced2b4d4a5a9a1283bd8da827', 'WHS01', '2022-11-17 13:00:02', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000001', 'POR-221117-00001000001', 1000, 0),
('fc4328286567448fbfa85574035028', 'WHS01', '2022-11-17 14:23:37', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('fcd0579a62994a8193ee4d24d4fe56', 'WHS02', '2022-11-18 13:09:09', NULL, NULL, 0, 'PO-003221019-0002', 'POR-20221116-0004', 'POR-221117-000014', 'POR-221117-00001000001', 10, 0),
('fdf1168011bb43c5943febf4d2514f', 'WHS01', '2022-11-17 13:53:02', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000003', 'POR-221117-00001000001', 5000, 0),
('fedadafb9ce049dab3c6db6b17b337', 'WHS01', '2022-11-17 14:23:28', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('fefe6780cddd469f92a9435348578b', 'WHS01', '2022-11-17 14:30:43', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0),
('ffaaa9ac9cdb43508c6460a8c06188', 'WHS01', '2022-11-17 14:24:48', NULL, NULL, 0, 'PO-002221019-0001', 'POR-20221116-0003', 'POR-221117-000011', 'POR-221117-00001000001', 1220, 0);

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
('050203b9cf5e45a5a685fe9f68ec9f', 'admin', '2022-11-14 20:57:53', NULL, NULL, 0, 'fd04621539994742b73c6f4cbfa63e', 'on', NULL, NULL, NULL, NULL, NULL, 'on', 'on', 0),
('0760de2ddd7d4d1baf29814a722508', 'admin', '2022-11-14 22:24:44', NULL, NULL, 0, '3257e9a11a8543b8afd8e27c0a21d2', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('0c364be3fdae42b6b59c01389251d8', 'admin', '2022-11-14 20:58:21', NULL, NULL, 0, 'e505e5e5d2564aa280b3d568c8dd6c', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('0ca3131a3aef48e3ba23c07612b771', 'admin', '2022-10-13 15:38:59', NULL, NULL, 0, '4f841c89e8274fd88335b2346d1ee2', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('0cf3c3b165dc492a9cfae284708dd1', 'admin', '2022-10-13 16:15:05', NULL, NULL, 0, '5ad1d62d08a3408d9ab3a84c105d15', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('0d0af664535841848285de80437691', 'admin', '2022-11-13 22:38:37', NULL, NULL, 0, '5cf9545d619a497ab20036d1c587c6', 'on', NULL, NULL, NULL, NULL, NULL, 'on', 'on', 0),
('0fddaa1405bf4a6081704dba2da56b', 'admin', '2022-09-29 17:01:01', NULL, NULL, 0, 'cf98f97766f6405590b26daa586e00', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('12787772bb2b4d7a8aa6b10559edc5', 'admin', '2022-10-16 12:48:32', NULL, NULL, 0, '7e92720f68204d2b948412828a116b', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('18944e423a144c35b0c76050a4d74d', 'admin', '2022-09-29 17:04:17', NULL, NULL, 0, 'c8f8362a5f6c432ab27d37213f15d4', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('20221123000001', 'admin', '2022-11-23 00:00:39', NULL, NULL, 0, '865cff3b613848cebcc7cb9667fbb1', 'on', NULL, NULL, NULL, NULL, NULL, 'on', 'on', 0),
('20221129000001', 'admin', '2022-11-29 11:10:58', NULL, NULL, 0, '7b3fd71d12d04dfdbfe4323903def5', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('20221129000002', 'admin', '2022-11-29 11:11:07', NULL, NULL, 0, 'c5e3a7bb003a42309c42907778173d', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('20a062c23b1d4c17aa1c2708fb69ca', 'admin', '2022-10-07 17:31:18', NULL, NULL, 0, 'e0f3586f91ee4ab2952b6a8ad0f5db', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('24638db76e3e4eb7bde1daae897752', 'admin', '2022-10-26 11:43:25', NULL, NULL, 0, '2c33a59b7b6c41be80df4129f90b71', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('265903ce55984c108b379833f53dc0', 'admin', '2022-10-16 13:56:59', NULL, NULL, 0, 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('28326066166f4866ace3d1ed643ffa', 'admin', '2022-11-14 21:44:38', NULL, NULL, 0, 'ac590aa34b8d4d85aebeaa6d6ee4a0', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('29a1fdd336ee4779b0cb9a1bd76f94', 'admin', '2022-11-04 20:57:22', NULL, NULL, 0, 'f0546fc46bf54b9385492a0da1fbf2', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('2b87f0b4f4fb4fb9b0134f49b6769a', 'admin', '2022-10-19 22:49:12', NULL, NULL, 0, '1bae0b2618ae47b5b7884c40519b61', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('2d6e9dc9efe946b9953903da4ddb10', 'admin', '2022-10-16 12:50:12', NULL, NULL, 0, '0bf49f569bb04892bda649b91bf21d', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('3355d1d6a3fb4ccb86c18bd5911c89', 'admin', '2022-10-07 18:20:45', NULL, NULL, 0, 'd188047ab21d45979c64c990a91e23', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('3491bbaf4b1f4d5385ae97a4dd6704', 'admin', '2022-10-16 12:49:23', NULL, NULL, 0, 'e7f55074baa54065bca03b77c62574', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('36cf6d128e674c2e969c97e28e1f09', 'admin', '2022-10-07 18:51:46', NULL, NULL, 0, 'a5d9db23534f44fa9d58a7f996ce2a', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('3a2ee69b825044838f568c6e84c974', 'admin', '2022-10-24 11:49:10', NULL, NULL, 0, '1d9918c716514cdfac598ba366aaef', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('3a642618e5ee477f89cdebf20d7030', 'admin', '2022-10-16 16:07:31', NULL, NULL, 0, '059428c1b43c4e8ca99d7314a7575b', 'on', NULL, NULL, NULL, NULL, NULL, 'on', 'on', 0),
('3c2f11cdd7834c78b64566a64e1015', 'admin', '2022-10-27 09:44:08', NULL, NULL, 0, 'e780677ba5764a128f4ae77e3b720e', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('3cc2624214d244aa8f41d7657e005c', 'admin', '2022-10-20 05:08:32', NULL, NULL, 0, '0e4bb0451f1d4a64a4f7be6be13708', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('44d4297a92d841fdacd6814262ef72', 'admin', '2022-10-16 12:50:30', NULL, NULL, 0, '50db640c2a0f47ab8958d00958d1b7', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('462223b9d3234e1dbfa96cd8963b1f', 'admin', '2022-10-28 00:12:44', NULL, NULL, 0, 'da7ff9a6b87a4b77bf7d89ef1f0c62', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('4755d360c4cf45259dfc75d2c607b0', 'admin', '2022-11-13 22:39:09', NULL, NULL, 0, '834ee81f71d14a1ba35708d85f7526', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('4b644f346a2144269a6b194e3e8c03', 'admin', '2022-11-15 22:00:20', NULL, NULL, 0, 'b3caa83cf1534926a614edc17ed055', 'on', 'on', NULL, 'on', 'on', 'on', 'on', 'on', 0),
('4bd526d8b21543838779825c0484ea', 'admin', '2022-10-17 22:25:38', NULL, NULL, 0, '3562627a9d084609a7dea66faf8598', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('4d5cad89d11949e4842e13fac4f975', 'admin', '2022-10-16 12:50:17', NULL, NULL, 0, '2d0a643865084c4ba9fbc7869370fa', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('4d7eea6d7e404774980591dd58541c', 'admin', '2022-10-13 16:15:03', NULL, NULL, 0, '3f423b73a7b04367853767d7de4bc5', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('51c9d6e14c034c07b73871c9b78652', 'admin', '2022-10-16 12:50:10', NULL, NULL, 0, '93d9f074b9e142eaa1103045d07273', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('53f837cac744428ebe6c46b58166bf', 'admin', '2022-10-16 12:50:15', NULL, NULL, 0, '5214613be76e4e08ab01a260c8ef55', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('53f9a3dfd3094c909a6db12186e7bc', 'admin', '2022-10-07 18:12:35', NULL, NULL, 0, '3038d96df22048608bbbb8762bbe24', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('54e0ccf1e1e94624ae017715e70c6d', 'admin', '2022-11-14 21:19:22', NULL, NULL, 0, '30baffda74154b428e3effd069d09e', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('61b6723f47044f729ae6d30c3547f9', 'admin', '2022-10-07 20:14:11', NULL, NULL, 0, 'a98a56d8e07944d4a5a3d628358f03', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('632d22f50ae04ae48859dd86e35a8f', 'admin', '2022-10-26 08:34:22', NULL, NULL, 0, '8f2e2ea5fa0649619863e4a30f1cbc', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('6504ca4e927944a4824d7d86c3fe26', 'admin', '2022-11-13 22:39:04', NULL, NULL, 0, '5f52889797034e918456da3c3a7971', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('65359b84216a4160b69f7ce8cc5e5f', 'admin', '2022-10-07 17:31:56', NULL, NULL, 0, '3ca074598cf94973b83bb1facb1190', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('65bdf777a5564d5c94068feb0edcb9', 'admin', '2022-09-29 17:03:57', NULL, NULL, 0, 'de3f6855009e49deb7fd2fdd0f3b3d', 'on', NULL, NULL, 'on', NULL, NULL, 'on', 'on', 0),
('69f4089980ed47e7b01958512bd6c0', 'admin', '2022-11-14 22:29:07', NULL, NULL, 0, 'de6779722f6347d798b07350eee0ef', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('6e92e482f00b40358cb84a9894c276', 'admin', '2022-10-16 12:50:27', NULL, NULL, 0, '1f0d78d3e80a457bb0914831b94c7b', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('725d847e0b61464e9a1e563788092c', 'admin', '2022-10-16 12:49:06', NULL, NULL, 0, '23ce7975fd3a45abaf71ef4a805056', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('836ff9fa6650482fbf81e4f49bb255', 'admin', '2022-09-29 17:03:46', NULL, NULL, 0, '6ccd20c54d1d415189120ec5cc6c81', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('880ea658785d44929df3fe128c6617', 'admin', '2022-10-13 16:14:50', NULL, NULL, 0, '9c04c7dfcf6c44cc9a0ec44b1c7691', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('8cf9e31a44fd40efba4124fd293640', 'admin', '2022-10-07 17:32:06', NULL, NULL, 0, 'e9d8310044d3481f81834d14f91bd7', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('8e712c0bec164331b1f2131b410425', 'admin', '2022-10-07 21:01:29', NULL, NULL, 0, '8001792212e640eb8e67b13a16a26d', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('9353391666bb4d81bc4c678771b98b', 'admin', '2022-10-12 04:57:35', NULL, NULL, 0, 'c10a8ffd0165455989b58f9090798c', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('9529df37239c49f8a5be37a560417d', 'admin', '2022-10-16 12:49:47', NULL, NULL, 0, '3265ca2128e841a9ba488846de25f7', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('962311b4039448699f25c8ef64f470', 'admin', '2022-09-29 17:04:22', NULL, NULL, 0, '44964312f0264429978158ada88843', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('972a76a5a04e416e92a9b4e225c19c', 'admin', '2022-09-29 17:04:02', NULL, NULL, 0, 'd13439e3f2324450a69b4e0e50159a', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('98252c26c0c446118809ffe9ac885c', 'admin', '2022-10-16 12:50:14', NULL, NULL, 0, '7097c7632da5440994c39f828678ab', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('9e02556ff6a6452e8298a7800eee7c', 'admin', '2022-11-16 14:28:37', NULL, NULL, 0, '670141b0c0ac4f61bba46f0c85acd6', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('a4dc58ea1d774f15a3d24f7e9f87bc', 'admin', '2022-10-26 11:38:39', NULL, NULL, 0, '4436260df6074dfb8676de448a1a89', 'on', 'on', 'on', 'on', NULL, NULL, NULL, NULL, 0),
('a88be7a83e364c4eb29cd72be852a9', 'admin', '2022-10-28 00:12:04', NULL, NULL, 0, '76e9ec30b2274d13b6fd78bd9771b0', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('ac2ecd50edcb4e04b15251a250b7be', 'admin', '2022-10-16 12:50:19', NULL, NULL, 0, '687d6466b56c4d0f926dd655ae7ab9', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('ac40bf63b16d4aeab224d7d7dfb130', 'admin', '2022-10-07 18:38:19', NULL, NULL, 0, '255bcee4fb4c45d8aa938b8279893c', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('adc02a6ea56948509a0c34da310a46', 'admin', '2022-10-16 12:49:49', NULL, NULL, 0, '42c5d26116ee453e9225b91d3c827d', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('b0050a24404c432d9116944bb3bc8c', 'admin', '2022-10-07 17:31:50', NULL, NULL, 0, 'a015669f743f49d18be7541f4e9e4f', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('b0e891c3fe6a447f97150702d185d0', 'admin', '2022-10-07 17:31:35', NULL, NULL, 0, '3dd1a46ef2834b79a8da5080c496e4', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('b74140596412487bb85891f3a11854', 'admin', '2022-10-26 11:37:26', NULL, NULL, 0, '92502b9d5bf7422d9e108068e2316c', 'on', NULL, NULL, NULL, NULL, NULL, 'on', 'on', 0),
('c150682d482f4c25b613172ba9b880', 'admin', '2022-09-29 17:04:13', NULL, NULL, 0, 'e3c31e10b6c64e119b068ae4b73be6', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('c47b2d67ddb444edb8e1ade2ff78f0', 'admin', '2022-10-07 17:31:48', NULL, NULL, 0, '612df21b8cd34fb5869011b0e92f81', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('ca93e2509fc54771b5ec614a066d85', 'admin', '2022-10-26 11:51:55', NULL, NULL, 0, '50f02a4e5e0845f4aab2b43bf63047', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('d555a830ee91408880789f70d488a2', 'admin', '2022-10-19 22:49:08', NULL, NULL, 0, '5666bae5c6254bab977fcd4fd7129e', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('db5b12161cd041f9a980fb3114e7c3', 'admin', '2022-10-16 12:49:30', NULL, NULL, 0, 'ae9dda6c8d9e4366a241528c7390ff', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('dc02c9c9237e4f3fad8b8787691f63', 'admin', '2022-10-07 17:31:43', NULL, NULL, 0, '62309884bfe74e5696f10f32243d97', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('dd43c9f7bdb549138bdcec6fa0fc62', 'admin', '2022-11-12 23:20:29', NULL, NULL, 0, 'b7f1f62e48c34c73ba97bef9e22ffb', 'on', NULL, NULL, NULL, NULL, NULL, 'on', 'on', 0),
('e1c69b08bcc5424889afde8cd16ad5', 'admin', '2022-10-16 12:49:28', NULL, NULL, 0, '8344f4bb673644908cf7f59e61f84d', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('e6df2154c7544bee9028c45ee2c732', 'admin', '2022-10-07 17:31:52', NULL, NULL, 0, '39894a92c9e9456997bb6af3b21bd3', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('eb0c375a4dfc4f6b9bfc9f782126b4', 'admin', '2022-10-19 22:49:05', NULL, NULL, 0, '955ae49b75df4f678ec2324489ae3d', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('eba912bd48844e1dbe5689737f6ea9', 'admin', '2022-10-07 21:39:06', NULL, NULL, 0, '93d8c32f689c41399f7ccb5ce434c3', 'on', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
('edae5d40129f4bd2b4ac567c020497', 'admin', '2022-10-07 18:18:26', NULL, NULL, 0, '3c5e75290ca947eab000aa09269753', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('ef8730f9fdf14c57a7c4aed9870c09', 'admin', '2022-11-14 20:57:58', NULL, NULL, 0, '2a4389152cc646148f199267b768d0', 'on', NULL, NULL, NULL, NULL, NULL, 'on', 'on', 0),
('eff15051ce0149beb6b5dc8acd36b8', 'admin', '2022-10-07 18:25:23', NULL, NULL, 0, '7d7f997ca58f425c8783ff7a7f994c', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('f10a5347cb5e4f38be8339258b589a', 'admin', '2022-10-07 17:31:32', NULL, NULL, 0, 'ec436420c2734ec3a864eeedbe53c6', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('f6d82192e5e5435584db2ba80b9f03', 'admin', '2022-10-07 17:31:54', NULL, NULL, 0, '90af5528e9a4458585b2d74bb73b05', 'on', 'on', 'on', 'on', NULL, NULL, 'on', 'on', 0),
('f85929619f53420ea32a0eb9049e1d', 'admin', '2022-11-14 20:58:02', NULL, NULL, 0, '62482f126fe940939924a187d617ea', 'on', NULL, NULL, NULL, NULL, NULL, 'on', 'on', 0),
('fa602303fbd14b4ea23a3c84588123', 'admin', '2022-10-07 20:42:07', NULL, NULL, 0, 'c98376ce677644eea31e91bcb49438', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0),
('fefa2dbad50f425c99fb1a9c9523e6', 'admin', '2022-10-19 22:49:10', NULL, NULL, 0, '48be2218f3134d0d900c14b875cd4b', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', 0);

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
('008aeb95209f40a7a08164a1cf6a94', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '7097c7632da5440994c39f828678ab', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('008d68ea392946b0a647a91eae2ef0', 'admin', '2022-10-07 18:18:29', 'admin', '2022-10-07 18:18:36', 0, 'admin', '3c5e75290ca947eab000aa09269753', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('00e168e4811c41ccaf1b6ffcefaef0', 'admin', '2022-10-07 20:14:15', 'admin', '2022-10-07 20:14:23', 0, 'admin', 'a98a56d8e07944d4a5a3d628358f03', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('0160c0915f6044468c58cebed25158', 'admin', '2022-10-07 20:42:10', 'admin', '2022-10-07 20:42:16', 0, 'admin', 'c98376ce677644eea31e91bcb49438', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('0199c56307b24dcf90a22e7a4a15d5', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'a015669f743f49d18be7541f4e9e4f', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('01fb40ff87ea44bc8a15ec71b45a66', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '1f0d78d3e80a457bb0914831b94c7b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0229a2465c934b579f9126f42bd2fe', 'admin', '2022-10-19 22:49:16', 'admin', '2022-10-19 22:49:47', 0, 'admin', '48be2218f3134d0d900c14b875cd4b', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('02b25e3b90084520a2c05fbbf68a70', 'admin', '2022-11-21 13:46:12', 'admin', '2022-11-21 13:46:49', 0, 'MGT02', '76e9ec30b2274d13b6fd78bd9771b0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0362a1a4d2484b3db9ee8623617182', 'admin', '2022-10-07 21:39:55', 'admin', '2022-11-29 11:11:38', 0, 'admin', '7b3fd71d12d04dfdbfe4323903def5', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('0460625308e54e4291497da620adb2', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:20:37', 0, 'WHS02', '7e92720f68204d2b948412828a116b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('0484104ab3824405b5c7b1f035bf42', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('049d28a71a0c4d569f6b1d5e0ed72e', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('056ec1395c9940b9b874d32c1723de', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('062cf454be0648798b9a925690f52a', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'e9d8310044d3481f81834d14f91bd7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('06ba5a67d8e64d378d558138d06610', 'admin', '2022-10-16 13:57:04', 'admin', '2022-10-16 13:57:12', 0, 'admin', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('06ba8400505144dfac556a697c27f3', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('06f391dbedd54dd395e5a862799562', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '7b3fd71d12d04dfdbfe4323903def5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0744f29a9709498f854ea0d959e885', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-24 11:46:08', 0, 'samsudin', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('077676b4d4514202a978f603699c17', 'admin', '2022-10-28 00:13:00', 'admin', '2022-10-28 13:44:42', 0, 'samsudin', '1d9918c716514cdfac598ba366aaef', 1, 1, 1, 0, 1, 1, 1, 1, 0),
('07e4e0ddb5244052a84fcf9a28282c', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '62309884bfe74e5696f10f32243d97', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('084840e2914c46cd8cafb0d1e31bd9', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0911cc9abaa54be4bdbdb2ba9ea999', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '7097c7632da5440994c39f828678ab', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('098bcdbb8bbe4e4c926bc03e944fbe', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('098f88d5c9774d75b0161bd3e2524b', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '7097c7632da5440994c39f828678ab', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('09a7d93942544d4894ffdc622ac808', 'admin', '2022-11-15 11:18:42', NULL, NULL, 0, 'WHS01', '30baffda74154b428e3effd069d09e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('09f2cbc7eb7b4ada874d6a647cfe0f', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:45:33', 0, 'ADM01', '5ad1d62d08a3408d9ab3a84c105d15', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('0a16306d547943fd9c121d2e0a8085', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0a54eb36a2e44bbd93c7b1ab02defa', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:42:47', 0, 'WHS01', '5ad1d62d08a3408d9ab3a84c105d15', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('0a96fb54ebf44891882a9bfda805ad', 'admin', '2022-11-13 22:39:38', NULL, NULL, 0, 'YENIARTI', '5cf9545d619a497ab20036d1c587c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0aa14f5cfbd14fde974cef9eeadc65', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:50:58', 0, 'admin', '8344f4bb673644908cf7f59e61f84d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('0ac293459dcb400c9804bdafde366a', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '3ca074598cf94973b83bb1facb1190', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0b1bf346c0d44d829d90be5467bc81', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:45:21', 0, 'ADM01', '30baffda74154b428e3effd069d09e', 1, 1, 1, 1, 1, 1, 1, 0, 0),
('0c35736a09ea4854b08b5f5c0995f2', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0c4c7384c9d84ac5880fa3572e1127', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0cebc055404642189bea27f6cbc3cd', 'admin', '2022-11-15 11:18:42', NULL, NULL, 0, 'WHS01', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0d67cfce9e984056826904bf2afc54', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', 'e7f55074baa54065bca03b77c62574', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0e67099ab9b14557808d2d237ff3d4', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '3dd1a46ef2834b79a8da5080c496e4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0f5c8989734d40b9b082b24f82eb00', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '2d0a643865084c4ba9fbc7869370fa', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('0f8702ece6b64af4804126c80635c6', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:45:25', 0, 'ADM01', 'c5e3a7bb003a42309c42907778173d', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('0fc55b17a96844e09c7a61edb233ba', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'e7f55074baa54065bca03b77c62574', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('103c9ec78cd14bd5a631af43381451', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1063a471dff14cf7b752ebb02e6ec2', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:42:48', 0, 'WHS01', '7e92720f68204d2b948412828a116b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('11489287933d4984941f854c84bf0b', 'admin', '2022-11-15 13:35:42', NULL, NULL, 0, 'YENIARTI', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11642b5025f243279f3c126b4eaebb', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-16 14:28:55', 0, 'ADM01', '670141b0c0ac4f61bba46f0c85acd6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('11a28711970442f1ae1d1a6c5b7908', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:43:28', 0, 'ADM01', 'ec436420c2734ec3a864eeedbe53c6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('11b4c0fb96ed432790484dabc242cd', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11e41ab00ad34bd3b3d92bfca9c559', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '2d0a643865084c4ba9fbc7869370fa', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('11fe2fa27d954e1f8ddc797b2b43b1', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('121b53f636f945f394c0b3c3e06af7', 'admin', '2022-11-13 22:39:43', NULL, NULL, 0, 'WHS01', '2a4389152cc646148f199267b768d0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('12db1a13afdb4e95b2c4bf60c75fa8', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '30baffda74154b428e3effd069d09e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('131275fe62294abda28265ef431237', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:38:17', 0, 'samsudin', '90af5528e9a4458585b2d74bb73b05', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('13f467e0c9d44f25baee2428bf5acd', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('144bad330d874e178301bd3a7a9148', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '1bae0b2618ae47b5b7884c40519b61', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1461f733ff9b45e5aea449d22811db', 'admin', '2022-10-12 04:57:16', 'admin', '2022-11-15 22:01:31', 0, 'admin', 'b3caa83cf1534926a614edc17ed055', 1, 1, 0, 1, 1, 1, 1, 1, 0),
('14fc2f3379ab452f89c588532e8b01', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:50:58', 0, 'admin', 'e7f55074baa54065bca03b77c62574', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('15558228fbcd48aa80d6c5c7120abc', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '3f423b73a7b04367853767d7de4bc5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('15a081d5803d42eebe9be4346d7f46', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '50db640c2a0f47ab8958d00958d1b7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1680ada813314376b025e90dc3d472', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:04:58', 0, 'MGT01', 'e780677ba5764a128f4ae77e3b720e', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('168f90a756f1475a8b37306b01173a', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:43:41', 0, 'WHS01', '23ce7975fd3a45abaf71ef4a805056', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('17013a39b2ea4e748cc74c5b885877', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1782b65bd9aa46c1ba9e009933d4fd', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'c5e3a7bb003a42309c42907778173d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('18534dacb48a4d419b8fd6bdcef8bc', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:09', 0, 'admin', '1f0d78d3e80a457bb0914831b94c7b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('18617aca12514267a0b60f820a29ec', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:17', 0, 'ADM01', '2d0a643865084c4ba9fbc7869370fa', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('1864fa8b484d4ae8bfac05ab8d6a30', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'ae9dda6c8d9e4366a241528c7390ff', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('187c7af889424cd29cb823924b6e57', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:27:07', 0, 'WHS02', '955ae49b75df4f678ec2324489ae3d', 1, 1, 1, 0, 1, 1, 1, 1, 0),
('18843281de6948659d11ae214658c2', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:45:21', 0, 'WHS01', 'b3caa83cf1534926a614edc17ed055', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('18fe16a8f725407db67da2b0946f9c', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '9c04c7dfcf6c44cc9a0ec44b1c7691', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('198304f4656a40cc93902294424c43', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('19930928b8c8452aa53463cb23aec9', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '612df21b8cd34fb5869011b0e92f81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('19a9dd8462fa4e05846bfef56ec7d5', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:03', 0, 'admin', '5f52889797034e918456da3c3a7971', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('19d2f34ac13549ebb3c2ef2262878c', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('19e3c28584ce4273b80e1a3ccc1834', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-29 11:38:49', 0, 'ADM01', '62309884bfe74e5696f10f32243d97', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('1a42c76d328a49c9b250a570036fce', 'admin', '2022-10-28 00:13:08', NULL, NULL, 0, 'WHS01', 'fd04621539994742b73c6f4cbfa63e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1a4b952591cd4ac1b68aba1917481e', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '2d0a643865084c4ba9fbc7869370fa', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1a65c8bdefe545018a87f5d876f1ed', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '1f0d78d3e80a457bb0914831b94c7b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1a86ab3a415948f6870f04646f1285', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1ac28f51c48e4d98ba591f4e1abea1', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-25 13:57:14', 0, 'WHS02', '3f423b73a7b04367853767d7de4bc5', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('1b449f693b56483396924c24fe66e0', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:42:46', 0, 'WHS01', '3f423b73a7b04367853767d7de4bc5', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('1b50f43db4664ba09e9e8b2dc49ab5', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:26:20', 0, 'WHS02', '2a4389152cc646148f199267b768d0', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('1b6ba97e74b84b289dfda76069a836', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:47', 0, 'admin', '90af5528e9a4458585b2d74bb73b05', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('1c0f4cea64214e16963d8a76c80e58', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '76e9ec30b2274d13b6fd78bd9771b0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1c5cfa6b040a40c8a7ebdf08da2986', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '3dd1a46ef2834b79a8da5080c496e4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1c634039cb6f42199fc233a015293d', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:37:41', 0, 'samsudin', '8001792212e640eb8e67b13a16a26d', 1, 1, 1, 0, 1, 1, 1, 1, 0),
('1c702b34df8141c5ad9fe7a179cee0', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'c10a8ffd0165455989b58f9090798c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1c73bebc2e4346a7a52904062039cd', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:27', 0, 'MGT01', '48be2218f3134d0d900c14b875cd4b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('1d08d0b006ac46bb939f565fa160ea', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '5f52889797034e918456da3c3a7971', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1d37db7351c54bba97f80ecf21fed1', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'c5e3a7bb003a42309c42907778173d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1d4e333507604f09b42e1f0eeb3f92', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '3ca074598cf94973b83bb1facb1190', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1d8d07e0e12340bca1ac63cac88e71', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '42c5d26116ee453e9225b91d3c827d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1dbf25ee95f34887906d25f180082b', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '93d9f074b9e142eaa1103045d07273', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1e7664c6b70145e6b5be014db6c8fe', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'e7f55074baa54065bca03b77c62574', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('1f94e867dde6422f95462d9f3c1afc', 'admin', '2022-11-04 21:07:03', 'admin', '2022-11-14 20:58:16', 0, 'admin', '2a4389152cc646148f199267b768d0', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('1fe23ea28c9e43b998de30926063a1', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:04', 0, 'ADM01', '1f0d78d3e80a457bb0914831b94c7b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('1ffa259b52ac44eb922f5bdf5606bc', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '50db640c2a0f47ab8958d00958d1b7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000001', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '059428c1b43c4e8ca99d7314a7575b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000002', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '0bf49f569bb04892bda649b91bf21d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000004', 'admin', '2022-11-25 14:07:02', 'admin', '2022-11-25 14:07:25', 0, 'NURYUAN', '0e4bb0451f1d4a64a4f7be6be13708', 1, 1, 0, 0, 0, 0, 0, 0, 0),
('20221125000005', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '1bae0b2618ae47b5b7884c40519b61', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000006', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '1d9918c716514cdfac598ba366aaef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000007', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '1f0d78d3e80a457bb0914831b94c7b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000008', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '23ce7975fd3a45abaf71ef4a805056', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000009', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000010', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '2a4389152cc646148f199267b768d0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000011', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '2c33a59b7b6c41be80df4129f90b71', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000012', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '2d0a643865084c4ba9fbc7869370fa', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000013', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000014', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '30baffda74154b428e3effd069d09e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000015', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000016', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '3265ca2128e841a9ba488846de25f7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000017', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000018', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '39894a92c9e9456997bb6af3b21bd3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000019', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000020', 'admin', '2022-11-25 14:07:02', NULL, NULL, 0, 'NURYUAN', '3ca074598cf94973b83bb1facb1190', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000021', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '3dd1a46ef2834b79a8da5080c496e4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000022', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '3f423b73a7b04367853767d7de4bc5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000023', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '42c5d26116ee453e9225b91d3c827d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000024', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000025', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000026', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '48be2218f3134d0d900c14b875cd4b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000027', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '4f841c89e8274fd88335b2346d1ee2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000028', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '50db640c2a0f47ab8958d00958d1b7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000029', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000030', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '5214613be76e4e08ab01a260c8ef55', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000031', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '5666bae5c6254bab977fcd4fd7129e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000032', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '5ad1d62d08a3408d9ab3a84c105d15', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000033', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '5cf9545d619a497ab20036d1c587c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000034', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '5f52889797034e918456da3c3a7971', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000035', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '612df21b8cd34fb5869011b0e92f81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000036', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '62309884bfe74e5696f10f32243d97', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000037', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '62482f126fe940939924a187d617ea', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000038', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '670141b0c0ac4f61bba46f0c85acd6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000039', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '687d6466b56c4d0f926dd655ae7ab9', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000040', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000041', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '7097c7632da5440994c39f828678ab', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000042', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '76e9ec30b2274d13b6fd78bd9771b0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000043', 'admin', '2022-11-25 14:07:03', 'admin', '2022-11-25 14:07:28', 0, 'NURYUAN', '7b3fd71d12d04dfdbfe4323903def5', 1, 1, 0, 0, 0, 0, 0, 0, 0),
('20221125000044', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000045', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '7e92720f68204d2b948412828a116b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000046', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '8001792212e640eb8e67b13a16a26d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000047', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '8344f4bb673644908cf7f59e61f84d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000048', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '834ee81f71d14a1ba35708d85f7526', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000049', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '865cff3b613848cebcc7cb9667fbb1', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000050', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000051', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '8f2e2ea5fa0649619863e4a30f1cbc', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000052', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '90af5528e9a4458585b2d74bb73b05', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000053', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '92502b9d5bf7422d9e108068e2316c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000054', 'admin', '2022-11-25 14:07:03', 'admin', '2022-11-25 14:07:08', 0, 'NURYUAN', '93d8c32f689c41399f7ccb5ce434c3', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000055', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '93d9f074b9e142eaa1103045d07273', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000056', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '955ae49b75df4f678ec2324489ae3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000057', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', '9c04c7dfcf6c44cc9a0ec44b1c7691', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000058', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'a015669f743f49d18be7541f4e9e4f', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000059', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000060', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000061', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000062', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'ae9dda6c8d9e4366a241528c7390ff', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000063', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'b3caa83cf1534926a614edc17ed055', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000064', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000065', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'b7f1f62e48c34c73ba97bef9e22ffb', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000066', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'c10a8ffd0165455989b58f9090798c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000067', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'c5e3a7bb003a42309c42907778173d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000068', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000069', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000070', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000071', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000072', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000073', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000074', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000075', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000076', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000077', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000078', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000079', 'admin', '2022-11-25 14:07:03', 'admin', '2022-11-25 14:07:24', 0, 'NURYUAN', 'e780677ba5764a128f4ae77e3b720e', 1, 1, 0, 0, 0, 0, 0, 0, 0),
('20221125000080', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'e7f55074baa54065bca03b77c62574', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000081', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'e9d8310044d3481f81834d14f91bd7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000082', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000083', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'ec436420c2734ec3a864eeedbe53c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000084', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'f0546fc46bf54b9385492a0da1fbf2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221125000085', 'admin', '2022-11-25 14:07:03', NULL, NULL, 0, 'NURYUAN', 'fd04621539994742b73c6f4cbfa63e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000001', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '059428c1b43c4e8ca99d7314a7575b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000002', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '0bf49f569bb04892bda649b91bf21d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000003', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '0e4bb0451f1d4a64a4f7be6be13708', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000004', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '1bae0b2618ae47b5b7884c40519b61', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000005', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '1d9918c716514cdfac598ba366aaef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000006', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '1f0d78d3e80a457bb0914831b94c7b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000007', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '23ce7975fd3a45abaf71ef4a805056', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000008', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000009', 'admin', '2022-11-29 11:23:02', 'admin', '2022-11-29 11:24:13', 0, 'PRC01', '2a4389152cc646148f199267b768d0', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('20221129000010', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '2c33a59b7b6c41be80df4129f90b71', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000011', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '2d0a643865084c4ba9fbc7869370fa', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000012', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000013', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '30baffda74154b428e3effd069d09e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000014', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000015', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '3265ca2128e841a9ba488846de25f7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000016', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000017', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '39894a92c9e9456997bb6af3b21bd3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000018', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000019', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '3ca074598cf94973b83bb1facb1190', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000020', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '3dd1a46ef2834b79a8da5080c496e4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000021', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '3f423b73a7b04367853767d7de4bc5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000022', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '42c5d26116ee453e9225b91d3c827d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000023', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000024', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000025', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '48be2218f3134d0d900c14b875cd4b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000026', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '4f841c89e8274fd88335b2346d1ee2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000027', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '50db640c2a0f47ab8958d00958d1b7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000028', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000029', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '5214613be76e4e08ab01a260c8ef55', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000030', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '5666bae5c6254bab977fcd4fd7129e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000031', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '5ad1d62d08a3408d9ab3a84c105d15', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000032', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '5cf9545d619a497ab20036d1c587c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000033', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '5f52889797034e918456da3c3a7971', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000034', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '612df21b8cd34fb5869011b0e92f81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000035', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '62309884bfe74e5696f10f32243d97', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000036', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '62482f126fe940939924a187d617ea', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000037', 'admin', '2022-11-29 11:23:02', 'admin', '2022-11-29 11:23:28', 0, 'PRC01', '670141b0c0ac4f61bba46f0c85acd6', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000038', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '687d6466b56c4d0f926dd655ae7ab9', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000039', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000040', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '7097c7632da5440994c39f828678ab', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000041', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '76e9ec30b2274d13b6fd78bd9771b0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000042', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '7b3fd71d12d04dfdbfe4323903def5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000043', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000044', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '7e92720f68204d2b948412828a116b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000045', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '8001792212e640eb8e67b13a16a26d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000046', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '8344f4bb673644908cf7f59e61f84d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000047', 'admin', '2022-11-29 11:23:02', 'admin', '2022-11-29 11:24:04', 0, 'PRC01', '834ee81f71d14a1ba35708d85f7526', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000048', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '865cff3b613848cebcc7cb9667fbb1', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000049', 'admin', '2022-11-29 11:23:02', NULL, NULL, 0, 'PRC01', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000050', 'admin', '2022-11-29 11:23:02', 'admin', '2022-11-29 11:23:47', 0, 'PRC01', '8f2e2ea5fa0649619863e4a30f1cbc', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('20221129000051', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', '90af5528e9a4458585b2d74bb73b05', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000052', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', '92502b9d5bf7422d9e108068e2316c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000053', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', '93d8c32f689c41399f7ccb5ce434c3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000054', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', '93d9f074b9e142eaa1103045d07273', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000055', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', '955ae49b75df4f678ec2324489ae3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000056', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', '9c04c7dfcf6c44cc9a0ec44b1c7691', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000057', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'a015669f743f49d18be7541f4e9e4f', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000058', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000059', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000060', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000061', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'ae9dda6c8d9e4366a241528c7390ff', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000062', 'admin', '2022-11-29 11:23:03', 'admin', '2022-11-29 11:23:42', 0, 'PRC01', 'b3caa83cf1534926a614edc17ed055', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('20221129000063', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000064', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'b7f1f62e48c34c73ba97bef9e22ffb', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000065', 'admin', '2022-11-29 11:23:03', 'admin', '2022-11-29 11:23:08', 0, 'PRC01', 'c10a8ffd0165455989b58f9090798c', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000066', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'c5e3a7bb003a42309c42907778173d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000067', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000068', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000069', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000070', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000071', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000072', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000073', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000074', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000075', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000076', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000077', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000078', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'e780677ba5764a128f4ae77e3b720e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000079', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'e7f55074baa54065bca03b77c62574', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000080', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'e9d8310044d3481f81834d14f91bd7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000081', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000082', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'ec436420c2734ec3a864eeedbe53c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000083', 'admin', '2022-11-29 11:23:03', NULL, NULL, 0, 'PRC01', 'f0546fc46bf54b9385492a0da1fbf2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20221129000084', 'admin', '2022-11-29 11:23:03', 'admin', '2022-11-29 11:24:13', 0, 'PRC01', 'fd04621539994742b73c6f4cbfa63e', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('208aafc4020549ad8cdb2e3e168c91', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '059428c1b43c4e8ca99d7314a7575b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20bd5f42b3354096a39b5bcae78680', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '865cff3b613848cebcc7cb9667fbb1', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('20f95f5b01394567933fc86def018c', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '9c04c7dfcf6c44cc9a0ec44b1c7691', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('213add7a8e9744088448e0dd424095', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:13', 0, 'MGT01', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('218433d234724357bf4e19c7e5309e', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('21a9816b78204573ab963a3785824a', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('21c6d20de8ee486a851440a35c3c03', 'admin', '2022-11-14 21:45:29', 'admin', '2022-11-14 21:45:39', 0, 'admin', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('22327d4a061145979991b5e9b17f6a', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('22c92933ec2c4f8fa722558ed2ee7d', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('232d42cbbf374a56bf747b43ab88c2', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '3dd1a46ef2834b79a8da5080c496e4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2355bfb42c4f4df6ba6c3f865b8c05', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '865cff3b613848cebcc7cb9667fbb1', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('23b240ff2c974ec19836ad8186945a', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '93d9f074b9e142eaa1103045d07273', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('23bf13d85c944283981999ca974c32', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '4f841c89e8274fd88335b2346d1ee2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('244d5996b7734ece9d51752e706bef', 'admin', '2022-11-15 13:41:12', 'ADM01', '2022-11-16 14:26:55', 0, 'ADM01', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2518f6d2309c46c38af84f841e061e', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'a015669f743f49d18be7541f4e9e4f', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('258b5febd70e475a8642c5e69e039f', 'admin', '2022-11-15 11:18:42', NULL, NULL, 0, 'WHS01', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('25db217f49c24399be3a85369bd4f5', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '50db640c2a0f47ab8958d00958d1b7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2613249c45314a6d8933bca33e2c3e', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '93d9f074b9e142eaa1103045d07273', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('268583f2f54a4e5f9378dcc24ecbee', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'ae9dda6c8d9e4366a241528c7390ff', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('27170a63ed354133804f52dd5b4ae9', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '48be2218f3134d0d900c14b875cd4b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2727b0454bef46e5a9f9094590d71d', 'admin', '2022-10-28 00:13:00', NULL, NULL, 0, 'samsudin', 'fd04621539994742b73c6f4cbfa63e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('27557222900846718b88f43f3139ca', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '90af5528e9a4458585b2d74bb73b05', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('27710dc268634289bab348c5c23703', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '48be2218f3134d0d900c14b875cd4b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('27a09f11c1fe4198b024df15bcf023', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('28a44740a9144404a62818c2c9b3c3', 'admin', '2022-10-13 15:39:16', 'admin', '2022-11-14 21:19:39', 0, 'admin', '4f841c89e8274fd88335b2346d1ee2', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('28a53bc278b94a3b9385e319c0e4f3', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('294de03022524776a72b90169a7480', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '23ce7975fd3a45abaf71ef4a805056', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('29d380dad4434a93a9295df1e38e5c', 'admin', '2022-10-07 18:25:25', 'admin', '2022-10-07 18:25:32', 0, 'admin', '7d7f997ca58f425c8783ff7a7f994c', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('29d98c205c7a49bb8957c57fcf2194', 'admin', '2022-10-07 18:12:39', 'admin', '2022-10-07 18:12:45', 0, 'admin', '3038d96df22048608bbbb8762bbe24', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('29e692bf5c2a4a53907989cd6bb35e', 'admin', '2022-11-15 13:35:42', NULL, NULL, 0, 'YENIARTI', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2ad2733f34da461ca3f2c97f3d1b28', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:06:38', 0, 'MGT01', '9c04c7dfcf6c44cc9a0ec44b1c7691', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('2af1e0c5d61b47ad835da1aeb88f42', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'b3caa83cf1534926a614edc17ed055', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2b17ca7872724b258673c08b86352e', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-29 11:39:27', 0, 'ADM01', '3dd1a46ef2834b79a8da5080c496e4', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('2b3485743734469281087ef25b3f92', 'admin', '2022-11-15 13:35:42', NULL, NULL, 0, 'YENIARTI', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2b452ac55f18483f90568f1b005ab5', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:21:09', 0, 'WHS02', '059428c1b43c4e8ca99d7314a7575b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('2c192616c6374feebbbc2778dd4443', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:46', 0, 'admin', '44964312f0264429978158ada88843', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('2c6c2377963e456f850413c1ec0699', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:16', 0, 'admin', '0bf49f569bb04892bda649b91bf21d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('2d8263de61b34d37b8a118434ca083', 'admin', '2022-10-28 00:13:08', NULL, NULL, 0, 'WHS01', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2db60b74d0d84d41bf7f49b28f3221', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:16', 0, 'ADM01', '865cff3b613848cebcc7cb9667fbb1', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('2dcf81fe83604bd3aec28d9135c038', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:41:56', 0, 'ADM01', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('2f60bb510f5947bb9fcc50b6d34e66', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:04:57', 0, 'MGT01', '93d8c32f689c41399f7ccb5ce434c3', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('2f6f9f75d7594c7fa3576fe6fc4840', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'b3caa83cf1534926a614edc17ed055', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('313d6d78a4044e92b3f90df065832e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'fd04621539994742b73c6f4cbfa63e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3215202264534b658ad270546ea3eb', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:18', 0, 'ADM01', '0bf49f569bb04892bda649b91bf21d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('32356d38993d4087930c0fb34ec30f', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:05:00', 0, 'MGT01', '0e4bb0451f1d4a64a4f7be6be13708', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('32d5b41afa234853aaf3576bf960d4', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '7097c7632da5440994c39f828678ab', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3411e9a22a0d459e8ff184ead36799', 'admin', '2022-11-04 20:56:12', 'admin', '2022-11-04 20:57:37', 0, 'admin', 'f0546fc46bf54b9385492a0da1fbf2', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('34961c258f6b4392a4ed3b95077a5b', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'e780677ba5764a128f4ae77e3b720e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('353c4ea3d7dd4c798bdda6824fa8f5', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('35bb7c6c1c4145d98382c8f106715e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '834ee81f71d14a1ba35708d85f7526', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('365fe59d8f9546238647064f867ae4', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('36cdf6901d5d4236baa59f32d310f5', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('36d0410ab08940709ab3a8bbb88a29', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '93d8c32f689c41399f7ccb5ce434c3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('37099308bf9f42d98eeeb8719e5e6c', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '7e92720f68204d2b948412828a116b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3827dd94f9394487a25c3f2ca3d95b', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'a015669f743f49d18be7541f4e9e4f', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('387ccf43a4214de1b80337873a705b', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'e780677ba5764a128f4ae77e3b720e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3880159e8b2d481cab9d369bcb2a98', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '3265ca2128e841a9ba488846de25f7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('38b835e86545465aa78140f096395d', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('38c9e63777e7404789cba3585f613b', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-25 13:53:52', 0, 'WHS02', '5ad1d62d08a3408d9ab3a84c105d15', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('38ce0d635cdd4ac79f87e888b52db3', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '93d8c32f689c41399f7ccb5ce434c3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('38fac7b7e6614fe29b139730a5a59f', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '1d9918c716514cdfac598ba366aaef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('38ffbb15541d40e092ecd1a9214afb', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:07:33', 0, 'MGT01', '1f0d78d3e80a457bb0914831b94c7b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('3948c8e38f3745d997dae86da6bd5a', 'admin', '2022-10-28 00:12:58', NULL, NULL, 0, 'YENIARTI', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3a20a31125da4e79a1982504e9fa5f', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '50db640c2a0f47ab8958d00958d1b7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3a6ce215d82d45a190bdc8720c9d81', 'admin', '2022-11-04 21:16:20', 'admin', '2022-11-13 22:38:48', 0, 'admin', '5cf9545d619a497ab20036d1c587c6', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('3b09485c9d03427199817bec81ce91', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3b1456386c1d4c499b1b7508c282aa', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3b5c803713eb4244be9b9505e6fe5d', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:09', 0, 'MGT01', '62482f126fe940939924a187d617ea', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('3b8ea60d459641bab7966ffc885e36', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'fd04621539994742b73c6f4cbfa63e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3bc08e20723f418eb90c35c9e31dbc', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3c43b652185d4fa3a003f406289e84', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3caad7e48a4c4967a9daa0ebd07dd8', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '612df21b8cd34fb5869011b0e92f81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3cbf89571aaa47cca1888d86be77ed', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3cd3693a2d93447bb3257fdda3474c', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-29 11:39:13', 0, 'ADM01', '39894a92c9e9456997bb6af3b21bd3', 1, 1, 1, 1, 0, 0, 1, 1, 0);
INSERT INTO `setting_users` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `users_id`, `menus_id`, `v_view`, `v_add`, `v_edit`, `v_delete`, `v_upload`, `v_download`, `v_print`, `v_excel`, `status`) VALUES
('3d0971e13c9e477d9d35e7a4742924', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3d572b9825ce42949254aaace825d7', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '23ce7975fd3a45abaf71ef4a805056', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3d70f3ee63304c07bdeedb77b3c7c8', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '62309884bfe74e5696f10f32243d97', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3e737d063d564768bc381b3f6c9884', 'admin', '2022-10-28 00:12:58', NULL, NULL, 0, 'YENIARTI', '834ee81f71d14a1ba35708d85f7526', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3ec987758ef94059b67fe057f4306c', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3f0ba5fc2f014d24a0a2dd0779aaa9', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '1f0d78d3e80a457bb0914831b94c7b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3f7fea6ac02f4f4db34d2b0b68b01a', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:43:14', 0, 'WHS01', '5f52889797034e918456da3c3a7971', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('3fb1996144d34ee6a3e03a309fa496', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:43:42', 0, 'ADM01', '3c5e75290ca947eab000aa09269753', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('3fdb778ddfa0463d9a08b70509f6a6', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:19', 0, 'admin', 'e0f3586f91ee4ab2952b6a8ad0f5db', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('408b9270f966464583d889de4243dc', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:08', 0, 'MGT01', '5cf9545d619a497ab20036d1c587c6', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('409a3acd47e249e5b62eb4e5e9f61a', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '0bf49f569bb04892bda649b91bf21d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('41054745788e4cff9a85d42a5ff973', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('41179616b3d64191b340810e9c0cff', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'ec436420c2734ec3a864eeedbe53c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4121a7037e114582a12db98120f712', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '93d8c32f689c41399f7ccb5ce434c3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('41745bfafe8247939562a62130da3c', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('41ab6d6e8cab4c63ae115d183634ec', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('41ad7ad909cd4dc48bde8a72a790ea', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('41f0dd6c4bc84b4aa8cc9261a20b06', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:08:03', 0, 'MGT01', 'ae9dda6c8d9e4366a241528c7390ff', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('421aa923289242e483ea02b8646bd9', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('428e17a00bde46f6bc84e2c9e213af', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:07:43', 0, 'MGT01', '3265ca2128e841a9ba488846de25f7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('42e241ff42b646e3808855459e694f', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '4f841c89e8274fd88335b2346d1ee2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('431f79867ae34d9bab255dc79795ab', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 16:07:42', 0, 'admin', '059428c1b43c4e8ca99d7314a7575b', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('435c1df0e95f408e880bfa130d3646', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '5666bae5c6254bab977fcd4fd7129e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4391f2c6f5c045e99dcf182eb98d1b', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:41:55', 0, 'ADM01', '4f841c89e8274fd88335b2346d1ee2', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('43f06316909d41588cad2fc7a6421e', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('44efc47fb24b49338eddae1628889b', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4603f17f33274bb78d2d85adc6721f', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '93d9f074b9e142eaa1103045d07273', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('462cae650bbe4beb986000e812d3ef', 'admin', '2022-10-19 22:49:16', 'admin', '2022-10-19 22:49:34', 0, 'admin', '955ae49b75df4f678ec2324489ae3d', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('464792bbcf034f57a685431d07611a', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '93d8c32f689c41399f7ccb5ce434c3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('46eb7e0d46844660aac92fdb8d8eb6', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', 'ae9dda6c8d9e4366a241528c7390ff', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('471581fca8c14f52a93aa2f133c29a', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '93d9f074b9e142eaa1103045d07273', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('47181f41a6a24012b6537101a63550', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:02', 0, 'admin', 'ae9dda6c8d9e4366a241528c7390ff', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('4826daccc9394076adcf7a72405d0e', 'admin', '2022-10-28 00:13:08', NULL, NULL, 0, 'WHS01', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4839d416bece4492b2b4f4e67fdecc', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-29 11:39:30', 0, 'ADM01', 'a015669f743f49d18be7541f4e9e4f', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('483b72b9a1304ba9bba899a1240a82', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-29 11:38:55', 0, 'ADM01', '90af5528e9a4458585b2d74bb73b05', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('48920822dc91473fab2babc14b4eca', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:38:18', 0, 'samsudin', '612df21b8cd34fb5869011b0e92f81', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('48cc2a5e844f42399ce9e778b5e234', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '39894a92c9e9456997bb6af3b21bd3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4942338a355e4a2fbed8ac1cdbc074', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:46', 0, 'MGT01', '42c5d26116ee453e9225b91d3c827d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('496f0f6b90b84151955e2b078c7f70', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '62482f126fe940939924a187d617ea', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('498c018752f242aca7c3059a8a53a8', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4ab8c53038174f61aa118750f1267a', 'admin', '2022-11-15 13:35:41', NULL, NULL, 0, 'YENIARTI', '30baffda74154b428e3effd069d09e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4b18d12d16454bf4ad9e5f55543a1f', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:07', 0, 'MGT01', '7b3fd71d12d04dfdbfe4323903def5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4b7e54ba0d5b4723a947c3fa589929', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:38:19', 0, 'samsudin', '39894a92c9e9456997bb6af3b21bd3', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('4c46afaf53914ccbb9bded1bd10505', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4c9f427118b84768b16d3d43f2f6a0', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:41:57', 0, 'ADM01', 'e7f55074baa54065bca03b77c62574', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('4cdfa4f91c0a40ae8c20d875a6285c', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:08:11', 0, 'MGT01', '93d9f074b9e142eaa1103045d07273', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('4d8d2cf02c21472889b7a69e574171', 'admin', '2022-10-24 11:50:35', 'admin', '2022-10-24 11:50:43', 0, 'admin', '1d9918c716514cdfac598ba366aaef', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('4e709383c6674ad798d2f8f1e42709', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:45:49', 0, 'ADM01', '2c33a59b7b6c41be80df4129f90b71', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('4eba5fe6f01d439d9b54462e8a5745', 'admin', '2022-10-28 00:13:00', NULL, NULL, 0, 'samsudin', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4ecabc50d12745ae8f093544f2d9e5', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4f6dffa27c0743568fe38517104bb2', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4f844c0ebd864924b165f96375679d', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '3ca074598cf94973b83bb1facb1190', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('4fb17519543c471c89f145d87539a0', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:44:52', 0, 'ADM01', '8f2e2ea5fa0649619863e4a30f1cbc', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('506fb905eea24326a46d9b4d77f6ca', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'b3caa83cf1534926a614edc17ed055', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('50ca156be42e4d9aa58b2584e9631d', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '92502b9d5bf7422d9e108068e2316c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('516e5017f3fa4cdb8203e3b3e754b8', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:43:30', 0, 'ADM01', 'a5d9db23534f44fa9d58a7f996ce2a', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('51bd55292a28488eb84bd0c7e64005', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '1f0d78d3e80a457bb0914831b94c7b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('528faf2638eb49ae8c6984e9742538', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '612df21b8cd34fb5869011b0e92f81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('52af4273642244679c1df3379fe104', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:46', 0, 'admin', '62309884bfe74e5696f10f32243d97', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('531548f3a89f4bd5978ed7b6bd75ce', 'admin', '2022-11-21 11:04:06', NULL, NULL, 0, 'MGT01', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5374cfce8d1142f6b5bb30b12e34fb', 'admin', '2022-10-07 18:51:51', 'admin', '2022-10-07 18:51:56', 0, 'admin', 'a5d9db23534f44fa9d58a7f996ce2a', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('53c297fff8664397a72ff7b0baf06c', 'admin', '2022-11-14 22:29:26', 'admin', '2022-11-14 22:29:39', 0, 'admin', 'de6779722f6347d798b07350eee0ef', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('53df0cd503c44f858b8ed4b6f0d769', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:26:05', 0, 'WHS02', '834ee81f71d14a1ba35708d85f7526', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('54aab1e7716c412798febce4683712', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '5666bae5c6254bab977fcd4fd7129e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('54b362aba84e4429bfa047c05a0f6d', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('550301c2270946f994d8e85342aa35', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '059428c1b43c4e8ca99d7314a7575b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5527b69bb455423aa7e8e20bea1334', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('55ce78c1251e4e2d80a7f2ad5874cf', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:46:00', 0, 'ADM01', '7e92720f68204d2b948412828a116b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('5604be7bb83642b1b7e4db43151268', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:46:01', 0, 'ADM01', '3f423b73a7b04367853767d7de4bc5', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('56397100da5b4d35b1178e6c68db3c', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '30baffda74154b428e3effd069d09e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5641efbc304f471ab386c5bdc1ffe6', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '3f423b73a7b04367853767d7de4bc5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('56c39e081a4d4d4c8db20e988f14cc', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:52', 0, 'admin', 'de3f6855009e49deb7fd2fdd0f3b3d', 1, 0, 0, 1, 0, 0, 1, 1, 0),
('56f529fdee8b407cb3eaeac58d4ca7', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('57751a21659e433693ddc7e4be1356', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('57e69afd72cb4f73941b1d9c0ebf06', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:43:39', 0, 'WHS01', '1bae0b2618ae47b5b7884c40519b61', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('581b15b833864ef49bfebcaf60b6ea', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'e9d8310044d3481f81834d14f91bd7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('587ec7bc3fa54afa832fb66c8abd7f', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:20', 0, 'ADM01', '5214613be76e4e08ab01a260c8ef55', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('58f52ec68b224c16a28db3726e229e', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', 'e7f55074baa54065bca03b77c62574', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('595485e91bc04794b990aa0c56142d', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:42:02', 0, 'ADM01', 'e9d8310044d3481f81834d14f91bd7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('59582a43dcb7490ea280e1843780ef', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:05', 0, 'admin', '23ce7975fd3a45abaf71ef4a805056', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('59756e1db7a74fd892301bf1e8e801', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '0e4bb0451f1d4a64a4f7be6be13708', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5980412022724f9cb73542501b7c9a', 'admin', '2022-10-28 00:12:58', NULL, NULL, 0, 'YENIARTI', '2c33a59b7b6c41be80df4129f90b71', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('59a3bae545bf484592d798556c4987', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:43:43', 0, 'ADM01', '3038d96df22048608bbbb8762bbe24', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('5a8797c797764a8fb71f6ae67de7c9', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5a8f81ac33fc45a6acdd6efe2dbac9', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:43:35', 0, 'ADM01', 'd188047ab21d45979c64c990a91e23', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('5aa8dd6e7a3f4fdf96aa1d4c1345cb', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '0bf49f569bb04892bda649b91bf21d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5c7f0d2eaa824bdf944a72dbabbdb2', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5cc4b9e2842f4157b475b3e5239572', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '5214613be76e4e08ab01a260c8ef55', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5cf820eeac46437ea3ebf56d799c22', 'admin', '2022-11-13 22:39:43', 'admin', '2022-11-14 11:36:11', 0, 'WHS01', '5cf9545d619a497ab20036d1c587c6', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('5da8a669b07948d780f81f2bacece7', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '3265ca2128e841a9ba488846de25f7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5df58bcc43c544deaa0190dae5b3a5', 'admin', '2022-10-19 22:49:16', 'admin', '2022-10-19 22:49:47', 0, 'admin', '1bae0b2618ae47b5b7884c40519b61', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('5e41e06be3ca42daa937aa8e6e1153', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '687d6466b56c4d0f926dd655ae7ab9', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5e49523721504fe38b1d143a9abbeb', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '0bf49f569bb04892bda649b91bf21d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5edbc62be60145fcbc4b4f92229afc', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:38:18', 0, 'samsudin', '3ca074598cf94973b83bb1facb1190', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('5eff961f8c9045e399a6f3248fc891', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:47:29', 0, 'ADM01', '5cf9545d619a497ab20036d1c587c6', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('5f107a4209d24d0eb35aba6fe5a051', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:08:17', 0, 'MGT01', '687d6466b56c4d0f926dd655ae7ab9', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('5f1a7b3b701346ee8808ace3d935eb', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:34', 0, 'MGT01', '834ee81f71d14a1ba35708d85f7526', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('5fcb2e73a85e4fe0a1bb86c1b133f7', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '92502b9d5bf7422d9e108068e2316c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('5fe16a6676444b93a9f4c8bc2955a4', 'admin', '2022-10-28 00:13:08', NULL, NULL, 0, 'WHS01', '834ee81f71d14a1ba35708d85f7526', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('603008c1e1744e99a7b11c808bb0b0', 'admin', '2022-10-17 22:26:01', 'admin', '2022-10-17 22:26:10', 0, 'admin', '3562627a9d084609a7dea66faf8598', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('609378b5af6644b4bf91365372aef1', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '3265ca2128e841a9ba488846de25f7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('61abde0bb43541d58bbc4f21e061c8', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:41:59', 0, 'ADM01', 'ae9dda6c8d9e4366a241528c7390ff', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('61af91d5709b4eb797d9bb2f4c1f3e', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('61b9f6fc0b484ffe80032a853b77c2', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '8001792212e640eb8e67b13a16a26d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('61d33ff0301d4bdca2d4017b25d33d', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '0e4bb0451f1d4a64a4f7be6be13708', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6241562f66a94a3e8d58e79b01fb17', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('62aa172fcf7c443aba135013fbcc54', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:26', 0, 'admin', 'cf98f97766f6405590b26daa586e00', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('62acd4c56b6d449f8813800eb455e7', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '23ce7975fd3a45abaf71ef4a805056', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('636c1a3b21a74c89b21c6e90c4ebe6', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '8344f4bb673644908cf7f59e61f84d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('63dd1daca16747ef9d1c239b4f2d07', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:27:03', 0, 'WHS02', '2c33a59b7b6c41be80df4129f90b71', 1, 1, 1, 0, 0, 0, 1, 1, 0),
('63f55c0e1590463ea554a57f36b47c', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('64b13750b4f2461ea5394e4ff4ae52', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '62309884bfe74e5696f10f32243d97', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('64ccfd7cf91b4eab9c869a49a2e0d1', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:04:18', 0, 'MGT01', '1d9918c716514cdfac598ba366aaef', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('64f1956660944883a8d9d56cd11acf', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '39894a92c9e9456997bb6af3b21bd3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('652298abe95f4a6686135d12d3ef4d', 'admin', '2022-11-15 11:18:42', NULL, NULL, 0, 'WHS01', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('65284374db604178a5e299c0718c43', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('654c91d190d94a05bf0ba447e3dece', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:20:34', 0, 'WHS02', '9c04c7dfcf6c44cc9a0ec44b1c7691', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('659bcd71097540bbb17f2f45093a90', 'admin', '2022-11-14 21:19:28', 'admin', '2022-11-14 21:19:37', 0, 'admin', '30baffda74154b428e3effd069d09e', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('65a854887b8241ffb3f1ab43f55270', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('65a8f1e31f974266894d8a06ebccbd', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('65f75abeff5b4f2c8fb0e80d2d5900', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:47:11', 0, 'ADM01', 'de6779722f6347d798b07350eee0ef', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('664011c16dfc40658db60c2ea5948b', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '0e4bb0451f1d4a64a4f7be6be13708', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('666111f2757d4f4ba262a910b6133c', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '5214613be76e4e08ab01a260c8ef55', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('66af9cfa91c046c3a278abc51f0b03', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '5ad1d62d08a3408d9ab3a84c105d15', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('66c9539fe3fa4839afb57b00a15e4d', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '5666bae5c6254bab977fcd4fd7129e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('66d49e017da842b99e67bc22ef6455', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '8344f4bb673644908cf7f59e61f84d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6757d52b926440c4a63b7535b8483e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '5ad1d62d08a3408d9ab3a84c105d15', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('67b92be10bca45438aff838eebab55', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:49', 0, 'admin', '3dd1a46ef2834b79a8da5080c496e4', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('67bf89a8259942d799ead773394497', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:31', 0, 'admin', 'c8f8362a5f6c432ab27d37213f15d4', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('67d80f94a0d747b7b15f9247c2ff22', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:01', 0, 'MGT01', '5f52889797034e918456da3c3a7971', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('67e1461a5a8744ed8b64f1de822609', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '2c33a59b7b6c41be80df4129f90b71', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('680f99ea20ba4259b7e82b893aa1f7', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '90af5528e9a4458585b2d74bb73b05', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('688c157505da4f02b40a14e1670b6d', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('690424ca1c514334a403531b2c42cd', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:12', 0, 'admin', '42c5d26116ee453e9225b91d3c827d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6993eceb362a4652916ff57dfe6312', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '2a4389152cc646148f199267b768d0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('69a9a95aa074429da6b3324109a0e5', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:48', 0, 'admin', '3ca074598cf94973b83bb1facb1190', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('69d3d4bbf7574b5b80cba7c20d386f', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '9c04c7dfcf6c44cc9a0ec44b1c7691', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6a6da8d38ad943bb97dfcead40fd08', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6aab43a0a59d44a994de6689c6e8d0', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:15', 0, 'admin', '93d9f074b9e142eaa1103045d07273', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6acbcb5c1a5241f7a1502edf7fde50', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:10', 0, 'MGT01', 'b7f1f62e48c34c73ba97bef9e22ffb', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6afee9f446b049eea26be3757f5bce', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:06', 0, 'ADM01', '50db640c2a0f47ab8958d00958d1b7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6b0dc36bbeb64bab914af204aa64ef', 'admin', '2022-10-26 11:54:10', 'admin', '2022-11-13 22:39:31', 0, 'admin', '834ee81f71d14a1ba35708d85f7526', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6b8e4049b4b44f629b390304a36c36', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:05:37', 0, 'MGT01', '2a4389152cc646148f199267b768d0', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6bcfd3780a5145059877af287cff62', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '955ae49b75df4f678ec2324489ae3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6c095656119746318b6b37ab497089', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6d5aaf66bbd841e782aabb4846bb16', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '2d0a643865084c4ba9fbc7869370fa', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6da6f4b1adc243cbadfe00b73692d3', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6dc80dabf24f4ca0bfd296afa8f4c7', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'e7f55074baa54065bca03b77c62574', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('6e180e79504c403e980ee491e0da6d', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:37:35', 0, 'samsudin', 'e9d8310044d3481f81834d14f91bd7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6e80de5232b2440aa5e9415eeb1d66', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:42:30', 0, 'WHS01', 'c10a8ffd0165455989b58f9090798c', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6ebc44947e1a4e4f9bdb3dd1b8c81d', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:24', 0, 'MGT01', 'c10a8ffd0165455989b58f9090798c', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('6fe113f9ae2a464bb21876a0167cea', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '48be2218f3134d0d900c14b875cd4b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('70a354d2a8cb4696999bd078a591c6', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '1bae0b2618ae47b5b7884c40519b61', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('70bfdf8af8ea4d28a0930c43b99b8c', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('70dc50c078d748ff80a8518944f58b', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:47:55', 0, 'ADM01', '48be2218f3134d0d900c14b875cd4b', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('713a85b8a56044f3add50bc7c1fd87', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:20:56', 0, 'WHS02', '5f52889797034e918456da3c3a7971', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('716366a55dd448e59119f67b3bc935', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '834ee81f71d14a1ba35708d85f7526', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('71bf929b8a58422686216ae67936cd', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '687d6466b56c4d0f926dd655ae7ab9', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7208044c8c74451a817ebd7853b2e4', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:43:11', 0, 'ADM01', '4436260df6074dfb8676de448a1a89', 1, 1, 1, 1, 0, 0, 0, 0, 0),
('721f4ee42c4c48b389f36ab60d14d5', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7236a04e03474fed9102bb0354cecf', 'admin', '2022-11-15 13:41:11', 'ADM01', '2022-11-16 14:26:45', 0, 'ADM01', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7240d3ff6ce8416ab5d1ad6cd9e41e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'ae9dda6c8d9e4366a241528c7390ff', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('727f150588c44b2a826997e76c1aab', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('72b2f1f83ed04bb7bee2fa1340a6d7', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:06:57', 0, 'MGT01', '955ae49b75df4f678ec2324489ae3d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('72dca004fc194e50b6ecb4a6495271', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:44:11', 0, 'ADM01', 'e780677ba5764a128f4ae77e3b720e', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('73174e39effb4b6380262dd7eb1120', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'e780677ba5764a128f4ae77e3b720e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('731edfc14709428a86de81615c5bab', 'admin', '2022-10-24 11:28:38', 'admin', '2022-10-28 00:12:21', 0, 'admin', '76e9ec30b2274d13b6fd78bd9771b0', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('7394e651d2724d209ff5d422f1211a', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '687d6466b56c4d0f926dd655ae7ab9', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7428bfe5f6e44ac19545cced5a86bf', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:21:04', 0, 'WHS02', '5cf9545d619a497ab20036d1c587c6', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('746d6989a790471ca2e4de24a9f871', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:48', 0, 'admin', 'b679033b3256414b8f916c69f17674', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('74afec503cc945ae92801fecb35e03', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '7e92720f68204d2b948412828a116b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('74b775975ffd4aa4b28904778dc19b', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:04:51', 0, 'MGT01', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('74dc4ecbdbe84b08b88cc004095603', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:41:58', 0, 'ADM01', '8344f4bb673644908cf7f59e61f84d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('74fc770978514b5eb1d7774a3995a7', 'admin', '2022-11-14 22:24:52', 'admin', '2022-11-14 22:25:03', 0, 'admin', '3257e9a11a8543b8afd8e27c0a21d2', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('754b8fd0984749dbabcc3e9963d2aa', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('75a0fa4ec179431d9bc9a0696ddf88', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:44:31', 0, 'ADM01', '834ee81f71d14a1ba35708d85f7526', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('75ab83a3d56647f898f3dbaf951b46', 'admin', '2022-10-07 18:20:50', 'admin', '2022-10-07 18:20:57', 0, 'admin', 'd188047ab21d45979c64c990a91e23', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('76b9a0af05014dc0aa3a20d3105608', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:34', 0, 'MGT01', '50db640c2a0f47ab8958d00958d1b7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('76cfb373c4804af5b3d826c6645584', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:42:17', 0, 'ADM01', '8001792212e640eb8e67b13a16a26d', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('76e1bfa94cca4eed855f2ee24f05d8', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'ae9dda6c8d9e4366a241528c7390ff', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('76e39cab182d4e4a983cb4629c8a60', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-29 11:39:30', 0, 'ADM01', '3562627a9d084609a7dea66faf8598', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('76f1ae71b140472f91248911e22bbf', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '865cff3b613848cebcc7cb9667fbb1', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7705505573fe426e89209262e1c99f', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7708658de71647e08b23bb1cde50db', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '5666bae5c6254bab977fcd4fd7129e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('771511773e91483fb7c859e2b32534', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '3f423b73a7b04367853767d7de4bc5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('77b2c5c61f204388b3698cc4e33cdc', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '7e92720f68204d2b948412828a116b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('77fd375e92c7456d9b7fa2fee6ec69', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:08:15', 0, 'MGT01', '7097c7632da5440994c39f828678ab', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('781368c84fe64ce98d8a215c39ce30', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'b3caa83cf1534926a614edc17ed055', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('782902967c7240b69fe56db8a0b996', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('78e6ed091cc94b4a8dbba2ad95844a', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'ec436420c2734ec3a864eeedbe53c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('78e95abc579c4fa0a8f8bcd377c418', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '2d0a643865084c4ba9fbc7869370fa', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7915630d97ec4f219c5b89781773cb', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('799fc0e126414a83894f65b3dbddc1', 'admin', '2022-10-26 11:37:43', 'admin', '2022-10-26 11:37:52', 0, 'admin', '92502b9d5bf7422d9e108068e2316c', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('7a0a9c5ddb1f483ab42fe7ed370398', 'admin', '2022-11-15 11:18:42', NULL, NULL, 0, 'WHS01', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7a11e42f3b4941ab9fc9f9f1b67f2e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '90af5528e9a4458585b2d74bb73b05', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7a1d766b94de4295a4469a56c5f5bf', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '612df21b8cd34fb5869011b0e92f81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7a4170556ae948cdb96476bba264cb', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7a45ef2342ad477f8f2bde15d3cfe6', 'admin', '2022-10-26 11:55:24', 'admin', '2022-11-14 20:58:15', 0, 'admin', 'fd04621539994742b73c6f4cbfa63e', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('7b3045dca90b43cb8237f942026406', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7b4a9cb8a8a549458de26fc047fd1d', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7bd39dc2ad324eccab1f426f954c5f', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:06:37', 0, 'MGT01', '30baffda74154b428e3effd069d09e', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('7c492213ad934eac926f1ba8549906', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '2d0a643865084c4ba9fbc7869370fa', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7c65c32cf724426e97457eb121faf7', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:04:12', 0, 'MGT01', '76e9ec30b2274d13b6fd78bd9771b0', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('7cbd86993d8b49aebf1ac5698b2e99', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'a015669f743f49d18be7541f4e9e4f', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7d310b88d15e4fe99f77b39b8248fc', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '5cf9545d619a497ab20036d1c587c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7debea4009ba493b8c8378784e1985', 'admin', '2022-11-15 13:35:44', NULL, NULL, 0, 'samsudin', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7e0de44bba224f2aa048dde7cf6981', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7e6d84cc420e4ece880dcf2ba1cd62', 'admin', '2022-11-14 20:58:27', 'admin', '2022-11-14 20:58:37', 0, 'admin', 'e505e5e5d2564aa280b3d568c8dd6c', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('7e99a42af43943efabea7257e51917', 'admin', '2022-10-07 21:39:55', 'admin', '2022-10-27 09:44:22', 0, 'admin', 'e780677ba5764a128f4ae77e3b720e', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('7edff16c84a845f7b569d5696e9159', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7ee4fc1784a842c28f5012fc430d29', 'admin', '2022-10-21 09:42:16', 'admin', '2022-11-17 10:00:26', 0, 'WHS01', '670141b0c0ac4f61bba46f0c85acd6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('7f200ab50ed84e25abefa079b7ed63', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '1bae0b2618ae47b5b7884c40519b61', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('7f24376a19b949a387d53e5d6a8a02', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:17', 0, 'admin', '687d6466b56c4d0f926dd655ae7ab9', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('7f2ee7180b23488fbcbe92aee02499', 'admin', '2022-11-15 13:35:44', NULL, NULL, 0, 'samsudin', 'e505e5e5d2564aa280b3d568c8dd6c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('803839ca6f864088b376747071e534', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'f0546fc46bf54b9385492a0da1fbf2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8065321db5a04055a0ec59903b6930', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:41:52', 0, 'ADM01', '93d8c32f689c41399f7ccb5ce434c3', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('8066464c45c84db2b2fcbcacfebba0', 'admin', '2022-11-13 22:39:40', NULL, NULL, 0, 'samsudin', 'f0546fc46bf54b9385492a0da1fbf2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('81613522643f4dc991fec6dfe3e587', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:43:58', 0, 'ADM01', 'f0546fc46bf54b9385492a0da1fbf2', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('8241f44d8e3d40eaa1520b85941616', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:47:39', 0, 'ADM01', '23ce7975fd3a45abaf71ef4a805056', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('8272076abe2b4981b56bc475903fc1', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '62482f126fe940939924a187d617ea', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('82d4ef15c2244a48951c36e6cd9d88', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '8344f4bb673644908cf7f59e61f84d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('848a3addb4cc483a91af4987b47a30', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '8344f4bb673644908cf7f59e61f84d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('84ca9c1ad91b4a50a5ba9893763a73', 'admin', '2022-10-13 16:22:35', 'admin', '2022-10-13 16:22:39', 0, 'admin', '9c04c7dfcf6c44cc9a0ec44b1c7691', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('85fd9513221e4678b0d5dafbcf49ec', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:35', 0, 'MGT01', 'fd04621539994742b73c6f4cbfa63e', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('867f4b56292f43f6b825982ee8375a', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:06:36', 0, 'MGT01', 'c5e3a7bb003a42309c42907778173d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('86a50739b6c84ee68fb8574c069bb2', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '059428c1b43c4e8ca99d7314a7575b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('86bfdec031c14f7babc2802454111d', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '4f841c89e8274fd88335b2346d1ee2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('87c60a4a5b004a92a6a2daa4c37327', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('87f69d847e5f404883d8d6cfc7231a', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '955ae49b75df4f678ec2324489ae3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('886269ae3bf54cfcb6404d1495451c', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('886acce788a64894aef2cdaf7cf352', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:06:56', 0, 'MGT01', '5666bae5c6254bab977fcd4fd7129e', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('898a9733bced49a69fb2857141a7a4', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:42:18', 0, 'ADM01', '92502b9d5bf7422d9e108068e2316c', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('89b7747648fb466fab730611e435ab', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '670141b0c0ac4f61bba46f0c85acd6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('89beef0d9ca14a33991b1971176ea1', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '8f2e2ea5fa0649619863e4a30f1cbc', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('89cf1104075b4cba8156669fb0bb7f', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('89e82ba1af874c91b3b80d2234e919', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8a3f743a91e54c23be020da66b4f56', 'admin', '2022-10-28 00:12:58', NULL, NULL, 0, 'YENIARTI', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8a47c952fc5c49df8d849211b92ee6', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '2a4389152cc646148f199267b768d0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8ae87099bcb94e78a441e7dd7536c5', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:11', 0, 'ADM01', '3265ca2128e841a9ba488846de25f7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('8aef40e4bcb645768818d6f6911c61', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '1bae0b2618ae47b5b7884c40519b61', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8b3e5251a9c14f3884ab4d93701178', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '955ae49b75df4f678ec2324489ae3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8be09f6a52c04e51ad1c18b8e6e9de', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8c54a07deba54a5b9d8e6637ddf164', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '5f52889797034e918456da3c3a7971', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8cca8a583adb4387baa7c172e65b65', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8cce32e99a7445bc93f952b0c798c0', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '8001792212e640eb8e67b13a16a26d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8d36035b06d94b53b124eee4712a7f', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '42c5d26116ee453e9225b91d3c827d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8d5ff66023594bcc9c2ea4993b163b', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '5214613be76e4e08ab01a260c8ef55', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8d86ef6df38848658f2138cb5b2162', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '76e9ec30b2274d13b6fd78bd9771b0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8db0f26913cb427db7f89c2621ada7', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '687d6466b56c4d0f926dd655ae7ab9', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8dbe1cce67984cccaece36a3433063', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '62309884bfe74e5696f10f32243d97', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8e13794cf8594a87a57ab12b915912', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8e3c864e2e584d0faba51d3bb7ebb6', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:02', 0, 'MGT01', 'f0546fc46bf54b9385492a0da1fbf2', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('8e717c0135934bcfb888d5b3644838', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '3ca074598cf94973b83bb1facb1190', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8ea7b20b2a2a4cb99769302879da37', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '7b3fd71d12d04dfdbfe4323903def5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8f01066a119349d381f04b117d3456', 'admin', '2022-11-21 11:04:06', NULL, NULL, 0, 'MGT01', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8f473cf7c03a4b219a9b489882f69d', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8f504697b95c41738168e19a4f7252', 'admin', '2022-11-15 13:41:12', NULL, NULL, 0, 'ADM01', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8f62147ecfbb4688a704d6daa4e6fa', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '48be2218f3134d0d900c14b875cd4b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('8fbd72c2fdd74f6ba0e8b65fa9fabf', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9043407052f1432aa6339e3266dbfd', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('90ac1a9162b048848ce6bfb8823110', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '5ad1d62d08a3408d9ab3a84c105d15', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('91075341c532419eabac69db12b584', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '23ce7975fd3a45abaf71ef4a805056', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('923fdd50030042229beb44b627eac3', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '90af5528e9a4458585b2d74bb73b05', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('93085aeba8914ebe9915b1085e5079', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9314fef4de8d4395b7cce531cf49fa', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '62309884bfe74e5696f10f32243d97', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9369d3d0ece54171baf22abea833f3', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '76e9ec30b2274d13b6fd78bd9771b0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9389de21d1804d68a2699440881ca1', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '42c5d26116ee453e9225b91d3c827d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9398f4d8c84946dc80434d9655dbac', 'admin', '2022-11-15 13:41:12', 'ADM01', '2022-11-16 14:27:00', 0, 'ADM01', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('93a167c1676c4a5e8efe9dc68cec81', 'admin', '2022-11-21 13:46:12', 'admin', '2022-11-21 13:46:43', 0, 'MGT02', '8001792212e640eb8e67b13a16a26d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9439884824254f569c1b4e5eb5c067', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '93d8c32f689c41399f7ccb5ce434c3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('946595a6294c44a9afa9f13b121c96', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('947f268ee13f4a47bb57ab00b7620d', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '8f2e2ea5fa0649619863e4a30f1cbc', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9516887fa5b34dc4a357fcd11325bb', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:44:11', 0, 'ADM01', '0e4bb0451f1d4a64a4f7be6be13708', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('955564a4e2214cc180898832d6f692', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '50f02a4e5e0845f4aab2b43bf63047', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('96d3ae8aa6a04ed596052e3f11e198', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('96eafd51726f462ca27dec92e82557', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('97290dd5ea184773a8a35b5f4c9005', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('973014a579d84cc582f95adb128abe', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('973396b796724fcba62b35892ef6bd', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '0e4bb0451f1d4a64a4f7be6be13708', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('97a2a274f19e4a11a099d3afc0fb7a', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'c10a8ffd0165455989b58f9090798c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('97bddb40defa430f85541a7cb5ac2f', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:42:43', 0, 'WHS01', '9c04c7dfcf6c44cc9a0ec44b1c7691', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('97f597eb3f82437fb5c6dd5b5bf17f', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '90af5528e9a4458585b2d74bb73b05', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9886d8c98e884fab8a3f2c21de7832', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '42c5d26116ee453e9225b91d3c827d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('989c428c99a4438e92a51cba594443', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('994efc5c51754e69b128c8fba55227', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '670141b0c0ac4f61bba46f0c85acd6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('99a8d4c4a95a4fe186f511e2db63c3', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('99f377db53124e3c82d81defad5d30', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:27:06', 0, 'WHS02', '5666bae5c6254bab977fcd4fd7129e', 1, 1, 1, 0, 1, 1, 1, 1, 0),
('9a31a84e211e4cf3a6fe9d0c1360ba', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9a4086ccee9f49a6bdf660157b71e6', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:43:44', 0, 'ADM01', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('9b10bc87fc4541f18b7c8d68f54c90', 'admin', '2022-10-28 00:13:00', NULL, NULL, 0, 'samsudin', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9b57e5c096124c3090c77c5a862e2e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '7b3fd71d12d04dfdbfe4323903def5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9b830bdcd7f5457980742d0349d411', 'admin', '2022-10-13 16:22:35', 'admin', '2022-10-13 16:22:38', 0, 'admin', '5ad1d62d08a3408d9ab3a84c105d15', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('9b9c36848ff4460eb505761f37efaf', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:51', 0, 'admin', 'd13439e3f2324450a69b4e0e50159a', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('9c4321ad5c434fa388d926b5b3ec8b', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '93d9f074b9e142eaa1103045d07273', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9d57e8005526484399f6ac81885488', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '8344f4bb673644908cf7f59e61f84d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9d7a5b8d71764ee48bd6da5f4b6a0f', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '7b3fd71d12d04dfdbfe4323903def5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9dc3e3ee5bc24b69b75a1de894e135', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:51:22', 0, 'MGT01', 'e9d8310044d3481f81834d14f91bd7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9dfe7e13048d4ff6b31ec7272f89fc', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9e8646bb9c6f40899de15e164b3801', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '2c33a59b7b6c41be80df4129f90b71', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9edb654c61b14199aa5be8597d57a5', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:44:23', 0, 'ADM01', 'b7f1f62e48c34c73ba97bef9e22ffb', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('9ef1d3a3f2054485aa5bfe2d594cc0', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('9f53d8f721c64e8980b2aa0d3a65c9', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '42c5d26116ee453e9225b91d3c827d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a0081f746b2848bc82957458b792f9', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', 'ae9dda6c8d9e4366a241528c7390ff', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a036819d13044fbdad1dc21956a7fa', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'c5e3a7bb003a42309c42907778173d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a03ee9ed047f46b7b67694a09ebe26', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:42:39', 0, 'WHS01', '4f841c89e8274fd88335b2346d1ee2', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('a07ec23d04c949ce98b1accd15aaab', 'admin', '2022-10-19 22:49:16', 'admin', '2022-10-19 22:49:34', 0, 'admin', '5666bae5c6254bab977fcd4fd7129e', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('a0fd18de68864e44b8032af69c270f', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a138d397f8c4479eba9d884561ab4b', 'admin', '2022-11-13 22:39:38', NULL, NULL, 0, 'YENIARTI', '62482f126fe940939924a187d617ea', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a162acb115dc4ec0b54857c93334b1', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '5f52889797034e918456da3c3a7971', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a1c2757ca18544cdb362c3edd48486', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '0bf49f569bb04892bda649b91bf21d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a1d76c3b43f74e1584bc1115037a07', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '62309884bfe74e5696f10f32243d97', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a1efbe98c99a43c79c4ac95bf8fffb', 'admin', '2022-11-15 13:35:44', NULL, NULL, 0, 'samsudin', '30baffda74154b428e3effd069d09e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a209beb99b2f45d78dccf0f59e1ce8', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:19', 0, 'admin', 'e9d8310044d3481f81834d14f91bd7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('a20e49562df146b8943abf056dc579', 'admin', '2022-10-18 09:06:57', 'admin', '2022-10-28 00:12:56', 0, 'admin', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `setting_users` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `users_id`, `menus_id`, `v_view`, `v_add`, `v_edit`, `v_delete`, `v_upload`, `v_download`, `v_print`, `v_excel`, `status`) VALUES
('a3985834ab244e6bad6bd1adeee19b', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:29', 0, 'MGT01', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('a40183a020a44443a61e53c66225a4', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'b7f1f62e48c34c73ba97bef9e22ffb', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a40ef4d8ba7f4d56b479341950aaa6', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a4c7f7e71c79444aa5a05c5c70fd5f', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:47:59', 0, 'ADM01', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('a4d4d486258247c0b61fcd3f001a16', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:43:34', 0, 'ADM01', 'c98376ce677644eea31e91bcb49438', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('a5667eb9e4044094b6b26932819095', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a58ac08b017a4333a838ad0bc8be6b', 'admin', '2022-10-28 00:13:08', 'admin', '2022-11-14 11:36:26', 0, 'WHS01', '2c33a59b7b6c41be80df4129f90b71', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('a5c2349eae0043e3909c23488131fe', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a67db1f75b28415a8499145f3f2556', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:49', 0, 'admin', '39894a92c9e9456997bb6af3b21bd3', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('a6b14fcb4bf547ff89694b2155cc4b', 'admin', '2022-10-12 04:57:16', 'admin', '2022-11-17 09:59:59', 0, 'admin', '670141b0c0ac4f61bba46f0c85acd6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('a78e9f0a47234465839b32f2882f79', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a79b0e4fae814be4bf08d07cd8d6ad', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-29 11:11:24', 0, 'ADM01', '7b3fd71d12d04dfdbfe4323903def5', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('a7f50bfe9f5642d2a55ab05da0c6a1', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '687d6466b56c4d0f926dd655ae7ab9', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a8a815107e9644799c465a82c2cc73', 'admin', '2022-10-28 00:13:00', NULL, NULL, 0, 'samsudin', '92502b9d5bf7422d9e108068e2316c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a8c4232827d24712a825d8ed1065b1', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'a015669f743f49d18be7541f4e9e4f', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a98e1078f8f14d47b6aacd841d0f6e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'ec436420c2734ec3a864eeedbe53c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('a9aa0d4bcf474f1182e2e459101d83', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('aa4e56bc34dd4c76be257937f0240f', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '1f0d78d3e80a457bb0914831b94c7b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('aaa0f6b57397474a936d881d61a0e6', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ab4b50cdff594061b869b5a9c65b77', 'admin', '2022-10-28 00:12:58', NULL, NULL, 0, 'YENIARTI', '1d9918c716514cdfac598ba366aaef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ab8da807e3bb4830bc100121e1b376', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:43:27', 0, 'ADM01', '7d7f997ca58f425c8783ff7a7f994c', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('ac15754936c54e7c8074449607acf6', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '42c5d26116ee453e9225b91d3c827d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ac1c26d8170144cba6eecacc9faeb3', 'admin', '2022-10-28 00:13:08', NULL, NULL, 0, 'WHS01', '92502b9d5bf7422d9e108068e2316c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ac542dc754354f7a8c20cf48a747f1', 'admin', '2022-10-07 18:09:55', 'admin', '2022-10-07 18:10:00', 0, 'admin', '8a5ae39e16a54354bd0ea87c1ff963', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('acf7366679934d009014bac1e6b5b3', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:17', 0, 'admin', '5214613be76e4e08ab01a260c8ef55', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('ada19a178e9d4590be4c0c96a73405', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:09', 0, 'ADM01', '42c5d26116ee453e9225b91d3c827d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('ada9041a921d4519a3f0c19de28a28', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '0bf49f569bb04892bda649b91bf21d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('adb836cf5e4242e78c9097d7db8bfb', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:41:55', 0, 'ADM01', '9c04c7dfcf6c44cc9a0ec44b1c7691', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('adc18ffbbb4d449ab02d92a1e658f0', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ae95699aa9e74cb290b815d3297258', 'admin', '2022-10-12 04:57:16', 'admin', '2022-10-26 08:34:56', 0, 'admin', '8f2e2ea5fa0649619863e4a30f1cbc', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('af473d04fefb479e967d32fd497e2e', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:53', 0, 'admin', 'e3c31e10b6c64e119b068ae4b73be6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('af7216703c2f4704a2ad53d179f237', 'admin', '2022-11-15 13:41:11', 'ADM01', '2022-11-16 14:26:56', 0, 'ADM01', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('af7585e895e04ab79883bd7d595734', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:43:42', 0, 'WHS01', '48be2218f3134d0d900c14b875cd4b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('afe1156528774d68ad89d343064407', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('afff162d3adc4f6aad9e2d7efe3da8', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b0c12de2cd5e4c19b43912c2794cf6', 'admin', '2022-11-15 13:35:44', NULL, NULL, 0, 'samsudin', '3257e9a11a8543b8afd8e27c0a21d2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b0c1faa93eb54b928f81ffc06ddcbe', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '7d7f997ca58f425c8783ff7a7f994c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b0e162485b414a5a93d4c2abe57f8e', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '8344f4bb673644908cf7f59e61f84d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b134088f0ead407b8d574a3fdabbe6', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b20b4df35bcf4d5fb1084bda71e326', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '0e4bb0451f1d4a64a4f7be6be13708', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b2aca648fc1b4149b9a93d686f0711', 'admin', '2022-10-26 11:38:50', 'admin', '2022-10-26 11:38:58', 0, 'admin', '4436260df6074dfb8676de448a1a89', 1, 1, 1, 1, 0, 0, 0, 0, 0),
('b2c98e44efcf466e833147a1ad26f4', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '7b3fd71d12d04dfdbfe4323903def5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b2d0e2787de046ef8d6a9440c2c128', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:06:55', 0, 'MGT01', '2c33a59b7b6c41be80df4129f90b71', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('b32535bef2dc473099149a0f02e91a', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:43:30', 0, 'ADM01', 'a98a56d8e07944d4a5a3d628358f03', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('b3363e0efb4449f7a421b7226f9acf', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b337fe5f063e487cbce292508e599b', 'admin', '2022-10-26 11:43:31', 'admin', '2022-10-26 11:43:40', 0, 'admin', '2c33a59b7b6c41be80df4129f90b71', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('b39112676b624a6e8d5cd0d7d0abc3', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b3ec8bdaa9d841c4937e7fc1b2566e', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b467a41cf96a4ed7a8789256d6e9fc', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:47:09', 0, 'ADM01', '3257e9a11a8543b8afd8e27c0a21d2', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('b4e082818fea4da3a6879acb60616f', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'e7f55074baa54065bca03b77c62574', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b4f64babba714ff2b690fb9730e96a', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:06:34', 0, 'MGT01', '4f841c89e8274fd88335b2346d1ee2', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('b50cfe9d13bc4b8cb9a4c9903f6206', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b51eed90957848b883556217a39990', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '955ae49b75df4f678ec2324489ae3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b541b23d76884356865aa40c44d5b4', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '1f0d78d3e80a457bb0914831b94c7b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b61fd358e72042f099ab60fe177e91', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'e780677ba5764a128f4ae77e3b720e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b648edb6b3fb4c28aa8bfce6544137', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:44:24', 0, 'ADM01', '62482f126fe940939924a187d617ea', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('b64d6c694fa24e9f8e0b4efc1a1a8c', 'admin', '2022-11-15 13:41:12', 'ADM01', '2022-11-16 14:26:50', 0, 'ADM01', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b6529b71e7b844b7a7b6f1275889b0', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b656ff299d504cf89721225f3a9620', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '48be2218f3134d0d900c14b875cd4b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b6e62f86a5894030b0ebc9f1f881ad', 'admin', '2022-10-28 00:12:58', NULL, NULL, 0, 'YENIARTI', '92502b9d5bf7422d9e108068e2316c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b6ed6b2a68b54e63a4cb498753bbfb', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b793ce24a7954cd2a0f3404db9e4e5', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b80a8c89528449179fc8fef555b2f2', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '865cff3b613848cebcc7cb9667fbb1', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b8a570e8d8a346abbbfaafa5bd6306', 'admin', '2022-11-12 23:20:33', 'admin', '2022-11-12 23:20:39', 0, 'admin', 'b7f1f62e48c34c73ba97bef9e22ffb', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('b8c8b9aa3c7c4a1f99de039146a69c', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '865cff3b613848cebcc7cb9667fbb1', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b94c1dad432444d4ba0ddae6b34883', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'a015669f743f49d18be7541f4e9e4f', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('b9e388553d05480abfc24ff1f0626e', 'admin', '2022-10-16 12:50:57', 'admin', '2022-11-23 00:00:48', 0, 'admin', '865cff3b613848cebcc7cb9667fbb1', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('ba0aab68106a4e869e47efb1f9ac2b', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'ec436420c2734ec3a864eeedbe53c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ba63005662ef4f12add5d3354b7398', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '6ccd20c54d1d415189120ec5cc6c81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ba826745d46f4ee189a0dc8bcdd4af', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:43:02', 0, 'WHS01', 'c5e3a7bb003a42309c42907778173d', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('bafc808a9dd44932a764d79ffc020c', 'admin', '2022-10-21 09:42:16', 'admin', '2022-11-14 11:36:15', 0, 'WHS01', '059428c1b43c4e8ca99d7314a7575b', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('bc90a954b0424008852d58b7696e1c', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:38:20', 0, 'samsudin', 'a015669f743f49d18be7541f4e9e4f', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('bca2162056da4f898b238ad0203d9e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '50db640c2a0f47ab8958d00958d1b7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('bd0502477f714cb1b1691d2fda7cb3', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('bd386dc3563d453ba1ea1a52661809', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:08:13', 0, 'MGT01', '0bf49f569bb04892bda649b91bf21d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('bdc960cf84f7468ca9f81099df629c', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '7e92720f68204d2b948412828a116b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('be9ffc3fd04247ab96d34ce8698539', 'admin', '2022-10-12 04:57:42', 'admin', '2022-10-12 04:57:45', 0, 'admin', 'c10a8ffd0165455989b58f9090798c', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('bea29e940f264b7a98676e3043c650', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:45:03', 0, 'ADM01', '2a4389152cc646148f199267b768d0', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('bede10170512482daa9a119ac07f16', 'admin', '2022-11-15 13:35:42', NULL, NULL, 0, 'YENIARTI', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('bf6aa4a180e349099e8a29456a7e26', 'admin', '2022-10-13 15:39:16', 'admin', '2022-11-28 21:33:32', 0, 'admin', 'c5e3a7bb003a42309c42907778173d', 1, 1, 0, 1, 0, 0, 1, 1, 0),
('bf6d450d82614b77808762eb096776', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:12', 0, 'admin', '3265ca2128e841a9ba488846de25f7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('c01c0d19a1c044058c3807a7c25cc5', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c0222a89f2fe4d4a836cf80ef7c3b2', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'c5e3a7bb003a42309c42907778173d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c025f4c4988942eabc09156b54a2c9', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c13c3654b063405b85dff2bc2fe523', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:28', 0, 'MGT01', '8f2e2ea5fa0649619863e4a30f1cbc', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('c36312dd040e49d4abb224603246bc', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '4f841c89e8274fd88335b2346d1ee2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c3d636b0c827478f81583425a42666', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '3ca074598cf94973b83bb1facb1190', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c3f67e83c4234bcead671c518c8023', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c414ad4390e14133bcc34730462635', 'admin', '2022-10-28 00:13:00', NULL, NULL, 0, 'samsudin', '2c33a59b7b6c41be80df4129f90b71', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c45c977e23ce4a84991d12c0bd4340', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:26:14', 0, 'WHS02', 'fd04621539994742b73c6f4cbfa63e', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('c47b5c1c7efb40b789337eae288e27', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:38:19', 0, 'samsudin', '3dd1a46ef2834b79a8da5080c496e4', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('c488dab278b9442990b38123488c17', 'admin', '2022-11-04 20:56:12', 'admin', '2022-11-14 20:57:43', 0, 'admin', '62482f126fe940939924a187d617ea', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('c514a477ce25453bb3ea581f5f4636', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'cf98f97766f6405590b26daa586e00', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c5a682e11e754dc1b04a0e7aacaec6', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '5cf9545d619a497ab20036d1c587c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c63c790452d44721b0d660b010936e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '1d9918c716514cdfac598ba366aaef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c6a4e51cba66417c88ecc560d1a883', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '5214613be76e4e08ab01a260c8ef55', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c7382602e2b34ba9ba257342451a7f', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c7974656828a48949e9d3b8eadc82d', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '670141b0c0ac4f61bba46f0c85acd6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c7a0b4a98c7845948c4d60f8305c17', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c7dc2444b17f4bf48a632ee8dc9b5a', 'admin', '2022-11-21 11:04:06', NULL, NULL, 0, 'MGT01', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c82ac99e4f2142548e6c04c007e4d0', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c8612cd7d5c54e8faae07412336663', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:20', 0, 'ADM01', '687d6466b56c4d0f926dd655ae7ab9', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('c873fb5286bd4860a576887496a2f9', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '612df21b8cd34fb5869011b0e92f81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c887f7aedfd84eb68faf6d447e7000', 'admin', '2022-11-15 13:35:44', NULL, NULL, 0, 'samsudin', 'ac590aa34b8d4d85aebeaa6d6ee4a0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c8ddef0df0764958b9d1b106c75761', 'admin', '2022-10-07 21:39:55', 'admin', '2022-10-07 21:39:57', 0, 'admin', '93d8c32f689c41399f7ccb5ce434c3', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('c8e9d53f2e11467a8650cc11c011ee', 'admin', '2022-11-13 22:39:38', NULL, NULL, 0, 'YENIARTI', '2a4389152cc646148f199267b768d0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c900e4c83f324195b51cdc176a5ccd', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'c5e3a7bb003a42309c42907778173d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c93d58aadd4b46ce94ac9e8af4f42c', 'admin', '2022-09-29 17:18:39', 'admin', '2022-09-29 17:19:30', 0, 'admin', '6ccd20c54d1d415189120ec5cc6c81', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('c9631d4700c643c7a2b9a4c9606e1e', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('c967f5c7d5ff4b278758bfc5e0ddcc', 'admin', '2022-11-13 22:39:40', NULL, NULL, 0, 'samsudin', 'b7f1f62e48c34c73ba97bef9e22ffb', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ca331fc171c8456bb8d4f75860930d', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'f0546fc46bf54b9385492a0da1fbf2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ca4e720df2e847e098d0924cf57c3d', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cacd260ad19e4006af345f2fe01b84', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '62482f126fe940939924a187d617ea', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cad8d53bfa3b4e88b59a3ab8002373', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:08:12', 0, 'MGT01', '2d0a643865084c4ba9fbc7869370fa', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('cae14167836c4678a4c5b7501ab132', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:50', 0, 'admin', 'ec436420c2734ec3a864eeedbe53c6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('caef3a0396694981ab8468de4fd79b', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:41:51', 0, 'ADM01', '76e9ec30b2274d13b6fd78bd9771b0', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('cb97006b07604df0af3bbdfcabbfde', 'admin', '2022-11-15 13:41:12', NULL, NULL, 0, 'ADM01', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cbea519502f6454f84fe6151da3a4d', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:47:10', 0, 'ADM01', 'e505e5e5d2564aa280b3d568c8dd6c', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('cc1d93cc40924aa28d9ce99f4cb9b9', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'b7f1f62e48c34c73ba97bef9e22ffb', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cc1dca806d934416936c9f69b823dd', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '8001792212e640eb8e67b13a16a26d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cd05cdd05cba4139943c629a73ce9a', 'admin', '2022-10-13 16:22:35', 'admin', '2022-10-13 16:22:39', 0, 'admin', '3f423b73a7b04367853767d7de4bc5', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('cd24c969f8ab49c38cc7ea41eec9db', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:08:16', 0, 'MGT01', '5214613be76e4e08ab01a260c8ef55', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('cd66168dc60b4815a9fa11efd5dedc', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:45:02', 0, 'ADM01', 'fd04621539994742b73c6f4cbfa63e', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('cd989709b6b14014af5dadab67c2b7', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '5ad1d62d08a3408d9ab3a84c105d15', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cdda6cf319884ccfac01677120c518', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '8f2e2ea5fa0649619863e4a30f1cbc', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ce25eff3f6e74556b8916569f3c15c', 'admin', '2022-11-21 13:46:12', 'admin', '2022-11-21 13:46:47', 0, 'MGT02', '92502b9d5bf7422d9e108068e2316c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ce864c565ecd4ff5be6189c1c1e82f', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '8f2e2ea5fa0649619863e4a30f1cbc', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cecf3ffb2cab47ccbe2ca7deca580c', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'ec436420c2734ec3a864eeedbe53c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cee3211c1ce74d39aefda7487519ed', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cee9a40f8690405192ff63615b69ba', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:41:50', 0, 'ADM01', 'e0f3586f91ee4ab2952b6a8ad0f5db', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('cf14c4952b9c4b3195d5fed8942884', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '3f423b73a7b04367853767d7de4bc5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cf4d521c3cac42cabdb3ef92798327', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '3f423b73a7b04367853767d7de4bc5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cf68cb7e33ec4232858c3ebcb8ee63', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '3265ca2128e841a9ba488846de25f7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cf8f9000a622405585b37e44afb1a2', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('cfa8378b93b343a0bbb32f1ad81b5e', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '50db640c2a0f47ab8958d00958d1b7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d05389ecbc1a4ec9a65a0def34650e', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '8001792212e640eb8e67b13a16a26d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d07d620cf29d4d7d9958e9b748b28e', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '5f52889797034e918456da3c3a7971', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d0988bcf87344601928e64889e85bc', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '059428c1b43c4e8ca99d7314a7575b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d15ac3a6e8f34aeb8786f6bc4d6186', 'admin', '2022-11-13 22:39:40', NULL, NULL, 0, 'samsudin', '2a4389152cc646148f199267b768d0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d27854e569df46aea40d4371dcd448', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:48', 0, 'admin', '612df21b8cd34fb5869011b0e92f81', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('d37ae9ef0d494f0eaee7d3f05961ee', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:29', 0, 'MGT01', '670141b0c0ac4f61bba46f0c85acd6', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('d3f8e0af030045698e91286e7165cd', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:43:40', 0, 'WHS01', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d42338142c0e452995d3c18879f86f', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '4f841c89e8274fd88335b2346d1ee2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d46f5c5e7d7f43188e2cbf8daefff6', 'admin', '2022-10-07 17:32:17', 'admin', '2022-10-07 17:32:50', 0, 'admin', 'a015669f743f49d18be7541f4e9e4f', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('d471ed0ff5c24f418820c2e2d8dc9e', 'admin', '2022-11-13 22:39:40', NULL, NULL, 0, 'samsudin', '62482f126fe940939924a187d617ea', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d4fa1f4a0cfb4b119f1212db32963b', 'admin', '2022-11-21 13:46:12', 'admin', '2022-11-21 13:46:35', 0, 'MGT02', '1d9918c716514cdfac598ba366aaef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d59d16390f244dcc8b7ebaf71fbeb2', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d63aaeaaf1b1493fad78a5ab9434cf', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '3dd1a46ef2834b79a8da5080c496e4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d6ef8aba57ff4ea29a9d9fa4e823ec', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:10', 0, 'admin', '50db640c2a0f47ab8958d00958d1b7', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('d6f5b894d9964f6a9e68517bb5cffe', 'admin', '2022-10-24 11:46:55', NULL, NULL, 0, 'WHS01', '76e9ec30b2274d13b6fd78bd9771b0', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d72e53f73dc14594aaebfef3e7dde0', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'e780677ba5764a128f4ae77e3b720e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d73f76eccd8b48dabb0062ccab03a0', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:43:05', 0, 'WHS01', '955ae49b75df4f678ec2324489ae3d', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('d76163e3d2974f20905bc81b376fae', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:16', 0, 'admin', '7097c7632da5440994c39f828678ab', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('d84ecb1820f1454094312935d0d1be', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'e780677ba5764a128f4ae77e3b720e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d875d47fdb414e2eb5eea5b05e2d76', 'admin', '2022-11-15 13:41:12', NULL, NULL, 0, 'ADM01', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d8b10aea52ac40198c803fc4a36982', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '90af5528e9a4458585b2d74bb73b05', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d8e4e8442f0b4060b1c03887cbef78', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '9c04c7dfcf6c44cc9a0ec44b1c7691', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d930729562f945dbbc344770bbce5d', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('d9c11315ea4d4368ac087dedcdec5c', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:45:51', 0, 'ADM01', '5666bae5c6254bab977fcd4fd7129e', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('d9dae2e72c8f450ba71a7020afe174', 'admin', '2022-10-24 11:46:01', 'admin', '2022-10-28 00:13:05', 0, 'samsudin', '76e9ec30b2274d13b6fd78bd9771b0', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('da628fe6ea3b40549694e25917f275', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '3dd1a46ef2834b79a8da5080c496e4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('dac71b1496f14d4e93f17a6e8c2262', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('db986b1e9d054fb198cc61df3127a9', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'e9d8310044d3481f81834d14f91bd7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('dbc6046656404e1f900f61c1428118', 'admin', '2022-11-13 22:39:43', NULL, NULL, 0, 'WHS01', '62482f126fe940939924a187d617ea', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('dd191460b2f344e5b68a15617a1610', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:38:17', 0, 'samsudin', '62309884bfe74e5696f10f32243d97', 1, 1, 1, 0, 1, 1, 1, 1, 0),
('dd4ba43f8b194ad0bf06cc0f2053c8', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '7e92720f68204d2b948412828a116b', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('de22dfeaf07d4def9d7001381cdcc7', 'admin', '2022-10-28 00:13:08', NULL, NULL, 0, 'WHS01', '1d9918c716514cdfac598ba366aaef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('deb0339279f24b51ab5f8ff91bef81', 'admin', '2022-10-26 11:52:02', 'admin', '2022-10-26 11:52:10', 0, 'admin', '50f02a4e5e0845f4aab2b43bf63047', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('ded5b3f91cc445baa9fcd7eb53bd79', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('df8280ae714840bd87338db0326b40', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('dfac852b62514afc97d0f6deaf7e26', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:04:17', 0, 'MGT01', '8001792212e640eb8e67b13a16a26d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('e086cc44f385459c9a6e83722e41ff', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'c10a8ffd0165455989b58f9090798c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e0fb41f12c72431691687fb03ee496', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-29 11:39:01', 0, 'ADM01', '612df21b8cd34fb5869011b0e92f81', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('e13fe18e8c274006917c46b9bd1ab5', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '4436260df6074dfb8676de448a1a89', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e144e48e27a74018a675756f2ae28e', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e332541d8c9e408ea9e757450dbcb7', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '3265ca2128e841a9ba488846de25f7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e34dc4b3ed3b4dbf950caf0f870c15', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e3acaf3d48e045e4ba14951d109605', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:48:16', 0, 'ADM01', '93d9f074b9e142eaa1103045d07273', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('e3e87dec43a4462f9df61e32b52360', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:07:26', 0, 'MGT01', '1bae0b2618ae47b5b7884c40519b61', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('e40cf94b32094b6ebfe7683639b827', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '7b3fd71d12d04dfdbfe4323903def5', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e41090e9076e40afa7e70733cbfef7', 'admin', '2022-11-13 22:39:38', NULL, NULL, 0, 'YENIARTI', 'f0546fc46bf54b9385492a0da1fbf2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e42fa8f1862a497fb3fa70dc5ecfd7', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'b7f1f62e48c34c73ba97bef9e22ffb', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e49941e3332741ccb98892ae90e1e1', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '3265ca2128e841a9ba488846de25f7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e50723f6ab654515857ef4bda06080', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '23ce7975fd3a45abaf71ef4a805056', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e511fea2092b4d4b8bd72f1bc2bd28', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '687d6466b56c4d0f926dd655ae7ab9', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e519f414c259424882fa5927c9a58f', 'admin', '2022-10-28 00:12:58', NULL, NULL, 0, 'YENIARTI', 'fd04621539994742b73c6f4cbfa63e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e52d78b38c8e4bffa49d1b976fa22f', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e564ceb38389442a94ab2f2debd8b1', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e5666d6ed5a74edf9aa1fcdf10c458', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '39894a92c9e9456997bb6af3b21bd3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e5bfae8df613456e9404831a6f7fe2', 'admin', '2022-10-07 18:38:22', 'admin', '2022-10-07 18:38:30', 0, 'admin', '255bcee4fb4c45d8aa938b8279893c', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('e5c60409fd604a37b24c1c4ce8981a', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:43:45', 0, 'ADM01', '8a5ae39e16a54354bd0ea87c1ff963', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('e64ab30944534cb0a96edc0626fb3e', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e67dbc03a4fa4faf97fbfd4d977b44', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '39894a92c9e9456997bb6af3b21bd3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e6c2674c1cef44f399e3ced6165074', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '7097c7632da5440994c39f828678ab', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e6ecea95a8614a4083ca27159d7649', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:08:09', 0, 'MGT01', '865cff3b613848cebcc7cb9667fbb1', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('e89f5c572e64442f9e61f0ea9bda1b', 'admin', '2022-11-13 22:39:38', NULL, NULL, 0, 'YENIARTI', 'b7f1f62e48c34c73ba97bef9e22ffb', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e94ecf5bf0544ebf82d37dee6713ac', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:42:17', 0, 'ADM01', '1d9918c716514cdfac598ba366aaef', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('e95998c48dbc42fab1ce5faf91b6c7', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '3c5e75290ca947eab000aa09269753', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e96d7ed7277c48a0a5f7f205cf2112', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '8f2e2ea5fa0649619863e4a30f1cbc', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('e9f4506bb0c04689a9350803950d14', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', '8f2e2ea5fa0649619863e4a30f1cbc', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ea6ce63d09314212a82eea086b49a9', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '865cff3b613848cebcc7cb9667fbb1', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ea807db09ddb455da23e9f03d4b8c0', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'c8f8362a5f6c432ab27d37213f15d4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('eac5343d9a9b4ad89895dbd342d39b', 'admin', '2022-11-13 22:39:40', NULL, NULL, 0, 'samsudin', '5cf9545d619a497ab20036d1c587c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('eb16dfb6fa814158a8cbe738b47ad7', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '93d8c32f689c41399f7ccb5ce434c3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('eb207c1489d24bec9934d6eccc9486', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'e3c31e10b6c64e119b068ae4b73be6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('eba80cac49484bc9b2adea5eb35fdd', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:04:19', 0, 'MGT01', '92502b9d5bf7422d9e108068e2316c', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('ec381e7de60b4bd8b5b60f8b46f06f', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ecc3d66b99934e669af4238cc100a4', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:46:12', 0, 'ADM01', '5f52889797034e918456da3c3a7971', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('ecd624c9658745928d345c19c64ed0', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:07:23', 0, 'MGT01', '23ce7975fd3a45abaf71ef4a805056', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('ed790aeaf2fd4a3b8b94fc19708146', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'da7ff9a6b87a4b77bf7d89ef1f0c62', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('edadc5fad5b348a79ee84e42de0a59', 'admin', '2022-11-13 22:39:43', NULL, NULL, 0, 'WHS01', 'b7f1f62e48c34c73ba97bef9e22ffb', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('edb8b384a6bb480b98203111220da2', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '7097c7632da5440994c39f828678ab', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ee19936bf6e24e9bb0a60fbb262f55', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '5214613be76e4e08ab01a260c8ef55', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ee4d15e1bcd44d9da26df362438bf5', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '3ca074598cf94973b83bb1facb1190', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ee6ee89859d44e6699e6d19576b89a', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:47:56', 0, 'ADM01', '1bae0b2618ae47b5b7884c40519b61', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('eed5c3221ab64c44a4b6a427660da7', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('eee8863df66b49318591f19fa7230c', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '1bae0b2618ae47b5b7884c40519b61', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ef1c43b0e565422fac2d8cd1325ffa', 'admin', '2022-11-21 11:04:06', NULL, NULL, 0, 'MGT01', '3038d96df22048608bbbb8762bbe24', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ef5697b5edae4c389463079be8be7d', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ef59f21ad50f4dcd99ccb0abc53e36', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '30baffda74154b428e3effd069d09e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ef73c895d8484e6b8603204b33e719', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 22:01:40', 0, 'ADM01', 'b3caa83cf1534926a614edc17ed055', 1, 1, 0, 1, 1, 1, 1, 1, 0),
('f0425c337680476a81896595a50c92', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'de6779722f6347d798b07350eee0ef', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f0514e257a2745ab9c0df38da7f7ec', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:16', 0, 'admin', '2d0a643865084c4ba9fbc7869370fa', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('f06d5d1397774f938daa6e42f1446b', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'e9d8310044d3481f81834d14f91bd7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f0f0cd0f49d144d7a205534feb9782', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:32', 0, 'MGT01', 'e7f55074baa54065bca03b77c62574', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('f12f01dc59a54effbe2cea1458ab7c', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f144b2c370a746a7b0eebaa8ebeaf6', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'a5d9db23534f44fa9d58a7f996ce2a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f254786034274053a99411c245adf0', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'c10a8ffd0165455989b58f9090798c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f2877010abaa429ca9649ba5fc56c2', 'admin', '2022-10-21 09:42:16', NULL, NULL, 0, 'WHS01', 'e0f3586f91ee4ab2952b6a8ad0f5db', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f297eb0f65124ba7ad6dcdad791ec9', 'admin', '2022-10-24 11:46:01', NULL, NULL, 0, 'samsudin', '0bf49f569bb04892bda649b91bf21d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f2f5e88d75214857a2243a8ebdf00f', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'f0546fc46bf54b9385492a0da1fbf2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f325601f01a4485c9a5a5e1f5563ca', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f36d20e5b1c1457ab35a42e7cf2d7c', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', 'c98376ce677644eea31e91bcb49438', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f378fbb6e52144aabec0f6a082f7e7', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '3dd1a46ef2834b79a8da5080c496e4', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f3a371a9722e456abd64e0e0f5f21b', 'admin', '2022-10-28 00:13:00', NULL, NULL, 0, 'samsudin', '834ee81f71d14a1ba35708d85f7526', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f3ed9d3426db47e99962b8ba7ee266', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:45:54', 0, 'ADM01', '50f02a4e5e0845f4aab2b43bf63047', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('f412085497734740974cfd9eaa8121', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', '612df21b8cd34fb5869011b0e92f81', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f44a7d80a787417d98f77d6b25a627', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '39894a92c9e9456997bb6af3b21bd3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f494e4cc7e0e4b1195d3833430ddd2', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:48:18', 0, 'ADM01', '7097c7632da5440994c39f828678ab', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('f4f535188d1645fdb73b1a7bc4a9c4', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'ec2cdc9e44cb4ccba8f21e9dac5a9e', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f50a5b4c409b472599933c49eeb957', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '255bcee4fb4c45d8aa938b8279893c', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f51dc043c89b46f485b6b917e79ae8', 'admin', '2022-10-24 11:46:43', NULL, NULL, 0, 'YENIARTI', '3562627a9d084609a7dea66faf8598', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f6110f9f53434277924e24b17a93d0', 'admin', '2022-10-21 09:42:16', 'admin', '2022-10-21 09:43:03', 0, 'WHS01', '5666bae5c6254bab977fcd4fd7129e', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('f66ea6fe823d46d28f8aefec6e3589', 'admin', '2022-10-16 11:37:21', 'admin', '2022-10-16 11:38:21', 0, 'samsudin', 'ec436420c2734ec3a864eeedbe53c6', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('f68ad5afdf124601b9bb0354adc9b4', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '5214613be76e4e08ab01a260c8ef55', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f6e5ad10fbce45af974caeaea1ee12', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'ec436420c2734ec3a864eeedbe53c6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f70b40b1d05f4ba4b953d22658b66d', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:07:41', 0, 'MGT01', '8344f4bb673644908cf7f59e61f84d', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('f748fa0619a349a798ba30d0494951', 'admin', '2022-10-07 21:39:55', 'admin', '2022-10-20 05:09:07', 0, 'admin', '0e4bb0451f1d4a64a4f7be6be13708', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('f76aa31bec904bcc9cdc5f066788f8', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:47:28', 0, 'ADM01', '059428c1b43c4e8ca99d7314a7575b', 1, 0, 0, 0, 0, 0, 1, 1, 0),
('f776575926e442478ba6a8aa3bdfcd', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:26:01', 0, 'WHS02', '670141b0c0ac4f61bba46f0c85acd6', 1, 1, 0, 0, 0, 0, 1, 1, 0),
('f7a1ea3e38b94a7cb6682f674d4ec8', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f800beac22864c05983d0ef492ee10', 'admin', '2022-10-07 21:01:34', 'admin', '2022-10-07 21:01:41', 0, 'admin', '8001792212e640eb8e67b13a16a26d', 1, 1, 1, 1, 1, 1, 1, 1, 0),
('f862fb7d41a546eaa68febeba05b37', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'b3caa83cf1534926a614edc17ed055', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f8687f4eb3de458ca01805c2df910f', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '5ad1d62d08a3408d9ab3a84c105d15', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f91d6b1331d44e58af1bc30534df7a', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', '670141b0c0ac4f61bba46f0c85acd6', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f942462e59204ad2bfcf4d220de5c5', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-29 11:39:07', 0, 'ADM01', '3ca074598cf94973b83bb1facb1190', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('f9c8c836f7de4c3597a5fbbf9aab2c', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', '0e4bb0451f1d4a64a4f7be6be13708', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('f9ccb3a9b22443a2988410f5218600', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'd13439e3f2324450a69b4e0e50159a', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fa8a0bf30152414bbf7481876de4b4', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:41:54', 0, 'ADM01', 'c10a8ffd0165455989b58f9090798c', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('fab4a92823de4e40b415b86b3aefb0', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', 'd188047ab21d45979c64c990a91e23', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fb4affd7dc834f3ba261f3f36bd4f6', 'admin', '2022-11-15 10:20:21', NULL, NULL, 0, 'WHS02', 'e9d8310044d3481f81834d14f91bd7', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fba3e946507e4f8a93eb0b46a098c5', 'admin', '2022-11-21 10:59:14', NULL, NULL, 0, 'adm', 'a98a56d8e07944d4a5a3d628358f03', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fbf901e40f8d4235a0858e16576d53', 'admin', '2022-11-21 11:04:07', 'admin', '2022-11-21 11:05:26', 0, 'MGT01', 'b3caa83cf1534926a614edc17ed055', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('fc0463f163874a72adefe5ad44e790', 'admin', '2022-10-16 11:38:36', NULL, NULL, 0, 'YENIARTI', 'de3f6855009e49deb7fd2fdd0f3b3d', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fc60a2c4d6294a8887f29faf12f117', 'admin', '2022-10-16 12:50:57', 'admin', '2022-10-16 12:51:04', 0, 'admin', '7e92720f68204d2b948412828a116b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('fca98bb1444e478a9d74a6644cb776', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '8a5ae39e16a54354bd0ea87c1ff963', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fcffc0155ab94a18aa86bce0cde0d8', 'admin', '2022-11-21 11:04:06', 'admin', '2022-11-21 11:07:04', 0, 'MGT01', '059428c1b43c4e8ca99d7314a7575b', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('fd307459cb304ea686a6666cb878c9', 'admin', '2022-11-21 11:04:07', NULL, NULL, 0, 'MGT01', '44964312f0264429978158ada88843', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fd3c7b14032441fb877b57f12dd5ec', 'admin', '2022-11-13 22:39:43', NULL, NULL, 0, 'WHS01', 'f0546fc46bf54b9385492a0da1fbf2', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fd738eaf9b5f469ca64c28857dae5b', 'admin', '2022-11-21 13:46:12', NULL, NULL, 0, 'MGT02', '39894a92c9e9456997bb6af3b21bd3', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('fe2c9b43cb334132919bdb310e7fc6', 'admin', '2022-11-15 10:20:21', 'admin', '2022-11-15 10:25:44', 0, 'WHS02', 'c10a8ffd0165455989b58f9090798c', 1, 0, 0, 0, 0, 0, 0, 0, 0),
('febcc40c052449038b241d4f583b27', 'admin', '2022-11-15 13:41:11', 'admin', '2022-11-15 13:43:29', 0, 'ADM01', '255bcee4fb4c45d8aa938b8279893c', 1, 1, 1, 1, 0, 0, 1, 1, 0),
('ff04cc683a7044848aa7dd6cf36cc2', 'admin', '2022-10-16 11:37:21', NULL, NULL, 0, 'samsudin', 'b679033b3256414b8f916c69f17674', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('ffd164742c264fa1bbefde7ba8a026', 'admin', '2022-11-15 13:41:12', 'admin', '2022-11-15 13:45:57', 0, 'ADM01', '955ae49b75df4f678ec2324489ae3d', 1, 1, 1, 1, 1, 1, 1, 1, 0);

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
('661774e2f9124620aa42da8c2c4ab9', 'admin', '2022-10-14 15:17:31', 'admin', '2022-10-19 11:54:47', 0, 'OS0001', 'LEOCO (USA) Corp.', NULL, '4125 BUSINESS CENTER DRIVE, FREMONT CA 94538', NULL, '', '', 'claire@leocousa.com', 'www.leocousa.com', 30, '', 0, '', '', '6502218870', 'CALIFORNIA BANK & TRUST', 'USD', 'IMPORT', 0),
('66cf921a21a54002a07722c1d9fc42', 'admin', '2022-10-14 15:18:08', 'admin', '2022-11-02 10:44:36', 0, 'OS0002', 'LEOCO (SUZHOU) PRECISE INDUSTRIAL CO., LTD', NULL, 'NO.300 LIUXU ROAD, SONGLING TOWN, WUJIANG CITY, JIANGSU PROVINCE, CHINA .', 'CARLOS DAI', '', '', 'dak@leoco.com.cn', 'www.leoco.com.tw', 60, '', 0, 'NON VAT', '', '', '', 'USD', 'IMPORT', 0),
('78daa32796a94d1fa37ba9e3db6451', 'admin', '2022-10-18 16:08:48', 'admin', '2022-11-16 20:50:13', 0, 'OS0004', 'CHINA MACHINERY ENGINEERING SUZHOU CO., LTD', NULL, 'NO. 659, JIN MEN ROAD, SUZHOU,CHINA', 'Zhihao Jin', '+86-0512-65560108', '+86-0512-65327276', 'cj_jin@cmecsz.com', '', 60, '', 0, 'NON VAT', '', '', '', 'USD', 'IMPORT', 0),
('a261290db0a141a7916312007b7a8e', 'admin', '2022-10-14 15:19:04', NULL, NULL, 0, 'OS0003', 'TJ TECHNOLOGY LTD.', NULL, '3F-1, NO.299, FUSIN RD., TAOYUAN CITY, TAOYUAN COUNTY, TAIWAN.', NULL, '', '', 'maggie-hwang@leoco.com.tw', 'www.leocousa.com', 60, '', 0, '', '', '', '', 'USD', 'IMPORT', 0),
('af5c257b9a2d4306ae07e9d6cbb80b', 'admin', '2022-10-14 15:19:48', 'ADM01', '2022-11-16 08:16:57', 0, 'LS0001', 'PT. EKASURYA INOUT INDONESIA', NULL, 'KOMPLEK MULTIGUNA NIAGA 2, JL. TANJUNG NO,9, LIPPO CIKARANG , BEKASI, JAWA BARAT.  17550', 'Mrs. Lilik Winarti', '+62 21 89906301', '+62 21 8990 6118', 'lilik@ekasurya.co.id', 'www.ekasurya.co.id', 30, '', 0, 'VAT', '', '', '', 'IDR', 'LOCAL', 0),
('cf55c130c8ae47a690c88382589ea2', 'admin', '2022-10-14 15:20:13', 'ADM01', '2022-11-16 08:17:16', 0, 'LS0002', 'PT. SEROJA BUMIPERSADA', NULL, 'RUKAN KENCANA NIAGA 1, JL. TAMAN ARIES BLOK D1/2E, MERUYA UTARA KEMBANGAN,  JAKARTA . 11620', 'Mr. Stefanus Tangguh', '+62 21 5857428', '+62 21 5841846', 'serojabp@cbn.net.id', '', 1, '', 0, 'VAT', '', '', '', 'IDR', 'LOCAL', 0);

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
  `mpq` decimal(10,2) DEFAULT NULL,
  `moq` decimal(10,2) DEFAULT NULL,
  `price` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `remarks` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier_items`
--

INSERT INTO `supplier_items` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `supplier_id`, `item_id`, `mpq`, `moq`, `price`, `remarks`, `status`) VALUES
('0270ab26ba3b4e13b09e4baba4d611', 'admin', '2022-10-16 12:08:29', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '3e70bdfd80f5405780dbf3b530e009', '2000.00', '2000.00', '0.0000', '', 0),
('040a340f38ac4cb787a84035ad7a39', 'admin', '2022-10-16 12:08:24', 'ADM01', '2022-11-17 12:02:38', 0, '66cf921a21a54002a07722c1d9fc42', '624c4bd2693743b48ff8ec6a1011e8', '50.00', '50.00', '0.0418', '', 0),
('05256518068f4f05bf27fc7e5f9e5b', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '9b9b4c19c11349b4bc1f059a1d4159', '7000.00', '7000.00', '0.0000', '', 0),
('06518a50a36c456ea9d17ef9144e36', 'admin', '2022-10-16 12:08:29', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', 'bed6c03ec4bf41f5bcdcd425d6d528', '4514.00', '4514.00', '0.0000', '', 0),
('0e0561cf4bcc422f9e49ada54c0c9d', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '2a723738ac66458184f008b747dbd7', '1.00', '1.00', '0.0000', '', 0),
('10fc97410de24c519359e718254cb1', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '10af05969b8042799c703dcd435d08', '4000.00', '4000.00', '0.0000', '', 0),
('194cfae271604854a9afcfb2b322f6', 'admin', '2022-10-19 08:37:41', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', 'c6f46c95ec004f819348ae736fb99c', '1.00', '1.00', '20000.0000', '', 0),
('197d460b219d4dbaad9b40ef41d127', 'admin', '2022-10-19 08:32:32', 'admin', '2022-10-26 08:16:56', 0, '78daa32796a94d1fa37ba9e3db6451', '7a1631ccb6554010b9e6d7af7a2810', '1.00', '1.00', '2600.0000', '', 0),
('1d3aa2bbba7a48a5a3e85db0ff6398', 'admin', '2022-10-16 12:08:24', 'admin', '2022-10-19 12:11:25', 0, '66cf921a21a54002a07722c1d9fc42', '959962f44c0f44a29761da251f3cf5', '1220.00', '1220.00', '0.3040', '', 0),
('1f52e7856be24b1daf7a4d67f9bc78', 'admin', '2022-10-16 12:08:24', 'ADM01', '2022-11-17 12:06:20', 0, '66cf921a21a54002a07722c1d9fc42', 'bed6c03ec4bf41f5bcdcd425d6d528', '5000.00', '5000.00', '0.0098', '', 0),
('246aa275148d418b974407a91c79e6', 'admin', '2022-10-16 12:08:23', 'admin', '2022-10-19 13:47:48', 0, '66cf921a21a54002a07722c1d9fc42', '10af05969b8042799c703dcd435d08', '4000.00', '4000.00', '0.1275', '', 0),
('2dbeb5df07ec47adb181ece6c333f5', 'admin', '2022-10-19 08:34:16', 'admin', '2022-10-26 08:17:52', 0, '78daa32796a94d1fa37ba9e3db6451', '84ed48f24e424cedbae66d03750af9', '1.00', '1.00', '3000.0000', '', 0),
('2f3e9a4024b245b3b05f8a59cea1f0', 'admin', '2022-10-16 12:08:28', 'admin', '2022-10-27 10:08:01', 0, 'af5c257b9a2d4306ae07e9d6cbb80b', '98a74ee45aa84fdea4a995a8f94c72', '1.00', '1.00', '390000.0000', '', 0),
('3066027e64f849fd85d0f4fa4b3dd5', 'admin', '2022-10-19 10:40:45', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '5bf5c56dea2745b9925d11cfbfa4a2', '1.00', '1.00', '150.0000', '', 0),
('35ff686c7dbe44e38f7ac5ee8ff374', 'admin', '2022-10-19 08:31:54', 'admin', '2022-10-26 08:14:53', 0, '78daa32796a94d1fa37ba9e3db6451', '5ed6a9df03334e65b29657a7051407', '1.00', '1.00', '475.0000', '', 0),
('3858233c123041a19789ac6f410a4b', 'admin', '2022-10-16 12:08:30', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', 'd0d2d181e9864f9e87d38bd8349f9f', '144000.00', '144000.00', '0.0000', '', 0),
('387d465a8c8c42c2b9c9a4922c9582', 'admin', '2022-10-19 08:31:26', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', 'da0b5a0b29be443e9b0a8d53045587', '1.00', '1.00', '29000.0000', '', 0),
('38c4fb754db144bbbf37272f7e48c4', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', 'b5099016fd8c487ebdb5b7b4af1d67', '317.00', '317.00', '0.0000', '', 0),
('39c536e6c93c4f9db8f593589cd8d5', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '91975e7b4d394c0a88563cc154d9c3', '348.00', '348.00', '1.0000', '', 0),
('3d4cc3a36b8d400b82b6011baf3357', 'admin', '2022-10-16 12:08:24', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '2a723738ac66458184f008b747dbd7', '1.00', '1.00', '0.0000', '', 0),
('4283902f836c432bbd6872e83db6c0', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '624c4bd2693743b48ff8ec6a1011e8', '31.00', '31.00', '0.0000', '', 0),
('480c47cd92cd4e3ea798b4e04976f0', 'admin', '2022-10-16 12:08:30', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', 'f6d94df71f99416591000e95fef385', '1600.00', '1600.00', '0.0000', '', 0),
('4837df9295a84ca8a734eedba59e50', 'admin', '2022-10-16 12:08:24', 'admin', '2022-10-19 13:47:17', 0, '66cf921a21a54002a07722c1d9fc42', 'f03f5c8efbba404b8abb41370965bf', '5000.00', '5000.00', '0.1828', '', 0),
('54681dbad3214776a0a8082416aee2', 'admin', '2022-10-16 12:08:28', 'admin', '2022-10-26 14:56:44', 0, 'cf55c130c8ae47a690c88382589ea2', '614b430c9c2f4260b240e5cf44ad73', '1000.00', '1000.00', '5500.0000', '', 0),
('5c13b8f0b3f44ba59148b66bc9d3cc', 'admin', '2022-10-19 08:32:52', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', 'a0f00c476c3447dc81d9450fa51a42', '1.00', '1.00', '3250.0000', '', 0),
('6444e38327eb4d918d8c95be1e9c7a', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', 'f03f5c8efbba404b8abb41370965bf', '5000.00', '5000.00', '0.0000', '', 0),
('6be9a5a7a88e4fedbbf1651283e97f', 'admin', '2022-10-19 08:37:59', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '996b6ffe582c495494a1c45d179fd6', '1.00', '1.00', '5000.0000', '', 0),
('6e389237ce2544cc8f1502fc736b5e', 'admin', '2022-10-16 12:08:24', 'ADM01', '2022-11-17 15:05:34', 0, '66cf921a21a54002a07722c1d9fc42', '91975e7b4d394c0a88563cc154d9c3', '10.00', '10.00', '1.0700', '', 0),
('737f15f4bf5d4dad8575bf557d6f2a', 'admin', '2022-10-19 10:41:06', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '7d0c84c8a32545ab977aac1c568c0f', '1.00', '1.00', '1000.0000', '', 0),
('75ea7d1d8d5e464ab55d8e64f2c5b5', 'admin', '2022-10-16 12:08:24', 'admin', '2022-10-27 10:37:25', 0, '661774e2f9124620aa42da8c2c4ab9', '57748ea624ea42f8a3d2c9ea9f8776', '19.05', '19.05', '56.5900', '', 0),
('7b621d6e669940d08557ef49bd7506', 'admin', '2022-10-16 12:08:25', 'ADM01', '2022-11-17 12:05:58', 0, '66cf921a21a54002a07722c1d9fc42', 'a995527a67594ce0af5a2298712860', '2700.00', '2700.00', '0.0278', '', 0),
('858c35db0dbf4015a641823bee7c77', 'admin', '2022-10-16 12:08:24', 'ADM01', '2022-11-17 12:03:36', 0, '66cf921a21a54002a07722c1d9fc42', 'b5099016fd8c487ebdb5b7b4af1d67', '500.00', '500.00', '0.0110', '', 0),
('86a66c527d6f40bfb4034d0ec8af1d', 'admin', '2022-10-16 12:08:30', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '3714e81e66f34ba5aa8da4579a9627', '4167.00', '4167.00', '0.0000', '', 0),
('87027b0880e44d65a12e0b49562235', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', 'b0fd68d0868e4433acc74b897b5b18', '286.00', '286.00', '3.0000', '', 0),
('8810cb11912841c69dcba11b71b25b', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '19d58c090ea14cdc994a8baa312c33', '4000.00', '4000.00', '0.0000', '', 0),
('89bc2cda18d549bc8b6fed18836692', 'admin', '2022-10-16 12:08:29', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '258d134422724290aa869aed97c018', '2000.00', '2000.00', '0.0000', '', 0),
('8e5437cb1c1a48daaceb369ba38e5d', 'admin', '2022-10-16 12:08:26', 'ADM01', '2022-11-29 13:26:05', 0, '66cf921a21a54002a07722c1d9fc42', 'f6d94df71f99416591000e95fef385', '1000.00', '1000.00', '0.0102', '', 0),
('8e791d6ec3c640f388c96d259a277e', 'admin', '2022-10-16 12:08:24', 'admin', '2022-10-19 12:14:33', 0, '66cf921a21a54002a07722c1d9fc42', '19d58c090ea14cdc994a8baa312c33', '4000.00', '4000.00', '0.1063', '', 0),
('8e79a7f11252494baa4f2666738b5e', 'admin', '2022-10-19 14:17:26', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', '9b9b4c19c11349b4bc1f059a1d4159', '7000.00', '7000.00', '0.1303', '', 0),
('95329ed86ce74b6691b3d0f9a5c1f0', 'admin', '2022-10-19 08:38:19', 'admin', '2022-10-26 08:22:49', 0, '78daa32796a94d1fa37ba9e3db6451', '04fe43996a1c4c36948c5242d9a7b8', '1.00', '1.00', '2100.0000', '', 0),
('a05c0f9eb61646a1a72606aed748c0', 'admin', '2022-10-19 08:33:14', NULL, NULL, 0, '78daa32796a94d1fa37ba9e3db6451', '1461a62f894140b8ac1fd858936796', '1.00', '1.00', '1500.0000', '', 0),
('ab8541ea94da46f39c39975883e317', 'admin', '2022-10-16 12:08:25', 'ADM01', '2022-11-17 12:07:29', 0, '66cf921a21a54002a07722c1d9fc42', '258d134422724290aa869aed97c018', '100000.00', '100000.00', '0.0105', '', 0),
('bc1b803f52f345f89901a5dbf0b433', 'admin', '2022-10-16 12:08:28', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', '959962f44c0f44a29761da251f3cf5', '1220.00', '1220.00', '0.0000', '', 0),
('d390f9142cab4279bf823ff4f0590a', 'admin', '2022-10-16 12:08:25', NULL, NULL, 0, '66cf921a21a54002a07722c1d9fc42', 'd0d2d181e9864f9e87d38bd8349f9f', '144000.00', '144000.00', '0.0000', '', 0),
('d6a4fee12e944494bc2785149da719', 'admin', '2022-10-19 10:40:32', 'ADM01', '2022-11-16 08:12:21', 0, '78daa32796a94d1fa37ba9e3db6451', '0d6841b5f98542179a5114022f0f59', '1.00', '1.00', '175.0000', '', 0),
('deb9d2db3314460897a035f0fb7f5a', 'admin', '2022-10-16 12:08:30', NULL, NULL, 0, 'a261290db0a141a7916312007b7a8e', 'a995527a67594ce0af5a2298712860', '7055.00', '7055.00', '0.0000', '', 0),
('e5b6571e14ec44a0b954312683b3db', 'admin', '2022-10-16 12:08:24', 'admin', '2022-10-19 13:55:15', 0, '66cf921a21a54002a07722c1d9fc42', 'b0fd68d0868e4433acc74b897b5b18', '286.00', '286.00', '3.1000', '', 0),
('f427203cb0974b9289c45549847974', 'admin', '2022-10-16 12:08:26', 'admin', '2022-10-27 10:36:49', 0, '661774e2f9124620aa42da8c2c4ab9', 'ae1e4ae4b24d4f598f5390ead6be52', '21.32', '21.32', '54.2700', '', 0),
('f428446370da4b838061ac130396bb', 'admin', '2022-10-16 12:08:25', 'ADM01', '2022-11-17 12:07:56', 0, '66cf921a21a54002a07722c1d9fc42', '3e70bdfd80f5405780dbf3b530e009', '100000.00', '100000.00', '0.0163', '', 0),
('fbf9fad8fb114690910231881e3860', 'admin', '2022-10-19 08:33:52', 'admin', '2022-10-26 08:23:57', 0, '78daa32796a94d1fa37ba9e3db6451', 'f73c5828ffd742ff917c350b1f43ab', '1.00', '1.00', '200.0000', '', 0),
('fc4e59ed8e7d4c13bf01db91e2e508', 'admin', '2022-10-19 14:22:24', 'ADM01', '2022-11-17 12:01:26', 0, '66cf921a21a54002a07722c1d9fc42', 'e4b82d1b4e70476daf85aa5494b37c', '144000.00', '144000.00', '0.1751', '', 0),
('fd516805fbce477dbf1e38995cbbb3', 'admin', '2022-10-16 12:08:25', 'ADM01', '2022-11-17 12:04:57', 0, '66cf921a21a54002a07722c1d9fc42', '3714e81e66f34ba5aa8da4579a9627', '2000.00', '2000.00', '0.0485', '', 0);

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
  `qty_req` decimal(20,2) NOT NULL DEFAULT 0.00,
  `qty_act` decimal(20,2) NOT NULL DEFAULT 0.00,
  `qty_bal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supply_sheets`
--

INSERT INTO `supply_sheets` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `item_id`, `component_id`, `workorder`, `request_date`, `request_no`, `request_name`, `qty_req`, `qty_act`, `qty_bal`, `status`) VALUES
('20221129000001', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '10af05969b8042799c703dcd435d08', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '500.00', '500.00', '0.00', 0),
('20221129000002', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', 'f6d94df71f99416591000e95fef385', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '80.00', '80.00', '0.00', 0),
('20221129000003', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '258d134422724290aa869aed97c018', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '500.00', '500.00', '0.00', 0),
('20221129000004', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '959962f44c0f44a29761da251f3cf5', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '795.00', '795.00', '0.00', 0),
('20221129000005', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', 'a995527a67594ce0af5a2298712860', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '35.00', '35.00', '0.00', 0),
('20221129000006', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '3e70bdfd80f5405780dbf3b530e009', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '500.00', '500.00', '0.00', 0),
('20221129000007', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '19d58c090ea14cdc994a8baa312c33', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '500.00', '500.00', '0.00', 0),
('20221129000008', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', 'e4b82d1b4e70476daf85aa5494b37c', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '1500.00', '1500.00', '0.00', 0),
('20221129000009', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', 'f03f5c8efbba404b8abb41370965bf', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '500.00', '500.00', '0.00', 0),
('20221129000010', 'ADM01', '2022-11-29 12:11:34', NULL, NULL, 0, '2a723738ac66458184f008b747dbd7', '9b9b4c19c11349b4bc1f059a1d4159', 'WO221129-00001', '2022-11-29', 'SH-221129-0001', 'FIRDAUS', '500.00', '500.00', '0.00', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_types`
--

CREATE TABLE `transaction_types` (
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
-- Dumping data untuk tabel `transaction_types`
--

INSERT INTO `transaction_types` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `number`, `name`, `description`, `status`) VALUES
('0e49cb457333486f8090c6ed9880c5', 'admin', '2022-11-14 21:48:33', NULL, NULL, 0, 'T005', 'RETURN', 'IN', 0),
('0f6a437328ab46b6958ee5c2c6fa6e', 'admin', '2022-11-14 21:47:43', NULL, NULL, 0, 'T003', 'ADJUSMENT-IN', 'IN', 0),
('3a798bdca7b843d18f56b5ed8b3908', 'admin', '2022-11-14 21:49:03', NULL, NULL, 0, 'T006', 'PART REQUISITION', 'OUT', 0),
('498a789727b94d0e907fe860a26c87', 'admin', '2022-11-14 21:32:27', 'admin', '2022-11-14 21:47:04', 0, 'T001', 'RECEIPT', 'IN', 0),
('9835f0926f0442aea1a60efff04f00', 'admin', '2022-11-14 21:48:15', NULL, NULL, 0, 'T004', 'ADJUSMENT-OUT', 'OUT', 0),
('9ab512cf800b448a86114bc52b1216', 'admin', '2022-11-14 21:47:20', NULL, NULL, 0, 'T002', 'ISSUED', 'OUT', 0),
('b94b8b8735294bafa3ad4fb92e4cf7', 'admin', '2022-11-14 21:50:11', NULL, NULL, 0, 'T008', 'STO-MINUS', 'OUT', 0),
('ecd09253f939460b95a5c7693df406', 'admin', '2022-11-14 21:49:54', NULL, NULL, 0, 'T007', 'STO-PLUS', 'IN', 0);

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
('05c0b88ebdfa4799bb0563ee919965', 'admin', '2022-10-26 16:21:59', 'admin', '2022-10-28 10:38:56', 0, '009', 'SET', 'Set', 0),
('09efc8bcc8cf41a09f5a71246c0a52', 'admin', '2022-10-07 18:16:05', 'admin', '2022-10-28 10:38:30', 0, '002', 'KG', 'Kilogram', 0),
('21220e226eac4dba8690d8961b58d4', 'admin', '2022-10-26 14:11:40', 'admin', '2022-11-28 08:05:40', 0, '008', 'Ml', 'Milliliter', 0),
('57b25832f89144ed9b36bd11e602b0', 'admin', '2022-10-16 11:41:31', 'admin', '2022-11-28 08:05:51', 0, '003', 'Gr', 'Gram', 0),
('86c081e423324443860d07ea0ccefe', 'admin', '2022-10-07 18:16:10', 'admin', '2022-10-28 10:38:24', 0, '001', 'PCS', 'Pieces', 0),
('95ae4168da3b4aadac6a4497bd03d8', 'admin', '2022-10-16 11:42:00', 'admin', '2022-10-28 10:38:50', 0, '007', 'BTL', 'Bottle', 0),
('9bfb58ce16064560a6ccfd22b8b236', 'admin', '2022-10-27 10:11:46', 'admin', '2022-10-28 10:39:03', 0, '011', 'CTG', 'Cartridge', 0),
('b74a21780d4f4f03b022847ff07bc5', 'admin', '2022-10-16 11:41:17', 'admin', '2022-11-28 08:05:22', 0, '005', 'Mtr', 'Meter', 0),
('c2ce0b887b4b4b50a75f89c8f45e4e', 'admin', '2022-10-16 11:41:45', 'admin', '2022-10-28 10:38:44', 0, '006', 'GAL', 'Gallon', 0),
('c64ccef3d1f74c43ab167d7a3ec984', 'admin', '2022-10-27 08:27:59', 'admin', '2022-11-28 08:06:09', 0, '010', 'Ltr', 'Liter', 0),
('cacb50a73a234e7191844506e3c7b5', 'admin', '2022-10-16 11:40:57', 'admin', '2022-10-16 11:46:15', 0, '004', 'Unit', 'Unit', 0);

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
('131e3c0b9c674705aa138d61f506f1', 'admin', '2022-10-16 11:36:32', NULL, NULL, 0, 'YENIARTI', 'YENIARTI', NULL, 'YENIARTI', 'Yeni@123', 'supervisorppic@gmail.com', '1234567', 'PPIC', NULL, 0, 0),
('1d34fb638f1d4b43a0d209e3d381e5', 'admin', '2022-10-16 11:35:50', NULL, NULL, 0, 'SAMSUDIN', 'SAMSUDIN', NULL, 'samsudin', 'samsudin@123#', 'engineering@leoco.com', '123456789', 'Engineering', NULL, 0, 0),
('20221125000001', 'admin', '2022-11-25 14:06:41', NULL, NULL, 0, 'PLANNING', 'NURYUAN', NULL, 'NURYUAN', 'nuryuan123', 'nuryuan@chainwin.com', '1234567890', 'Staff Planning', NULL, 0, 0),
('20221129000001', 'admin', '2022-11-29 11:22:44', NULL, NULL, 0, 'PRC01', 'BRYAN', NULL, 'PRC01', 'PRC01@123#', 'purchasing01@gmail.com', '1111111', 'PURCHASING', NULL, 0, 0),
('74e1927529564a0b80096f9b8b43ee', 'admin', '2022-11-21 11:01:35', 'MGT01', '2022-11-21 15:42:01', 0, 'MGT', 'MR. CHOI', NULL, 'MGT01', '1234', 'Plantmanager@chainwin.co.id', '111111', 'GENERAL MANAGER', NULL, 0, 0),
('79dd0830fdba4c8eab9740f69db4df', 'admin', '2022-11-15 13:40:28', 'ADM01', '2022-11-28 09:56:05', 0, 'ADM01', 'FIRDAUS', NULL, 'ADM01', '123456', 'ADM01@chainwin.co.id', '11111', 'SUPER ADMIN', NULL, 0, 0),
('7d4d895cc6da40129bf8bda75f2648', 'admin', '2022-10-21 09:42:04', NULL, NULL, 0, 'WHS01', 'LUKMANUL HAKIM', NULL, 'WHS01', 'WHS01@123#', 'warehouse@chainwin.co.id', '111111', 'WAREHOUSE', NULL, 0, 0),
('86f9f296025243ed953fe6014ff765', 'admin', '2021-12-26 11:24:58', 'admin', '2022-11-15 13:27:53', 0, '1', 'Administrator', '', 'admin', 'Login190320', 'admin@aeconsys.com', '88888888888', 'Admin System', NULL, 0, 0),
('b1a5baa5cf97423a8aaa085bdeeb0a', 'admin', '2022-11-21 13:45:47', NULL, NULL, 0, 'MGT02', 'MANAGEMENT', NULL, 'MGT02', 'MGT02@123#', 'MGT02@chainwin.com', '22222', 'MANAGEMENT', NULL, 0, 0),
('c8aea2bbea2d4e428b3315a9ce8e98', 'admin', '2022-11-15 10:20:07', NULL, NULL, 0, 'WHS02', 'CARINI', NULL, 'WHS02', 'WHS02@123#', 'whs02@chainwin.co.id', '11111', 'RECEIVING WAREHOUSE', NULL, 0, 0),
('ddae2f0dde8c4bfdb174edc284213a', 'admin', '2022-11-21 10:57:51', 'admin', '2022-11-21 10:59:34', 0, '2', 'Super Admin', NULL, 'adm', 'hilmanf123', 'ADM02@chainwin.co.id', '11111', 'SUPER ADMIN', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse_locations`
--

CREATE TABLE `warehouse_locations` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `type` varchar(10) NOT NULL,
  `number` varchar(30) DEFAULT NULL,
  `location` varchar(30) NOT NULL,
  `area` varchar(30) NOT NULL,
  `rack` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL,
  `level_sub` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `warehouse_locations`
--

INSERT INTO `warehouse_locations` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `type`, `number`, `location`, `area`, `rack`, `level`, `level_sub`, `status`) VALUES
('0a1e33e908df412490c60180f5f00f', 'admin', '2022-10-19 17:27:11', NULL, NULL, 0, 'FG', 'L001', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 2', 'LEVEL SUB 6', 0),
('141ae9c4597f4fa0bacfdd7ab9b505', 'WHS01', '2022-11-14 11:11:30', 'WHS02', '2022-11-15 11:19:30', 0, 'RM', 'RM', 'A04', 'A', '-', '-', '-', 0),
('1beeecd9adaa42a38459113bbe5c1c', 'WHS02', '2022-11-15 11:27:22', NULL, NULL, 0, 'RM', 'RM', 'A08-B', 'A', '-', '-', '-', 0),
('1d6391b38b7e42268f67ca70f38747', 'WHS02', '2022-11-15 11:25:30', NULL, NULL, 0, 'RM', 'RM', 'A07-E', 'A', '-', '-', '-', 0),
('206705b05332482d8cc84ae668c54a', 'WHS02', '2022-11-15 11:24:21', NULL, NULL, 0, 'RM', 'RM', 'A07-B', 'A', '-', '-', '-', 0),
('20853c5ceecd4963b318d86c8f7f53', 'WHS02', '2022-11-15 11:25:18', NULL, NULL, 0, 'RM', 'RM', 'A07-C', 'A', '-', '-', '-', 0),
('2b96aa15e1dd4daa92302a814d3392', 'WHS01', '2022-11-14 11:11:36', 'WHS02', '2022-11-15 11:19:45', 0, 'RM', 'RM', 'A05', 'A', '-', '-', '-', 0),
('39bc5fc01abc43c7ad872f21135396', 'WHS01', '2022-11-14 11:11:24', 'WHS02', '2022-11-15 11:19:14', 0, 'RM', 'RM', 'A03', 'A', '-', '-', '-', 0),
('45da6f94d40c464c90f282b16b4e80', 'admin', '2022-10-19 17:26:34', NULL, NULL, 0, 'FG', 'L002', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 1', 'LEVEL SUB 1', 0),
('4d073d0d85a941648be4722dbb4629', 'WHS02', '2022-11-15 11:27:37', NULL, NULL, 0, 'RM', 'RM', 'A08-D', 'A', '-', '-', '-', 0),
('5549fb39b61b4f55a283f528f428b1', 'admin', '2022-10-19 17:26:58', NULL, NULL, 0, 'FG', 'L003', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 1', 'LEVEL SUB 3', 0),
('603dbbbc28574d6f8363ee547c791e', 'WHS02', '2022-11-15 11:12:33', NULL, NULL, 0, 'RM', 'RM', 'A05-D', 'A', '-', '-', '-', 0),
('606f1c45ad144dc89511dea57a2b4a', 'WHS01', '2022-11-14 11:11:16', 'admin', '2022-11-15 11:15:49', 0, 'RM', 'RM', 'A02', 'A', '-', '-', '-', 0),
('619b07f23cf649f199bed3e0e52191', 'WHS01', '2022-11-14 11:11:50', 'WHS02', '2022-11-15 11:20:57', 0, 'RM', 'RM', 'A08', 'A', '-', '-', '-', 0),
('64afc6308cbb4a6eb310305d3626ad', 'admin', '2022-10-19 17:45:46', 'ADM01', '2022-11-21 11:35:01', 0, 'RM', 'RM', 'P18', '-', '-', '-', '-', 0),
('68bf8a7e5e9241c8b953a6bfca41bc', 'WHS02', '2022-11-15 11:13:42', NULL, NULL, 0, 'RM', 'RM', 'A05-E', 'A', '-', '-', '-', 0),
('6f901f48f5104891be6eae289684d8', 'admin', '2022-10-19 17:27:21', NULL, NULL, 0, 'FG', 'L004', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 2', 'LEVEL SUB 10', 0),
('78c9f771c863493eb8dce33bd1503e', 'WHS02', '2022-11-15 11:22:20', NULL, NULL, 0, 'RM', 'RM', 'A06-C', 'A', '-', '-', '-', 0),
('82a9044394424424ade64bfa00670e', 'WHS01', '2022-11-18 10:48:50', 'ADM01', '2022-11-21 11:34:42', 0, 'RM', 'RM', 'P14', '-', '-', '-', '-', 0),
('868c04b3e1f345bdb16408615fdad7', 'admin', '2022-10-19 17:27:14', NULL, NULL, 0, 'FG', 'L005', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 2', 'LEVEL SUB 7', 0),
('878de9393f3a4d938fc0bd7d48a0a4', 'WHS02', '2022-11-15 11:25:26', NULL, NULL, 0, 'RM', 'RM', 'A07-D', 'A', '-', '-', '-', 0),
('8ed29bb366664e3fa375776ba6b949', 'admin', '2022-10-19 17:27:01', NULL, NULL, 0, 'FG', 'L006', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 1', 'LEVEL SUB 5', 0),
('99c5d62e24f641fcbb6a993f50436b', 'WHS02', '2022-11-15 11:22:10', NULL, NULL, 0, 'RM', 'RM', 'A06-B', 'A', '-', '-', '-', 0),
('a48d9945c1db4b599608862954e0ad', 'WHS02', '2022-11-15 11:22:20', 'WHS02', '2022-11-15 11:23:38', 0, 'RM', 'RM', 'A06-E', 'A', '-', '-', '-', 0),
('ae39785936124eef9afda8575a907a', 'WHS02', '2022-11-15 11:27:16', NULL, NULL, 0, 'RM', 'RM', 'A08-A', 'A', '-', '-', '-', 0),
('b42fb2806fbb483a9ba78074deed30', 'WHS02', '2022-11-15 11:22:14', 'WHS02', '2022-11-15 11:23:11', 0, 'RM', 'RM', 'A06-D', 'A', '-', '-', '-', 0),
('b7807a697c9945baa003a33c63551f', 'WHS02', '2022-11-15 11:21:58', NULL, NULL, 0, 'RM', 'RM', 'A06-A', 'A', '-', '-', '-', 0),
('bb88555566584744a18cae5e805bbf', 'WHS01', '2022-11-14 11:11:46', 'WHS02', '2022-11-15 11:20:41', 0, 'RM', 'RM', 'A07', 'A', '-', '-', '-', 0),
('c34248697d794feb90bc8631f067e5', 'admin', '2022-10-19 17:26:57', NULL, NULL, 0, 'FG', 'L007', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 1', 'LEVEL SUB 2', 0),
('cc842b200a83449e930411fe1ce171', 'admin', '2022-10-19 17:27:18', NULL, NULL, 0, 'FG', 'L008', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 2', 'LEVEL SUB 9', 0),
('cdb63b97442b4a0895e002c6ff133a', 'WHS01', '2022-11-14 11:11:41', 'WHS02', '2022-11-15 11:20:04', 0, 'RM', 'RM', 'A06', 'A', '-', '-', '-', 0),
('d1bd100aae2c450d99b6e46d4c087b', 'WHS02', '2022-11-15 11:25:30', NULL, NULL, 0, 'RM', 'RM', 'A07-E', 'A', '-', '-', '-', 0),
('d7b40dd0ed134525bb7a918e31ca44', 'WHS02', '2022-11-15 11:27:41', NULL, NULL, 0, 'RM', 'RM', 'A08-E', 'A', '-', '-', '-', 0),
('dd57573f62594b598ac39f5ba356b7', 'WHS02', '2022-11-15 11:24:14', NULL, NULL, 0, 'RM', 'RM', 'A07-A', 'A', '-', '-', '-', 0),
('de4b96a8c8eb4d90aa724771962921', 'admin', '2022-10-19 17:27:00', NULL, NULL, 0, 'FG', 'L009', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 1', 'LEVEL SUB 4', 0),
('ea53b2ea4b73451cbdcd9b93d9d5b0', 'admin', '2022-10-19 17:27:17', NULL, NULL, 0, 'FG', 'L010', 'LOKASI A', 'AREA A', 'RAK 001', 'LEVEL 2', 'LEVEL SUB 8', 0),
('fec56605644f4cdb9e227dc9ec7f40', 'WHS02', '2022-11-15 11:27:31', NULL, NULL, 0, 'RM', 'RM', 'A08-C', 'A', '-', '-', '-', 0),
('ff45b8254d364135a18a3ed64d29cd', 'WHS01', '2022-11-14 11:11:01', 'WHS02', '2022-11-15 11:19:01', 0, 'RM', 'RM', 'A01', 'A', '-', '-', '-', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse_location_items`
--

CREATE TABLE `warehouse_location_items` (
  `id` varchar(30) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `type` varchar(10) NOT NULL,
  `item_id` varchar(30) NOT NULL,
  `location` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `rack` varchar(30) DEFAULT NULL,
  `level` varchar(30) DEFAULT NULL,
  `level_sub` varchar(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `warehouse_location_items`
--

INSERT INTO `warehouse_location_items` (`id`, `created_by`, `created_date`, `updated_by`, `updated_date`, `deleted`, `type`, `item_id`, `location`, `area`, `rack`, `level`, `level_sub`, `status`) VALUES
('1241089fbca34ac8bade9bb0de5c91', 'WHS01', '2022-11-14 11:43:27', 'WHS01', '2022-11-16 14:48:53', 0, 'RM', 'f03f5c8efbba404b8abb41370965bf', 'A04', 'A', '-', '-', '-', 0),
('2a2ba7ca2324432b9f4c97abfbacdd', 'WHS01', '2022-11-15 11:59:34', 'WHS01', '2022-11-16 14:52:15', 0, 'RM', '3e70bdfd80f5405780dbf3b530e009', 'A04', '-', '-', '-', '-', 0),
('3817de5704664fcca3c59a469ad65c', 'WHS01', '2022-11-15 12:01:25', 'WHS01', '2022-11-16 14:53:05', 0, 'RM', 'f6d94df71f99416591000e95fef385', 'A04', 'A', '-', '-', '-', 0),
('495d46012dae4c678d88be1870b926', 'WHS01', '2022-11-15 12:03:22', 'WHS01', '2022-11-16 14:54:21', 0, 'RM', '624c4bd2693743b48ff8ec6a1011e8', 'A05', 'A', '-', '-', '-', 0),
('5306b732b89147a980569522aad5a5', 'WHS02', '2022-11-15 11:09:31', 'WHS01', '2022-11-15 11:55:43', 0, 'RM', 'd0d2d181e9864f9e87d38bd8349f9f', 'A05', 'A', '-', '-', '-', 0),
('6001b47a71ec4b7eb42c43646dd91c', 'admin', '2022-11-14 10:48:47', 'WHS01', '2022-11-22 10:06:37', 0, 'RM', '91975e7b4d394c0a88563cc154d9c3', 'P18', '-', '-', '-', '-', 0),
('6a3331a84a64490b98ead9bbff3a8d', 'WHS02', '2022-11-15 11:08:03', 'WHS01', '2022-11-16 14:49:16', 0, 'RM', '10af05969b8042799c703dcd435d08', 'A01', 'A', '-', '-', '-', 0),
('6c3f71f799ad4893bd03d2ebd68cd3', 'WHS01', '2022-11-14 11:12:58', 'WHS01', '2022-11-16 14:47:13', 0, 'RM', '19d58c090ea14cdc994a8baa312c33', 'A02', 'A', '-', '-', '-', 0),
('75d270642be743c5ad0635f8578ddc', 'WHS01', '2022-11-15 12:02:05', 'WHS01', '2022-11-16 14:53:31', 0, 'RM', 'bed6c03ec4bf41f5bcdcd425d6d528', 'A05', 'A', '-', '-', '-', 0),
('7618baa56357422680d38ab56070af', 'WHS01', '2022-11-15 12:02:43', 'WHS01', '2022-11-16 14:53:53', 0, 'RM', 'b5099016fd8c487ebdb5b7b4af1d67', 'A05', 'A', '-', '-', '-', 0),
('763e3b70edc945349ee0822ec3abbf', 'WHS01', '2022-11-15 11:59:05', 'WHS01', '2022-11-16 14:50:43', 0, 'RM', '258d134422724290aa869aed97c018', 'A05', 'A', '-', '-', '-', 0),
('78d3c21b04314f5190c0f82736abde', 'WHS01', '2022-11-14 11:13:33', 'WHS01', '2022-11-16 14:48:13', 0, 'RM', '9b9b4c19c11349b4bc1f059a1d4159', 'A03', 'A', '-', '-', '-', 0),
('a705d186a9dc472aa4f8dfa41328cc', 'WHS01', '2022-11-15 12:00:47', 'WHS01', '2022-11-16 14:52:38', 0, 'RM', '3714e81e66f34ba5aa8da4579a9627', 'A05', 'A', '-', '-', '-', 0),
('b7fcf01a178b4871bb0ab2162d883e', 'WHS02', '2022-11-15 11:09:31', 'WHS01', '2022-11-15 11:58:12', 0, 'RM', 'd0d2d181e9864f9e87d38bd8349f9f', 'A05', 'A', '-', '-', '-', 0),
('bf547038e14d4880966cb197fc895d', 'WHS01', '2022-11-18 12:49:29', 'ADM01', '2022-11-21 11:35:42', 0, 'RM', '614b430c9c2f4260b240e5cf44ad73', 'P14', '-', '-', '-', '-', 0),
('ce7ab897fdef4bfeab92076a58f6d6', 'WHS01', '2022-11-15 12:03:55', 'WHS01', '2022-11-16 14:55:08', 0, 'RM', 'a995527a67594ce0af5a2298712860', 'A05', 'A', '-', '-', '-', 0),
('d70380546ecc40e895b9de777905a4', 'WHS01', '2022-11-18 12:48:32', 'ADM01', '2022-11-21 11:30:29', 0, 'RM', '98a74ee45aa84fdea4a995a8f94c72', 'P14', '-', '-', '-', '-', 0);

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
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `reff` (`reff`),
  ADD KEY `label_no` (`label_no`);

--
-- Indeks untuk tabel `bc_kind`
--
ALTER TABLE `bc_kind`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
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
-- Indeks untuk tabel `item_products`
--
ALTER TABLE `item_products`
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
-- Indeks untuk tabel `job_orders`
--
ALTER TABLE `job_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `customers_number` (`customer_id`),
  ADD KEY `items_number` (`item_id`);

--
-- Indeks untuk tabel `job_order_labels`
--
ALTER TABLE `job_order_labels`
  ADD PRIMARY KEY (`id`),
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
  ADD KEY `line_id` (`line_id`),
  ADD KEY `workorder` (`workorder`);

--
-- Indeks untuk tabel `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `request_no` (`request_no`),
  ADD KEY `po_no` (`po_no`);

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
  ADD KEY `receipt_no` (`receipt_no`),
  ADD KEY `po_no` (`po_no`);

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
-- Indeks untuk tabel `scan_item_receipts`
--
ALTER TABLE `scan_item_receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `receipt_id` (`receipt_id`),
  ADD KEY `label_no` (`label_no`);

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
  ADD KEY `items_number` (`item_id`),
  ADD KEY `workorder` (`workorder`);

--
-- Indeks untuk tabel `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

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
-- Indeks untuk tabel `warehouse_locations`
--
ALTER TABLE `warehouse_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indeks untuk tabel `warehouse_location_items`
--
ALTER TABLE `warehouse_location_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
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
  ADD CONSTRAINT `barcode_divides_ibafk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barcode_divides_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bc_kind`
--
ALTER TABLE `bc_kind`
  ADD CONSTRAINT `bc_kind_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bc_kind_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `issued_material_details_ibfk_4` FOREIGN KEY (`request_no`) REFERENCES `issued_materials` (`request_no`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Ketidakleluasaan untuk tabel `item_products`
--
ALTER TABLE `item_products`
  ADD CONSTRAINT `item_products_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_products_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Ketidakleluasaan untuk tabel `job_orders`
--
ALTER TABLE `job_orders`
  ADD CONSTRAINT `job_orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_orders_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_orders_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_orders_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `job_order_labels`
--
ALTER TABLE `job_order_labels`
  ADD CONSTRAINT `job_order_labels_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_order_labels_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `purchase_order_receipts_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_receipts_ibfk_5` FOREIGN KEY (`po_no`) REFERENCES `purchase_orders` (`po_no`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Ketidakleluasaan untuk tabel `scan_item_receipts`
--
ALTER TABLE `scan_item_receipts`
  ADD CONSTRAINT `scan_item_receipts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scan_item_receipts_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scan_item_receipts_ibfk_3` FOREIGN KEY (`receipt_id`) REFERENCES `purchase_order_receipts` (`receipt_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scan_item_receipts_ibfk_4` FOREIGN KEY (`label_no`) REFERENCES `purchase_order_labels` (`label_no`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `supply_sheets_ibfk_4` FOREIGN KEY (`component_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supply_sheets_ibfk_5` FOREIGN KEY (`workorder`) REFERENCES `production_schedules` (`workorder`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD CONSTRAINT `transaction_types_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_types_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Ketidakleluasaan untuk tabel `warehouse_locations`
--
ALTER TABLE `warehouse_locations`
  ADD CONSTRAINT `warehouse_locations_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_locations_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `warehouse_location_items`
--
ALTER TABLE `warehouse_location_items`
  ADD CONSTRAINT `warehouse_location_items_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_location_items_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warehouse_location_items_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
