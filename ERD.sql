create database ApartmentWorld
use ApartmentWorld

create table taikhoan(
	tentaikhoan varchar(150) primary key,
	firstname nvarchar(100),
	lastname nvarchar(100),
	matkhau varchar(200) not null,
	sodienthoai varchar(15),
	mota nvarchar(200),
	gioitinh bit,
	ngaysinh date,
	anhtaikhoan varchar(200),
	vaitro bit,
	email nvarchar(150),
	email_verified BIT DEFAULT 0,        
    phone_verified BIT DEFAULT 0
);
select * from taikhoan
insert into taikhoan values
('admin',N'Nguyễn Đình',N'Tuấn','123','0783955138','AdminDepTrai',0,'08-16-2004','admin.jpg',1),
('khang', N'Bảo', 'Khang', '123', '0865399254','normal dev', 0, '2004-08-30', null, 1);

insert into CCCD values
('079204036245',N'Nguyễn Đình Tuấn','2004-08-16','anhTruoc.jpg','anhSau.jpg','2022-10-30',N'TPHCM','admin');
select * from CCCD
create table CCCD(
	maCCCD varchar(12) primary key,
	tenCCCD nvarchar(250),
	ngaysinh date,
	anhTruocCCCD varchar(250),
	anhSauCCCD varchar(250),
	ngaycap date,
	noicap nvarchar(450),
	tentaikhoan varchar(150),
	constraint FK_user foreign key (tentaikhoan) references taikhoan(tentaikhoan)
);
create table tinhtrang(
	matinhtrang varchar(20) primary key,
	loaitinhtrang varchar(100) -- ví dụ : 'Nội thất cao cấp', 'Nội thất đầy đủ', 'Nhà trống'
);
CREATE TABLE trangthaisudung(
    matrangthai VARCHAR(20) PRIMARY KEY,
    trangthai NVARCHAR(100)  -- Ví dụ: 'Còn trống', 'Đã thuê', 'Đang bảo trì'
);

create table phongtro(
	maphong varchar(20) primary key,
	tenphong nvarchar(200) not null,
	diachi nvarchar(250) not null,
	anh nvarchar(100) not null,
	giaphong float not null,
	mota nvarchar(2000) not null,
	matinhtrang varchar(20) not null,
	tentaikhoan varchar(150) not null,
	matrangthai varchar(20) not null,
    CONSTRAINT FK_taikhoan FOREIGN KEY (tentaikhoan) REFERENCES taikhoan(tentaikhoan),
    CONSTRAINT FK_tinhtrang FOREIGN KEY (matinhtrang) REFERENCES tinhtrang(matinhtrang),
    CONSTRAINT FK_trangthai FOREIGN KEY (matrangthai) REFERENCES trangthaisudung(matrangthai),
);
create table chitietphongtro(
	maCT varchar(20) primary key,
	anhchitiet varchar(150),
	noidungchitiet nvarchar(500),
	maphong varchar(20)
	CONSTRAINT FK_phongtro FOREIGN KEY (maphong) REFERENCES phongtro(maphong)
);	

CREATE TABLE danhgia(
    madanhgia INT PRIMARY KEY,
    tentaikhoan varchar(150),    -- Tài khoản người đánh giá
    maphong VARCHAR(20),       -- Phòng được đánh giá
    noidung NVARCHAR(500),
    sosao INT,                 -- Số sao đánh giá (1-5)
    ngaydanhgia DATE,
    CONSTRAINT FK_taikhoan_danhgia FOREIGN KEY (tentaikhoan) REFERENCES taikhoan(tentaikhoan),
    CONSTRAINT FK_phong_danhgia FOREIGN KEY (maphong) REFERENCES phongtro(maphong)
);
CREATE TABLE hopdongthue(
    maHD VARCHAR(20) PRIMARY KEY,
	tentaikhoan varchar(150),  -- Tài khoản người thuê
    maphong VARCHAR(20),         -- Mã phòng trọ
    ngaybatdau DATE,
    ngayketthuc DATE,
    CONSTRAINT FK_taikhoan_thue FOREIGN KEY (tentaikhoan) REFERENCES taikhoan(tentaikhoan),
    CONSTRAINT FK_phong FOREIGN KEY (maphong) REFERENCES phongtro(maphong)
);
select * from lichsuthanhtoan join hopdongthue on lichsuthanhtoan.maHD = hopdongthue.maHD where tentaikhoan = 'admin'

CREATE TABLE lichsuthanhtoan(
    mathanhtoan INT PRIMARY KEY,
    maHD VARCHAR(20),           -- Mã hợp đồng thuê
    sotien FLOAT,
    ngaythanhtoan DATE,
    hinhthucthanhtoan NVARCHAR(50),
    CONSTRAINT FK_hopdong FOREIGN KEY (maHD) REFERENCES hopdongthue(maHD)
);
--Insert data tinhtrang
INSERT INTO tinhtrang (matinhtrang, loaitinhtrang) VALUES
('TT01', N'Nội thất cao cấp'),
('TT02', N'Nội thất đầy đủ'),
('TT03', N'Nhà trống');
--Insert data trangthaisudung
INSERT INTO trangthaisudung (matrangthai, trangthai) VALUES
('TS01', N'Còn trống'),
('TS02', N'Đã thuê'),
('TS03', N'Đang bảo trì');
--Insert data phongtro
INSERT INTO phongtro (maphong, tenphong, diachi, anh, giaphong, mota, matinhtrang, tentaikhoan, matrangthai) VALUES
('P001', N'Phòng 1', N'123 Đường A, Quận 1', 'phong1.jpg', 3000000, N'Phòng rộng, có nội thất cao cấp', 'TT01', 'admin', 'TS01'),
('P002', N'Phòng 2', N'456 Đường B, Quận 3', 'phong2.jpg', 2500000, N'Phòng thoáng, nội thất đầy đủ', 'TT02', 'khang', 'TS02'),
('P003', N'Phòng 3', N'789 Đường C, Quận 5', 'phong3.jpg', 2000000, N'Phòng nhỏ, nhà trống', 'TT03', 'khang', 'TS01'),
('P004', N'Phòng 4', N'12 Đường D, Quận 2', 'phong4.jpg', 3500000, N'Phòng mới xây, nội thất cao cấp', 'TT01', 'admin', 'TS03'),
('P005', N'Phòng 5', N'34 Đường E, Quận 7', 'phong5.jpg', 2800000, N'Phòng tiện nghi, đầy đủ nội thất', 'TT02', 'khang', 'TS01'),
('P006', N'Phòng 6', N'56 Đường F, Quận 9', 'phong6.jpg', 1500000, N'Phòng nhỏ, nhà trống', 'TT03', 'admin', 'TS02'),
('P007', N'Phòng 7', N'78 Đường G, Quận 10', 'phong7.jpg', 3200000, N'Phòng thoáng mát, nội thất cao cấp', 'TT01', 'khang', 'TS01'),
('P008', N'Phòng 8', N'90 Đường H, Quận 4', 'phong8.jpg', 2900000, N'Phòng đầy đủ nội thất', 'TT02', 'admin', 'TS03'),
('P009', N'Phòng 9', N'102 Đường I, Quận Bình Thạnh', 'phong9.jpg', 1800000, N'Phòng nhỏ, nhà trống', 'TT03', 'khang', 'TS01'),
('P010', N'Phòng 10', N'114 Đường J, Quận Phú Nhuận', 'phong10.jpg', 4000000, N'Phòng cao cấp, nội thất hiện đại', 'TT01', 'admin', 'TS02'),
('P011', N'Phòng 11', N'126 Đường K, Quận 8', 'phong11.jpg', 2500000, N'Phòng tiện nghi, đầy đủ nội thất', 'TT02', 'khang', 'TS01'),
('P012', N'Phòng 12', N'138 Đường L, Quận 6', 'phong12.jpg', 2200000, N'Phòng nhỏ, nhà trống', 'TT03', 'admin', 'TS02'),
('P013', N'Phòng 13', N'150 Đường M, Quận 11', 'phong13.jpg', 3500000, N'Phòng cao cấp, nội thất đầy đủ', 'TT02', 'khang', 'TS03'),
('P014', N'Phòng 14', N'162 Đường N, Quận Thủ Đức', 'phong14.jpg', 3200000, N'Phòng rộng rãi, nội thất cao cấp', 'TT01', 'admin', 'TS01'),
('P015', N'Phòng 15', N'174 Đường O, Quận Tân Bình', 'phong15.jpg', 2000000, N'Phòng nhỏ, nhà trống', 'TT03', 'khang', 'TS02'),
('P016', N'Phòng 16', N'186 Đường P, Quận Gò Vấp', 'phong16.jpg', 3000000, N'Phòng đầy đủ nội thất', 'TT02', 'admin', 'TS03'),
('P017', N'Phòng 17', N'198 Đường Q, Quận 12', 'phong17.jpg', 2500000, N'Phòng tiện nghi, nhà trống', 'TT03', 'khang', 'TS01'),
('P018', N'Phòng 18', N'210 Đường R, Quận 7', 'phong18.jpg', 4000000, N'Phòng cao cấp, nội thất hiện đại', 'TT01', 'admin', 'TS01'),
('P019', N'Phòng 19', N'222 Đường S, Quận Bình Tân', 'phong19.jpg', 2900000, N'Phòng tiện nghi, đầy đủ nội thất', 'TT02', 'khang', 'TS02'),
('P020', N'Phòng 20', N'234 Đường T, Quận 5', 'phong20.jpg', 1800000, N'Phòng nhỏ, nhà trống', 'TT03', 'admin', 'TS03');
--Insert Data chitietphongtro
INSERT INTO chitietphongtro (maCT, anhchitiet, noidungchitiet, maphong) VALUES
('CT001', 'ct_phong1_1.jpg', N'Phòng có view đẹp, cửa sổ lớn.', 'P001'),
('CT002', 'ct_phong2_1.jpg', N'Nội thất đầy đủ với giường và tủ quần áo.', 'P002'),
('CT003', 'ct_phong3_1.jpg', N'Nhà trống, có thể thiết kế theo ý muốn.', 'P003'),
('CT004', 'ct_phong4_1.jpg', N'Phòng mới xây, nội thất hiện đại.', 'P004'),
('CT005', 'ct_phong5_1.jpg', N'Phòng tiện nghi, gần trung tâm.', 'P005'),
('CT006', 'ct_phong6_1.jpg', N'Nhà trống, không có nội thất.', 'P006'),
('CT007', 'ct_phong7_1.jpg', N'Phòng thoáng mát, nội thất đầy đủ.', 'P007'),
('CT008', 'ct_phong8_1.jpg', N'Nội thất hiện đại với bàn làm việc.', 'P008'),
('CT009', 'ct_phong9_1.jpg', N'Nhà trống, có thể sử dụng làm văn phòng.', 'P009'),
('CT010', 'ct_phong10_1.jpg', N'Phòng cao cấp với sofa và giường lớn.', 'P010'),
('CT011', 'ct_phong11_1.jpg', N'Nội thất đầy đủ, có điều hòa và tivi.', 'P011'),
('CT012', 'ct_phong12_1.jpg', N'Nhà trống, có thể trang trí theo ý thích.', 'P012'),
('CT013', 'ct_phong13_1.jpg', N'Phòng có nội thất đầy đủ, gần siêu thị.', 'P013'),
('CT014', 'ct_phong14_1.jpg', N'Phòng cao cấp, nội thất hiện đại.', 'P014'),
('CT015', 'ct_phong15_1.jpg', N'Nhà trống, không có nội thất.', 'P015'),
('CT016', 'ct_phong16_1.jpg', N'Nội thất đầy đủ, giường và tủ quần áo.', 'P016'),
('CT017', 'ct_phong17_1.jpg', N'Phòng tiện nghi, gần công viên.', 'P017'),
('CT018', 'ct_phong18_1.jpg', N'Nội thất hiện đại với bàn ăn.', 'P018'),
('CT019', 'ct_phong19_1.jpg', N'Phòng tiện nghi, gần trung tâm mua sắm.', 'P019'),
('CT020', 'ct_phong20_1.jpg', N'Nhà trống, thích hợp để làm văn phòng.', 'P020');

-- Insert mẫu vào bảng hopdongthue
INSERT INTO hopdongthue (maHD, tentaikhoan, maphong, ngaybatdau, ngayketthuc) VALUES
('HD001', 'khang', 'P001', '2023-01-01', '2023-12-31'),
('HD002', 'admin', 'P002', '2023-02-15', '2024-02-14'),
('HD003', 'khang', 'P003', '2023-03-01', '2024-03-01');

-- Insert mẫu vào bảng lichsuthanhtoan
INSERT INTO lichsuthanhtoan (mathanhtoan, maHD, sotien, ngaythanhtoan, hinhthucthanhtoan) VALUES
(1, 'HD001', 3000000, '2023-01-10', N'Chuyển khoản'),
(2, 'HD002', 3500000, '2023-02-20', N'Tiền mặt'),
(3, 'HD003', 4000000, '2023-03-05', N'Chuyển khoản');

-- Insert mẫu vào bảng danhgia
INSERT INTO danhgia (madanhgia, tentaikhoan, maphong, noidung, sosao, ngaydanhgia) VALUES
(1, 'khang', 'P001', N'Phòng sạch sẽ, rộng rãi, chủ nhà thân thiện.', 5, '2023-02-01'),
(2, 'admin', 'P002', N'Phòng hơi nhỏ, nhưng nội thất tốt.', 4, '2023-03-10'),
(3, 'khang', 'P003', N'Vị trí thuận tiện nhưng giá hơi cao.', 3, '2023-04-05');