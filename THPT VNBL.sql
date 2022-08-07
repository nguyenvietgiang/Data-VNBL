create database THPT_VNBL
use THPT_VNBL;
GO

Create table tblMon
(
   sMaMon nvarchar(10) primary key,
   sTenMon nvarchar(30) not null,
   iSoTiet int not null,
);
select sTenMon from tblMon where tblMon.sMaMon=N'NV10'
Create table tblGV
(
   sSoCCCD int primary key,
   sMaMon nvarchar(10),
   sHoTenGV  nvarchar(30) not null,
   sDiachi  nvarchar(30) not null,
   sGioiTinh nvarchar(5) not null,
   sChucvu nvarchar(30) not null,
   dNgaysinh date,
   CONSTRAINT FK_tblMon_tblGV FOREIGN KEY (sMaMon) REFERENCES tblMon(sMaMon),
);
Create table tblLop
(
   sMaLop nvarchar(10) primary key,
   sSoCCCD int,
   sTenLop nvarchar(30) not null,
   iSoHS int not null,
   CONSTRAINT FK_tblGV_tblLop FOREIGN KEY (sSoCCCD) REFERENCES tblGV(sSoCCCD),
);
Create table tblHK
(
   sMaHK nvarchar(10) primary key,
   sSoCCCD int,
   sLoaiHK nvarchar(30) not null,
   iHocKy int not null,
   iNamHoc int not null,
   CONSTRAINT FK_tblGV_tblHK FOREIGN KEY (sSoCCCD) REFERENCES tblGV(sSoCCCD),
);
Create table tblHS
(
  sMaHS nvarchar(10) primary key,
  sMaLop nvarchar(10),
  sMaHK nvarchar(10),
  sHoTenHS nvarchar(30) not null,
  dNgaysinhHS date,
  bUuTien bit not null,
  sGioiTinh nvarchar(5) not null,
  sDiaChi nvarchar(30) not null,
  sDanToc nvarchar(10) not null,
  CONSTRAINT FK_tblLop_tblHS FOREIGN KEY (sMaLop) REFERENCES tblLop(sMaLop),
  CONSTRAINT FK_tblHK_tblHS FOREIGN KEY (sMaHK) REFERENCES tblHK(sMaHK),
);
Create table tblDiem
(
   sMaMon nvarchar(10),
   sMaHS nvarchar(10),
   fDiemTX1 float not null,
   fDiemTX2 float not null,
   fDiemCK float not null,
   fDiemGK float not null,
   iNamHoc int not null,
   iHocKy  int not null,
);
Alter table tblDiem ADD CONSTRAINT FK_tblMon_tblDiem FOREIGN KEY (sMaMon) REFERENCES tblMon(sMaMon)
Alter table tblDiem ADD CONSTRAINT FK_tblHS_tblDiem FOREIGN KEY (sMaHS) REFERENCES tblHS(sMaHS)

Create table tblTK
(
 sMaTK  nvarchar(10)primary key, 
 sTenTK nvarchar(20) not null,
 sMatKhau nvarchar(20) not null,
 sQuyen nvarchar(5) not null,
)
select * from tblGV
insert into tblMon VALUES(N'TO10',N'Toán Lớp 10',45);
insert into tblMon VALUES(N'TO11',N'Toán Lớp 11',45);
insert into tblMon VALUES(N'TO12',N'Toán Lớp 12',45);
insert into tblMon VALUES(N'NV10',N'Ngữ Văn Lớp 10',45);
insert into tblMon VALUES(N'NV11',N'Ngữ Văn lớp 11',45);
insert into tblMon VALUES(N'TA12',N'Tiếng Anh lớp 11',40);
insert into tblMon VALUES(N'LS11',N'Lịch Sử lớp 11',30);
insert into tblGV VALUES(362011, N'TA12',N'Nguyễn Thùy Lan',N'Cầu Giấy',N'Nữ',N'Chủ nhiệm 12B','1988-11-05');
insert into tblGV VALUES(122811, N'TO11',N'Trần Trung Đức',N'Hai Bà Trưng',N'Nam',N'Giáo viên','1996-12-04');
insert into tblGV VALUES(777511, N'NV11',N'Lê Thị Liên',N'Hoàn Mai',N'Nữ',N'11A','1990-02-09');
insert into tblGV VALUES(609230, N'NV10',N'Nguyen Viet Giang',N'Hoàn Mai',N'Nam',N'10A','1999-04-10');
insert into tblGV VALUES(728236, N'LS11',N'Cao Anh Tu',N'Mai Động',N'Nam',N'11C','1998-04-10');
delete from tblGV where tblGV.sSoCCCD=362011
insert into tblLop VALUES(N'12B',362011,N'Lớp chuyên Anh 12B',40);
insert into tblLop VALUES(N'11A',777511,N'Lớp chuyên Văn 11A',35);
insert into tblLop VALUES(N'10A',609230,N'Lớp chuyên Văn 10A',35);
insert into tblHK VALUES(N'HK11A11',777511,N'Tốt',2,2021);
insert into tblHK VALUES(N'HK12B02',362011,N'Khá',1,2021);
insert into tblHK VALUES(N'HK12B35',362011,N'Tốt',2,2021);
insert into tblHK VALUES(N'HK10A35',609230,N'Tốt',2,2021);
insert into tblHS VALUES(N'HS12B02',N'12B',N'HK12B35',N'Trần Kim Ngân','2005-07-11',1,N'Nữ',N'Hoàng Mai','Kinh');
insert into tblHS VALUES(N'HS12B35',N'12B',N'HK12B02',N'Ngô Quang Toản','2005-10-11',1,N'Nam',N'Hoàng Mai','Kinh');
insert into tblHS VALUES(N'HS10A35',N'10A',N'HK10A35',N'Phan Huy Nam','2005-10-11',1,N'Nam',N'Hoàng Mai','Kinh');
insert into tblTK VaLUES(N'122811',N'Trần Trung Đức','1111',N'GV');
insert into tblTK VaLUES(N'HS01',N'NgoQuangToan','1111',N'HS');
insert into tblTK VaLUES(N'362011',N'Nguyen Thuy Lan','1111',N'GV');
insert into tblTK VaLUES(N'609230',N'Nguyen Viet Giang','1111',N'GV');
insert into tblTK VaLUES(N'728236',N'Cao Anh Tu','1111',N'GV');
insert into tblDiem VaLues(N'TO10',N'HS10A35',7,7.5,7,7,2022,2);
insert into tblDiem VaLues(N'NV10',N'HS10A35',9,8,7,8,2022,2); 
SELECT sMaTK FROM tblTK WHERE tblTK.sTenTK =N'Nguyễn Thùy Lan'
select* from tblTK where tblTK.sMaTK='362011'
delete from tblTK where tblTK.sMaTK='362011'
select * from tblTK
select * from tblTK where tblTK.sTenTK='TranKimNgan'and tblTK.sMatKhau ='1111'and tblTK.sQuyen='GV'
/*học sinh*/
CREATE PROCEDURE spHocsinh_GET
AS
BEGIN
SET NOCOUNT ON;
SELECT * FROM tblHS
END
GO
EXEC spHocsinh_GET

create PROCEDURE spHocsinh_INSERT
	@sMaHS nvarchar(10),
    @sMaLop nvarchar(10),
    @sMaHK nvarchar(10),
    @sHoTenHS nvarchar(30) ,
    @dNgaysinhHS date ,
    @bUuTien bit ,
    @sGioiTinh nvarchar(5) ,
    @sDiaChi nvarchar(30) ,
    @sDanToc nvarchar(10)
AS
	INSERT [tblHS] ([sMaHS], [sMaLop], [sMaHK], [sHoTenHS], [dNgaysinhHS], [bUuTien], [sGioiTinh], [sDiaChi], [sDanToc] )
	VALUES (@sMaHS,
			@sMaLop,
			@sMaHK, 
			@sHoTenHS, 
			@dNgaysinhHS, 
			@bUuTien,
			@sGioiTinh,
			@sDiaChi,
			@sDanToc)
	SET @sMaHS= @@IDENTITY
	GO
/*Giao Vien*/
CREATE proc GV_Update
   @sSoCCCD int,
   @sMaMon nvarchar(10),
   @sHoTenGV  nvarchar(30),
   @sDiachi  nvarchar(30),
   @sGioiTinh nvarchar(5),
   @sChucvu nvarchar(30),
   @dNgaysinh date
as
update tblGV
   set
    sMaMon = case when @sMaMon is null or @sMaMon = '' then sMaMon
   else @sMaMon end,
    sHoTenGV = case when @sHoTenGV is null or @sHoTenGV = '' then sHoTenGV
   else @sHoTenGV end,
    sDiachi = case when @sDiachi is null or @sDiachi = '' then sDiachi
   else @sDiachi end,
   sGioiTinh = case when @sGioiTinh is null or @sGioiTinh = '' then sGioiTinh
   else @sGioiTinh end,
    sChucvu = case when @sChucvu is null or @sChucvu = '' then sChucvu
   else @sChucvu end,
   dNgaysinh = case when @dNgaysinh is null or @dNgaysinh = '' then dNgaysinh
   else @dNgaysinh end
Where sSoCCCD = @sSoCCCD
GO
SELECT * from tblHS WHERE tblHS.sMaLop ='10a'
