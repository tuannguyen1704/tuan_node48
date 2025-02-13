--quy tắc đặt tên table ,column 
-- +tên table ,column ko được phép trùng với keyword trong MYSQL 
-- + nếu tên table, column có từ 2 chữ trở lên => nối những chữ bằng dấu _ 
-- + ký tự đầu tiên không được phép là số 
-- + đặt tên theo kiểu snake case 
create table users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255) NOT NULL ,
	email VARCHAR(255) NOT NULL,
	age INT 
)
INSERT INTO users (full_name, email, age) VALUES
('Nguyen Van A', 'nguyenvana@example.com', 25),
('Tran Thi B', 'tranthib@example.com', 22),
('Le Hoang C', 'lehoangc@example.com', 30),
('Pham Minh D', 'phamminhd@example.com', 28),
('Vo Thanh E', 'vothanhe@example.com', 35),
('Dang Quoc F', 'dangquocf@example.com', 26),
('Hoang Kim G', 'hoangkimg@example.com', 24),
('Nguyen Anh H', 'nguyenanhh@example.com', 27),
('Pham Bao I', 'phambaoi@example.com', 29),
('Le Hong J', 'lehongj@example.com', 23),
('Tran Van K', 'tranvank@example.com', 31),
('Nguyen Quoc L', 'nguyenquocl@example.com', 34),
('Dang Bao M', 'dangbaom@example.com', 28),
('Pham Van N', 'phamvann@example.com', 26),
('Vo Minh O', 'vominho@example.com', 32),
('Le Thanh P', 'lethanhp@example.com', 29),
('Nguyen Hoang Q', 'nguyenhoangq@example.com', 25),
('Tran Kim R', 'trankimr@example.com', 27),
('Hoang Van S', 'hoangvans@example.com', 30),
('Pham Quynh T', 'phamquynht@example.com', 22);



-- tạo table videos 
create table videos (
	video_id INT PRIMARY KEY AUTO_INCREMENT ,
	video_name VARCHAR(255),
	image VARCHAR(255),
	description TEXT,
	user_id INT ,
	FOREIGN KEY (user_id) REFERENCES users(user_id) 
)

-- tạo data cho table users
insert into users(full_name,email,age) VALUES 
('sơn tùng','mtp@gmail.com',30),
('nguyễn văn tuấn','teemoanh2817@gmail.com',22),
('nguyễn hoàng xuân anh','piiumon@gmail.com',22)
select * from users


-- tạo data cho table videos 
insert into videos(video_name,user_id) VALUES 
('nhạc 1',1),
('streetcar',2),
('best part',3)


select * from videos	

select * from users
join videos on videos.user_id=users.user_id



create table like_res (
	res_id INT,
	user_id INT,
	date_like DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (res_id, user_id), 
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
)
INSERT INTO like_res (res_id, user_id, date_like) VALUES
(1, 1, '2024-02-01 12:30:00'),
(1, 2, '2024-02-02 15:45:00'),
(2, 3, '2024-02-03 18:20:00'),
(3, 4, '2024-02-04 20:10:00'),
(2, 5, '2024-02-05 14:05:00'),
(4, 1, '2024-02-06 11:00:00'),
(3, 6, '2024-02-07 16:30:00'),
(5, 7, '2024-02-08 19:40:00'),
(4, 8, '2024-02-09 13:15:00'),
(5, 9, '2024-02-10 17:50:00');



create table restaurant (
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	descr VARCHAR(255)
)
INSERT INTO restaurant (res_name, image, descr) VALUES
('Thai Thai', 'thai_thai.jpg', 'Authentic Thai cuisine with a modern twist'),
('Bangkok Bistro', 'bangkok_bistro.jpg', 'Traditional Thai dishes in a cozy setting'),
('Siam Delight', 'siam_delight.jpg', 'Fusion Thai flavors with fresh ingredients'),
('Golden Elephant', 'golden_elephant.jpg', 'A fine dining experience with Thai specialties'),
('Spicy Basil', 'spicy_basil.jpg', 'Street-style Thai food with bold flavors'),
('Lemongrass Kitchen', 'lemongrass_kitchen.jpg', 'Healthy Thai meals made with organic ingredients'),
('Pad Thai Express', 'pad_thai_express.jpg', 'Quick and delicious Pad Thai dishes'),
('Mango Sticky Rice Cafe', 'mango_sticky_rice.jpg', 'Famous for its Thai desserts and sweet treats'),
('Tom Yum House', 'tom_yum_house.jpg', 'Spicy and sour Tom Yum soup specialists'),
('Green Curry Hut', 'green_curry_hut.jpg', 'Home of the best Green Curry in town');

SELECT * FROM restaurant;


-- Tìm 2 nhà hàng có lượt like nhiều nhất
select count(res.res_id) as 'lượt like',
res.res_name from restaurant as res
join like_res as lr on lr.res_id = res.res_id
group by res.res_name
order by count(res.res_id) desc 
limit 2 

-- tạo table rate_res , food_type
create table rate_res(
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
	amount INT ,
	date_rate date 
)
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2024-02-01'),
(2, 1, 4, '2024-02-02'),
(3, 2, 5, '2024-02-03'),
(4, 3, 3, '2024-02-04'),
(5, 2, 4, '2024-02-05'),
(6, 4, 5, '2024-02-06'),
(7, 5, 2, '2024-02-07'),
(8, 4, 4, '2024-02-08'),
(9, 3, 5, '2024-02-09'),
(10, 2, 3, '2024-02-10'),
(1, 5, 4, '2024-02-11'),
(2, 3, 5, '2024-02-12'),
(3, 1, 3, '2024-02-13'),
(4, 5, 2, '2024-02-14'),
(5, 4, 5, '2024-02-15'),
(6, 2, 4, '2024-02-16'),
(7, 3, 3, '2024-02-17'),
(8, 1, 5, '2024-02-18'),
(9, 5, 4, '2024-02-19'),
(10, 4, 3, '2024-02-20');


create table food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
	
)
INSERT INTO food_type (type_name) VALUES
('Thai Curry'),
('Pad Thai'),
('Tom Yum Soup'),
('Som Tam (Papaya Salad)'),
('Grilled Seafood'),
('Fried Rice'),
('Noodles'),
('Vegetarian Dishes'),
('Spicy Dishes'),
('Street Food'),
('Desserts'),
('Beverages'),
('BBQ & Grilled'),
('Soup & Broth'),
('Salads'),
('Rice Dishes'),
('Appetizers'),
('Spicy Salads'),
('Coconut-Based Dishes'),
('Fusion Thai Cuisine');

-- tạo table food 
create table food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	price double ,
	image VARCHAR(255),
	description TEXT,
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)
INSERT INTO food (food_name, price, image, description, type_id) VALUES
('Green Curry', 8.99, 'green_curry.jpg', 'A creamy and spicy Thai green curry with coconut milk and basil.', 1),
('Pad Thai', 7.99, 'pad_thai.jpg', 'Stir-fried noodles with shrimp, tofu, peanuts, and tamarind sauce.', 2),
('Tom Yum Soup', 6.99, 'tom_yum_soup.jpg', 'A hot and sour Thai soup with shrimp, lemongrass, and chili.', 3),
('Som Tam', 5.99, 'som_tam.jpg', 'A refreshing papaya salad with peanuts, tomatoes, and a spicy dressing.', 4),
('Grilled Prawns', 12.99, 'grilled_prawns.jpg', 'Juicy grilled prawns marinated in Thai spices.', 5),
('Thai Fried Rice', 7.49, 'thai_fried_rice.jpg', 'Classic Thai fried rice with chicken, egg, and vegetables.', 6),
('Drunken Noodles', 8.49, 'drunken_noodles.jpg', 'Spicy stir-fried noodles with basil and vegetables.', 7),
('Vegetable Stir-Fry', 6.99, 'vegetable_stir_fry.jpg', 'Fresh vegetables stir-fried in a light soy sauce.', 8),
('Spicy Basil Chicken', 8.99, 'spicy_basil_chicken.jpg', 'Stir-fried chicken with basil and chili.', 9),
('Thai Spring Rolls', 5.49, 'thai_spring_rolls.jpg', 'Crispy spring rolls stuffed with vegetables and served with dipping sauce.', 10),
('Mango Sticky Rice', 6.99, 'mango_sticky_rice.jpg', 'Sweet mango with coconut sticky rice and sesame seeds.', 11),
('Thai Iced Tea', 3.99, 'thai_iced_tea.jpg', 'Chilled Thai tea with condensed milk.', 12),
('BBQ Chicken Skewers', 9.99, 'bbq_chicken_skewers.jpg', 'Grilled chicken skewers marinated in Thai BBQ sauce.', 13),
('Chicken Coconut Soup', 7.99, 'chicken_coconut_soup.jpg', 'Creamy coconut soup with chicken and galangal.', 14),
('Larb Gai', 7.49, 'larb_gai.jpg', 'A spicy minced chicken salad with lime and herbs.', 15),
('Pineapple Fried Rice', 8.99, 'pineapple_fried_rice.jpg', 'Fried rice with pineapple, cashews, and curry powder.', 16),
('Thai Fish Cakes', 6.99, 'thai_fish_cakes.jpg', 'Crispy fish cakes with Thai herbs and sweet chili sauce.', 17),
('Spicy Beef Salad', 9.49, 'spicy_beef_salad.jpg', 'Sliced beef with chili, lime, and fresh herbs.', 18),
('Coconut Shrimp Curry', 11.49, 'coconut_shrimp_curry.jpg', 'Shrimp cooked in a creamy coconut curry sauce.', 19),
('Fusion Thai Pizza', 12.99, 'fusion_thai_pizza.jpg', 'A unique Thai-inspired pizza with spicy toppings.', 20);

--tao table orders 
create table orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES food(food_id),
	amout INT,
	code VARCHAR(10),
	arr_sub_id VARCHAR(255)
)
INSERT INTO orders (user_id, food_id, amout, code, arr_sub_id) VALUES
(1, 3, 2, 'ORD001', 'SUB001'),
(2, 5, 1, 'ORD002', 'SUB002'),
(3, 7, 3, 'ORD003', 'SUB003'),
(4, 2, 1, 'ORD004', 'SUB004'),
(5, 10, 2, 'ORD005', 'SUB005'),
(6, 15, 1, 'ORD006', 'SUB006'),
(7, 8, 4, 'ORD007', 'SUB007'),
(8, 12, 2, 'ORD008', 'SUB008'),
(9, 6, 3, 'ORD009', 'SUB009'),
(10, 14, 1, 'ORD010', 'SUB010'),
(1, 11, 2, 'ORD011', 'SUB011'),
(2, 9, 1, 'ORD012', 'SUB012'),
(3, 4, 3, 'ORD013', 'SUB013'),
(4, 13, 2, 'ORD014', 'SUB014'),
(5, 20, 1, 'ORD015', 'SUB015'),
(6, 17, 2, 'ORD016', 'SUB016'),
(7, 19, 3, 'ORD017', 'SUB017'),
(8, 16, 1, 'ORD018', 'SUB018'),
(9, 18, 2, 'ORD019', 'SUB019'),
(10, 1, 4, 'ORD020', 'SUB020');

-- CÂU 3: TÌM NGƯỜI ĐẶT HÀNG NHIỀU NHẤT 
SELECT count(u.user_id) as 'lượng order',
u.full_name FROM users as u 
join orders as o on o.user_id=u.user_id
group by u.full_name
order by count(u.user_id) desc 
limit 1

-- CÂU 4 TÌM NGƯỜI KHÔNG HOẠT ĐỘNG 
-- TÌM NGƯỜI KO LIKE VÀ KO ĐÁNH GIÁ HAY ORDER GÌ HẾT 
SELECT * FROM users as u
left join like_res as lr on u.user_id=lr.user_id
left join rate_res as rr on u.user_id=rr.user_id
left join orders as o on o.user_id=u.user_id	
where lr.user_id is null 
and rr.user_id is null 
and o.user_id is null 










