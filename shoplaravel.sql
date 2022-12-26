-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 26, 2022 lúc 07:05 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shoplaravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2021_08_18_075639_create_tbl_admin_table', 1),
(5, '2021_08_18_130850_create_tbl_category_product', 2),
(6, '2021_08_18_131643_create_tbl_category_product', 3),
(7, '2021_08_18_132818_create_tbl_category_product', 4),
(8, '2021_09_03_042626_create_tbl_brand_product', 5),
(9, '2021_09_03_064608_create_tbl_product', 6),
(10, '2021_09_05_031532_tbl_customer', 7),
(11, '2021_09_05_044131_tbl_shipping', 8),
(12, '2021_09_05_093849_tbl_payment', 9),
(13, '2021_09_05_094022_tbl_order', 9),
(14, '2021_09_05_094129_tbl_order_details', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_phone`, `created_at`, `updated_at`) VALUES
(1, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Trần Tuấn Hiệp', '0333568287', '2021-08-18 08:20:06', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `brand_desc`, `brand_status`, `created_at`, `updated_at`) VALUES
(9, 'Adidas', 'Adidas là một nhà sản xuất dụng cụ thể thao của Đức', 0, NULL, NULL),
(10, 'Nike', 'Nike là một tập đoàn đa quốc gia của Mỹ hoạt động trong lĩnh vực thiết kế, phát triển, sản xuất, quảng bá cũng như kinh doanh các mặt hàng giày dép, quần áo, phụ kiện, trang thiết bị và dịch vụ liên quan đến thể thao.', 0, NULL, NULL),
(11, 'New Balance', 'New Balance là một công ty Mỹ sản xuất giày có trụ sở tại Brighton khu phố của Boston, Massachusetts. Công ty được thành lập vào năm 1906 với tên \"New Balance Arch Support Company\" và là một trong những nhà sản xuất giày dép thể thao lớn của thế giới.', 0, NULL, NULL),
(12, 'Vans', 'Vans là thương hiệu thời trang chuyên về giày trượt ván, quần áo và phụ kiện của Mỹ, được thành lập tại Anaheim, California và thuộc sở hữu của tập đoàn VF Corporation.', 0, NULL, NULL),
(13, 'The Wolf', 'The Wolf là thương hiệu Việt, chuyên các dong giày boot, giày tây.', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_product`
--

CREATE TABLE `tbl_category_product` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_product`
--

INSERT INTO `tbl_category_product` (`category_id`, `category_name`, `category_desc`, `category_status`, `created_at`, `updated_at`) VALUES
(10, 'Chelsea boot', 'Chelsea boots là một kiểu giày không dây đơn giản, cao đến mắt cá chân với phần hông đàn hồi. Chúng thường được làm từ da hoặc da lộn với hai màu nâu, đen phổ biến.', 0, NULL, NULL),
(11, 'Sneakers', 'Sneaker là giày thể thao có đế mềm với phần trên làm bằng vải hoặc da bạt. Giày sneaker trước đây chủ yếu dùng trong lĩnh vực thể thao, nhưng ngày nay là một sản phẩm thời trang không thể thiếu trong mọi outfit.', 0, NULL, NULL),
(12, 'Derby', 'Giày Derby là để ám chỉ dòng giày da có hệ thống Viền mở, hay tiếng anh gọi là Open Lacing. Lacing hiểu sát nghĩa nhất có nghĩa là phần buộc dây giày. Đối với đôi Derby khi bạn tháo bỏ dây giày, bạn có thể thấy có 2 phần da mà đục lỗ buộc dây, có thể mở ra như đôi cánh.', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customers`
--

INSERT INTO `tbl_customers` (`customer_id`, `customer_name`, `customer_email`, `customer_password`, `customer_address`, `customer_phone`, `created_at`, `updated_at`) VALUES
(9, 'Trần Tuấn Hiệp', 'trantuanhiep07022001@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Thái Bình', '0563182601', NULL, NULL),
(10, 'admin123', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đoán xem', '0360251199', NULL, NULL),
(11, 'Dương Văn Quang', 'quangdv@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nghệ An', '0563182601', NULL, NULL),
(12, 'toilaso1', 'toilaso1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'ha noi', '0563182601', NULL, NULL),
(13, 'toilaso2', 'toilaso2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Thái Bình', '0563182601', NULL, NULL),
(14, 'Tạ Văn Quyết', 'quyet@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hà Nam', '0123456789', NULL, NULL),
(15, 'Trần Công Minh', 'minh@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Thái Bình', '0123456789', NULL, NULL),
(16, 'Trần Tuấn Hiệp', 'trantuanhiep07022001@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Thái Bình', '0360251199', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_infomation`
--

CREATE TABLE `tbl_infomation` (
  `info_id` int(11) NOT NULL,
  `info_contact` mediumtext NOT NULL,
  `info_map` text NOT NULL,
  `info_logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `tbl_infomation`
--

INSERT INTO `tbl_infomation` (`info_id`, `info_contact`, `info_map`, `info_logo`) VALUES
(1, '<p>Địa chỉ: 54 Phố Triều Kh&uacute;c, Thanh Xu&acirc;n, H&agrave; Nội, Việt Nam</p>\r\n\r\n<p>Số điện thoại: 0563182601</p>', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7450.542252160444!2d105.79639787464141!3d20.981766244095372!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acc3ae37fc47%3A0x607ded9d4d1d1182!2zVHJp4buBdSBLaMO6YywgVMOibiBUcmnhu4F1LCBUaGFuaCBUcsOsLCBIYW5vaSwgVmlldG5hbQ!5e0!3m2!1sen!2sus!4v1670764092637!5m2!1sen!2sus\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '158220616_267336174839763_321265054410333084_n39.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_total` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_total`, `order_status`, `created_at`, `updated_at`) VALUES
(31, 9, 19, 31, '1,750,000', 'Đang chờ xử lý', NULL, NULL),
(32, 9, 20, 32, '2,100,000', 'Đang chờ xử lý', NULL, NULL),
(37, 13, 24, 37, '5,450,000', 'Đang chờ xử lý', NULL, NULL),
(38, 14, 25, 38, '6,690,000', 'Đang chờ xử lý', NULL, NULL),
(39, 15, 26, 39, '10,750,000', 'Đang chờ xử lý', NULL, NULL),
(40, 16, 27, 40, '2,050,000', 'Đang chờ xử lý', NULL, NULL),
(41, 16, 28, 41, '2,000,000', 'Đang chờ xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(20, 27, 23, 'Chelsea boot classic black', '1750000', 1, NULL, NULL),
(21, 28, 23, 'Chelsea boot classic black', '1750000', 1, NULL, NULL),
(22, 29, 23, 'Chelsea boot classic black', '1750000', 1, NULL, NULL),
(23, 30, 23, 'Chelsea boot classic black', '1750000', 1, NULL, NULL),
(24, 31, 23, 'Chelsea boot classic black', '1750000', 1, NULL, NULL),
(25, 32, 25, 'Grand Court - White/Black', '1050000', 2, NULL, NULL),
(26, 36, 23, 'Chelsea boot classic black', '1750000', 1, NULL, NULL),
(27, 36, 25, 'Grand Court - White/Black', '1050000', 1, NULL, NULL),
(28, 37, 22, 'VANS Checkerboard Slip-on Classic White', '1450000', 1, NULL, NULL),
(29, 37, 24, 'THE WOLF CHUNKY DERBY - BLACK WHITE', '2000000', 2, NULL, NULL),
(30, 38, 27, 'Giày Nike Air Force 1 Low', '2390000', 1, NULL, NULL),
(31, 38, 32, 'Giày Chạy Bộ Nam Adidas', '4300000', 1, NULL, NULL),
(32, 39, 31, 'Giày Lifestyle Nữ', '2500000', 3, NULL, NULL),
(33, 39, 23, 'Chelsea boot classic black', '1750000', 1, NULL, NULL),
(34, 39, 21, 'VANS Old Skool Classic Black/White', '1500000', 1, NULL, NULL),
(35, 40, 39, 'CHUNKY DERBY - BEIGE', '2050000', 1, NULL, NULL),
(36, 41, 38, 'THE WOLF CHUNKY DERBY', '2000000', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(27, '1', 'Đang chờ xử lý', NULL, NULL),
(28, '1', 'Đang chờ xử lý', NULL, NULL),
(29, '3', 'Đang chờ xử lý', NULL, NULL),
(30, '3', 'Đang chờ xử lý', NULL, NULL),
(31, '3', 'Đang chờ xử lý', NULL, NULL),
(32, '2', 'Đang chờ xử lý', NULL, NULL),
(33, '2', 'Đang chờ xử lý', NULL, NULL),
(34, '2', 'Đang chờ xử lý', NULL, NULL),
(35, '2', 'Đang chờ xử lý', NULL, NULL),
(36, '3', 'Đang chờ xử lý', NULL, NULL),
(37, '2', 'Đang chờ xử lý', NULL, NULL),
(38, '3', 'Đang chờ xử lý', NULL, NULL),
(39, '2', 'Đang chờ xử lý', NULL, NULL),
(40, '2', 'Đang chờ xử lý', NULL, NULL),
(41, '2', 'Đang chờ xử lý', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `category_id`, `product_name`, `brand_id`, `product_desc`, `product_content`, `product_price`, `product_quantity`, `product_image`, `product_status`, `created_at`, `updated_at`) VALUES
(21, 11, 'VANS Old Skool Classic Black/White', 12, '<p>Được gọi vui một c&aacute;ch th&acirc;n thuộc l&agrave; &quot;<strong>gi&agrave;y VANS đen</strong>&quot; vốn l&agrave; một sự phổ biến rất đặc biệt đối với c&aacute;c t&iacute;n đồ của nh&agrave;&nbsp;<strong>VANS</strong>. Tới nay đ&ocirc;i gi&agrave;y chỉ với phối m&agrave;u đen trắng n&agrave;y vẫn nằm trong top &quot;Best Seller&quot; của&nbsp;<strong>VANS&nbsp;</strong>tr&ecirc;n to&agrave;n thế giới, với kiểu d&aacute;ng cổ điển c&ugrave;ng &quot;sọc Jazz&quot; huyền thoại&nbsp;hợp thời trang khiến đ&ocirc;i&nbsp;<strong>VANS</strong>&nbsp;n&agrave;y thật sự trở th&agrave;nh mẫu gi&agrave;y&nbsp;<strong>classic</strong>&nbsp;bất bại, l&agrave; fan h&acirc;m mộ của&nbsp;<strong>VANS</strong>&nbsp;n&oacute;i chung v&agrave; những skaters n&oacute;i ri&ecirc;ng đều n&ecirc;n c&oacute; một đ&ocirc;i trong tủ gi&agrave;y.</p>', '<p>H&agrave;ng mới</p>', '1500000', '100', 'giay-vans-nam-dep-0627.jpg', 0, NULL, NULL),
(22, 11, 'VANS Checkerboard Classic White', 12, '<p>Đối với&nbsp;<strong>VANS</strong>&nbsp;kh&ocirc;ng một t&iacute;n đồ n&agrave;o c&ograve;n xa lại với khả năng s&aacute;ng tạo, phấn đấu kh&ocirc;ng ngừng nghỉ cũng như sự chuy&ecirc;n ch&uacute; v&agrave;o chất lượng ng&agrave;y một cải tiến. Sự h&agrave;i l&ograve;ng v&agrave; phong c&aacute;ch của c&aacute;c t&iacute;n đồ được&nbsp;<strong>VANS</strong>&nbsp;đặt l&agrave;m t&ocirc;n chỉ ngay từ những ng&agrave;y đầu ti&ecirc;n bước ch&acirc;n v&agrave;o ng&agrave;nh gi&agrave;y chuy&ecirc;n nghiệp. Minh chứng r&otilde; nhất cho sự ưu &aacute;i m&agrave; nh&agrave; mốt&nbsp;<strong>OFF THE WALL&nbsp;</strong>d&agrave;nh cho c&aacute;c t&iacute;n đồ y&ecirc;u qu&yacute; m&igrave;nh ch&iacute;nh l&agrave; si&ecirc;u phẩm&nbsp;<strong>VANS SLIP-ON</strong>. Đ&acirc;y l&agrave; si&ecirc;u phẩm với bề d&agrave;y lịch sử gần một nửa thế kỷ.</p>', '<p>H&agrave;ng mới</p>', '1450000', '100', '80489f0dab5956070f4850.jpg', 0, NULL, NULL),
(23, 10, 'Chelsea boot classic black', 13, '<ul>\r\n	<li>M&agrave;u sắc: Đen l&aacute;ng</li>\r\n	<li>Chất liệu da: Da b&ograve; nhập khẩu</li>\r\n	<li>Chất liệu đế gi&agrave;y: Cao su cao cấp</li>\r\n	<li>L&oacute;t Trong: Vải canvas cao cấp, da d&ecirc;</li>\r\n	<li>Độ cao g&oacute;t: 3,8&nbsp;cm</li>\r\n</ul>', '<p>H&agrave;ng mới</p>', '1750000', '100', '35028fd178c7cd47bfa76affc14dcac668.jfif', 0, NULL, NULL),
(24, 12, 'CHUNKY DERBY - BLACK WHITE', 13, '<ul>\r\n	<li>M&agrave;u sắc: Đen Trắng.&nbsp;</li>\r\n	<li>Chất liệu da: Da b&ograve; nhập khẩu.&nbsp;</li>\r\n	<li>Chất liệu đế gi&agrave;y: Cao su cao cấp.&nbsp;</li>\r\n	<li>L&oacute;t Trong: Vải canvas cao cấp, da d&ecirc;.&nbsp;</li>\r\n	<li>Độ cao g&oacute;t: 5,5 cm.&nbsp;</li>\r\n	<li>Chi tiết: Dấu X được may thủ c&ocirc;ng sau g&oacute;t, đầu cột d&acirc;y l&agrave;m bằng th&eacute;p kh&ocirc;ng gỉ,&nbsp;phần mũi gi&agrave;y được may thủ c&ocirc;ng bằng tay, với đường chỉ lớn, tạo điểm nhấn cho đ&ocirc;i gi&agrave;y.&nbsp;</li>\r\n	<li>Sản phẩm được THIẾT KẾ V&Agrave; GIA C&Ocirc;NG BỞI NGƯỜI VIỆT NAM.&nbsp;</li>\r\n</ul>', '<p>H&agrave;ng mới</p>', '2000000', '100', 'fea53ab4d4d51616617e753589e19bf026.jpg', 0, NULL, NULL),
(25, 11, 'Grand Court - White/Black', 9, '<p>Bản cập nhật hiện đại cho phong c&aacute;ch thập ni&ecirc;n 70. Đ&ocirc;i gi&agrave;y lấy cảm hứng từ t&ograve;a &aacute;n n&agrave;y c&oacute; phần tr&ecirc;n giống như da mịn với 3 sọc tương phản. Một chiếc sockliner nhẹ mang lại sự thoải m&aacute;i khi họ đi trong ng&agrave;y.</p>', '<p>H&agrave;ng mới</p>', '1050000', '100', 'adidas-grand-court-ef0103-0171.webp', 0, NULL, NULL),
(27, 11, 'Giày Nike Air Force 1 Low', 10, '<p>Nike Air Force 1 Low LE GS All White &ndash; &ldquo;cầu nối&rdquo; giữa qu&aacute; khứ v&agrave; hiện tại. Những gi&aacute; trị l&acirc;u đời của d&ograve;ng gi&agrave;y Air Force 1 được thể hiện r&otilde; r&agrave;ng ở bộ đế: họa tiết sao năm c&aacute;nh dập nổi, những v&ograve;ng tr&ograve;n đồng t&acirc;m gi&uacute;p tăng độ b&aacute;m (traction) v&agrave; c&ocirc;ng nghệ đế Air danh tiếng từ những năm 1979. Mặt kh&aacute;c, đ&ocirc;i gi&agrave;y mang đến cảm gi&aacute;c tươi mới với cổ thấp, t&ocirc;ng m&agrave;u trắng tối giản k&eacute;t hợp c&ugrave;ng những đường n&eacute;t cắt xẻ hiện đại ở phần upper.</p>', '<p>Sản phâm mới</p>', '2390000', '100', 'air-force-1-big-kids-shoe-yjjzro_0ad09cd2f79b45048056acf54900a913_master79.webp', 0, NULL, NULL),
(29, 11, 'Giày Lifestyle Nike Air Max', 10, '<p>Gi&agrave;y Lifestyle Nike Air Max&nbsp;được l&agrave;m từ chất liệu 3% sợi dệt, 42% sợi tổng hợp v&agrave; 55% da c&oacute; bề mặt th&ocirc;ng tho&aacute;ng mang lại cảm gi&aacute;c thoải m&aacute;i, &iacute;t b&aacute;m bẩn v&agrave; độ bền cao</p>', '<p>Sản phẩm mới</p>', '4500000', '100', 'giay-lifestyle-nu-nike-w-air-max-97-dh1592-100-190422-021820-600x60036.jpg', 0, NULL, NULL),
(30, 11, 'Giày Nike React Infinity Run', 10, '<p>Gi&agrave;y&nbsp;được l&agrave;m từ 18% sợi tổng hợp v&agrave; 82% sợi dệt cho độ bền cao, hạn chế t&igrave;nh trạng phai m&agrave;u v&agrave; chống b&aacute;m bẩn tốt.&nbsp;được l&agrave;m từ 18% sợi tổng hợp v&agrave; 82% sợi dệt cho độ bền cao, hạn chế t&igrave;nh trạng phai m&agrave;u v&agrave; chống b&aacute;m bẩn tốt</p>', '<p>Sản phẩm mới</p>', '3800000', '100', 'giay-chay-bo-nam-nike-react-infinity-run-fk-2-ct2357-006-135.jpg', 0, NULL, NULL),
(31, 11, 'Giày Lifestyle Nữ', 10, '<p>Bộ đế cao su gi&uacute;p b&aacute;m đường tốt hơn v&agrave; an to&agrave;n khi vận động. Gi&agrave;y Nike sở hữu c&ocirc;ng nghệ Air max c&oacute; đệm chứa kh&ocirc;ng kh&iacute; nhằm giảm c&aacute;c chấn động</p>', '<p>Sản phẩm mới</p>', '2500000', '100', 'giay-lifestyle-nu-nike-air-max-270-react-cv8818-500-119.jpg', 0, NULL, NULL),
(32, 11, 'Giày Chạy Bộ Nam Adidas', 9, '<p>Thiết kế với vải lưới mỏng nhẹ cho gi&agrave;y Adidas&nbsp;th&ocirc;ng tho&aacute;ng tốt mang lại sự thoải m&aacute;i. Ngo&agrave;i ra c&ograve;n c&oacute; độ bền đẹp cao v&agrave; dễ d&agrave;ng lau ch&ugrave;i</p>', '<p>Sản phẩm mới</p>', '4300000', '100', 'adidas-solar-control-m-gx9219-177.jpg', 0, NULL, NULL),
(34, 11, 'Giày New Balance W Pro', 11, '<p><strong>Thương hiệu</strong>: New Balance</p>\r\n\r\n<p><strong>Chất liệu</strong>: Da cao cấp, Vải</p>', '<p>Sản phẩm mới</p>', '2100000', '100', 'giay_new_balance_wmns_pro_court_beige_green_proctccg__3__80d56df2bf53452a97ae30d7a4b8a4f8_grande82.webp', 0, NULL, NULL),
(35, 10, 'CHELSEA BOOT - TAN', 13, '<ul>\r\n	<li>M&agrave;u sắc: Tan</li>\r\n	<li>Chất liệu da: Da b&ograve; nhập khẩu</li>\r\n	<li>Chất liệu đế gi&agrave;y: Cao su cao cấp</li>\r\n	<li>L&oacute;t Trong: Vải canvas cao cấp, da d&ecirc;</li>\r\n	<li>Độ cao g&oacute;t: 3,8&nbsp;cm</li>\r\n</ul>', '<p>Sản phẩm mới</p>', '1700000', '100', '2_64cff3e2d8b4444fb27a285c339380c0_grande67.webp', 0, NULL, NULL),
(36, 10, 'WILD WALK CHELSEA BOOT', 13, '<ul>\r\n	<li>M&agrave;u sắc: Tan</li>\r\n	<li>Chất liệu da: Da b&ograve; nhập khẩu</li>\r\n	<li>Chất liệu đế gi&agrave;y: Cao su cao cấp</li>\r\n	<li>L&oacute;t Trong: Da d&ecirc;</li>\r\n	<li>Độ cao g&oacute;t: 4,3&nbsp;cm</li>\r\n</ul>', '<p>Sản phẩm mới</p>', '2050000', '100', '1_cfc15ec05df74c478fc01bd94d46ccbd_master33.webp', 0, NULL, NULL),
(37, 10, 'CHELSEA BOOT – BLACK LIZARD', 13, '<ul>\r\n	<li>M&agrave;u sắc: Đen Lizard</li>\r\n	<li>Chất liệu da: Da b&ograve; nhập khẩu</li>\r\n	<li>Chất liệu đế gi&agrave;y: Cao su cao cấp</li>\r\n	<li>L&oacute;t Trong: Da d&ecirc;</li>\r\n	<li>Độ cao g&oacute;t: 4,3&nbsp;cm</li>\r\n</ul>', '<p>Sản phẩm mới</p>', '2200000', '100', '1_aacacf20a8c646dc8d6f105b08a71aac_master36.webp', 0, NULL, NULL),
(38, 12, 'THE WOLF CHUNKY DERBY', 13, '<ul>\r\n	<li>M&agrave;u sắc: Đen Trắng.&nbsp;</li>\r\n	<li>Chất liệu da: Da b&ograve; nhập khẩu.&nbsp;</li>\r\n	<li>Chất liệu đế gi&agrave;y: Cao su cao cấp.&nbsp;</li>\r\n	<li>L&oacute;t Trong: Vải canvas cao cấp, da d&ecirc;.&nbsp;</li>\r\n	<li>Độ cao g&oacute;t: 5,5 cm.&nbsp;</li>\r\n	<li>Chi tiết: Dấu X được may thủ c&ocirc;ng sau g&oacute;t, đầu cột d&acirc;y l&agrave;m bằng th&eacute;p kh&ocirc;ng gỉ,&nbsp;phần mũi gi&agrave;y được may thủ c&ocirc;ng bằng tay, với đường chỉ lớn, tạo điểm nhấn cho đ&ocirc;i gi&agrave;y.&nbsp;</li>\r\n	<li>Sản phẩm được THIẾT KẾ V&Agrave; GIA C&Ocirc;NG BỞI NGƯỜI VIỆT NAM.&nbsp;</li>\r\n</ul>', '<p>Sản phẩm mới</p>', '2000000', '99', '1_b29d64a19ebf4e4c84cb922271622fff_master41.webp', 0, NULL, NULL),
(39, 12, 'CHUNKY DERBY - BEIGE', 13, '<ul>\r\n	<li>M&agrave;u sắc: Beige.&nbsp;</li>\r\n	<li>Chất liệu da: Da b&ograve; nhập khẩu.&nbsp;</li>\r\n	<li>Chất liệu đế gi&agrave;y: Cao su cao cấp.&nbsp;</li>\r\n	<li>L&oacute;t Trong: Vải canvas cao cấp, da d&ecirc;.&nbsp;</li>\r\n	<li>Độ cao g&oacute;t: 5,5 cm.&nbsp;</li>\r\n	<li>Chi tiết: Dấu X được may thủ c&ocirc;ng sau g&oacute;t, đầu cột d&acirc;y l&agrave;m bằng th&eacute;p kh&ocirc;ng gỉ,&nbsp;phần mũi gi&agrave;y được may thủ c&ocirc;ng bằng tay, với đường chỉ lớn, tạo điểm nhấn cho đ&ocirc;i gi&agrave;y.&nbsp;</li>\r\n	<li>Sản phẩm được THIẾT KẾ V&Agrave; GIA C&Ocirc;NG BỞI NGƯỜI VIỆT NAM.&nbsp;</li>\r\n</ul>', '<p>Sản phẩm mới</p>', '2050000', '99', '1_8cb96985fe774590bae82942d57fdc61_master36.webp', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `shipping_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `shipping_name`, `shipping_address`, `shipping_phone`, `shipping_email`, `shipping_notes`, `created_at`, `updated_at`) VALUES
(19, 'Trần Tuấn Hiệp', 'Thái Bình', '0563182601', 'trantuanhiep07022001@gmail.com', 'Không!', NULL, NULL),
(20, 'Tran Tuan Hiep', 'Thai Binh', '0563182601', 'trantuanhiep07022001@gmail.com', 'Khong co gi', NULL, NULL),
(21, 'toilaso2', 'hanoi', '0563128601', 'toilaso2', 'k co gi', NULL, NULL),
(22, 'toilaso2', 'hanoi', '0563128601', 'toilaso2', 'k', NULL, NULL),
(23, 'toilaso2', 'hanoi', '0563128601', 'toilaso2', 'khoong', NULL, NULL),
(24, 'toilaso2', 'hanoi', '0563128601', 'toilaso2', 'không', NULL, NULL),
(25, 'Tạ Văn Quyết', 'Hà Nam', '0123456789', 'quyet@gmail.com', 'Không', NULL, NULL),
(26, 'Trần Công Minh', 'Thái Bình', '0123456789', 'minh@gmail.com', 'không', NULL, NULL),
(27, 'trantuanhiep', 'Thái Bình', '0360251199', 'trantuanhiep07022001@gmail.com', 'khong', NULL, NULL),
(28, 'quang van duong', 'nghe an', '0563182601', 'quangdv@gmail.com', 'khong', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_infomation`
--
ALTER TABLE `tbl_infomation`
  ADD PRIMARY KEY (`info_id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Chỉ mục cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `tbl_category_product`
--
ALTER TABLE `tbl_category_product`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `tbl_infomation`
--
ALTER TABLE `tbl_infomation`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
