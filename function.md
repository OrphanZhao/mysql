# 函数

## 函数分类

##### 字符串函数

- 语法
  - select 函数（参数字符串）
- 常用合集
  | **函数** | **功能** |
  | --- | --- |
  | concat(s1,s2,...sn) | 字符串拼接 |
  | lower(s) | 转小写 |
  | upper(s) | 转大写 |
  | lpad(s,n,pad) | 左填充，用字符串 pad 对 str 进行左填充，达到 n 个字符长度 |
  | rpad(s,n,pad) | 右填充，用字符串 pad 对 str 进行右填充，达到 n 个字符长度 |
  | trim(s) | 去掉字符串首尾的空格 |
  | substring(s,start,len) | 返回 s 从 start 起 len 长度的字符串
  注意 ⚠️：1 就是字符串的第一位，和语言的第一位是 0 不同 |

- 🌰
  - 工号补零
  - update user set workid=lpad(workid,5,'0');

##### 数值函数

- 语法
  - select 函数（参数字符串）
- 常用合集
  | **函数** | **功能** |
  | --- | --- |
  | ceil(num) | 向上取证 |
  | floor(num) | 向下取证 |
  | mod(x,y) | 取 x/y 的余数 |
  | rand() | 返回 0-1 内的随机数 |
  | round(x,y) | 求参数 x 四舍五入的值，保留 y 味的小数 |

- 🌰
  - select lpad(round(rand()\*1000000,0),6,'0');

##### 日期函数

- 语法
  - select 函数（参数字符串）
- 常用集合
  | **函数** | **功能** |
  | --- | --- |
  | curdate() | 当前日期 yyyy-mm-dd |
  | curtime() | 当前时间 hh:mm:ss |
  | now() | 当前日期和时间 yyyy-mm-dd hh:mm:ss |
  | year(date) | 指定 date 年份 yyyy |
  | month(date) | 指定 date 月份 mm |
  | day(date) | 指定 date 的日期 dd |
  | date_add(date,interval expr type) | 日期/时间值 date 加上时间间隔 expr 后的时间值，type 表示时间的类型，例如 year |
  | datediff(date1,date2) | 起始时间和结束时间之间的天数，date1-date2 存在负数的情况 |

- 🌰
  - 查询入职员工的天数，并进行倒序
    - select name, datediff(curdate(), entrydate) as entrydays from user order by entrydays desc;

##### 流程函数

- 作用
  - 条件筛选
  - 查询的字段做逻辑处理
- 语法
  - select 函数（参数字符串）
- 常用集合
  | **函数** | **功能** |
  | --- | --- |
  | if(value,t,f) | 类似三元表达式，value 为 true，返回 t 否则返回 f |
  | ifnull(value1, value2) | 如果 value1 不为空返回 value1，为空返回 value2
  不为空准确来说是不返回 null |
  | case when [val1] then [res1] ...else [default] end | 如果 val1 为 true，返回 res1，...否则返回 default 默认值 |
  | case [expr] when [val1] then [res1] ...else [default] end | 如果 expr 的值等于 val1，返回 res1，...否则返回 default 默认值 |

- 🌰
  - 查询学生的分数并根据分数返回优秀、及格、不及格
    - select id,name,case when math>=90 then '优秀' else '不及格' end '数学' form score;
