/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.3.29-MariaDB : Database - barw9725_barang_mudo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`barw9725_barang_mudo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `barw9725_barang_mudo`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `id_barang` bigint(20) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `slug_barang` text DEFAULT NULL,
  `status_barang` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `barang` */

/*Table structure for table `barang_deskripsi` */

DROP TABLE IF EXISTS `barang_deskripsi`;

CREATE TABLE `barang_deskripsi` (
  `id_brg_desc` bigint(20) NOT NULL AUTO_INCREMENT,
  `barang_brg_desc` bigint(20) NOT NULL,
  `judul_brg_desc` varchar(50) DEFAULT NULL,
  `desc_brg_desc` text DEFAULT NULL,
  `level_brg_desc` int(2) NOT NULL,
  PRIMARY KEY (`id_brg_desc`),
  KEY `barang_deskripsi_barang_brg_desc_foreign` (`barang_brg_desc`),
  CONSTRAINT `barang_deskripsi_barang_brg_desc_foreign` FOREIGN KEY (`barang_brg_desc`) REFERENCES `barang` (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `barang_deskripsi` */

/*Table structure for table `barang_kategori` */

DROP TABLE IF EXISTS `barang_kategori`;

CREATE TABLE `barang_kategori` (
  `id_brg_kategori` bigint(20) NOT NULL AUTO_INCREMENT,
  `barang_brg_kategori` bigint(20) NOT NULL,
  `kategori_brg_kategori` bigint(20) NOT NULL,
  PRIMARY KEY (`id_brg_kategori`),
  KEY `barang_kategori_barang_brg_kategori_foreign` (`barang_brg_kategori`),
  KEY `barang_kategori_kategori_brg_kategori_foreign` (`kategori_brg_kategori`),
  CONSTRAINT `barang_kategori_barang_brg_kategori_foreign` FOREIGN KEY (`barang_brg_kategori`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `barang_kategori_kategori_brg_kategori_foreign` FOREIGN KEY (`kategori_brg_kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `barang_kategori` */

/*Table structure for table `barang_satuan` */

DROP TABLE IF EXISTS `barang_satuan`;

CREATE TABLE `barang_satuan` (
  `id_brg_satuan` bigint(20) NOT NULL AUTO_INCREMENT,
  `barang_brg_satuan` bigint(20) NOT NULL,
  `satuan_brg_satuan` bigint(20) NOT NULL,
  PRIMARY KEY (`id_brg_satuan`),
  KEY `barang_satuan_barang_brg_satuan_foreign` (`barang_brg_satuan`),
  KEY `barang_satuan_satuan_brg_satuan_foreign` (`satuan_brg_satuan`),
  CONSTRAINT `barang_satuan_barang_brg_satuan_foreign` FOREIGN KEY (`barang_brg_satuan`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `barang_satuan_satuan_brg_satuan_foreign` FOREIGN KEY (`satuan_brg_satuan`) REFERENCES `satuan` (`id_satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `barang_satuan` */

/*Table structure for table `gudang` */

DROP TABLE IF EXISTS `gudang`;

CREATE TABLE `gudang` (
  `id_gudang` bigint(20) NOT NULL,
  `nama_gudang` varchar(50) DEFAULT NULL,
  `alamat_gudang` text DEFAULT NULL,
  PRIMARY KEY (`id_gudang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gudang` */

/*Table structure for table `harga_barang` */

DROP TABLE IF EXISTS `harga_barang`;

CREATE TABLE `harga_barang` (
  `id_hrg_barang` bigint(20) NOT NULL AUTO_INCREMENT,
  `terima_hrg_barang` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_hrg_barang`),
  KEY `harga_barang_terima_hrg_barang_foreign` (`terima_hrg_barang`),
  CONSTRAINT `harga_barang_terima_hrg_barang_foreign` FOREIGN KEY (`terima_hrg_barang`) REFERENCES `penerimaan_detail` (`id_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `harga_barang` */

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL,
  `slug_kategori` text DEFAULT NULL,
  `icon_kategori` text DEFAULT NULL,
  `parent_kategori` bigint(20) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`nama_kategori`,`slug_kategori`,`icon_kategori`,`parent_kategori`) values 
(1,'Sayur','sayur','images/kategori/ad0823d1c059305b21f9df9fd11299bd.png',0),
(2,'Lauk Pauk','lauk-pauk','images/kategori/cd2d6e9ecad04093852fed15b8bd1198.png',0),
(3,'Buah-Buahan','buah-buahan','images/kategori/7792c44999a45dd8b9f2244898acf06d.png',0),
(4,'Sayur Daun','sayur-daun','',1),
(5,'Sayur Batang','sayur-batang','',1),
(6,'Organik','organik','',5),
(7,'Pupuk Kandang','pupuk-kandang','',6),
(8,'Sayur Organik','sayur-organik','',1);

/*Table structure for table `kategori_path` */

DROP TABLE IF EXISTS `kategori_path`;

CREATE TABLE `kategori_path` (
  `kategori_path` bigint(20) NOT NULL,
  `parent_path` bigint(20) NOT NULL,
  `level_path` int(11) NOT NULL,
  PRIMARY KEY (`kategori_path`,`parent_path`),
  KEY `kategori_path_parent_path_foreign` (`parent_path`),
  CONSTRAINT `kategori_path_kategori_path_foreign` FOREIGN KEY (`kategori_path`) REFERENCES `kategori` (`id_kategori`),
  CONSTRAINT `kategori_path_parent_path_foreign` FOREIGN KEY (`parent_path`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kategori_path` */

insert  into `kategori_path`(`kategori_path`,`parent_path`,`level_path`) values 
(1,1,0),
(2,2,0),
(3,3,0),
(4,1,0),
(4,4,1),
(5,1,0),
(5,5,1),
(6,1,0),
(6,5,1),
(6,6,2),
(7,1,0),
(7,5,1),
(7,6,2),
(7,7,3),
(8,1,0),
(8,8,1);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) values 
(1,'2021-03-24-092217','App\\Database\\Migrations\\CreateTabelUser','default','App',1619679886,1),
(2,'2021-03-24-103035','App\\Database\\Migrations\\CreateTabelRole','default','App',1619679886,1),
(3,'2021-03-25-114954','App\\Database\\Migrations\\CreateTabelGudang','default','App',1619679886,1),
(4,'2021-03-25-120018','App\\Database\\Migrations\\CreateTabelUserOffice','default','App',1619679886,1),
(5,'2021-03-25-132256','App\\Database\\Migrations\\CreateTabelUserGudang','default','App',1619679886,1),
(6,'2021-04-04-031035','App\\Database\\Migrations\\CreateTabelSatuan','default','App',1619679886,1),
(7,'2021-04-10-043405','App\\Database\\Migrations\\CreateTabelSupplier','default','App',1619679886,1),
(8,'2021-04-10-064513','App\\Database\\Migrations\\CreateTableKategori','default','App',1619679886,1),
(9,'2021-04-10-064942','App\\Database\\Migrations\\CreateTabelKategoriPath','default','App',1619679886,1),
(10,'2021-04-10-083640','App\\Database\\Migrations\\CreateTabelBarang','default','App',1619679886,1),
(11,'2021-04-10-090143','App\\Database\\Migrations\\CreateTabelBarangDeskripsi','default','App',1619679886,1),
(12,'2021-04-10-090840','App\\Database\\Migrations\\CreateTabelBarangDeskripsiKategori','default','App',1619679886,1),
(13,'2021-04-10-092542','App\\Database\\Migrations\\CreateTabelBarangDeskripsiSatuan','default','App',1619679886,1),
(14,'2021-04-12-110619','App\\Database\\Migrations\\CreateTabelTmpPermintaan','default','App',1619679886,1),
(15,'2021-04-12-113827','App\\Database\\Migrations\\CreateTabelPermintaan','default','App',1619679886,1),
(16,'2021-04-12-123137','App\\Database\\Migrations\\CreateTablePermintaanDetail','default','App',1619679886,1),
(17,'2021-04-12-141559','App\\Database\\Migrations\\CreateTabelTmpPenerimaan','default','App',1619679886,1),
(18,'2021-04-12-141935','App\\Database\\Migrations\\CreateTabelPenerimaan','default','App',1619679886,1),
(19,'2021-04-12-142453','App\\Database\\Migrations\\CreateTabelPenerimaanDetail','default','App',1619679886,1),
(20,'2021-04-12-143746','App\\Database\\Migrations\\CreateTabelPenerimaanSupplier','default','App',1619679886,1),
(21,'2021-04-23-070259','App\\Database\\Migrations\\CreateTabelSettings','default','App',1619679886,1),
(22,'2021-04-29-025126','App\\Database\\Migrations\\CreateTabelHargaBarang','default','App',1619679886,1);

/*Table structure for table `penerimaan` */

DROP TABLE IF EXISTS `penerimaan`;

CREATE TABLE `penerimaan` (
  `id_terima` bigint(20) NOT NULL,
  `gudang_terima` bigint(20) NOT NULL,
  `tanggal_terima` date NOT NULL,
  `total_terima` int(11) NOT NULL,
  `status_terima` tinyint(1) NOT NULL,
  `user_terima` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_terima`),
  KEY `penerimaan_gudang_terima_foreign` (`gudang_terima`),
  KEY `penerimaan_user_terima_foreign` (`user_terima`),
  CONSTRAINT `penerimaan_gudang_terima_foreign` FOREIGN KEY (`gudang_terima`) REFERENCES `gudang` (`id_gudang`),
  CONSTRAINT `penerimaan_user_terima_foreign` FOREIGN KEY (`user_terima`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `penerimaan` */

/*Table structure for table `penerimaan_detail` */

DROP TABLE IF EXISTS `penerimaan_detail`;

CREATE TABLE `penerimaan_detail` (
  `id_detail` bigint(20) NOT NULL AUTO_INCREMENT,
  `terima_detail` bigint(20) NOT NULL,
  `minta_detail` bigint(20) NOT NULL,
  `harga_detail` int(11) NOT NULL,
  `jumlah_detail` int(11) NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `penerimaan_detail_terima_detail_foreign` (`terima_detail`),
  KEY `penerimaan_detail_minta_detail_foreign` (`minta_detail`),
  CONSTRAINT `penerimaan_detail_minta_detail_foreign` FOREIGN KEY (`minta_detail`) REFERENCES `permintaan_detail` (`id_detail`),
  CONSTRAINT `penerimaan_detail_terima_detail_foreign` FOREIGN KEY (`terima_detail`) REFERENCES `penerimaan` (`id_terima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `penerimaan_detail` */

/*Table structure for table `penerimaan_supplier` */

DROP TABLE IF EXISTS `penerimaan_supplier`;

CREATE TABLE `penerimaan_supplier` (
  `id_terima_supplier` bigint(20) NOT NULL,
  `id_minta_supplier` bigint(20) NOT NULL,
  KEY `penerimaan_supplier_id_terima_supplier_foreign` (`id_terima_supplier`),
  KEY `penerimaan_supplier_id_minta_supplier_foreign` (`id_minta_supplier`),
  CONSTRAINT `penerimaan_supplier_id_minta_supplier_foreign` FOREIGN KEY (`id_minta_supplier`) REFERENCES `permintaan` (`id_permintaan`),
  CONSTRAINT `penerimaan_supplier_id_terima_supplier_foreign` FOREIGN KEY (`id_terima_supplier`) REFERENCES `penerimaan` (`id_terima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `penerimaan_supplier` */

/*Table structure for table `permintaan` */

DROP TABLE IF EXISTS `permintaan`;

CREATE TABLE `permintaan` (
  `id_permintaan` bigint(20) NOT NULL,
  `supplier_permintaan` bigint(20) NOT NULL,
  `tanggal_permintaan` date NOT NULL,
  `total_permintaan` int(11) NOT NULL,
  `status_permintaan` tinyint(1) NOT NULL,
  `user_permintaan` bigint(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_permintaan`),
  KEY `permintaan_supplier_permintaan_foreign` (`supplier_permintaan`),
  KEY `permintaan_user_permintaan_foreign` (`user_permintaan`),
  CONSTRAINT `permintaan_supplier_permintaan_foreign` FOREIGN KEY (`supplier_permintaan`) REFERENCES `supplier` (`id_supplier`),
  CONSTRAINT `permintaan_user_permintaan_foreign` FOREIGN KEY (`user_permintaan`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permintaan` */

/*Table structure for table `permintaan_detail` */

DROP TABLE IF EXISTS `permintaan_detail`;

CREATE TABLE `permintaan_detail` (
  `id_detail` bigint(20) NOT NULL AUTO_INCREMENT,
  `permintaan_detail` bigint(20) NOT NULL,
  `barang_detail` bigint(20) NOT NULL,
  `harga_detail` int(11) NOT NULL,
  `jumlah_detail` int(11) NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `permintaan_detail_permintaan_detail_foreign` (`permintaan_detail`),
  KEY `permintaan_detail_barang_detail_foreign` (`barang_detail`),
  CONSTRAINT `permintaan_detail_barang_detail_foreign` FOREIGN KEY (`barang_detail`) REFERENCES `barang_satuan` (`id_brg_satuan`),
  CONSTRAINT `permintaan_detail_permintaan_detail_foreign` FOREIGN KEY (`permintaan_detail`) REFERENCES `permintaan` (`id_permintaan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permintaan_detail` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` char(50) DEFAULT NULL,
  `jenis_role` enum('1','2') DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id_role`,`nama_role`,`jenis_role`) values 
(1,'Administrator','1'),
(2,'Bagian Penjualan','1'),
(3,'Bagian Produk','1'),
(4,'Kepala Gudang','2'),
(5,'Kepala Gudang','2'),
(6,'Pengemasan','2'),
(7,'Pengiriman','2');

/*Table structure for table `satuan` */

DROP TABLE IF EXISTS `satuan`;

CREATE TABLE `satuan` (
  `id_satuan` bigint(20) NOT NULL,
  `nama_satuan` varchar(50) DEFAULT NULL,
  `singkatan_satuan` char(30) DEFAULT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `satuan` */

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id_seting` bigint(20) NOT NULL,
  `nama_seting` varchar(50) DEFAULT NULL,
  `value_seting` longtext DEFAULT NULL,
  PRIMARY KEY (`id_seting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `settings` */

insert  into `settings`(`id_seting`,`nama_seting`,`value_seting`) values 
(1,'nameapp','Barang Mudo'),
(2,'pathassets','http://localhost:81/assets/'),
(3,'pathfavicon','http://localhost:81/assets/logo/favicon.ico'),
(4,'pathlogo','http://localhost:81/assets/logo/logo.png'),
(5,'pathlogohome','http://localhost:81/assets/logo/logo-white.png'),
(6,'pathnouser','http://localhost:81/assets/logo/no_image.png'),
(7,'pathimage','../assets/'),
(8,'nameappapi','API Barang Mudo'),
(9,'pathlogoapi','http://localhost:81/assets/logo/logo.png'),
(10,'pathlogohomeapi','http://localhost:81/assets/logo/logo-white.png'),
(11,'pathfaviconapi','http://localhost:81/assets/logo/favicon.ico');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id_supplier` bigint(20) NOT NULL,
  `nama_supplier` varchar(50) DEFAULT NULL,
  `alamat_supplier` text DEFAULT NULL,
  `telp_supplier` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

/*Table structure for table `tmp_penerimaan` */

DROP TABLE IF EXISTS `tmp_penerimaan`;

CREATE TABLE `tmp_penerimaan` (
  `iddetail` bigint(20) NOT NULL,
  `permintaan` bigint(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `user` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tmp_penerimaan` */

/*Table structure for table `tmp_permintaan` */

DROP TABLE IF EXISTS `tmp_permintaan`;

CREATE TABLE `tmp_permintaan` (
  `satuan` bigint(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `user` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tmp_permintaan` */

/*Table structure for table `user_gudang` */

DROP TABLE IF EXISTS `user_gudang`;

CREATE TABLE `user_gudang` (
  `id_level` bigint(20) NOT NULL,
  `user_level` bigint(20) NOT NULL,
  `gudang_level` bigint(20) NOT NULL,
  `role_level` int(11) NOT NULL,
  PRIMARY KEY (`id_level`),
  KEY `user_gudang_user_level_foreign` (`user_level`),
  KEY `user_gudang_gudang_level_foreign` (`gudang_level`),
  KEY `user_gudang_role_level_foreign` (`role_level`),
  CONSTRAINT `user_gudang_gudang_level_foreign` FOREIGN KEY (`gudang_level`) REFERENCES `gudang` (`id_gudang`),
  CONSTRAINT `user_gudang_role_level_foreign` FOREIGN KEY (`role_level`) REFERENCES `role` (`id_role`),
  CONSTRAINT `user_gudang_user_level_foreign` FOREIGN KEY (`user_level`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_gudang` */

/*Table structure for table `user_office` */

DROP TABLE IF EXISTS `user_office`;

CREATE TABLE `user_office` (
  `id_level` int(11) NOT NULL,
  `user_level` bigint(20) NOT NULL,
  `role_level` int(11) NOT NULL,
  PRIMARY KEY (`id_level`),
  KEY `user_office_user_level_foreign` (`user_level`),
  KEY `user_office_role_level_foreign` (`role_level`),
  CONSTRAINT `user_office_role_level_foreign` FOREIGN KEY (`role_level`) REFERENCES `role` (`id_role`),
  CONSTRAINT `user_office_user_level_foreign` FOREIGN KEY (`user_level`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_office` */

insert  into `user_office`(`id_level`,`user_level`,`role_level`) values 
(1,1,1),
(2,2,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id_user` bigint(20) NOT NULL,
  `nama_user` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `avatar_user` text DEFAULT NULL,
  `jenis_user` enum('1','2') DEFAULT NULL,
  `status_user` int(1) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id_user`,`nama_user`,`username`,`password`,`avatar_user`,`jenis_user`,`status_user`,`last_login`) values 
(1,'Admin','admin','$2y$10$MRbVuprGDy9Jsrlm8LbyXOivU8H/3/t7toTOmQdIS5a5GCOEml6Hq',NULL,'1',1,'2021-03-26 17:27:44'),
(2,'tes_admin','tes_admin','$2y$10$tX.sZOgv96OojIK8V7jgGONUdrdVFxhT8H2yOoVR/5zywfJbrSuhy','images/users/1619662887.png','1',0,'2021-04-29 09:21:27');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
