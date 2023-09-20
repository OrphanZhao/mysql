create table user(
    id int comment '主键' primary key auto_increment,
    name varchar(10) comment '姓名' not null unique,
    age int comment '年龄' check ( age>0 and age<=120),
    status char(1) comment '状态' default '1',
    gender char(1) comment '性别'
) comment '用户表';

create table department(
    id int comment '主键' primary key auto_increment,
    name varchar(50) comment '部门' not null
) comment '部门表';


create table employee(
    id int comment '主键' primary key auto_increment,
    name varchar(50) comment '姓名' not null,
    age int comment '年龄' check ( age > 0 and age <= 120 ),
    job varchar(20) comment '职位' not null,
    salary int comment '薪资' not null,
    entry_data date comment '薪资' not null,
    manager_id int comment '直属领导ID' not null,
    department_id int comment '部门ID' not null
) comment '员工表';


delete from department where id=5;
