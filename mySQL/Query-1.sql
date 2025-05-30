--- Q1: Delete duplicate data --- 

drop table if exists cars;
create table cars
(
	model_id		int primary key,
	model_name		varchar(100),
	color			varchar(100),
	brand			varchar(100)
);
insert into cars values(1,'Leaf', 'Black', 'Nissan');
insert into cars values(2,'Leaf', 'Black', 'Nissan');
insert into cars values(3,'Model S', 'Black', 'Tesla');
insert into cars values(4,'Model X', 'White', 'Tesla');
insert into cars values(5,'Ioniq 5', 'Black', 'Hyundai');
insert into cars values(6,'Ioniq 5', 'Black', 'Hyundai');
insert into cars values(7,'Ioniq 6', 'White', 'Hyundai');

select
	*
from
	cars;
	

delete  from cars where model_id not in(
select
	min(model_id) as min_model_id
from
	cars c
group by
	c.model_name ,
	c.brand
order by
	min_model_id asc);
	


delete
from
	cars
where
	ctid in (
	select
		max(ctid)
	from
		cars
	group by
		model_name,
		brand
	having
		count(1) > 1);