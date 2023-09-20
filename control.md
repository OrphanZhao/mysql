# 约束

##### 概述

- 概念
  - 作用于表中字段上的规则，用于限制存储在表中的数据
- 目的
  - 保证数据库中数据的正确性有效性和完整性
- 分类
  | **约束** | **描述** | **关键字** |
  | --- | --- | --- |
  | 非空约束 | 限制该字段的数据不能为 null | not null |
  | 唯一约束 | 保证该字段的所有数据都是唯一、不重复的 | unioue |
  | 主键约束 | 主键是一行数据的唯一标识，要求非空且唯一 | primary key |
  | 默认约束 | 保存数据时，如果未指定该字段的值，则采用默认值 | default |
  | 检查约束（8.0.16 版本之后） | 保证字段值满足一个条件 | check |
  | 外键约束 | 用来让两张表的数据之间建立连接，保证数据的一致性和完整性 | foreign key |

##### 约束演示

| **字段名**     | **字段含义** | **字段类型** | **约束条件**               | **约束关键字** |
| -------------- | ------------ | ------------ | -------------------------- | -------------- |
| id             | ID 唯一标识  | int          | 主键并且自动增长           | primary key    |
| auto_increment |
| name           | 姓名         | varchar(10)  | 不为空，且唯一             | not null       |
| unioue         |
| age            | 年龄         | int          | 大于 0，并且小于等于 120   | check          |
| status         | 状态         | char(1)      | 如果没有指定该值，默认为 1 | default        |
| gender         | 性别         | char(1)      | 无                         |                |

```sql
create table user(
  id int comment '主键' primary key auto_increment,
  name varchar(10) comment '姓名' not null unique,
  age int comment '年龄' check ( age > 0 and age <= 120),
  status char(1) comment '状态' default '1',
  gender char(1) comment '性别'
) comment '用户表';
```

##### 外键约束

- 概念
  - 外键是用来让两张表的数据之间建立连接，从而保证数据的一致性和完整性
- 添加外键

```sql
create table 表名(
  字段名 数据类型,
  [constraint] [外键名称] foreign key (外键字段名) references 主表(主表列名)
);
alter table 表名 add constriant 外键名称 foreign key (外键字段名) references 主表(主表列名) on update [行为] on delete [行为];
```

- 🌰

```sql
create table department(
    id int comment '主键' primary key auto_increment,
    name varchar(50) comment '部门' not null
) comment '部门表';

insert into department (name) values ('研发部'),('市场部'),('财务部'),('销售部'),('总裁办');

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


insert into employee (name, age, job, salary, entry_data, manager_id, department_id) values (rand(), floor(rand()*100), '总裁', '200000', now(), 0, 5)
,(rand(), floor(rand()*100), '总裁', '20000', now(), 0, 1),(rand(), floor(rand()*100), '总裁', '20000', now(), 0, 1),(rand(), floor(rand()*100), '总裁', '20000', now(), 0, 1);

alter table employee add constraint foreign key (department_id) references department(id);

alter table employee drop foreign key fk_emp_department_id;
```

- 删除和更新行为
  | **行为** | **说明** |
  | --- | --- |
  | no action | 当在父表中删除/更新对应记录时，首先检查该记录是否有对应外键，如果有则不允许删除/更新。（与 restrict 一致） |
  | restrict | 当在父表中删除/更新对应记录时，首先检查该记录是否有对应外键，如果有则不允许删除/更新。（与 no action 一致） |
  | cascade | 当在父表中删除/更新对应记录时，首先检查该记录是否有对应外键，如果有，则也删除/更新外键在子表中的记录。 |
  | set null | 当在父表中删除对应记录时，首先检查该记录是否有对应外键，如果有则设置子表中该外键值为 null（这就要求该外键允许取 null） |
  | set default | 父表有变更时，子表将外键列设置成一个默认的值（innodb 不支持） |

- **Todo 外键删除之后、键表语句并没有把外键信息删除**
