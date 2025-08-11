use [QLDASV];

CREATE TABLE TruSo (
    ID_TruSo nvarchar(20) NOT NULL PRIMARY KEY,
    TenTruSo nvarchar(255),
    DiaChi nvarchar(255)
);

CREATE TABLE Khoa (
    ID_Khoa VARCHAR(20) NOT NULL PRIMARY KEY,
    TenKhoa NVARCHAR(255) NOT NULL,
    ID_TruSo NVARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_TruSo) REFERENCES TruSo(ID_TruSo)
);

CREATE TABLE SinhVien (
    ID_SinhVien NVARCHAR(255) NOT NULL PRIMARY KEY,
    TenSinhVien NVARCHAR(255),
    NamNhapHoc DATETIME,
    Email NVARCHAR(255),
    NgaySinh DATETIME,
    ID_DoAn VARCHAR(20) NOT NULL,
    ID_Khoa VARCHAR(20) NOT NULL,
    CONSTRAINT FK_SinhVien_DoAn FOREIGN KEY (ID_DoAn) REFERENCES DoAn(ID_DoAn),
    CONSTRAINT FK_SinhVien_Khoa FOREIGN KEY (ID_Khoa) REFERENCES Khoa(ID_Khoa)
);


CREATE TABLE GiangVien (
    ID_GiangVien VARCHAR(255) NOT NULL PRIMARY KEY,
    TenGiangVien NVARCHAR(255),
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(255),
    BangCap NVARCHAR(255),
    ID_Khoa VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Khoa) REFERENCES Khoa(ID_Khoa)
);

CREATE TABLE HoiDong (
    ID_HoiDong VARCHAR(255) NOT NULL PRIMARY KEY,
    NamHoc VARCHAR(255) NOT NULL,
    KyHoc VARCHAR(255) NOT NULL,
    ID_Khoa VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Khoa) REFERENCES Khoa(ID_Khoa)
);

CREATE TABLE ThanhVienHoiDong (
    ID_TVHD VARCHAR(255) NOT NULL,
    ID_HoiDong VARCHAR(255) NOT NULL, 
    ID_GiangVien VARCHAR(255) NOT NULL,
    VaiTro NVARCHAR(255) NOT NULL,
    CONSTRAINT PK_ThanhVienHoiDong PRIMARY KEY (ID_TVHD),
    CONSTRAINT FK_ThanhVienHoiDong_HoiDong FOREIGN KEY (ID_HoiDong) REFERENCES HoiDong(ID_HoiDong),
    CONSTRAINT FK_ThanhVienHoiDong_GiangVien FOREIGN KEY (ID_GiangVien) REFERENCES GiangVien(ID_GiangVien)
);

CREATE TABLE DoAn (
    ID_DoAn VARCHAR(20) NOT NULL PRIMARY KEY,
    ChuDe NVARCHAR(255), 
    Diem FLOAT,
    ThoiGianCham DATETIME,
    ID_HoiDong VARCHAR(255) NOT NULL, 
    ID_GiangVien VARCHAR(255) NOT NULL, 

    FOREIGN KEY (ID_HoiDong) REFERENCES HoiDong(ID_HoiDong),
   FOREIGN KEY (ID_GiangVien) REFERENCES GiangVien(ID_GiangVien)
);

SELECT TOP (1000) [ID_TruSo],
                 [TenTruSo],
                 [DiaChi]
FROM [QLDASV].[dbo].[TruSo];


SELECT * FROM DoAn;









INSERT INTO TruSo (ID_TruSo, TenTruSo, DiaChi) VALUES
('TSC',    N'Trụ sở Chính',     N'18 Hoàng Diệu, Quận Ba Đình, TP. Hà Nội'),
('TSDN',   N'Trụ sở Đà Nẵng',   N'24 Trần Phú, Quận Hải Châu, TP. Đà Nẵng'),
('TSHCM',  N'Trụ sở Hồ Chí Minh', N'135 Pasteur, Quận 3, TP. HCM'),
('TSHN',   N'Trụ sở Hà Nam',     N'25 Lê Hoàn, TP. Phủ Lý, Hà Nam'),
('TSCT',   N'Trụ sở Cần Thơ',    N'1A Lý Tự Trọng, Quận Ninh Kiều, Cần Thơ'),
('TSHY',   N'Trụ sở Hưng Yên',   N'36 Nguyễn Văn Linh, TP. Hưng Yên'),
('TSQN',   N'Trụ sở Quảng Ninh', N'Trần Quốc Nghiễn, P. Bạch Đằng, Hạ Long, Quảng Ninh'),
('TSNA',   N'Trụ sở Nghệ An',    N'1 Đại lộ Lê Nin, TP. Vinh, Nghệ An'),
('TSHT',   N'Trụ sở Hà Tĩnh',   N'26 Lê Duẩn, TP. Hà Tĩnh'),
('TSNB',   N'Trụ sở Ninh Bình',  N'8 Tràng An, TP. Ninh Bình');


--Khoa
--Trụ sở chính:
--Trụ sở 1
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('DNK001', N'Công Nghệ Thông Tin', 'TSDN'),
       ('DNK002', N'Kinh Tế - Tài Chính', 'TSDN');
--Trụ sở 2
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('HCMK001', N'Công Nghệ Thông Tin', 'TSHCM'),
       ('HCMK002',  N'Kinh Tế - Tài Chính', 'TSHCM');

--Trụ sở 3
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('HNK001', N'Công Nghệ Thông Tin', 'TSHN'),
       ('HNK002',  N'Kinh Tế - Tài Chính', 'TSHN');
--Trụ sở 4
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('CTK001', N'Công Nghệ Thông Tin', 'TSCT'),
       ('CTK002',  N'Kinh Tế - Tài Chính', 'TSCT');
--Trụ sở 5
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('HYK001', N'Công Nghệ Thông Tin', 'TSHY'),
       ('HYK002',  N'Kinh Tế - Tài Chính', 'TSHY');
--Trụ sở 6
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('QNK001', N'Công Nghệ Thông Tin', 'TSQN'),
       ('QNK002',  N'Kinh Tế - Tài Chính', 'TSQN');
--Trụ sở 7
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('NAK001', N'Công Nghệ Thông Tin', 'TSNA'),
       ('NAK002',  N'Kinh Tế - Tài Chính', 'TSNA');
--Trụ sở 8
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('HTK001', N'Công Nghệ Thông Tin', 'TSHT'),
       ('HTK002', N'Kinh Tế - Tài Chính', 'TSHT');
--Trụ sở 9
INSERT INTO Khoa (ID_Khoa, TenKhoa, ID_TruSo) VALUES 
       ('NBK001', N'Công Nghệ Thông Tin', 'TSNB'),
       ('NBK002',  N'Kinh Tế - Tài Chính', 'TSNB');
--GiangVien
-- Insert cho cơ sở Đà Nẵng (ID_Khoa = DNK001 và DNK002)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('DNGVCN001', N'Nguyễn Văn An', N'123 Lê Lợi, Đà Nẵng', '0905123451', N'Thạc sĩ', 'DNK001'),
('DNGVCN002', N'Trần Thị Bình', N'456 Hải Phòng, Đà Nẵng', '0905123452', N'Tiến sĩ', 'DNK001'),
('DNGVCN003', N'Lê Văn Cường', N'789 Nguyễn Văn Linh, Đà Nẵng', '0905123453', N'Thạc sĩ', 'DNK001'),
('DNGVCN004', N'Phạm Thị Dung', N'101 Trần Phú, Đà Nẵng', '0905123454', N'Tiến sĩ', 'DNK001'),
('DNGVCN005', N'Hoàng Văn Em', N'202 Hùng Vương, Đà Nẵng', '0905123455', N'Thạc sĩ', 'DNK001'),
('DNGVCN006', N'Vũ Thị Phượng', N'303 Âu Cơ, Đà Nẵng', '0905123456', N'Thạc sĩ', 'DNK001'),
('DNGVCN007', N'Đặng Văn Giang', N'404 Nguyễn Tri Phương, Đà Nẵng', '0905123457', N'Tiến sĩ', 'DNK001'),
('DNGVCN008', N'Bùi Thị Hồng', N'505 Tôn Đức Thắng, Đà Nẵng', '0905123458', N'Thạc sĩ', 'DNK001'), 
('DNGVKT001', N'Ngô Văn Hùng', N'606 Phạm Văn Đồng, Đà Nẵng', '0905123459', N'Tiến sĩ', 'DNK002'),
('DNGVKT002', N'Mai Thị Kim', N'707 Nguyễn Hữu Thọ, Đà Nẵng', '0905123460', N'Thạc sĩ', 'DNK002'),
('DNGVKT003', N'Tô Văn Long', N'808 Lê Duẩn, Đà Nẵng', '0905123461', N'Tiến sĩ', 'DNK002'),
('DNGVKT004', N'Đỗ Thị Mai', N'909 Ngô Quyền, Đà Nẵng', '0905123462', N'Thạc sĩ', 'DNK002'),
('DNGVKT005', N'Nguyễn Thị Lan', N'111 Nguyễn Tất Thành, Đà Nẵng', '0905123463', N'Thạc sĩ', 'DNK002'), 
('DNGVKT006', N'Trần Văn Hùng', N'222 Điện Biên Phủ, Đà Nẵng', '0905123464', N'Tiến sĩ', 'DNK002');


--Trụ sở 2:
-- Insert cho cơ sở Hồ Chí Minh (ID_Khoa = HCMK001 và HCMK002)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('HCMGVCN001', N'Nguyễn Văn Nam', N'111 Lê Đại Hành, TP.HCM', '0905123463', N'Thạc sĩ', 'HCMK001'),
('HCMGVCN002', N'Trần Thị Oanh', N'222 Nguyễn Trãi, TP.HCM', '0905123464', N'Tiến sĩ', 'HCMK001'),
('HCMGVCN003', N'Lê Văn Phát', N'333 Lý Thường Kiệt, TP.HCM', '0905123465', N'Thạc sĩ', 'HCMK001'),
('HCMGVCN004', N'Phạm Thị Quyên', N'444 Võ Văn Tần, TP.HCM', '0905123466', N'Tiến sĩ', 'HCMK001'),
('HCMGVCN005', N'Hoàng Văn Rạng', N'555 Nguyễn Đình Chiểu, TP.HCM', '0905123467', N'Thạc sĩ', 'HCMK001'),
('HCMGVCN006', N'Vũ Thị Sen', N'666 Cách Mạng Tháng 8, TP.HCM', '0905123468', N'Thạc sĩ', 'HCMK001'),
('HCMGVCN007', N'Đặng Văn Tài', N'777 Lê Hồng Phong, TP.HCM', '0905123469', N'Tiến sĩ', 'HCMK001'),
('HCMGVCN008', N'Bùi Thị Uyên', N'888 Nguyễn Văn Cừ, TP.HCM', '0905123470', N'Thạc sĩ', 'HCMK001'),
('HCMGVKT001', N'Ngô Văn Việt', N'999 Điện Biên Phủ, TP.HCM', '0905123471', N'Tiến sĩ', 'HCMK002'),
('HCMGVKT002', N'Mai Thị Xuân', N'1010 Trường Sa, TP.HCM', '0905123472', N'Thạc sĩ', 'HCMK002'),
('HCMGVKT003', N'Tô Văn Yên', N'1111 Hoàng Sa, TP.HCM', '0905123473', N'Tiến sĩ', 'HCMK002'),
('HCMGVKT004', N'Đỗ Thị Zoa', N'1212 Phạm Ngũ Lão, TP.HCM', '0905123474', N'Thạc sĩ', 'HCMK002'),
('HCMGVKT005', N'Phạm Văn Khôi', N'123 Pasteur, TP.HCM', '0905123475', N'Thạc sĩ', 'HCMK002'), 
('HCMGVKT006', N'Nguyễn Thị Mai', N'234 Lê Lai, TP.HCM', '0905123476', N'Tiến sĩ', 'HCMK002');

--Trụ sở 3:
-- Insert cho cơ sở Hà Nam (ID_Khoa = HNK001 và HNK002)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('HNGVCN001', N'Nguyễn Văn Ba', N'123 Trần Hưng Đạo, Hà Nam', '0905123475', N'Thạc sĩ', 'HNK001'),
('HNGVCN002', N'Trần Thị Cẩm', N'234 Lê Lợi, Hà Nam', '0905123476', N'Tiến sĩ', 'HNK001'),
('HNGVCN003', N'Lê Văn Dân', N'345 Nguyễn Huệ, Hà Nam', '0905123477', N'Thạc sĩ', 'HNK001'),
('HNGVCN004', N'Phạm Thị Êm', N'456 Hùng Vương, Hà Nam', '0905123478', N'Tiến sĩ', 'HNK001'),
('HNGVCN005', N'Hoàng Văn Pháp', N'567 Trần Phú, Hà Nam', '0905123479', N'Thạc sĩ', 'HNK001'),
('HNGVCN006', N'Vũ Thị Giang', N'678 Lý Thường Kiệt, Hà Nam', '0905123480', N'Thạc sĩ', 'HNK001'),
('HNGVCN007', N'Đặng Văn Hòa', N'789 Nguyễn Văn Cừ, Hà Nam', '0905123481', N'Tiến sĩ', 'HNK001'),
('HNGVCN008', N'Bùi Thị In', N'890 Lê Đại Hành, Hà Nam', '0905123482', N'Thạc sĩ', 'HNK001'), 
('HNGVKT001', N'Ngô Văn Khánh', N'901 Nguyễn Trãi, Hà Nam', '0905123483', N'Tiến sĩ', 'HNK002'),
('HNGVKT002', N'Mai Thị Lan', N'912 Võ Văn Tần, Hà Nam', '0905123484', N'Thạc sĩ', 'HNK002'),
('HNGVKT003', N'Tô Văn Minh', N'923 Nguyễn Đình Chiểu, Hà Nam', '0905123485', N'Tiến sĩ', 'HNK002'),
('HNGVKT004', N'Đỗ Thị Nga', N'934 Cách Mạng Tháng 8, Hà Nam', '0905123486', N'Thạc sĩ', 'HNK002'),
('HNGVKT005', N'Lê Thị Hồng', N'123 Trường Chinh, Hà Nam', '0905123487', N'Thạc sĩ', 'HNK002'),
('HNGVKT006', N'Hoàng Văn Nam', N'234 Quang Trung, Hà Nam', '0905123488', N'Tiến sĩ', 'HNK002');

--Trụ sở 4:
-- Insert cho cơ sở Cần Thơ (ID_Khoa = CTK001 và CTK002)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('CTGVCN001', N'Nguyễn Văn Quang', N'123 Nguyễn Văn Cừ, Cần Thơ', '0905123487', N'Thạc sĩ', 'CTK001'),
('CTGVCN002', N'Trần Thị Rừng', N'234 Trần Hưng Đạo, Cần Thơ', '0905123488', N'Tiến sĩ', 'CTK001'),
('CTGVCN003', N'Lê Văn Sáng', N'345 Lê Lợi, Cần Thơ', '0905123489', N'Thạc sĩ', 'CTK001'),
('CTGVCN004', N'Phạm Thị Tâm', N'456 Nguyễn Huệ, Cần Thơ', '0905123490', N'Tiến sĩ', 'CTK001'),
('CTGVCN005', N'Hoàng Văn Uy', N'567 Hùng Vương, Cần Thơ', '0905123491', N'Thạc sĩ', 'CTK001'),
('CTGVCN006', N'Vũ Thị Vân', N'678 Trần Phú, Cần Thơ', '0905123492', N'Thạc sĩ', 'CTK001'),
('CTGVCN007', N'Đặng Văn Xuân', N'789 Lý Thường Kiệt, Cần Thơ', '0905123493', N'Tiến sĩ', 'CTK001'),
('CTGVCN008', N'Bùi Thị Ý', N'890 Nguyễn Trãi, Cần Thơ', '0905123494', N'Thạc sĩ', 'CTK001'), 
('CTGVKT001', N'Ngô Văn Ân', N'901 Lê Đại Hành, Cần Thơ', '0905123495', N'Tiến sĩ', 'CTK002'),
('CTGVKT002', N'Mai Thị Bảo', N'912 Võ Văn Tần, Cần Thơ', '0905123496', N'Thạc sĩ', 'CTK002'),
('CTGVKT003', N'Tô Văn Cường', N'923 Nguyễn Đình Chiểu, Cần Thơ', '0905123497', N'Tiến sĩ', 'CTK002'),
('CTGVKT004', N'Đỗ Thị Duyên', N'934 Cách Mạng Tháng 8, Cần Thơ', '0905123498', N'Thạc sĩ', 'CTK002'),
('CTGVKT005', N'Vũ Văn Tâm', N'123 Mậu Thân, Cần Thơ', '0905123499', N'Thạc sĩ', 'CTK002'), 
('CTGVKT006', N'Đặng Thị Ngọc', N'234 Nguyễn Văn Linh, Cần Thơ', '0905123500', N'Tiến sĩ', 'CTK002');


--Trụ sở 5
-- Insert cho cơ sở Hưng Yên (ID_Khoa = HYK001 và HYK002)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('HYGVCN001', N'Nguyễn Văn Đông', N'123 Lê Lợi, Hưng Yên', '0905123499', N'Thạc sĩ', 'HYK001'),
('HYGVCN002', N'Trần Thị Gấm', N'234 Nguyễn Huệ, Hưng Yên', '0905123500', N'Tiến sĩ', 'HYK001'),
('HYGVCN003', N'Lê Văn Hòa', N'345 Trần Phú, Hưng Yên', '0905123501', N'Thạc sĩ', 'HYK001'),
('HYGVCN004', N'Phạm Thị Iêm', N'456 Hùng Vương, Hưng Yên', '0905123502', N'Tiến sĩ', 'HYK001'),
('HYGVCN005', N'Hoàng Văn Kiên', N'567 Lý Thường Kiệt, Hưng Yên', '0905123503', N'Thạc sĩ', 'HYK001'),
('HYGVCN006', N'Vũ Thị Lan', N'678 Nguyễn Văn Cừ, Hưng Yên', '0905123504', N'Thạc sĩ', 'HYK001'),
('HYGVCN007', N'Đặng Văn Mạnh', N'789 Lê Đại Hành, Hưng Yên', '0905123505', N'Tiến sĩ', 'HYK001'),
('HYGVCN008', N'Bùi Thị Ngọc', N'890 Nguyễn Trãi, Hưng Yên', '0905123506', N'Thạc sĩ', 'HYK001'),
('HYGVKT001', N'Ngô Văn Phương', N'901 Võ Văn Tần, Hưng Yên', '0905123507', N'Tiến sĩ', 'HYK002'),
('HYGVKT002', N'Mai Thị Quy', N'912 Nguyễn Đình Chiểu, Hưng Yên', '0905123508', N'Thạc sĩ', 'HYK002'),
('HYGVKT003', N'Tô Văn Sơn', N'923 Cách Mạng Tháng 8, Hưng Yên', '0905123509', N'Tiến sĩ', 'HYK002'),
('HYGVKT004', N'Đỗ Thị Thảo', N'934 Trần Hưng Đạo, Hưng Yên', '0905123510', N'Thạc sĩ', 'HYK002'),
('HYGVKT005', N'Bùi Văn Phúc', N'123 Phạm Bành, Hưng Yên', '0905123511', N'Thạc sĩ', 'HYK002'), 
('HYGVKT006', N'Mai Thị Thanh', N'234 Nguyễn Thiện Thuật, Hưng Yên', '0905123512', N'Tiến sĩ', 'HYK002');
--Trụ sở 6: 
-- Insert cho cơ sở Quảng Ninh (ID_Khoa = QNK001 và QNK002)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('QNGVCN001', N'Nguyễn Văn Tùng', N'123 Trần Phú, Quảng Ninh', '0905123511', N'Thạc sĩ', 'QNK001'),
('QNGVCN002', N'Trần Thị Uyên', N'234 Lê Lợi, Quảng Ninh', '0905123512', N'Tiến sĩ', 'QNK001'),
('QNGVCN003', N'Lê Văn Vương', N'345 Nguyễn Huệ, Quảng Ninh', '0905123513', N'Thạc sĩ', 'QNK001'),
('QNGVCN004', N'Phạm Thị Xuân', N'456 Hùng Vương, Quảng Ninh', '0905123514', N'Tiến sĩ', 'QNK001'),
('QNGVCN005', N'Hoàng Văn Ý', N'567 Lý Thường Kiệt, Quảng Ninh', '0905123515', N'Thạc sĩ', 'QNK001'),
('QNGVCN006', N'Vũ Thị Ánh', N'678 Nguyễn Văn Cừ, Quảng Ninh', '0905123516', N'Thạc sĩ', 'QNK001'),
('QNGVCN007', N'Đặng Văn Bình', N'789 Lê Đại Hành, Quảng Ninh', '0905123517', N'Tiến sĩ', 'QNK001'),
('QNGVCN008', N'Bùi Thị Cúc', N'890 Nguyễn Trãi, Quảng Ninh', '0905123518', N'Thạc sĩ', 'QNK001'),
('QNGVKT001', N'Ngô Văn Dũng', N'901 Võ Văn Tần, Quảng Ninh', '0905123519', N'Tiến sĩ', 'QNK002'),
('QNGVKT002', N'Mai Thị Em', N'912 Nguyễn Đình Chiểu, Quảng Ninh', '0905123520', N'Thạc sĩ', 'QNK002'),
('QNGVKT003', N'Tô Văn Giang', N'923 Cách Mạng Tháng 8, Quảng Ninh', '0905123521', N'Tiến sĩ', 'QNK002'),
('QNGVKT004', N'Đỗ Thị Hương', N'934 Trần Hưng Đạo, Quảng Ninh', '0905123522', N'Thạc sĩ', 'QNK002'),
('QNGVKT005', N'Ngô Văn Đức', N'123 Bãi Cháy, Quảng Ninh', '0905123523', N'Thạc sĩ', 'QNK002'), 
('QNGVKT006', N'Tô Thị Hoa', N'234 Hạ Long, Quảng Ninh', '0905123524', N'Tiến sĩ', 'QNK002');


--Trụ sở 7:
-- Insert cho cơ sở Nghệ An (ID_Khoa = NAK007)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('NAGVCN001', N'Nguyễn Văn Anh', N'123 Lê Lợi, Nghệ An', '0905123523', N'Thạc sĩ', 'NAK001'),
('NAGVCN002', N'Trần Thị Bảo', N'234 Nguyễn Huệ, Nghệ An', '0905123524', N'Tiến sĩ', 'NAK001'),
('NAGVCN003', N'Lê Văn Cường', N'345 Trần Phú, Nghệ An', '0905123525', N'Thạc sĩ', 'NAK001'),
('NAGVCN004', N'Phạm Thị Duyên', N'456 Hùng Vương, Nghệ An', '0905123526', N'Tiến sĩ', 'NAK001'),
('NAGVCN005', N'Hoàng Văn Em', N'567 Lý Thường Kiệt, Nghệ An', '0905123527', N'Thạc sĩ', 'NAK001'),
('NAGVCN006', N'Vũ Thị Phượng', N'678 Nguyễn Văn Cừ, Nghệ An', '0905123528', N'Thạc sĩ', 'NAK001'),
('NAGVCN007', N'Trần Thị Loan', N'234 Trần Phú, Nghệ An', '0905123535', N'Tiến sĩ', 'NAK001'),
('NAGVCN008', N'Lê Văn Phát', N'345 Lê Lợi,  Nghệ An', '0905123538', N'Thạc sĩ', 'NAK001'),
('NAGVKT001', N'Đặng Văn Giang', N'789 Lê Đại Hành, Nghệ An', '0905123529', N'Tiến sĩ', 'NAK002'),
('NAGVKT002', N'Bùi Thị Hồng', N'890 Nguyễn Trãi, Nghệ An', '0905123530', N'Thạc sĩ', 'NAK002'),
('NAGVKT003', N'Ngô Văn Hùng', N'901 Võ Văn Tần, Nghệ An', '0905123531', N'Tiến sĩ', 'NAK002'),
('NAGVKT004', N'Mai Thị Kim', N'912 Nguyễn Đình Chiểu, Nghệ An', '0905123532', N'Thạc sĩ', 'NAK002'),
('NAGVKT005', N'Tô Văn Long', N'923 Cách Mạng Tháng 8, Nghệ An', '0905123533', N'Tiến sĩ', 'NAK002'),
('NAGVKT006', N'Đỗ Thị Mai', N'934 Trần Hưng Đạo, Nghệ An', '0905123534', N'Thạc sĩ', 'NAK002');
--Trụ sở 8:
-- Insert cho cơ sở Hà Tĩnh (ID_Khoa = HTK008)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('HTGVCN001', N'Trần Thị Oanh', N'234 Trần Phú, Hà Tĩnh', '0905123536', N'Tiến sĩ', 'HTK001'),
('HTGVCN002', N'Lê Văn Phát', N'345 Lê Lợi, Hà Tĩnh', '0905123537', N'Thạc sĩ', 'HTK001'),
('HTGVCN003', N'Phạm Thị Quyên', N'456 Hùng Vương, Hà Tĩnh', '0905123538', N'Tiến sĩ', 'HTK001'),
('HTGVCN004', N'Hoàng Văn Rạng', N'567 Lý Thường Kiệt, Hà Tĩnh', '0905123539', N'Thạc sĩ', 'HTK001'),
('HTGVCN005', N'Vũ Thị Sen', N'678 Nguyễn Văn Cừ, Hà Tĩnh', '0905123540', N'Thạc sĩ', 'HTK001'),
('HTGVCN006', N'Đặng Văn Tài', N'789 Lê Đại Hành, Hà Tĩnh', '0905123541', N'Tiến sĩ', 'HTK001'),
('HTGVCN007', N'Đỗ Thị Nụ', N'937 Trần Hưng Đạo, Hà Tĩnh', '0905123599', N'Thạc sĩ', 'HTK001'),
('HTGVCN008', N'Nguyễn Văn Nam', N'129 Nguyễn Huệ, Hà Tĩnh', '0905123538', N'Thạc sĩ', 'HTK001'),
('HTGVKT001', N'Bùi Thị Uyên', N'890 Nguyễn Trãi, Hà Tĩnh', '0905123542', N'Thạc sĩ', 'HTK002'),
('HTGVKT002', N'Ngô Văn Việt', N'901 Võ Văn Tần, Hà Tĩnh', '0905123543', N'Tiến sĩ', 'HTK002'),
('HTGVKT003', N'Mai Thị Xuân', N'912 Nguyễn Đình Chiểu, Hà Tĩnh', '0905123544', N'Thạc sĩ', 'HTK002'),
('HTGVKT004', N'Tô Văn Yên', N'923 Cách Mạng Tháng 8, Hà Tĩnh', '0905123545', N'Tiến sĩ', 'HTK002'),
('HTGVKT005', N'Đỗ Thị Zoa', N'934 Trần Hưng Đạo, Hà Tĩnh', '0905123546', N'Thạc sĩ', 'HTK002'),
('HTGVKT006', N'Nguyễn Văn Nam', N'123 Nguyễn Huệ, Hà Tĩnh', '0905123535', N'Thạc sĩ', 'HTK002');
--Trụ sở 9:
-- Insert cho cơ sở Ninh Bình (ID_Khoa = NBK001 và NBK002)
INSERT INTO GiangVien (ID_GiangVien, TenGiangVien, DiaChi, SoDienThoai, BangCap, ID_Khoa) VALUES
('NBGVCN001', N'Nguyễn Văn Ba', N'123 Lê Lợi, Ninh Bình', '0905123547', N'Thạc sĩ', 'NBK001'),
('NBGVCN002', N'Trần Thị Cẩm', N'234 Nguyễn Huệ, Ninh Bình', '0905123548', N'Tiến sĩ', 'NBK001'),
('NBGVCN003', N'Lê Văn Dân', N'345 Trần Phú, Ninh Bình', '0905123549', N'Thạc sĩ', 'NBK001'),
('NBGVCN004', N'Phạm Thị Êm', N'456 Hùng Vương, Ninh Bình', '0905123550', N'Tiến sĩ', 'NBK001'),
('NBGVCN005', N'Hoàng Văn Pháp', N'567 Lý Thường Kiệt, Ninh Bình', '0905123551', N'Thạc sĩ', 'NBK001'),
('NBGVCN006', N'Vũ Thị Giang', N'678 Nguyễn Văn Cừ, Ninh Bình', '0905123552', N'Thạc sĩ', 'NBK001'),
('NBGVCN007', N'Đặng Văn Hòa', N'789 Lê Đại Hành, Ninh Bình', '0905123553', N'Tiến sĩ', 'NBK001'),
('NBGVCN008', N'Bùi Thị In', N'890 Nguyễn Trãi, Ninh Bình', '0905123554', N'Thạc sĩ', 'NBK001'), 
('NBGVKT001', N'Ngô Văn Khánh', N'901 Võ Văn Tần, Ninh Bình', '0905123555', N'Tiến sĩ', 'NBK002'),
('NBGVKT002', N'Mai Thị Lan', N'912 Nguyễn Đình Chiểu, Ninh Bình', '0905123556', N'Thạc sĩ', 'NBK002'),
('NBGVKT003', N'Tô Văn Minh', N'923 Cách Mạng Tháng 8, Ninh Bình', '0905123557', N'Tiến sĩ', 'NBK002'),
('NBGVKT004', N'Đỗ Thị Nga', N'934 Trần Hưng Đạo, Ninh Bình', '0905123558', N'Thạc sĩ', 'NBK002'),
('NBGVKT005', N'Phạm Văn Lộc', N'123 Đinh Tiên Hoàng, Ninh Bình', '0905123559', N'Thạc sĩ', 'NBK002'), 
('NBGVKT006', N'Hoàng Thị Yến', N'234 Trần Hưng Đạo, Ninh Bình', '0905123560', N'Tiến sĩ', 'NBK002');



--HoiDong
--Trụ sở 1
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('DNHD001', '2024-2025', 'HK1', 'DNK001'), 
('DNHD002', '2024-2025', 'HK2', 'DNK001'), 
('DNHD003', '2024-2025', 'HK1', 'DNK002'),
('DNHD004', '2024-2025', 'HK2', 'DNK002');

--Trụ sở 2
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('HCMHD001', '2024-2025', 'HK1', 'HCMK001'), 
('HCMHD002', '2024-2025', 'HK2', 'HCMK001'), 
('HCMHD003', '2024-2025', 'HK1', 'HCMK002'), 
('HCMHD004', '2024-2025', 'HK2', 'HCMK002');

--Trụ sở 3
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('HNHD001', '2024-2025', 'HK1', 'HNK001'), 
('HNHD002', '2024-2025', 'HK2', 'HNK001'), 
('HNHD003', '2024-2025', 'HK1', 'HNK002'), 
('HNHD004', '2024-2025', 'HK2', 'HNK002');

--Trụ sở 4
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('CTHD001', '2024-2025', 'HK1', 'CTK001'), 
('CTHD002', '2024-2025', 'HK2', 'CTK001'), 
('CTHD003', '2024-2025', 'HK1', 'CTK002'), 
('CTHD004', '2024-2025', 'HK2', 'CTK002');

--Trụ sở 5
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('HYHD001', '2024-2025', 'HK1', 'HYK001'), 
('HYHD002', '2024-2025', 'HK2', 'HYK001'), 
('HYHD003', '2024-2025', 'HK1', 'HYK002'), 
('HYHD004', '2024-2025', 'HK2', 'HYK002');

--Trụ sở 6
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('QNHD001', '2024-2025', 'HK1', 'QNK001'), 
('QNHD002', '2024-2025', 'HK2', 'QNK001'), 
('QNHD003', '2024-2025', 'HK1', 'QNK002'), 
('QNHD004', '2024-2025', 'HK2', 'QNK002');

--Trụ sở 7
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('NAHD001', '2024-2025', 'HK1', 'NAK001'), 
('NAHD002', '2024-2025', 'HK2', 'NAK001'), 
('NAHD003', '2024-2025', 'HK1', 'NAK002'), 
('NAHD004', '2024-2025', 'HK2', 'NAK002');

--Trụ sở 8
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('HTHD001', '2024-2025', 'HK1', 'HTK001'), 
('HTHD002', '2024-2025', 'HK2', 'HTK001'),
('HTHD003', '2024-2025', 'HK2', 'HTK002'),
('HTHD004', '2024-2025', 'HK2', 'HTK002');

--Trụ sở 9
INSERT INTO HoiDong (ID_HoiDong, NamHoc, KyHoc, ID_Khoa) VALUES 
('NBHD001', '2024-2025', 'HK1', 'NBK001'), 
('NBHD002', '2024-2025', 'HK2', 'NBK001'),
('NBHD003', '2024-2025', 'HK2', 'NBK002'),
('NBHD004', '2024-2025', 'HK2', 'NBK002');

--ThanhVienHoiDong
INSERT INTO ThanhVienHoiDong (ID_TVHD, ID_HoiDong, ID_GiangVien, VaiTro) VALUES
-- Hội đồng DNHD001
('DNHD001TV001', 'DNHD001', 'DNGVCN001', N'Chủ tịch'),
('DNHD001TV002', 'DNHD001', 'DNGVCN002', N'Thành viên'),

-- Hội đồng DNHD0
('DNHD002TV001', 'DNHD002', 'DNGVCN003', N'Chủ tịch'),
('DNHD002TV002', 'DNHD002', 'DNGVCN004', N'Thành viên'),

-- Hội đồng DNHD003HDDN
('DNHD003TV001', 'DNHD003', 'DNGVKT001', N'Chủ tịch'),
('DNHD003TV002', 'DNHD003', 'DNGVKT002', N'Thành viên'),

-- Hội đồng DNHD004
('DNHD004TV001', 'DNHD004', 'DNGVKT003', N'Chủ tịch'),
('DNHD004TV002', 'DNHD004', 'DNGVKT004', N'Thành viên'),

-- Trụ sở Hồ Chí Minh
-- Hội đồng HCMHD001
('HCMHD001TV001', 'HCMHD001', 'HCMGVCN001', N'Chủ tịch'),
('HCMHD001TV002', 'HCMHD001', 'HCMGVCN002', N'Thành viên'),
-- Hội đồng HCMHD002
('HCMHD002TV001', 'HCMHD002', 'HCMGVCN003', N'Chủ tịch'),
('HCMHD002TV002', 'HCMHD002', 'HCMGVCN004', N'Thành viên'),
-- Hội đồng HCMHD003
('HCMHD003TV001', 'HCMHD003', 'HCMGVKT001', N'Chủ tịch'),
('HCMHD003TV002', 'HCMHD003', 'HCMGVKT002', N'Thành viên'),
-- Hội đồng HCMHD004
('HCMHD004TV001', 'HCMHD004', 'HCMGVKT003', N'Chủ tịch'),
('HCMHD004TV002', 'HCMHD004', 'HCMGVKT004', N'Thành viên'),

-- Trụ sở Hà Nam
-- Hội đồng HNHD001
('HNHD001TV001', 'HNHD001', 'HNGVCN001', N'Chủ tịch'),
('HNHD001TV002', 'HNHD001', 'HNGVCN002', N'Thành viên'),
-- Hội đồng HNHD002
('HNHD002TV001', 'HNHD002', 'HNGVCN003', N'Chủ tịch'),
('HNHD002TV002', 'HNHD002', 'HNGVCN004', N'Thành viên'),
-- Hội đồng HNHD003
('HNHD003TV001', 'HNHD003', 'HNGVKT001', N'Chủ tịch'),
('HNHD003TV002', 'HNHD003', 'HNGVKT002', N'Thành viên'),
-- Hội đồng HNHD004
('HNHD004TV001', 'HNHD004', 'HNGVKT003', N'Chủ tịch'),
('HNHD004TV002', 'HNHD004', 'HNGVKT004', N'Thành viên'),

-- Trụ sở Cần Thơ
-- Hội đồng CTHD001
('CTHD001TV001', 'CTHD001', 'CTGVCN001', N'Chủ tịch'),
('CTHD001TV002', 'CTHD001', 'CTGVCN002', N'Thành viên'),
-- Hội đồng CTHD002
('CTHD002TV001', 'CTHD002', 'CTGVCN003', N'Chủ tịch'),
('CTHD002TV002', 'CTHD002', 'CTGVCN004', N'Thành viên'),
-- Hội đồng CTHD003
('CTHD003TV001', 'CTHD003', 'CTGVKT001', N'Chủ tịch'),
('CTHD003TV002', 'CTHD003', 'CTGVKT002', N'Thành viên'),
-- Hội đồng CTHD004
('CTHD004TV001', 'CTHD004', 'CTGVKT003', N'Chủ tịch'),
('CTHD004TV002', 'CTHD004', 'CTGVKT004', N'Thành viên'),

-- Trụ sở Hưng Yên
-- Hội đồng HYHD001
('HYHD001TV001', 'HYHD001', 'HYGVCN001', N'Chủ tịch'),
('HYHD001TV002', 'HYHD001', 'HYGVCN002', N'Thành viên'),
-- Hội đồng HYHD002
('HYHD002TV001', 'HYHD002', 'HYGVCN003', N'Chủ tịch'),
('HYHD002TV002', 'HYHD002', 'HYGVCN004', N'Thành viên'),
-- Hội đồng HYHD003
('HYHD003TV001', 'HYHD003', 'HYGVKT001', N'Chủ tịch'),
('HYHD003TV002', 'HYHD003', 'HYGVKT002', N'Thành viên'),
-- Hội đồng HYHD004
('HYHD004TV001', 'HYHD004', 'HYGVKT003', N'Chủ tịch'),
('HYHD004TV002', 'HYHD004', 'HYGVKT004', N'Thành viên'),

-- Trụ sở Quảng Ninh
-- Hội đồng QNHD001
('QNHD001TV001', 'QNHD001', 'QNGVCN001', N'Chủ tịch'),
('QNHD001TV002', 'QNHD001', 'QNGVCN002', N'Thành viên'),
-- Hội đồng QNHD002
('QNHD002TV001', 'QNHD002', 'QNGVCN003', N'Chủ tịch'),
('QNHD002TV002', 'QNHD002', 'QNGVCN004', N'Thành viên'),
-- Hội đồng QNHD003
('QNHD003TV001', 'QNHD003', 'QNGVKT001', N'Chủ tịch'),
('QNHD003TV002', 'QNHD003', 'QNGVKT002', N'Thành viên'),
-- Hội đồng QNHD004
('QNHD004TV001', 'QNHD004', 'QNGVKT003', N'Chủ tịch'),
('QNHD004TV002', 'QNHD004', 'QNGVKT004', N'Thành viên'),

-- Trụ sở Nghệ An
-- Hội đồng NAHD001
('NAHD001TV001', 'NAHD001', 'NAGVCN001', N'Chủ tịch'),
('NAHD001TV002', 'NAHD001', 'NAGVCN002', N'Thành viên'),
-- Hội đồng NAHD002
('NAHD002TV001', 'NAHD002', 'NAGVCN003', N'Chủ tịch'),
('NAHD002TV002', 'NAHD002', 'NAGVCN004', N'Thành viên'),
-- Hội đồng NAHD003
('NAHD003TV001', 'NAHD003', 'NAGVKT001', N'Chủ tịch'),
('NAHD003TV002', 'NAHD003', 'NAGVKT002', N'Thành viên'),
-- Hội đồng NAHD004
('NAHD004TV001', 'NAHD004', 'NAGVKT003', N'Chủ tịch'),
('NAHD004TV002', 'NAHD004', 'NAGVKT004', N'Thành viên'),

-- Trụ sở Hà Tĩnh
-- Hội đồng HTHD001
('HTHD001TV001', 'HTHD001', 'HTGVCN001', N'Chủ tịch'),
('HTHD001TV002', 'HTHD001', 'HTGVCN002', N'Thành viên'),
-- Hội đồng HTHD002
('HTHD002TV001', 'HTHD002', 'HTGVCN003', N'Chủ tịch'),
('HTHD002TV002', 'HTHD002', 'HTGVCN004', N'Thành viên'),
-- Hội đồng HTHD003
('HTHD003TV001', 'HTHD003', 'HTGVKT001', N'Chủ tịch'),
('HTHD003TV002', 'HTHD003', 'HTGVKT002', N'Thành viên'),
-- Hội đồng HTHD004
('HTHD004TV001', 'HTHD004', 'HTGVKT003', N'Chủ tịch'),
('HTHD004TV002', 'HTHD004', 'HTGVKT004', N'Thành viên'),

-- Trụ sở Ninh Bình
-- Hội đồng NBHD001
('NBHD001TV001', 'NBHD001', 'NBGVCN001', N'Chủ tịch'),
('NBHD001TV002', 'NBHD001', 'NBGVCN002', N'Thành viên'),
-- Hội đồng NBHD002
('NBHD002TV001', 'NBHD002', 'NBGVCN003', N'Chủ tịch'),
('NBHD002TV002', 'NBHD002', 'NBGVCN004', N'Thành viên'),
-- Hội đồng NBHD003
('NBHD003TV001', 'NBHD003', 'NBGVKT001', N'Chủ tịch'),
('NBHD003TV002', 'NBHD003', 'NBGVKT002', N'Thành viên'),
-- Hội đồng NBHD004
('NBHD004TV001', 'NBHD004', 'NBGVKT003', N'Chủ tịch'),
('NBHD004TV002', 'NBHD004', 'NBGVKT004', N'Thành viên');


--DoAn	
INSERT INTO DoAn (ID_DoAn, ChuDe, Diem, ThoiGianCham, ID_HoiDong, ID_GiangVien) VALUES
-- Đà Nẵng (DN)
('DNDA001', N'Ứng dụng IoT trong nông nghiệp', 8.7, '2025-04-01 09:30:00', 'DNHD001', 'DNGVCN005'),
('DNDA002', N'Phát triển AI cho y tế', 9.2, '2025-04-02 10:00:00', 'DNHD002', 'DNGVCN006'),
('DNDA003', N'Phân tích thị trường fintech', 7.8, '2025-04-03 14:00:00', 'DNHD003', 'DNGVKT005'),
('DNDA004', N'Chiến lược marketing số', 8.5, '2025-04-04 15:30:00', 'DNHD004', 'DNGVKT006'),
-- Hồ Chí Minh (HC)
('HCMDA001', N'Hệ thống Blockchain cho logistics', 8.9, '2025-04-05 09:00:00', 'HCMHD001', 'HCMGVCN005'),
('HCMDA002', N'Tự động hóa với IoT công nghiệp', 9.0, '2025-04-06 10:30:00', 'HCMHD002', 'HCMGVCN006'),
('HCMDA003', N'Quản lý tài chính doanh nghiệp', 8.2, '2025-04-07 13:00:00', 'HCMHD003', 'HCMGVKT005'),
('HCMDA004', N'Phân tích hành vi người tiêu dùng', 8.6, '2025-04-08 14:30:00', 'HCMHD004', 'HCMGVKT006'),
-- Hà Nam (HN)
('HNDA001', N'Ứng dụng AI trong giáo dục', 9.1, '2025-04-09 08:30:00', 'DNHD001', 'HNGVCN005'),
('HNDA002', N'Phát triển ứng dụng di động thông minh', 8.8, '2025-04-10 09:00:00', 'HNHD002', 'HNGVCN006'),
('HNDA003', N'Tối ưu hóa chuỗi cung ứng', 7.9, '2025-04-11 15:00:00', 'HNHD003', 'HNGVKT005'),
('HNDA004', N'Đầu tư tài chính bền vững', 8.4, '2025-04-12 16:00:00', 'HNHD004', 'HNGVKT006'),
-- Cần Thơ (CT)
('CTDA001', N'Hệ thống giám sát môi trường IoT', 8.6, '2025-04-13 10:00:00', 'CTHD001', 'CTGVCN005'),
('CTDA002', N'Phân tích dữ liệu lớn với AI', 9.3, '2025-04-14 11:00:00', 'CTHD002', 'CTGVCN006'),
('CTDA003', N'Chiến lược thương mại điện tử', 8.0, '2025-04-15 14:00:00', 'CTHD003', 'CTGVKT005'),
('CTDA004', N'Phân tích rủi ro tài chính', 8.7, '2025-04-16 15:00:00', 'CTHD004', 'CTGVKT006'),
-- Hưng Yên (HY)
('HYDA001', N'Ứng dụng Blockchain trong ngân hàng', 9.0, '2025-04-17 09:30:00', 'HYHD001', 'HYGVCN005'),
('HYDA002', N'Hệ thống nhà thông minh IoT', 8.5, '2025-04-18 10:00:00', 'HYHD002', 'HYGVCN006'),
('HYDA003', N'Quản lý dự án kinh tế', 8.3, '2025-04-19 13:30:00', 'HYHD003', 'HYGVKT005'),
('HYDA004', N'Phát triển thương hiệu bền vững', 8.8, '2025-04-20 14:30:00', 'HYHD004', 'HYGVKT006'),
-- Quảng Ninh (QN)
('QNDA001', N'AI trong phân tích hình ảnh', 9.2, '2025-04-20 08:00:00', 'QNHD001', 'QNGVCN005'),
('QNDA002', N'Ứng dụng IoT trong du lịch', 8.7, '2025-04-20 09:00:00', 'QNHD002', 'QNGVCN006'),
('QNDA003', N'Tài chính vi mô cho startup', 8.1, '2025-04-20 15:00:00', 'QNHD003', 'QNGVKT005'),
('QNDA004', N'Chiến lược xuất khẩu nông sản', 8.6, '2025-04-20 16:00:00', 'QNHD004', 'QNGVKT006'),
-- Nghệ An (NA)
('NADA001', N'Phát triển game với AI', 8.9, '2025-04-20 10:30:00', 'NAHD001', 'NAGVCN005'),
('NADA002', N'Hệ thống giao thông thông minh', 9.1, '2025-04-20 11:00:00', 'NAHD002', 'NAGVCN006'),
('NADA003', N'Phân tích kinh tế vĩ mô', 7.7, '2025-04-20 14:00:00', 'NAHD003', 'NAGVKT005'),
('NADA004', N'Quản lý nguồn nhân lực', 8.5, '2025-04-20 15:30:00', 'NAHD004', 'NAGVKT006'),
-- Hà Tĩnh (HT)
('HTDA001', N'Ứng dụng AI trong nông nghiệp', 8.8, '2025-04-09 09:00:00', 'HTHD001', 'HTGVCN005'),
('HTDA002', N'Blockchain cho truy xuất nguồn gốc', 9.0, '2025-04-10 10:00:00', 'HTHD002', 'HTGVCN006'),
('HTDA003', N'Phát triển kinh tế tuần hoàn', 8.2, '2025-04-01 13:00:00', 'HTHD003', 'HTGVKT005'),
('HTDA004', N'Chiến lược đầu tư startup', 8.9, '2025-04-02 14:00:00', 'HTHD004', 'HTGVKT006'),
-- Ninh Bình (NB)
('NBDA001', N'Hệ thống an ninh mạng với AI', 9.3, '2025-04-03 08:30:00', 'NBHD001', 'NBGVCN005'),
('NBDA002', N'Ứng dụng IoT trong thủy sản', 8.6, '2025-04-04 09:30:00', 'NBHD002', 'NBGVCN006'),
('NBDA003', N'Phân tích thị trường bất động sản', 8.0, '2025-04-05 15:00:00', 'NBHD003', 'NBGVKT005'),
('NBDA004', N'Quản lý tài chính cá nhân', 8.7, '2025-04-06 16:00:00', 'NBHD004', 'NBGVKT006');

--SinhVien
--Trụ sở 1
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('DNSVKT001', N'Nguyễn Minh Tâm', '2022-09-01', 'ntam.dn@gmail.com', '2000-05-10', 'DNDA003', 'DNK002'),
('DNSVKT002', N'Phan Thị Lan', '2022-09-01', 'lan.phan.dn@gmail.com', '2000-06-12', 'DNDA003', 'DNK002'),
('DNSVKT003', N'Lê Văn Minh', '2022-09-01', 'minh.levn.dn@gmail.com', '2000-07-25', 'DNDA003', 'DNK002'),
('DNSVKT004', N'Trần Thi Bích', '2022-09-01', 'bich.tran.dn@gmail.com', '2000-08-19', 'DNDA003', 'DNK002'),
('DNSVKT005', N'Ngô Minh Tùng', '2022-09-01', 'mtung.dn@gmail.com', '2000-09-02', 'DNDA003', 'DNK002'),
('DNSVKT006', N'Lý Thanh Sơn', '2022-09-01', 'son.ly.dn@gmail.com', '2000-10-10', 'DNDA004', 'DNK002'),
('DNSVKT007', N'Vũ Minh Châu', '2022-09-01', 'chau.vu.dn@gmail.com', '2000-11-15', 'DNDA004', 'DNK002'),
('DNSVKT008', N'Nguyễn Thi Mai', '2022-09-01', 'mai.nguyen.dn@gmail.com', '2000-12-05', 'DNDA004', 'DNK002'),
('DNSVKT009', N'Trần Minh Tuấn', '2022-09-01', 'tuan.tran.dn@gmail.com', '2001-01-14', 'DNDA004', 'DNK002'),
('DNSVKT010', N'Phạm Hữu Bảo', '2022-09-01', 'bao.pham.dn@gmail.com', '2001-02-20', 'DNDA004', 'DNK002'),
('DNSVCN001', N'Nguyễn Quang Huy', '2022-09-01', 'huy.nguyen.dn@gmail.com', '2000-03-11', 'DNDA001', 'DNK001'),
('DNSVCN002', N'Võ Thị Lan', '2022-09-01', 'lan.vo.dn@gmail.com', '2001-04-25', 'DNDA001', 'DNK001'),
('DNSVCN003', N'Trần Quang Nam', '2022-09-01', 'nam.tran.dn@gmail.com', '2001-05-17', 'DNDA001', 'DNK001'),
('DNSVCN004', N'Ngô Thị Kim', '2022-09-01', 'kim.ngo.dn@gmail.com', '2001-06-10', 'DNDA001', 'DNK001'),
('DNSVCN005', N'Vũ Minh Đức', '2022-09-01', 'duc.vu.dn@gmail.com', '2001-07-02', 'DNDA001', 'DNK001'),
('DNSVCN006', N'Lê Thị Mỹ', '2022-09-01', 'my.le.dn@gmail.com', '2001-08-14', 'DNDA002', 'DNK001'),
('DNSVCN007', N'Phan Thi Thanh', '2022-09-01', 'thanh.phan.dn@gmail.com', '2001-09-08', 'DNDA002', 'DNK001'),
('DNSVCN008', N'Trần Minh Quân', '2022-09-01', 'quan.tran.dn@gmail.com', '2001-10-20', 'DNDA002', 'DNK001'),
('DNSVCN009', N'Nguyễn Quang Hoàng', '2022-09-01', 'hoang.nguyen.dn@gmail.com', '2001-11-12', 'DNDA002', 'DNK001'),
('DNSVCN010', N'Võ Thi Kim', '2022-09-01', 'kim.vo.dn@gmail.com', '2001-12-15', 'DNDA002', 'DNK001');



--Trụ sở 2
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('HCMSVKT001', N'Nguyễn Tuấn Anh', '2022-09-01', 'tuananh.hcm@gmail.com', '2000-05-10', 'HCMDA003', 'HCMK002'),
('HCMSVKT002', N'Phan Thị Lan', '2022-09-01', 'lan.phan.hcm@gmail.com', '2000-06-12', 'HCMDA003', 'HCMK002'),
('HCMSVKT003', N'Lê Văn Minh', '2022-09-01', 'minh.levn.hcm@gmail.com', '2000-07-25', 'HCMDA003', 'HCMK002'),
('HCMSVKT004', N'Trần Thi Bích', '2022-09-01', 'bich.tran.hcm@gmail.com', '2000-08-19', 'HCMDA003', 'HCMK002'),
('HCMSVKT005', N'Ngô Minh Tùng', '2022-09-01', 'mtung.hcm@gmail.com', '2000-09-02', 'HCMDA003', 'HCMK002'),
('HCMSVKT006', N'Lý Thanh Sơn', '2022-09-01', 'son.ly.hcm@gmail.com', '2000-10-10', 'HCMDA004', 'HCMK002'),
('HCMSVKT007', N'Vũ Minh Châu', '2022-09-01', 'chau.vu.hcm@gmail.com', '2000-11-15', 'HCMDA004', 'HCMK002'),
('HCMSVKT008', N'Nguyễn Thi Mai', '2022-09-01', 'mai.nguyen.hcm@gmail.com', '2000-12-05', 'HCMDA004', 'HCMK002'),
('HCMSVKT009', N'Trần Minh Tuấn', '2022-09-01', 'tuan.tran.hcm@gmail.com', '2001-01-14', 'HCMDA004', 'HCMK002'),
('HCMSVKT010', N'Phạm Hữu Bảo', '2022-09-01', 'bao.pham.hcm@gmail.com', '2001-02-20', 'HCMDA004', 'HCMK002'),
('HCMVCN001', N'Nguyễn Quang Huy', '2022-09-01', 'huy.nguyen.hcm@gmail.com', '2000-03-11', 'HCMDA001', 'HCMK001'),
('HCMVCN002', N'Võ Thị Lan', '2022-09-01', 'lan.vo.hcm@gmail.com', '2001-04-25', 'HCMDA001', 'HCMK001'),
('HCMVCN003', N'Trần Quang Nam', '2022-09-01', 'nam.tran.hcm@gmail.com', '2001-05-17', 'HCMDA001', 'HCMK001'),
('HCMVCN004', N'Ngô Thị Kim', '2022-09-01', 'kim.ngo.hcm@gmail.com', '2001-06-10', 'HCMDA001', 'HCMK001'),
('HCMVCN005', N'Vũ Minh Đức', '2022-09-01', 'duc.vu.hcm@gmail.com', '2001-07-02', 'HCMDA001', 'HCMK001'),
('HCMVCN006', N'Lê Thị Mỹ', '2022-09-01', 'my.le.hcm@gmail.com', '2001-08-14', 'HCMDA002', 'HCMK001'),
('HCMVCN007', N'Phan Thi Thanh', '2022-09-01', 'thanh.phan.hcm@gmail.com', '2001-09-08', 'HCMDA002', 'HCMK001'),
('HCMVCN008', N'Trần Minh Quân', '2022-09-01', 'quan.tran.hcm@gmail.com', '2001-10-20', 'HCMDA002', 'HCMK001'),
('HCMVCN009', N'Nguyễn Quang Hoàng', '2022-09-01', 'hoang.nguyen.hcm@gmail.com', '2001-11-12', 'HCMDA002', 'HCMK001'),
('HCMVCN010', N'Võ Thi Kim', '2022-09-01', 'kim.vo.hcm@gmail.com', '2001-12-15', 'HCMDA002', 'HCMK001');

--Trụ sở 3
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('HNSVCN001', N'Nguyễn Văn A', '2022-09-01', 'a.nguyen.hn@gmail.com', '2000-01-10', 'HNDA001', 'HNK001'),
('HNSVCN002', N'Nguyễn Thị B', '2022-09-01', 'b.nguyen.hn@gmail.com', '2000-02-11', 'HNDA001', 'HNK001'),
('HNSVCN003', N'Phan Minh C', '2022-09-01', 'c.phan.hn@gmail.com', '2000-03-12', 'HNDA001', 'HNK001'),
('HNSVCN004', N'Hoàng Quang D', '2022-09-01', 'd.hoang.hn@gmail.com', '2000-04-15', 'HNDA001', 'HNK001'),
('HNSVCN005', N'Phan Thi E', '2022-09-01', 'e.phan.hn@gmail.com', '2000-05-20', 'HNDA001', 'HNK001'),
('HNSVCN006', N'Nguyễn Thành F', '2022-09-01', 'f.nguyen.hn@gmail.com', '2000-06-25', 'HNDA002', 'HNK001'),
('HNSVCN007', N'Trần Minh G', '2022-09-01', 'g.tran.hn@gmail.com', '2000-07-30', 'HNDA002', 'HNK001'),
('HNSVCN008', N'Nguyễn Thi H', '2022-09-01', 'h.nguyen.hn@gmail.com', '2000-08-05', 'HNDA002', 'HNK001'),
('HNSVCN009', N'Trần Thành I', '2022-09-01', 'i.tran.hn@gmail.com', '2000-09-10', 'HNDA002', 'HNK001'),
('HNSVCN010', N'Hoàng Thị J', '2022-09-01', 'j.hoang.hn@gmail.com', '2000-10-15', 'HNDA002', 'HNK001'),
('HNSVKT001', N'Nguyễn Quang A', '2022-09-01', 'a.nguyen.hn.kt@gmail.com', '2000-01-20', 'HNDA003', 'HNK002'),
('HNSVKT002', N'Phan Minh B', '2022-09-01', 'b.phan.hn.kt@gmail.com', '2000-02-25', 'HNDA003', 'HNK002'),
('HNSVKT003', N'Nguyễn Thị C', '2022-09-01', 'c.nguyen.hn.kt@gmail.com', '2000-03-30', 'HNDA003', 'HNK002'),
('HNSVKT004', N'Trần Thành D', '2022-09-01', 'd.tran.hn.kt@gmail.com', '2000-04-15', 'HNDA003', 'HNK002'),
('HNSVKT005', N'Hoàng Minh E', '2022-09-01', 'e.hoang.hn.kt@gmail.com', '2000-05-18', 'HNDA003', 'HNK002'),
('HNSVKT006', N'Nguyễn Quang F', '2022-09-01', 'f.nguyen.hn.kt@gmail.com', '2000-06-20', 'HNDA004', 'HNK002'),
('HNSVKT007', N'Trần Quang G', '2022-09-01', 'g.tran.hn.kt@gmail.com', '2000-07-05', 'HNDA004', 'HNK002'),
('HNSVKT008', N'Nguyễn Thi H', '2022-09-01', 'h.nguyen.hn.kt@gmail.com', '2000-08-22', 'HNDA004', 'HNK002'),
('HNSVKT009', N'Phan Quang I', '2022-09-01', 'i.phan.hn.kt@gmail.com', '2000-09-10', 'HNDA004', 'HNK002'),
('HNSVKT010', N'Trần Minh J', '2022-09-01', 'j.tran.hn.kt@gmail.com', '2000-10-05', 'HNDA004', 'HNK002');

--Trụ sở 4
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('CTSVCN001', N'Nguyễn Văn A', '2022-09-01', 'a.nguyen.ct@gmail.com', '2000-01-10', 'CTDA001', 'CTK001'),
('CTSVCN002', N'Nguyễn Thị B', '2022-09-01', 'b.nguyen.ct@gmail.com', '2000-02-11', 'CTDA001', 'CTK001'),
('CTSVCN003', N'Phan Minh C', '2022-09-01', 'c.phan.ct@gmail.com', '2000-03-12', 'CTDA001', 'CTK001'),
('CTSVCN004', N'Hoàng Quang D', '2022-09-01', 'd.hoang.ct@gmail.com', '2000-04-15', 'CTDA001', 'CTK001'),
('CTSVCN005', N'Phan Thi E', '2022-09-01', 'e.phan.ct@gmail.com', '2000-05-20', 'CTDA001', 'CTK001'),
('CTSVCN006', N'Nguyễn Thành F', '2022-09-01', 'f.nguyen.ct@gmail.com', '2000-06-25', 'CTDA002', 'CTK001'),
('CTSVCN007', N'Trần Minh G', '2022-09-01', 'g.tran.ct@gmail.com', '2000-07-30', 'CTDA002', 'CTK001'),
('CTSVCN008', N'Nguyễn Thi H', '2022-09-01', 'h.nguyen.ct@gmail.com', '2000-08-05', 'CTDA002', 'CTK001'),
('CTSVCN009', N'Trần Thành I', '2022-09-01', 'i.tran.ct@gmail.com', '2000-09-10', 'CTDA002', 'CTK001'),
('CTSVCN010', N'Hoàng Thị J', '2022-09-01', 'j.hoang.ct@gmail.com', '2000-10-15', 'CTDA002', 'CTK001'),
('CTSVKT001', N'Nguyễn Quang A', '2022-09-01', 'a.nguyen.ct.kt@gmail.com', '2000-01-20', 'CTDA003', 'CTK002'),
('CTSVKT002', N'Phan Minh B', '2022-09-01', 'b.phan.ct.kt@gmail.com', '2000-02-25', 'CTDA003', 'CTK002'),
('CTSVKT003', N'Nguyễn Thị C', '2022-09-01', 'c.nguyen.ct.kt@gmail.com', '2000-03-30', 'CTDA003', 'CTK002'),
('CTSVKT004', N'Trần Thành D', '2022-09-01', 'd.tran.ct.kt@gmail.com', '2000-04-15', 'CTDA003', 'CTK002'),
('CTSVKT005', N'Hoàng Minh E', '2022-09-01', 'e.hoang.ct.kt@gmail.com', '2000-05-18', 'CTDA003', 'CTK002'),
('CTSVKT006', N'Nguyễn Quang F', '2022-09-01', 'f.nguyen.ct.kt@gmail.com', '2000-06-20', 'CTDA004', 'CTK002'),
('CTSVKT007', N'Trần Quang G', '2022-09-01', 'g.tran.ct.kt@gmail.com', '2000-07-05', 'CTDA004', 'CTK002'),
('CTSVKT008', N'Nguyễn Thi H', '2022-09-01', 'h.nguyen.ct.kt@gmail.com', '2000-08-22', 'CTDA004', 'CTK002'),
('CTSVKT009', N'Phan Quang I', '2022-09-01', 'i.phan.ct.kt@gmail.com', '2000-09-10', 'CTDA004', 'CTK002'),
('CTSVKT010', N'Trần Minh J', '2022-09-01', 'j.tran.ct.kt@gmail.com', '2000-10-05', 'CTDA004', 'CTK002');


--Trụ sở 5
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('HYSVCN001', N'Nguyễn Văn A', '2022-09-01', 'a.nguyen.hy@gmail.com', '2000-01-10', 'HYDA001', 'HYK001'),
('HYSVCN002', N'Trần Thị B', '2022-09-01', 'b.tran.hy@gmail.com', '2000-02-15', 'HYDA001', 'HYK001'),
('HYSVCN003', N'Phạm Minh C', '2022-09-01', 'c.pham.hy@gmail.com', '2000-03-20', 'HYDA001', 'HYK001'),
('HYSVCN004', N'Hoàng Quang D', '2022-09-01', 'd.hoang.hy@gmail.com', '2000-04-25', 'HYDA001', 'HYK001'),
('HYSVCN005', N'Đỗ Hữu E', '2022-09-01', 'e.do.hy@gmail.com', '2000-05-30', 'HYDA001', 'HYK001'),
('HYSVCN006', N'Ngô Minh F', '2022-09-01', 'f.ngo.hy@gmail.com', '2000-06-12', 'HYDA002', 'HYK001'),
('HYSVCN007', N'Vũ Hải G', '2022-09-01', 'g.vu.hy@gmail.com', '2000-07-08', 'HYDA002', 'HYK001'),
('HYSVCN008', N'Lê Thị H', '2022-09-01', 'h.le.hy@gmail.com', '2000-08-22', 'HYDA002', 'HYK001'),
('HYSVCN009', N'Nguyễn Quốc I', '2022-09-01', 'i.nguyen.hy@gmail.com', '2000-09-17', 'HYDA002', 'HYK001'),
('HYSVCN010', N'Phan Thanh J', '2022-09-01', 'j.phan.hy@gmail.com', '2000-10-03', 'HYDA002', 'HYK001'),
('HYSVKT001', N'Nguyễn Quang K', '2022-09-01', 'k.nguyen.hy.kt@gmail.com', '2000-01-05', 'HYDA003', 'HYK002'),
('HYSVKT002', N'Trần Minh L', '2022-09-01', 'l.tran.hy.kt@gmail.com', '2000-02-09', 'HYDA003', 'HYK002'),
('HYSVKT003', N'Phạm Văn M', '2022-09-01', 'm.pham.hy.kt@gmail.com', '2000-03-12', 'HYDA003', 'HYK002'),
('HYSVKT004', N'Lê Thị N', '2022-09-01', 'n.le.hy.kt@gmail.com', '2000-04-28', 'HYDA003', 'HYK002'),
('HYSVKT005', N'Vũ Quốc O', '2022-09-01', 'o.vu.hy.kt@gmail.com', '2000-05-16', 'HYDA003', 'HYK002'),
('HYSVKT006', N'Ngô Hữu P', '2022-09-01', 'p.ngo.hy.kt@gmail.com', '2000-06-06', 'HYDA004', 'HYK002'),
('HYSVKT007', N'Hoàng Minh Q', '2022-09-01', 'q.hoang.hy.kt@gmail.com', '2000-07-19', 'HYDA004', 'HYK002'),
('HYSVKT008', N'Trịnh Văn R', '2022-09-01', 'r.trinh.hy.kt@gmail.com', '2000-08-13', 'HYDA004', 'HYK002'),
('HYSVKT009', N'Lương Hải S', '2022-09-01', 's.luong.hy.kt@gmail.com', '2000-09-21', 'HYDA004', 'HYK002'),
('HYSVKT010', N'Nguyễn Thị T', '2022-09-01', 't.nguyen.hy.kt@gmail.com', '2000-10-11', 'HYDA004', 'HYK002');

--Trụ sở 6
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('QNSVCN001', 'Nguyen Van Y',     '2023-09-01', 'y.nguyen6@email.com',    '2002-01-24', 'QNDA001', 'QNK001'),
('QNSVCN002', 'Tran Thi Anh',     '2023-09-01', 'anh.tran6@email.com',    '2002-02-28', 'QNDA001', 'QNK001'),
('QNSVCN003', 'Le Van Binh',      '2023-09-01', 'binh.le6@email.com',     '2002-03-04', 'QNDA001', 'QNK001'),
('QNSVCN004', 'Pham Thi Cam',     '2023-09-01', 'cam.pham6@email.com',    '2002-04-09', 'QNDA001', 'QNK001'),
('QNSVCN005', 'Hoang Van Dung',   '2023-09-01', 'dung.hoang6@email.com',  '2002-05-14', 'QNDA001', 'QNK001'),
('QNSVCN006', 'Dang Thi Em',      '2023-09-01', 'em.dang6@email.com',     '2002-06-19', 'QNDA002', 'QNK001'),
('QNSVCN007', 'Vo Van Giang',     '2023-09-01', 'giang.vo6@email.com',    '2002-07-24', 'QNDA002', 'QNK001'),
('QNSVCN008', 'Bui Thi Hieu',     '2023-09-01', 'hieu.bui6@email.com',    '2002-08-29', 'QNDA002', 'QNK001'),
('QNSVCN009', 'Ngo Van Kieu',     '2023-09-01', 'kieu.ngo6@email.com',    '2002-09-03', 'QNDA002', 'QNK001'),
('QNSVCN010', 'Phan Thi Long',    '2023-09-01', 'long.phan6@email.com',   '2002-10-08', 'QNDA002', 'QNK001'),
('QNSVKT001', 'Do Van Mai',       '2023-09-01', 'mai.do6@email.com',      '2002-11-13', 'QNDA003', 'QNK002'),
('QNSVKT002', 'Ha Thi Nam',       '2023-09-01', 'nam.ha6@email.com',      '2002-12-18', 'QNDA004', 'QNK002'),
('QNSVKT003', 'Nguyen Van Oanh',  '2023-09-01', 'oanh.nguyen6@email.com', '2003-01-23', 'QNDA003', 'QNK002'),
('QNSVKT004', 'Tran Thi Phu',     '2023-09-01', 'phu.tran6@email.com',    '2003-02-28', 'QNDA004', 'QNK002'),
('QNSVKT005', 'Le Van Quynh',     '2023-09-01', 'quynh.le6@email.com',    '2003-03-05', 'QNDA003', 'QNK002'),
('QNSVKT006', 'Pham Thi Rang',    '2023-09-01', 'rang.pham6@email.com',   '2003-04-10', 'QNDA004', 'QNK002'),
('QNSVKT007', 'Hoang Van Suong',  '2023-09-01', 'suong.hoang6@email.com', '2003-05-15', 'QNDA003', 'QNK002'),
('QNSVKT008', 'Dang Thi Tai',     '2023-09-01', 'tai.dang6@email.com',    '2003-06-20', 'QNDA004', 'QNK002'),
('QNSVKT009', 'Vo Van Uyen',      '2023-09-01', 'uyen.vo6@email.com',     '2003-07-25', 'QNDA003', 'QNK002'),
('QNSVKT010', 'Bui Thi Vinh',     '2023-09-01', 'vinh.bui6@email.com',    '2003-08-30', 'QNDA004', 'QNK002');
--Trụ sở 7
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('NASVCN001', 'Nguyen Van Anh',   '2023-09-01', 'anh.nguyen7@email.com',   '2002-01-29', 'NADA001', 'NAK001'),
('NASVCN002', 'Le Van Cuong',     '2023-09-01', 'cuong.le7@email.com',     '2002-03-08', 'NADA001', 'NAK001'),
('NASVCN003', 'Hoang Van Em',     '2023-09-01', 'em.hoang7@email.com',     '2002-05-18', 'NADA001', 'NAK001'),
('NASVCN004', 'Vo Van Hieu',      '2023-09-01', 'hieu.vo7@email.com',      '2002-07-28', 'NADA001', 'NAK001'),
('NASVCN005', 'Ngo Van Long',     '2023-09-01', 'long.ngo7@email.com',     '2002-09-07', 'NADA001', 'NAK001'),
('NASVCN006', 'Tran Thi Bao',     '2023-09-01', 'bao.tran7@email.com',     '2002-02-03', 'NADA002', 'NAK001'),
('NASVCN007', 'Pham Thi Dung',    '2023-09-01', 'dung.pham7@email.com',    '2002-04-13', 'NADA002', 'NAK001'),
('NASVCN008', 'Dang Thi Giang',   '2023-09-01', 'giang.dang7@email.com',   '2002-06-23', 'NADA002', 'NAK001'),
('NASVCN009', 'Bui Thi Kieu',     '2023-09-01', 'kieu.bui7@email.com',     '2002-08-02', 'NADA002', 'NAK001'),
('NASVCN010', 'Phan Thi Mai',     '2023-09-01', 'mai.phan7@email.com',     '2002-10-12', 'NADA002', 'NAK001'),
('NASVKT001', 'Do Van Nam',       '2023-09-01', 'nam.do7@email.com',       '2002-11-17', 'NADA003', 'NAK002'),
('NASVKT002', 'Nguyen Van Phu',   '2023-09-01', 'phu.nguyen7@email.com',   '2003-01-27', 'NADA003', 'NAK002'),
('NASVKT003', 'Le Van Rang',      '2023-09-01', 'rang.le7@email.com',      '2003-03-06', 'NADA003', 'NAK002'),
('NASVKT004', 'Hoang Van Tai',    '2023-09-01', 'tai.hoang7@email.com',    '2003-05-16', 'NADA003', 'NAK002'),
('NASVKT005', 'Vo Van Vinh',      '2023-09-01', 'vinh.vo7@email.com',      '2003-07-26', 'NADA003', 'NAK002'),
('NASVKT006', 'Ha Thi Oanh',      '2023-09-01', 'oanh.ha7@email.com',      '2002-12-22', 'NADA004', 'NAK002'),
('NASVKT007', 'Tran Thi Quynh',   '2023-09-01', 'quynh.tran7@email.com',   '2003-02-01', 'NADA004', 'NAK002'),
('NASVKT008', 'Pham Thi Suong',   '2023-09-01', 'suong.pham7@email.com',   '2003-04-11', 'NADA004', 'NAK002'),
('NASVKT009', 'Dang Thi Uyen',    '2023-09-01', 'uyen.dang7@email.com',    '2003-06-21', 'NADA004', 'NAK002'),
('NASVKT010', 'Bui Thi Xuan',     '2023-09-01', 'xuan.bui7@email.com',     '2003-08-31', 'NADA004', 'NAK002');


--Trụ sở 8
-- Insert cho cơ sở Hà Tĩnh (ID_Khoa = HTK001 và HTK002)
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('HTSVCN001', N'Nguyen Van Y', '2023-09-01', 'y.nguyen.ht@gmail.com', '2002-01-03', 'HTDA001', 'HTK001'),
('HTSVCN002', N'Tran Thi Anh', '2023-09-01', 'anh.tran.ht@gmail.com', '2002-02-08', 'HTDA001', 'HTK001'),
('HTSVCN003', N'Le Van Binh', '2023-09-01', 'binh.le.ht@gmail.com', '2002-03-13', 'HTDA001', 'HTK001'),
('HTSVCN004', N'Pham Thi Cam', '2023-09-01', 'cam.pham.ht@gmail.com', '2002-04-18', 'HTDA001', 'HTK001'),
('HTSVCN005', N'Hoang Van Dung', '2023-09-01', 'dung.hoang.ht@gmail.com', '2002-05-23', 'HTDA001', 'HTK001'),
('HTSVCN006', N'Dang Thi Em', '2023-09-01', 'em.dang.ht@gmail.com', '2002-06-28', 'HTDA002', 'HTK001'),
('HTSVCN007', N'Vo Van Giang', '2023-09-01', 'giang.vo.ht@gmail.com', '2002-07-02', 'HTDA002', 'HTK001'),
('HTSVCN008', N'Bui Thi Hieu', '2023-09-01', 'hieu.bui.ht@gmail.com', '2002-08-07', 'HTDA002', 'HTK001'),
('HTSVCN009', N'Ngo Van Kieu', '2023-09-01', 'kieu.ngo.ht@gmail.com', '2002-09-12', 'HTDA002', 'HTK001'),
('HTSVCN010', N'Phan Thi Long', '2023-09-01', 'long.phan.ht@gmail.com', '2002-10-17', 'HTDA002', 'HTK001'),
('HTSVKT001', N'Do Van Mai', '2023-09-01', 'mai.do.ht.kt@gmail.com', '2002-11-22', 'HTDA003', 'HTK002'),
('HTSVKT002', N'Ha Thi Nam', '2023-09-01', 'nam.ha.ht.kt@gmail.com', '2002-12-27', 'HTDA003', 'HTK002'),
('HTSVKT003', N'Nguyen Van Oanh', '2023-09-01', 'oanh.nguyen.ht.kt@gmail.com', '2003-01-01', 'HTDA003', 'HTK002'),
('HTSVKT004', N'Tran Thi Phu', '2023-09-01', 'phu.tran.ht.kt@gmail.com', '2003-02-06', 'HTDA003', 'HTK002'),
('HTSVKT005', N'Le Van Quynh', '2023-09-01', 'quynh.le.ht.kt@gmail.com', '2003-03-11', 'HTDA003', 'HTK002'),
('HTSVKT006', N'Pham Thi Rang', '2023-09-01', 'rang.pham.ht.kt@gmail.com', '2003-04-16', 'HTDA004', 'HTK002'),
('HTSVKT007', N'Hoang Van Suong', '2023-09-01', 'suong.hoang.ht.kt@gmail.com', '2003-05-21', 'HTDA004', 'HTK002'),
('HTSVKT008', N'Dang Thi Tai', '2023-09-01', 'tai.dang.ht.kt@gmail.com', '2003-06-26', 'HTDA004', 'HTK002'),
('HTSVKT009', N'Vo Van Uyen', '2023-09-01', 'uyen.vo.ht.kt@gmail.com', '2003-07-31', 'HTDA004', 'HTK002'),
('HTSVKT010', N'Bui Thi Vinh', '2023-09-01', 'vinh.bui.ht.kt@gmail.com', '2003-08-05', 'HTDA004', 'HTK002');
--Trụ sở 9
INSERT INTO SinhVien (ID_SinhVien, TenSinhVien, NamNhapHoc, Email, NgaySinh, ID_DoAn, ID_Khoa) VALUES
('NBSVCN001', N'Nguyễn Hữu A', '2022-09-01', 'a.nguyen.nb@gmail.com', '2000-01-01', 'NBDA001', 'NBK001'),
('NBSVCN002', N'Trần Văn B', '2022-09-01', 'b.tran.nb@gmail.com', '2000-02-10', 'NBDA001', 'NBK001'),
('NBSVCN003', N'Lê Minh C', '2022-09-01', 'c.le.nb@gmail.com', '2000-03-15', 'NBDA001', 'NBK001'),
('NBSVCN004', N'Hoàng Quốc D', '2022-09-01', 'd.hoang.nb@gmail.com', '2000-04-20', 'NBDA001', 'NBK001'),
('NBSVCN005', N'Phạm Thị E', '2022-09-01', 'e.pham.nb@gmail.com', '2000-05-25', 'NBDA001', 'NBK001'),
('NBSVCN006', N'Đỗ Minh F', '2022-09-01', 'f.do.nb@gmail.com', '2000-06-30', 'NBDA002', 'NBK001'),
('NBSVCN007', N'Vũ Hải G', '2022-09-01', 'g.vu.nb@gmail.com', '2000-07-05', 'NBDA002', 'NBK001'),
('NBSVCN008', N'Ngô Thị H', '2022-09-01', 'h.ngo.nb@gmail.com', '2000-08-10', 'NBDA002', 'NBK001'),
('NBSVCN009', N'Lý Văn I', '2022-09-01', 'i.ly.nb@gmail.com', '2000-09-15', 'NBDA002', 'NBK001'),
('NBSVCN010', N'Trịnh Quốc J', '2022-09-01', 'j.trinh.nb@gmail.com', '2000-10-20', 'NBDA002', 'NBK001'),
('NBSVKT001', N'Nguyễn Hữu A', '2022-09-01', 'a2.nguyen.nb@gmail.com', '2000-01-01', 'NBDA003', 'NBK002'),
('NBSVKT002', N'Trần Văn B', '2022-09-01', 'b2.tran.nb@gmail.com', '2000-02-10', 'NBDA003', 'NBK002'),
('NBSVKT003', N'Lê Minh C', '2022-09-01', 'c2.le.nb@gmail.com', '2000-03-15', 'NBDA003', 'NBK002'),
('NBSVKT004', N'Hoàng Quốc D', '2022-09-01', 'd2.hoang.nb@gmail.com', '2000-04-20', 'NBDA003', 'NBK002'),
('NBSVKT005', N'Phạm Thị E', '2022-09-01', 'e2.pham.nb@gmail.com', '2000-05-25', 'NBDA003', 'NBK002'),
('NBSVKT006', N'Đỗ Minh F', '2022-09-01', 'f2.do.nb@gmail.com', '2000-06-30', 'NBDA004', 'NBK002'),
('NBSVKT007', N'Vũ Hải G', '2022-09-01', 'g2.vu.nb@gmail.com', '2000-07-05', 'NBDA004', 'NBK002'),
('NBSVKT008', N'Ngô Thị H', '2022-09-01', 'h2.ngo.nb@gmail.com', '2000-08-10', 'NBDA004', 'NBK002'),
('NBSVKT009', N'Lý Văn I', '2022-09-01', 'i2.ly.nb@gmail.com', '2000-09-15', 'NBDA004', 'NBK002'),
('NBSVKT010', N'Trịnh Quốc J', '2022-09-01', 'j2.trinh.nb@gmail.com', '2000-10-20', 'NBDA004', 'NBK002');



