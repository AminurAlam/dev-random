drop table admins;
CREATE table admins (
    username varchar(20),
    password varchar(20)
);

insert into admins values ('ff', 'ff');

drop table students;
CREATE table students (
    roll int primary key,
    name varchar(20)
);

insert into students values (01, 'ape');
insert into students values (02, 'bat');
insert into students values (03, 'cat');
insert into students values (04, 'dog');
insert into students values (05, 'eel');
