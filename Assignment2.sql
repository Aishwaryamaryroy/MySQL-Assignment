create database sales;
use sales;
create table orders (
order_id int primary key unique not null,
customer_name varchar(50) not null,
product_category varchar(50) not null,
ordered_item varchar(50) not null,
contact_no varchar(50) not null
);
alter table orders add order_quantity int not null;
alter table orders rename to sales_order;
insert into sales_order (order_id,customer_name,product_category,ordered_item,contact_no,order_quantity)
values
 
(1, 'Aishwarya', 'Electronics', 'Smartphone', '1234567890', 2),
(2, 'Bobby', 'Home Appliance', 'Air Conditioner', '0987654321', 1),
(3, 'Charlie ', 'Furniture', 'Dining Table', '1230984567', 1),
(4, 'David ', 'Electronics', 'Laptop', '3216549870', 1),
(5, 'Emma', 'Clothing', 'Jacket', '6547891230', 3),
(6, 'France', 'Books', 'Novel', '7894561230', 2),
(7, 'Gowri', 'Grocery', 'Rice Bag', '4561237890', 5),
(8, 'Harry', 'Stationery', 'Notebook', '3217896540', 10),
(9, 'Kevin', 'Toys', 'Action Figure', '1472583690', 4),
(10, 'Jenny', 'Electronics', 'Headphones', '9638527410', 2);

select customer_name,ordered_item from sales_order;
update sales_order
set ordered_item='Washing Mashine'
where order_id=2;
select * from sales_order;
drop table sales_order;