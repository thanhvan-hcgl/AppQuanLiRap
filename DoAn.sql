 -- Drop script --
 alter table CTHDTP
   drop constraint FK_CTH_TP_CTH_TP_HOA__ON_;

alter table CTHDTP
   drop constraint FK_CTH_TP_CTH_TP2_THUC_PHA;

alter table CTPhanQuyen
   drop constraint FK_CT_PHAN__CT_PHAN_Q_PHAN_QUY;

alter table CTPhanQuyen
   drop constraint FK_CT_PHAN__CT_PHAN_Q_TAI_KHOA;

alter table HoaDonThucPham
   drop constraint FK_HOA__ON__LAP_NHAN_VIE;

alter table NhanVien
   drop constraint FK_NHAN_VIE_LA_CHUC_VU;

alter table NhanVien
   drop constraint FK_NHAN_VIE__ANG_NHAP_TAI_KHOA;

alter table TaiKhoan
   drop constraint FK_TAI_KHOA__ANG_NHAP_NHAN_VIE;

alter table Ve
   drop constraint FK_VE_BAN_NHAN_VIE;

alter table Ve
   drop constraint FK_VE_MUA_HOI_VIEN;

alter table Ve
   drop constraint FK_VE_THUOC_SU_KIEN;

alter table Ve
   drop constraint FK_VE_THUOC2_SUAT_CHI;

alter table Ve
   drop constraint FK_VE_THUOC3_PHIM;

drop table ChucVu cascade constraints;

drop index CTH_TP2_FK;

drop index CTH_TP_FK;

drop table CTHDTP cascade constraints;

drop index CT_PHAN_QUYEN2_FK;

drop index CT_PHAN_QUYEN_FK;

drop table CT_PHAN_QUYEN cascade constraints;

drop index LAP_FK;

drop table HoaDonThucPham cascade constraints;

drop table HOI_VIEN cascade constraints;

drop index LA_FK;

drop index _ANG_NHAP_FK;

drop table NHAN_VIEN cascade constraints;

drop table PHAN_QUYEN cascade constraints;

drop table PHIM cascade constraints;

drop table SUAT_CHIEU cascade constraints;

drop table SU_KIEN cascade constraints;

drop index _ANG_NHAP2_FK;

drop table TAI_KHOAN cascade constraints;

drop table THUC_PHAM cascade constraints;

drop index MUA_FK;

drop index THUOC3_FK;

drop index THUOC2_FK;

drop index THUOC_FK;

drop index BAN_FK;

drop table VE cascade constraints;

/*==============================================================*/
/* Table: CHUC_VU                                               */
/*==============================================================*/
create table ChucVu 
(
   MaChucVu           CHAR(4)              not null,
   TenChucVu         NVARCHAR2(50),
   LuongCoBan         NUMBER(8,2),
   constraint PK_ChucVu primary key (MaChucVu)
);

/*==============================================================*/
/* Table: CTH_TP                                                */
/*==============================================================*/
create table CTHDTP 
(
   MaHoaDon           CHAR(4)              not null,
   MaThucPham        CHAR(4)              not null,
   NgayMua            DATE,
   SoLuong             INTEGER,
   constraint PK_CTHDTP primary key (MaHoaDon, MaThucPham)
);

/*==============================================================*/
/* Index: CTH_TP_FK                                             */
/*==============================================================*/
create index CTHDTP_FK on CTHDTP (
   MaHoaDon ASC
);

/*==============================================================*/
/* Index: CTH_TP2_FK                                            */
/*==============================================================*/
create index CTHDTP2_FK on CTHDTP (
   MaThucPham ASC
);

/*==============================================================*/
/* Table: CT_PHAN_QUYEN                                         */
/*==============================================================*/
create table CTPhanQuyen
(
   MaQuyen             CHAR(4)              not null,
   TenDangNhap       NVARCHAR2(50)        not null,
   constraint PK_CTPhanQuyen primary key (MaQuyen, TenDangNhap)
);

/*==============================================================*/
/* Index: CT_PHAN_QUYEN_FK                                      */
/*==============================================================*/
create index CTPhanQuyen_FK on CTPhanQuyen (
   MaQuyen ASC
);

/*==============================================================*/
/* Index: CT_PHAN_QUYEN2_FK                                     */
/*==============================================================*/
create index CTPhanQuyen2_FK on CTPhanQuyen (
   TenDangNhap ASC
);

/*==============================================================*/
/* Table: HOA__ON_THUC_PHAM                                     */
/*==============================================================*/
create table HoaDonThucPham
(
   MaHoaDon           CHAR(4)              not null,
   MaNhanVien         CHAR(4)              not null,
   SoTien             NUMBER(8,2),
   NgayBanVe          DATE,
   constraint PK_HoaDonThucPham primary key (MaHoaDon)
);

/*==============================================================*/
/* Index: LAP_FK                                                */
/*==============================================================*/
create index LAP_FK on HoaDonThucPham (
   MaNhanVien ASC
);

/*==============================================================*/
/* Table: HOI_VIEN                                              */
/*==============================================================*/
create table HoiVien 
(
   MaHoiVien           CHAR(4)              not null,
   HoTen               NVARCHAR2(50),
   GioiTinh            SMALLINT,
   CMND                 NVARCHAR2(15),
   NgaySinh            DATE,
   EMAIL                NVARCHAR2(50),
   DienThoai          NVARCHAR2(15),
   NgayDangKi         DATE,
   DiemTichLuy        INTEGER,
   constraint PK_HoiVien primary key (MaHoiVien)
);

/*==============================================================*/
/* Table: NHAN_VIEN                                             */
/*==============================================================*/
create table NhanVien 
(
   MaNhaVien         CHAR(4)              not null,
   MaChucVu           CHAR(4)              not null,
   TenDangNhap        NVARCHAR2(50)        not null,
   HoTen               NVARCHAR2(50),
   EMAIL                NVARCHAR2(50),
   CMND                 NVARCHAR2(15),
   GioiTinh            SMALLINT,
   NgaySinh            DATE,
   DiaChi              NVARCHAR2(120),
   DienThoai           NVARCHAR2(15),
   NgayVaoLam         DATE,
   TrangThai           SMALLINT,
   constraint PK_NhanVien primary key (MaNhanVien)
);

/*==============================================================*/
/* Index: _ANG_NHAP_FK                                          */
/*==============================================================*/
create index DangNhap_FK on NhanVien (
   TenDangNhap ASC
);

/*==============================================================*/
/* Index: LA_FK                                                 */
/*==============================================================*/
create index LA_FK on NhanVien (
   MaChucVu ASC
);

/*==============================================================*/
/* Table: PHAN_QUYEN                                            */
/*==============================================================*/
create table PhanQuyen 
(
   MaQuyen             CHAR(4)              not null,
   TenQuyen            NVARCHAR2(50),
   constraint PK_PhanQuyen primary key (MaQuyen)
);

/*==============================================================*/
/* Table: PHIM                                                  */
/*==============================================================*/
create table PHIM 
(
   MaPhim              CHAR(4)              not null,
   TenPhim             NVARCHAR2(120),
   ThoiLuong           INTEGER,
   LoaiPhim            NVARCHAR2(50),
   TenNhaSanXuat     NVARCHAR2(120),
   NamSanXuat         INTEGER,
   DienVien           NVARCHAR2(120),
   NgonNgu             NVARCHAR2(50),
   NuocSanXuat        NVARCHAR2(50),
   NgayKhoiChieu      DATE,
   GioiHanTuoi        INTEGER,
   TomTat              NVARCHAR2(120),
   TrangThai           SMALLINT,
   constraint PK_PHIM primary key (MaPhim)
);

/*==============================================================*/
/* Table: SUAT_CHIEU                                            */
/*==============================================================*/
create table SuatChieu 
(
   MaSuatChieu        CHAR(4)              not null,
   TrangThai           SMALLINT,
   PhongChieu          VARCHAR2(50),
   SoLuongVe          INTEGER,
   ThoiGianChieu      DATE,
   constraint PK_SuatChieu primary key (MaSuatChieu)
);

/*==============================================================*/
/* Table: SU_KIEN                                               */
/*==============================================================*/
create table SuKien 
(
   MaSuKien           CHAR(4)              not null,
   TenSuKien          VARCHAR2(50),
   MoTa                VARCHAR2(150),
   constraint PK_SuKien primary key (MaSuKien)
);

/*==============================================================*/
/* Table: TAI_KHOAN                                             */
/*==============================================================*/
create table TaiKhoan 
(
   TenDangNhap       NVARCHAR2(50)        not null,
   MaNhanVien         CHAR(4)              not null,
   MatKhau             NVARCHAR2(20),
   TrangThai           SMALLINT,
   constraint PK_TaiKhoan primary key (TenDangNhap)
);

/*==============================================================*/
/* Index: _ANG_NHAP2_FK                                         */
/*==============================================================*/
create index DangNhap2_FK on TaiKhoan (
   MaNhanVien ASC
);

/*==============================================================*/
/* Table: THUC_PHAM                                             */
/*==============================================================*/
create table ThucPham 
(
   MaThucPham         CHAR(4)              not null,
   TenThucPham        NVARCHAR2(50),
   DonGia             NUMBER(8,2),
   TrangThai           SMALLINT,
   constraint PK_ThucPham primary key (MaThucPham)
);

/*==============================================================*/
/* Table: VE                                                    */
/*==============================================================*/
create table VE 
(
   MaVe                CHAR(4)              not null,
   MaSuatChieu        CHAR(4)              not null,
   MaNhanVien         CHAR(4)              not null,
   MaSuKien          CHAR(4)              not null,
   MaHoiVien          CHAR(4)              not null,
   MaPhim              CHAR(4)              not null,
   NgayBanVe          DATE,
   GiaVe               NUMBER(8,2),
   DiemTichLuy        INTEGER,
   constraint PK_VE primary key (MaVe)
);

/*==============================================================*/
/* Index: BAN_FK                                                */
/*==============================================================*/
create index BAN_FK on VE (
   MaNhanVien ASC
);

/*==============================================================*/
/* Index: THUOC_FK                                              */
/*==============================================================*/
create index THUOC_FK on VE (
   MaSuKien ASC
);

/*==============================================================*/
/* Index: THUOC2_FK                                             */
/*==============================================================*/
create index THUOC2_FK on VE (
   MaSuatChieu ASC
);

/*==============================================================*/
/* Index: THUOC3_FK                                             */
/*==============================================================*/
create index THUOC3_FK on VE (
   MaPhim ASC
);

/*==============================================================*/
/* Index: MUA_FK                                                */
/*==============================================================*/
create index MUA_FK on VE (
   MaHoiVien ASC
);

alter table CTH_TP
   add constraint FK_CTH_TP_CTH_TP_HOA__ON_ foreign key (MA_HOA__ON)
      references HOA__ON_THUC_PHAM (MA_HOA__ON);

alter table CTH_TP
   add constraint FK_CTH_TP_CTH_TP2_THUC_PHA foreign key (MA_THUC_PHAM)
      references THUC_PHAM (MA_THUC_PHAM);

alter table CT_PHAN_QUYEN
   add constraint FK_CT_PHAN__CT_PHAN_Q_PHAN_QUY foreign key (MA_QUYEN)
      references PHAN_QUYEN (MA_QUYEN);

alter table CT_PHAN_QUYEN
   add constraint FK_CT_PHAN__CT_PHAN_Q_TAI_KHOA foreign key (TEN__ANG_NHAP)
      references TAI_KHOAN (TEN__ANG_NHAP);

alter table HOA__ON_THUC_PHAM
   add constraint FK_HOA__ON__LAP_NHAN_VIE foreign key (MA_NHAN_VIEN)
      references NHAN_VIEN (MA_NHAN_VIEN);

alter table NHAN_VIEN
   add constraint FK_NHAN_VIE_LA_CHUC_VU foreign key (MA_CHUC_VU)
      references CHUC_VU (MA_CHUC_VU);

alter table NHAN_VIEN
   add constraint FK_NHAN_VIE__ANG_NHAP_TAI_KHOA foreign key (TEN__ANG_NHAP)
      references TAI_KHOAN (TEN__ANG_NHAP);

alter table TAI_KHOAN
   add constraint FK_TAI_KHOA__ANG_NHAP_NHAN_VIE foreign key (MA_NHAN_VIEN)
      references NHAN_VIEN (MA_NHAN_VIEN);

alter table VE
   add constraint FK_VE_BAN_NHAN_VIE foreign key (MA_NHAN_VIEN)
      references NHAN_VIEN (MA_NHAN_VIEN);

alter table VE
   add constraint FK_VE_MUA_HOI_VIEN foreign key (MA_HOI_VIEN)
      references HOI_VIEN (MA_HOI_VIEN);

alter table VE
   add constraint FK_VE_THUOC_SU_KIEN foreign key (MA_SU_KIEN)
      references SU_KIEN (MA_SU_KIEN);

alter table VE
   add constraint FK_VE_THUOC2_SUAT_CHI foreign key (MA_SUAT_CHIEU)
      references SUAT_CHIEU (MA_SUAT_CHIEU);

alter table VE
   add constraint FK_VE_THUOC3_PHIM foreign key (MA_PHIM)
      references PHIM (MA_PHIM);
