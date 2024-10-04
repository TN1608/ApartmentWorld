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
    phone_verified BIT DEFAULT 0,
    ngaytao DATETIME DEFAULT GETDATE(),
    diachi nvarchar(250),
    tinhthanh nvarchar(250),
    quanhuyen nvarchar(250),
    phuongxa nvarchar(250)
);
select * from taikhoan
insert into taikhoan values
('admin',N'Nguyễn Đình',N'Tuấn','123','0783955138','AdminDepTrai',0,'08-16-2004','admin.jpg',1),
('khang', N'Bảo', 'Khang', '123', '0865399254','normal dev', 0, '2004-08-30', null, 1);
SELECT * FROM CCCD WHERE tentaikhoan = 'admin';
insert into CCCD values
('079204036245','10-30-2022','TPHCM','anh.jpg','admin','');
create table CCCD(
	maCCCD varchar(12) primary key,
	ngaycap date,
	noicap nvarchar(450),
	anhTruocCCCD varchar(250),
	anhSauCCCD varchar(50),
	ngaysinhCCCD datetime,
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
CREATE TABLE lichsuthanhtoan(
    mathanhtoan INT PRIMARY KEY,
    maHD VARCHAR(20),           -- Mã hợp đồng thuê
    sotien FLOAT,
    ngaythanhtoan DATE,
    hinhthucthanhtoan NVARCHAR(50),
    CONSTRAINT FK_hopdong FOREIGN KEY (maHD) REFERENCES hopdongthue(maHD)
);
