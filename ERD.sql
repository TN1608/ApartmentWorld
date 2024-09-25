create database ApartmentWorld
use ApartmentWorld

create table taikhoan(
	manguoidung varchar(20) primary key,
	tennguoidung nvarchar(200) not null,
	matkhau varchar(200) not null,
	sodienthoai varchar(15),
	mota nvarchar(200),
	gioitinh bit,
	ngaysinh date,
	anhtaikhoan varchar(200),
	vaitro bit,
	maCCCD varchar(12)
	CONSTRAINT FK_CCCD FOREIGN KEY (maCCCD) REFERENCES CCCD(maCCCD)
);
create table CCCD(
	maCCCD varchar(12) primary key,
	ngaycap date,
	noicap nvarchar(450),
	anhCCCD varchar(250)
);
create table phongtro(
	maphong varchar(20) primary key,
	title nvarchar(200) not null,
	diachi nvarchar(250) not null,
	anh nvarchar(100) not null,
	giaphong float not null,
	mota nvarchar(2000) not null,
	matinhtrang varchar(20) not null,
	mataikhoan varchar(20) not null,
	matrangthai varchar(20) not null,
    CONSTRAINT FK_taikhoan FOREIGN KEY (mataikhoan) REFERENCES taikhoan(manguoidung),
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
create table tinhtrang(
	matinhtrang varchar(20) primary key,
	loaitinhtrang varchar(100) -- ví dụ : 'Nội thất cao cấp', 'Nội thất đầy đủ', 'Nhà trống'
);
CREATE TABLE trangthaisudung(
    matrangthai VARCHAR(20) PRIMARY KEY,
    trangthai NVARCHAR(100)  -- Ví dụ: 'Còn trống', 'Đã thuê', 'Đang bảo trì'
);
CREATE TABLE danhgia(
    madanhgia INT PRIMARY KEY,
    mataikhoan VARCHAR(20),    -- Tài khoản người đánh giá
    maphong VARCHAR(20),       -- Phòng được đánh giá
    noidung NVARCHAR(500),
    sosao INT,                 -- Số sao đánh giá (1-5)
    ngaydanhgia DATE,
    CONSTRAINT FK_taikhoan_danhgia FOREIGN KEY (mataikhoan) REFERENCES taikhoan(manguoidung),
    CONSTRAINT FK_phong_danhgia FOREIGN KEY (maphong) REFERENCES phongtro(maphong)
);
CREATE TABLE hopdongthue(
    maHD VARCHAR(20) PRIMARY KEY,
    mataikhoanthue VARCHAR(20),  -- Tài khoản người thuê
    maphong VARCHAR(20),         -- Mã phòng trọ
    ngaybatdau DATE,
    ngayketthuc DATE,
    CONSTRAINT FK_taikhoan_thue FOREIGN KEY (mataikhoanthue) REFERENCES taikhoan(manguoidung),
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
