-- Mục đích: Nộp bài tập Database - Thiết kế cơ sở dữ liệu cho db QLBanSach
-- Người tạo: Java20 - Nguyễn Anh Tú
-- Ngày tạo: 2022/12/12
-- Version: 1.00

CREATE DATABASE db_QLBanSach;
USE db_QLBanSach;

CREATE TABLE KhachHang(
	MaKH INT PRIMARY KEY AUTO_INCREMENT,
    TaiKhoan VARCHAR(30) NOT NULL UNIQUE,
    MatKhau VARCHAR(30) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    HoTen VARCHAR(30),
    DiaChi VARCHAR(50),
    DienThoai VARCHAR(20) UNIQUE,
    GioiTinh BOOLEAN,
    NgaySinh DATE
);

CREATE TABLE DonHang(
	MaDonHang INT PRIMARY KEY AUTO_INCREMENT,
    NgayDat DATE NOT NULL,
    DaThanhToan BOOLEAN NOT NULL,
    NgayGiao DATE,
    TinhTrangGH BOOLEAN,
    MaKH INT,
    CONSTRAINT NguoiDatHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);

CREATE TABLE ChuDe(
	MaChuDe INT PRIMARY KEY AUTO_INCREMENT,
    TenChuDe VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE NhaSanXuat(
	MaNSX INT PRIMARY KEY AUTO_INCREMENT,
    TenNSB VARCHAR(30) NOT NULL UNIQUE,
    DiaChi VARCHAR(50),
    DienThoai VARCHAR(20) UNIQUE
);

CREATE TABLE TacGia(
	MaTacGia INT PRIMARY KEY AUTO_INCREMENT,
    TenTacGia VARCHAR(30) NOT NULL UNIQUE,
    DiaChi VARCHAR(50),
    TieuSu VARCHAR(200),
    DienThoai VARCHAR(20) UNIQUE
);

CREATE TABLE Sach(
	MaSach INT PRIMARY KEY AUTO_INCREMENT,
    TenSach VARCHAR(50) NOT NULL UNIQUE,
    GiaBan INT NOT NULL,
    MoTa VARCHAR(200),
    AnhBia VARCHAR(255),
    NgayCapNhap DATE,
    SoLuongTon INT,
    MaChuDe INT,
    CONSTRAINT ChuDeSach FOREIGN KEY (MaChuDe) REFERENCES ChuDe(MaChuDe),
    MaNSX INT,
    CONSTRAINT NhaXuatBan FOREIGN KEY (MaNSX) REFERENCES NhaSanXuat(MaNSX)
);

CREATE TABLE HoaDon (
    MaDonHang INT,
    CONSTRAINT ThongTinDonHang FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang),
    MaSach INT,
    CONSTRAINT HD_ThongTinSach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
    PRIMARY KEY (MaDonHang,MaSach),
    DonGia INT NOT NULL,
    SoLuong INT NOT NULL
);

CREATE TABLE BienSoanSach (
	MaTacGia INT,
    CONSTRAINT NguoiBienSoan FOREIGN KEY (MaTacGia) REFERENCES TacGia(MaTacGia),
    MaSach INT,
    CONSTRAINT BSS_ThongTinSach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach),
    PRIMARY KEY (MaTacGia,MaSach),
    VaiTro VARCHAR(20) NOT NULL,
    ViTri VARCHAR(20) NOT NULL
);





