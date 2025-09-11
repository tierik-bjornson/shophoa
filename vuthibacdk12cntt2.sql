-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 01, 2024 lúc 04:51 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vuthibacdk12cntt2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(12) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `total` int(12) NOT NULL,
  `pttt` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `name`, `address`, `tel`, `email`, `total`, `pttt`) VALUES
(2, 'bac11', 'chí linh hải dương', '087326872', 'Vurio410@gmail.com', 720, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(12) NOT NULL,
  `tensp` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `dongia` int(12) NOT NULL DEFAULT 0,
  `soluong` int(3) NOT NULL DEFAULT 0,
  `thanhtien` int(12) NOT NULL DEFAULT 0,
  `idbill` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `tensp`, `img`, `dongia`, `soluong`, `thanhtien`, `idbill`) VALUES
(3, 'Hoa Lan Hồ Điệp', 'anh27.jpg', 390, 1, 390000, 2),
(4, 'Hoa Hồng Kinh Đô   ', 'anh8x.jpg', 330, 1, 330000, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lienhe`
--

CREATE TABLE `lienhe` (
  `hoten` varchar(200) NOT NULL,
  `sdt` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `noidung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lienhe`
--

INSERT INTO `lienhe` (`hoten`, `sdt`, `email`, `noidung`) VALUES
('vũ thị bắc', 367456697, 'hung1@gmail.com', 'tôi muốn mua hoa với 1 số lượng lớn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login`
--

CREATE TABLE `login` (
  `tendangnhap` varchar(100) NOT NULL,
  `matkhau` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `masp` varchar(100) NOT NULL,
  `nhom_id` int(11) NOT NULL,
  `tensp` varchar(200) NOT NULL,
  `mota` text DEFAULT NULL,
  `dongia` int(11) NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT 1,
  `ghichu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`masp`, `nhom_id`, `tensp`, `mota`, `dongia`, `img`, `enable`, `ghichu`) VALUES
('1231', 2367, 'Hoa Hồng Nhung', 'siêu nhiều màu ', 123, 'hoa6.jpg', 1, 'hoa hồng '),
('2342', 1213, 'Hoa cúc', '32e', 233, 'hoa2.jpg', 1, '232'),
('45435', 2342, 'Hoa cẩm tú cầu', 'dsad', 3243, 'hoa5.jpg', 1, 'sdsa'),
('32434', 2367, '35345  ', '34534  ', 435, 'take4.jpg', 1, ' ahihi '),
('54645', 46456, '6456', '654', 65, 'anh1.jpg', 1, '565'),
('56756', 2367, '7567 ', '5675 ', 75567, 'take4.jpg', 0, 'dfd '),
('232', 2367, '32432 ', '43 ', 343, 'product.jpg', 1, '345 '),
('111', 7567, 'Hoa Cẩm Tú Cầu', 'đẹp', 343, 'hoa3.png', 1, 'hay');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham1`
--

CREATE TABLE `sanpham1` (
  `masp` varchar(100) NOT NULL,
  `nhom_id` int(11) NOT NULL,
  `tensp` varchar(200) NOT NULL,
  `mota` text DEFAULT NULL,
  `dongiacu` int(11) NOT NULL,
  `dongiamoi` int(11) NOT NULL,
  `img1` varchar(200) NOT NULL,
  `img2` varchar(200) DEFAULT NULL,
  `img3` varchar(200) DEFAULT NULL,
  `img4` varchar(200) DEFAULT NULL,
  `enable` tinyint(4) NOT NULL DEFAULT 1,
  `ghichu` text DEFAULT NULL,
  `diemnoibat` text DEFAULT NULL,
  `dieukienchamsoc` text DEFAULT NULL,
  `cachchamsoc` text DEFAULT NULL,
  `xuatxu` varchar(255) DEFAULT NULL,
  `ngaydang` varchar(50) DEFAULT NULL,
  `kichthuoc` varchar(255) DEFAULT NULL,
  `nguoidang` varchar(50) DEFAULT NULL,
  `giongloai` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham1`
--

INSERT INTO `sanpham1` (`masp`, `nhom_id`, `tensp`, `mota`, `dongiacu`, `dongiamoi`, `img1`, `img2`, `img3`, `img4`, `enable`, `ghichu`, `diemnoibat`, `dieukienchamsoc`, `cachchamsoc`, `xuatxu`, `ngaydang`, `kichthuoc`, `nguoidang`, `giongloai`) VALUES
('34', 123, 'Hoa Cúc Mâm Xôi  ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.  ', 200, 190, 'a1.png', 'a2.png', 'a3.png', 'a1.png', 1, 'Bạn cho giá thể đã xử lý nấm bệnh vào chậu cao cách miệng 5cm. Trồng cây sao cho cây phân bố xung quanh chậu, không trồng cây quá sát thành chậu. Nên trồng cây vào buổi chiều, sau khi tưới nước đẫm cây.  ', 'Về ánh sáng: Hoa cúc tana có đặc tính ưa ánh sáng dịu nhẹ và thời tiết mát mẻ. Cần cho cây vào nơi có mái che khi nắng và nhiệt độ tăng cao.\r\nVề nước tưới: Tưới nước cho cây đầy đủ lúc cây còn nhỏ và đang trong quá trình phát triển. Chỉ tưới nước khi mặt đất có dấu hiệu se khô.\r\n  ', 'Về đất trồng: Đất trồng cần có độ tơi xốp, đủ chất dinh dưỡng và thoát nước tốt.\r\nNhiệt độ: Cây hoa cúc tana ưa thích khí hậu mát mẻ, nên trồng cây ở nơi có thời tiết từ 18-23 độ C.\r\nĐộ ẩm: Cây ưa độ ẩm trung bình.\r\n  ', 'Phân bón: Trong khoảng 10 - 15 ngày thì nên bón phân, bằng cách hòa vào nước và tưới quanh gốc cho cây. Bạn nên sử dụng phân hữu cơ hoặc NPK để bón cho cây.\r\nSâu bệnh: Hoa cúc tana ít bị sâu bệnh, hầu hết bị sâu cuốn lá hoặc nhện đỏ, nấm gốc tấn công. Bạn cần phun thuốc và nhặt cỏ đều đặn để giúp cây phòng tránh sâu bệnh.\r\n  ', 'Quảng Ninh ', '11/22/2011  ', '10cm-30cm  ', 'Vũ Thị Bắc  ', 'hoa Cúc  '),
('454', 123, 'Hoa Cúc Họa Mi   ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.  ', 300, 293, 'c1.png', 'b1.png', 'b6.png', 'c1.png', 1, 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.  ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.  ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.  ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.  ', 'Hà Nam ', '2/2/2022  ', '30 - 40cm  ', 'bắc  ', 'Cúc  '),
('123', 123, 'Hoa Lan Hồ Điệp ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh. ', 400, 390, 'b3.png', 'b4.png', 'b10.png', 'b3.png', 1, 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh. ', 'Hải Dương   ', '1/1/2021 ', '20- 40cm ', 'Thiện ', 'Lan '),
('32', 7567, 'Hoa Hồng Nhung', '.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 329, 280, 'anh3a.jpg', 'anh2a.jpg', 'anh4a.jpg', 'anh8x.jpg', 1, '.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', '.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', '.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', '.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'HCM ', '2/2/2022  ', '30cm- 70cm  ', 'Nguyễn Minh Thiện  ', 'hoa hồng cổ      '),
('23', 123, 'Hoa Sen   ', 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong       ', 300, 288, 'b1.png', 'b8.png', 'b9.png', 'b1.png', 1, '3rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong       ', 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong       ', 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong       ', 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong       ', 'Lâm Đồng       ', '12/12/20023        ', '30cm- 70cm        ', 'Minh       ', 'sen        '),
('1213', 123, 'Hoa Cúc Ngũ Sắc ', 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh ', 212, 189, 'a5.png', 'a6.png', 'b7.png', 'a5.png', 1, 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh ', 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh ', 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh ', 'rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh ', 'tuyên quang ', '21/12/2012 ', '30cm- 70cm ', 'Nghĩa ', 'Cúc '),
('435345', 123, 'Hoa Sen Tuyết  ', '.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.  ', 900, 350, 'a3.png', 'a2.png', 'c2.png', 'a3.png', 1, '	.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.  ', '	.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.  ', '	.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.  ', '	.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.  ', 'bắc Giang  ', '23/9/2020  ', '10- 30 cm   ', 'Nhung  ', 'sen  '),
('4546', 123, 'Hoa Sen Ngũ Sắc ', 'Trong khoảng 10 - 15 ngày thì nên bón phân, bằng cách hòa vào nước và tưới quanh gốc cho cây. Bạn nên sử dụng phân hữu cơ hoặc NPK để bón cho cây.\r\nSâu bệnh: Hoa cúc tana ít bị sâu bệnh, hầu hết bị sâu cuốn lá hoặc nhện đỏ, nấm gốc tấn công. Bạn cần phun thuốc và nhặt cỏ đều đặn để giúp cây phòng tránh sâu bệnh\r\n ', 234, 232, 'c4.png', 'c1.png', 'c7.png', 'c4.png', 1, 'Trong khoảng 10 - 15 ngày thì nên bón phân, bằng cách hòa vào nước và tưới quanh gốc cho cây. Bạn nên sử dụng phân hữu cơ hoặc NPK để bón cho cây.\r\nSâu bệnh: Hoa cúc tana ít bị sâu bệnh, hầu hết bị sâu cuốn lá hoặc nhện đỏ, nấm gốc tấn công. Bạn cần phun thuốc và nhặt cỏ đều đặn để giúp cây phòng tránh sâu bệnh\r\n ', 'Trong khoảng 10 - 15 ngày thì nên bón phân, bằng cách hòa vào nước và tưới quanh gốc cho cây. Bạn nên sử dụng phân hữu cơ hoặc NPK để bón cho cây.\r\nSâu bệnh: Hoa cúc tana ít bị sâu bệnh, hầu hết bị sâu cuốn lá hoặc nhện đỏ, nấm gốc tấn công. Bạn cần phun thuốc và nhặt cỏ đều đặn để giúp cây phòng tránh sâu bệnh\r\n ', 'Trong khoảng 10 - 15 ngày thì nên bón phân, bằng cách hòa vào nước và tưới quanh gốc cho cây. Bạn nên sử dụng phân hữu cơ hoặc NPK để bón cho cây.\r\nSâu bệnh: Hoa cúc tana ít bị sâu bệnh, hầu hết bị sâu cuốn lá hoặc nhện đỏ, nấm gốc tấn công. Bạn cần phun thuốc và nhặt cỏ đều đặn để giúp cây phòng tránh sâu bệnh\r\n ', 'Trong khoảng 10 - 15 ngày thì nên bón phân, bằng cách hòa vào nước và tưới quanh gốc cho cây. Bạn nên sử dụng phân hữu cơ hoặc NPK để bón cho cây.\r\nSâu bệnh: Hoa cúc tana ít bị sâu bệnh, hầu hết bị sâu cuốn lá hoặc nhện đỏ, nấm gốc tấn công. Bạn cần phun thuốc và nhặt cỏ đều đặn để giúp cây phòng tránh sâu bệnh\r\n ', 'Đồng Thấp ', '2/2/2022 ', '30cm- 70cm ', 'tiên ', 'sen '),
('765', 7567, 'Hoa Hồng Leo', ': Hoa cúc tana có đặc tính ưa ánh sáng dịu nhẹ và thời tiết mát mẻ. Cần cho cây vào nơi có mái che khi nắng và nhiệt độ tăng cao.\r\nVề nước tưới: Tưới nước cho cây đầy đủ lúc cây còn nhỏ và đang trong quá trình phát triển. Chỉ tưới nước khi mặt đất có dấu hiệu se khô.\r\n', 123, 121, 'hong5.jpg', 'hong7.jpg', 'hong3.jpg', 'anh9s.jpg', 1, ': Hoa cúc tana có đặc tính ưa ánh sáng dịu nhẹ và thời tiết mát mẻ. Cần cho cây vào nơi có mái che khi nắng và nhiệt độ tăng cao.\r\nVề nước tưới: Tưới nước cho cây đầy đủ lúc cây còn nhỏ và đang trong quá trình phát triển. Chỉ tưới nước khi mặt đất có dấu hiệu se khô.\r\n', ': Hoa cúc tana có đặc tính ưa ánh sáng dịu nhẹ và thời tiết mát mẻ. Cần cho cây vào nơi có mái che khi nắng và nhiệt độ tăng cao.\r\nVề nước tưới: Tưới nước cho cây đầy đủ lúc cây còn nhỏ và đang trong quá trình phát triển. Chỉ tưới nước khi mặt đất có dấu hiệu se khô.\r\n', ': Hoa cúc tana có đặc tính ưa ánh sáng dịu nhẹ và thời tiết mát mẻ. Cần cho cây vào nơi có mái che khi nắng và nhiệt độ tăng cao.\r\nVề nước tưới: Tưới nước cho cây đầy đủ lúc cây còn nhỏ và đang trong quá trình phát triển. Chỉ tưới nước khi mặt đất có dấu hiệu se khô.\r\n', ': Hoa cúc tana có đặc tính ưa ánh sáng dịu nhẹ và thời tiết mát mẻ. Cần cho cây vào nơi có mái che khi nắng và nhiệt độ tăng cao.\r\nVề nước tưới: Tưới nước cho cây đầy đủ lúc cây còn nhỏ và đang trong quá trình phát triển. Chỉ tưới nước khi mặt đất có dấu hiệu se khô.\r\n', 'Tiên Quang', '11/6/2011', '30cm- 70cm', 'Trí', 'Hồng'),
('23242', 7567, 'hoa hồng cổ ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 123, 112, 'hong7.jpg', 'anh8x.jpg', 'anh9s.jpg', 'hong1.jpg', 1, 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'Lai Châu ', '1/2/1022 ', '30cm- 70cm ', 'Linh ', 'hoa hồng '),
('54654', 123, 'Hoa Lan Tứ Quý ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 567, 555, 'b4.png', 'b7.png', 'b10.png', 'b4.png', 1, 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'Hải Dương   ', '12/12/20023 ', '30cm- 70cm ', 'Dương ', 'Hoa Lan '),
('90584', 123, 'Hoa Lan Mộc Liên ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 767, 721, 'c9.png', 'c1.png', 'a2.png', 'c9.png', 1, 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'Hải Dương   ', '2/2/2022 ', '10cm-30cm ', 'hà Phương ', 'Hoa Lan '),
('555652', 7567, 'Hoa Hồng Pháp ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 675, 620, 'hong1.jpg', 'hong2.png', 'hong5.jpg', 'hong3.jpg', 1, 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã. ', 'Phú Thọ ', '23/12/2020 ', '10- 30 cm  ', 'Minh Hà ', 'Hoa Hồng '),
('876483', 7567, 'Hoa Hồng Kinh Đô   ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.   ', 342, 330, 'anh8x.jpg', 'anh1.jpg', 'hong3.jpg', 'hong4.png', 0, 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.   ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.   ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.   ', 'có nguồn gốc từ Hà Lan, tuy không quá rực rỡ, cuốn hút nhưng cúc tana được mọi người yêu thích bởi vẻ đẹp thuần khiết và giản dị. Những bông cúc tana nhỏ xinh khoe sắc như mặt trời bé nhỏ tỏa nắng trong tiết trời se lạnh.Mang mùi hương nhẹ nhàng, thoang thoảng ngọt ngào như mật ong, hoa cúc tana mang hương đồng gió nội thanh mát đến với nơi phố thị đông đúc, chật chội và vội vã.   ', 'Đà Lạt   ', '11/2/2019   ', '30cm- 70cm   ', 'Mẫn   ', 'Hoa Hồng   ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham_nhom`
--

CREATE TABLE `sanpham_nhom` (
  `id` int(11) NOT NULL,
  `tennhom` varchar(100) NOT NULL,
  `ghichu` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham_nhom`
--

INSERT INTO `sanpham_nhom` (`id`, `tennhom`, `ghichu`) VALUES
(123, 'Hoa Cúc', 's'),
(234, 'Hoa Lan', '100 loại'),
(987, 'Hoa Sen', '12'),
(7864, 'hoa cứt lợn', 'thiên nhiên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `tendangnhap` varchar(50) NOT NULL,
  `matkhau` varchar(50) NOT NULL,
  `hoten` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`tendangnhap`, `matkhau`, `hoten`, `email`, `enable`) VALUES
('bac11', '9d03564be9c7bf9450e36f2425a4af4e', 'bac ', 'vuthibac@gmail.com', 1),
('bacxg', '202cb962ac59075b964b07152d234b70', 'Bắc', 'Vurio410@gmail.com', 1),
('bac11', '123', 'Vũ Thị Bắc', 'hung@gmail.com', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
