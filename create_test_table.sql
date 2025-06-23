
create table test(
id INT AUTO_INCREMENT PRIMARY KEY,
user VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL
);

insert INTO test(user,address) VALUES('홍길동','부산');

commit;

select * from test;


# docker container 만들기
# PS C:\Users\NEISII\backend5> docker run --name database -p 3307:3306 -v ${pwd}/volumes/mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_DATABASE=backend mysql:8.0