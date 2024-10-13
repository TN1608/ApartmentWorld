create database ApartmentWorld
use ApartmentWorld
create table taikhoan
(
    tentaikhoan    varchar(150) not null
        primary key,
    firstname      nvarchar(100),
    lastname       nvarchar(100),
    matkhau        varchar(200) not null,
    sodienthoai    varchar(15),
    mota           nvarchar(200),
    gioitinh       bit,
    ngaysinh       date,
    anhtaikhoan    varchar(200),
    vaitro         bit,
    email          nvarchar(150),
    email_verified bit      default 0,
    phone_verified bit      default 0,
    ngaytao        datetime default getdate(),
    status         varchar(50),
    seller         varchar(50)
)
    go

create table CCCD
(
    maCCCD       varchar(12) not null
        primary key,
    tenCCCD      nvarchar(250),
    ngaysinh     date,
    anhTruocCCCD varchar(250),
    anhSauCCCD   varchar(250),
    ngaycap      date,
    noicap       nvarchar(450),
    tentaikhoan  varchar(150)
        constraint FK_user
            references taikhoan,
    ngaythem     date
)
    go

create table notification
(
    id          bigint identity
        primary key,
    message     nvarchar(255),
    is_read     bit,
    createAt    datetime2,
    tentaikhoan varchar(150)
        references taikhoan
)
    go

create table phongtro
(
    maphong     varchar(20)    not null
        primary key,
    tenphong    nvarchar(200)  not null,
    diachi      nvarchar(250)  not null,
    anh         nvarchar(500),
    giaphong    float          not null,
    mota        nvarchar(2000) not null,
    tinhtrang   nvarchar(150),
    tentaikhoan varchar(150)   not null
        constraint FK_taikhoan
            references taikhoan,
    trangthai   nvarchar(150),
    ngaytao     datetime,
    dientich    nvarchar(100),
    tiencoc     float
)
    go

create table chitietphongtro
(
    maCT           varchar(20) not null
        primary key,
    anhchitiet     varchar(150),
    noidungchitiet nvarchar(500),
    maphong        varchar(20)
        constraint FK_phongtro
            references phongtro
)
    go

create table danhgia
(
    madanhgia   int not null
        primary key,
    tentaikhoan varchar(150)
        constraint FK_taikhoan_danhgia
            references taikhoan,
    maphong     varchar(20)
        constraint FK_phong_danhgia
            references phongtro,
    noidung     nvarchar(500),
    sosao       int,
    ngaydanhgia date
)
    go

create table hopdongthue
(
    maHD        varchar(20) not null
        primary key,
    tentaikhoan varchar(150)
        constraint FK_taikhoan_thue
            references taikhoan,
    maphong     varchar(20)
        constraint FK_phong
            references phongtro,
    ngaybatdau  date,
    ngayketthuc date
)
    go

create table lichsuthanhtoan
(
    mathanhtoan       int not null
        primary key,
    maHD              varchar(20)
        constraint FK_hopdong
            references hopdongthue,
    sotien            float,
    ngaythanhtoan     date,
    hinhthucthanhtoan nvarchar(50)
)
    go