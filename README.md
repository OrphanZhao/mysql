# mysql

## 编写规范

- sql 单行和多行、以分号结尾
- tab 或者空格实现缩进
- 不区分大小写
- --或者# 单行注释
- /\*\*/ 多行注释

## sql 分类

- DDL 数据定义语言
  - 定义数据库、表、字段
- DML 数据库操作语言
  - 对数据库的数据进行增删改
- DQL 数据库查询语言
  - 对数据库的数据进行查询
- DCL 数据库控制语言
  - 对数据库本身的操作用户权限限制

## 图形化工具

- Datagrip
- Navicat

## DDL

##### DDL-基础

- 查询所有数据库
  - show databases；
- 返回当前正在 use 使用的数据库
  - select database()；
- 创建数据库
  - create database [if not exists] 数据库名 [default charset 字符集] [collate 排序规则]
- 删除数据库
  - drop database [if exists] 数据库名
- 使用数据库
  - use 数据库名

##### DDL-表操作

- 查询当前数据库的所有表
  - show tables
- 查看当前表结构
  - desc 表名
- 查询表的创建语句
  - show create table 表名
- 创建表
  - create table 表名(字段 1 字段 1 类型[comment 字段 1 注释])[comment 表注释]
  - 多个字段时，最后一个逗号需要省略

##### DDL-表操作-数据类型

- 数据类型
  - 数值类型
  - 字符串类型
  - 日期时间类型
- 注意
  - 有符号和无符号代表正负数
  - 二进制数据一般会统一管理、采用云服务、静态资源 cdn

##### DDL-表操作-修改

- 添加表字段
  - alter table 表名 add 字段名 类型(长度) [comment 注释] [约束]
- 修改表字段
  - 修改字段的类型
    - alter table 表名 modify 字段名 类型(长度)
  - 修改字段名和字段类型
    - alter table 表名 change 老字段名 新字段名 类型(长度) [comment 注释][约束]
- 删除表字段
  - alter table 表名 drop 字段名
- 修改表名
  - alter table 表名 rename to 新表名

##### DDL-表操作-删除

- 删除表
  - drop table [if exists] 表名
- 删除制定表并重新创建该表
  - truncate table 表名

## DML

##### DML-基础

- 增 insert
  - 给指定字段
    - insert into 表名 (字段 1,字段 2) values (值 1,值 2)
  - 给全部字段
    - insert into 表名 values (值 1, 值 2)
  - 批量添加数据
    - insert into 表名 values (值 1,值 2),(值 1,值 2)
- 改 update
  - update 表名 set 字段 1=值 1，字段 2=值 2...[where 条件]；
  - 没有条件修改的就是整个表的数据；
- 删 delete
  - delete form 表名 [where 条件]
- 注意
  - 插入数据时，指定的字段顺序需要和值的顺序一一对应
  - 字符串和日期类型应该包含在引号内
  - 插入的数据大小，应该在字段的规定范围内

## DQL

##### DQL-基础

- select
  - 字段列表
- from
  - 表名列表
- where
  - 条件列表
- group by
  - 分组字段列表
- having
  - 分组后条件列表
- order by
  - 排序字段列表
- limit
  - 分页参数

##### DQL-基础查询

- 查询多个字段
  - select 字段 1，字段 2，字段 3 from 表名；
  - select \* from 表名；
- 设置别名
  - select 字段 1 as 别名 1，字段 2 as 别名 2 from 表名；
- 去除重复记录
  - select distinct 字段列表 from 表名；

##### DQL-条件查询

- 语法
  - select 字段列表 from 表名 where 条件列表；
- 条件集合
  - `>`
  - `>=`
  - `<`
  - `<=`
  - `<> !=`
  - between 最小值 and 最大值
    - 包含连个边界值
  - in(...)
    - in 之后的列表中多选一，类似于 includes
  - link 占位符
    - 模糊匹配（\_匹配单个字符，%匹配任意个字符）
  - is null
  - and &&
  - or ||
  - not !

##### DQL-聚合函数

- 语法
  - select 聚合函数（字段列表）from 表名；
- 聚合函数
  - count 数量
  - max 最大值
  - min 最新值
  - avg 平均值
  - sum 总和
- 所有的 null 值不参与聚合函数的计算

##### DQL-分组查询

- 语法
  - select 字段列表 from 表名 [where 条件] group by 分组字段名 [having 分组后的过滤条件]；
- where 和 having 区别
  - 执行的时机不同，where 是分组之前过滤，不满足 where 条件不参与分组，having 是分组之后的结果进行过滤
  - 判断条件不同，where 不能对聚合函数进行判断，having 是可以的，并且可以使用别名判断
- 注意
  - 执行顺序：where>聚合函数>having
  - 分组之后查询的字段一般为聚合函数和分组字段，查询其它字段没有意义

##### DQL-排序查询

- 语法
  - select 字段列表 from 表名 order by 字段 1 排序方式 1，字段 2 排序方式 2；
- 排序方式
  - ASC 默认值升序
    - 查询时可以省略
  - DESC 降序
- 注意
  - 多字段排序，第一个字段值相同时才会根据第二个字段值进行排序

##### DQL-分页查询

- 语法
  - select 字段列表 from 表名 limit 起始索引，查询记录数；
- 注意
  - 起始索引是从 0 开始的，起始索引=（查询页码-1）\*每页显示记录数
  - 分页查询是数据库的方言，不同数据库有不同的实现，mysql 中为 limit
  - 如果查询的是第一页数据，起始索引可以省略，简写为 limit 10

##### DQL-执行顺序

- 执行顺序
  - from
    - 表名列表
  - where
    - 条件列表
  - group by
    - 分组字段列表
  - having
    - 分组后条件列表
  - select
    - 字段列表
  - order by
    - 排序字段列表
  - limit
    - 分页列表
- 注意
  - 编写顺序并不是查询顺序
