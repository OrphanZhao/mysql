# demo为测试数据库

# ---- DDL ----

# 所有数据库
show databases;
# 创建数据库
create database if not exists demo default charset utf8;
# 删除数据库
drop database if exists demo;
# 使用数据库
use demo;
# 当前使用的数据库
select database();

# user为demo数据库下的一个表
# 所有表
show tables;
# 表信息
desc user;
# 创建表信息
show create table user;
# 创建表
create table user(
    id int comment '唯一标示',
    name varchar(20) comment '名称',
    age tinyint comment '描述',
    gender char(1) comment '性别'
) comment '表描述';
# 删除表
drop table if exists user;
# 删除表并重新创建该表
truncate table user;
# 表重命名
alter table user rename to users;
# 表添加字段
alter table user add age tinyint comment '年龄';
# 删除表字段
alter table user drop age;
# 修改表字段的类型
alter table user modify description varchar(100) comment '修改类型';
# 修改表字段的名字和类型
alter table user change description age tinyint comment '年龄';

# ---- DML ----

# 指定字段插入数据
insert into user(id,name,age) values (1,'小明',18);
# 不指定字段插入数据
insert into user values (2,'小红',19);
# 批量添加 --> 指定/不指定
insert into user(id,name,age) values (3,'小里',20),(4,'小是',20),(5,'小三',20);
insert into user values (6,'小红',19),(7,'小红',19),(8,'小红',19);
# 修改数据
update user set name='小明-1' where id=1;
# 修该多个字段值
update user set name='小红-2',age=80 where id=2;
# 修改整张表的这个字段值
update user set age=1;
# 删除表数据
delete from user where id=1;
# 删除表里的所有数据
delete from user;

# ---- DQL ----

# 查询指定字段
select id,name from user;
# 查询所有字段
select * from user;
# 别名
select name as username from user;
# 去除重复
select distinct name from user;
# 条件查询
select * from user where id=1;
select * from user where id!=1;
select * from user where id>1;
select * from user where id>=1;
select * from user where id<8;
select * from user where id<=8;
select * from user where name is null;
select * from user where name is not null;
select * from user where age>=19 and age<20;
select * from user where age between 18 and 19;
select * from user where name='小三' or name='小里' or age=20;
select * from user where age in(20,18);
select * from user where name like '%红';
# 聚合函数
select max(age) from user;
select min(age) from user;
select count(age) from user;
select avg(age) from user;
select sum(age) from user;
select sum(age) from user where name='小红';
# 分组查询
select count(*) from user group by gender;
select gender,count(*) from user where age in (19,20) group by gender having count(*)=3;
# 排序查询
select * from user order by age asc;
select * from user order by age desc;
select * from user order by age desc,id asc;
# 分页查询
select * from user limit 0,5;

select date_add(now(), interval 70 day )

