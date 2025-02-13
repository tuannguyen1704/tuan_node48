-- cách 1:tạo database trực tiếp từ tablePlus
-- cách bôi đen là ctrl + ? 

-- cách 2:tạo database từ code SQL 
-- ctrl + enter để chạy code
create database node48_test 
-- lưu ý chỉ nên tạo database 1 lần 

-- để dùng databse mới tạo thì dùng use 
use node48_test 

-- tạo table 
CREATE TABLE product(
-- 	tên column -- kiểu dữ liệu -- constraint 
	product_name VARCHAR(100) NOT NULL ,
	image VARCHAR(255),
	price DOUBLE,
	rate INT 
)

-- tạo data cho table product 
INSERT INTO product (product_name, image, price, rate) VALUES
('iPhone 15 Pro Max', 'iphone15promax.jpg', 1399.99, 5),
('Samsung Galaxy S23 Ultra', 's23ultra.jpg', 1299.99, 5),
('MacBook Pro M2', 'macbookpro_m2.jpg', 2499.99, 5),
('Dell XPS 15', 'dellxps15.jpg', 1999.99, 4),
('Sony WH-1000XM5', 'sony_wh1000xm5.jpg', 399.99, 5),
('Bose QuietComfort 45', 'bose_qc45.jpg', 329.99, 4),
('iPad Pro 12.9', 'ipadpro_12_9.jpg', 1099.99, 5),
('Asus ROG Strix G16', 'asus_rog_strix_g16.jpg', 1799.99, 5),
('HP Spectre x360', 'hp_spectre_x360.jpg', 1599.99, 4),
('Logitech MX Master 3', 'logitech_mx_master_3.jpg', 99.99, 5),
('Nintendo Switch OLED', 'switch_oled.jpg', 349.99, 5),
('PlayStation 5', 'ps5.jpg', 499.99, 5),
('Xbox Series X', 'xbox_series_x.jpg', 499.99, 4),
('GoPro Hero 11', 'gopro_hero_11.jpg', 399.99, 5),
('DJI Mini 3 Pro', 'dji_mini_3_pro.jpg', 799.99, 4),
('Apple Watch Ultra', 'apple_watch_ultra.jpg', 799.99, 5),
('Garmin Fenix 7X', 'garmin_fenix_7x.jpg', 899.99, 4),
('Razer BlackWidow V4', 'razer_blackwidow_v4.jpg', 179.99, 5),
('Corsair K95 RGB Platinum', 'corsair_k95_rgb.jpg', 199.99, 4),
('MSI GeForce RTX 4090', 'msi_rtx_4090.jpg', 1799.99, 5);


-- dùng code SQL để query data 
SELECT * FROM product 
SELECT product_name,image FROM product 
SELECT product_name AS 'Tên sản phẩm ' FROM product 


-- tạo table users (full_name,email,phone,address,age)
CREATE TABLE users(
	full_name varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	phone VARCHAR(20),
	address VARCHAR(255),
	age INT 
)

--tạo data cho users 
INSERT INTO users (full_name, email, phone, address, age) VALUES
('Nguyễn Văn A', 'nguyenvana@example.com', '0987654321', '123 Đường ABC, Hà Nội', 30),
('Trần Thị B', 'tranthib@example.com', '0978123456', '456 Đường XYZ, TP. Hồ Chí Minh', 28),
('Lê Văn C', 'levanc@example.com', '0912345678', '789 Đường LMN, Đà Nẵng', 35),
('Phạm Thị D', 'phamthid@example.com', '0908765432', '321 Đường UVW, Cần Thơ', 27),
('Hoàng Minh E', 'hoangminhe@example.com', '0934123456', '654 Đường RST, Hải Phòng', 40),
('Đặng Thùy F', 'dangthuyf@example.com', '0921456789', '987 Đường OPQ, Nha Trang', 22),
('Võ Thành G', 'vothanhg@example.com', '0981122334', '159 Đường GHI, Bình Dương', 31),
('Ngô Bảo H', 'ngobaoh@example.com', '0977888899', '753 Đường DEF, Đà Lạt', 29),
('Lý Hải I', 'lyhaii@example.com', '0966555444', '852 Đường MNO, Huế', 33),
('Dương Thanh J', 'duongthanhj@example.com', '0955667788', '369 Đường PQR, Bắc Ninh', 26),
('Bùi Thị K', 'buithik@example.com', '0944111222', '741 Đường STU, Nam Định', 24),
('Tạ Quốc L', 'taquocl@example.com', '0933999666', '258 Đường VWX, Hải Dương', 37),
('Đỗ Văn M', 'dovanm@example.com', '0922111444', '654 Đường YZA, Quảng Ninh', 45),
('Cao Thanh N', 'caothanhn@example.com', '0911333222', '123 Đường BCD, Phú Quốc', 23),
('Hà Bích O', 'habicho@example.com', '0900999888', '456 Đường CDE, Vũng Tàu', 38),
('Lương Văn P', 'luongvanp@example.com', '0988222333', '789 Đường FGH, Bình Thuận', 41),
('Tống Thị Q', 'tongthiq@example.com', '0977555666', '321 Đường HIJ, Bạc Liêu', 32),
('Phan Hữu R', 'phanhuur@example.com', '0966777888', '654 Đường KLM, Đồng Nai', 27),
('Trịnh Minh S', 'trinhminhs@example.com', '0955888999', '987 Đường NOP, Hà Nam', 34),
('Vũ Ngọc T', 'vungoct@example.com', '0944777888', '258 Đường QRS, Thái Bình', 39);

SELECT * FROM users

-- query filter data
-- liệt kê những user có tuổi từ 25-30
--và sắp xếp tăng dần và giảm dần
-- asc là tăng dần 
-- desc là giảm dần 
SELECT * FROM users 
WHERE age between 25 and 30 
ORDER BY age ASC 

select * from users 
where 25 > age  and age < 30 
order by age DESC 

-- tìm những người có tên là John
SELECT * FROM users
WHERE full_name LIKE '%Nguyễn Văn A%'

-- liệt kê những người có tuổi lớn nhất 
select * from users
where age = (
	select age from users
	order by age DESC 
	limit 1 
)

select * from users 
where age = (
	select max(age) from users 
)

-- đếm số lượng users trong danh sách 
select count(*) as 'tổng số users' from users

-- update và delete data 
update users set age = 20 
where full_name = 'Nguyễn Văn A'

select * from users
where full_name like '%Nguyễn Văn A%'

-- update list user
update users set age = 40
where full_name in ('Nguyễn Văn A','Trần Thị B')

-- delete users 
delete from users 
where full_name = 'Bùi Thị K'


-- update table 
-- case1 thêm column
alter table users
add column gender int default 1

select * from users

-- case2 update datatype cho column 
alter table users 
modify column full_name varchar(100) not null 
/*
b1 git status(kiểm tra các file ,folder code đã change)
b2 git add . (thêm tất cả các file code vào commit)
b3 git commit -m "message" (commit code)
b4 git push origin <ten branch > (đẩy code lên github)
b5 git checkout -b <ten branch > main (chuyển branch)
b6 git push origin <ten branch > (đẩy nhánh mới lên github)
*/

/*
*các bước để tạo source expressJS 
b1 npm init để tạo file package,json
b2 cài thư viện express
npm i express 
b3 tạo file index.js để chứa toàn bộ code của BE 
*/






