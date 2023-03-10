create database IF NOT EXISTS qnucinema;
use qnucinema;

CREATE TABLE IF NOT EXISTS role(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL unique,
  code VARCHAR(255) NOT NULL unique,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS user (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  roleid bigint NOT NULL,
  username VARCHAR(150) NOT NULL,
  password VARCHAR(150) NOT NULL,
  fullname VARCHAR(150) NULL,
  email varchar(255),
  phone varchar(15),
  status int NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE user ADD CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES role(id);

CREATE TABLE IF NOT EXISTS film (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  title VARCHAR(255) NULL,
  thumbnail VARCHAR(255) NULL,
  cast VARCHAR(255) NULL,
  genre VARCHAR(255) NULL,
  director VARCHAR(255) NULL,
  rated VARCHAR(255) NULL,
  release_date timestamp NULL,
  running_time VARCHAR(100) NULL,
  description text NULL,
  trailer VARCHAR(100) NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS cinema(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL,
  description TEXT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

CREATE TABLE IF NOT EXISTS bill(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  idcustomer bigint NOT NULL unique,
  idfilm bigint NOT NULL unique,
  idcinema bigint not null,
  seat varchar(250) not null,
  price bigint not null,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE bill ADD CONSTRAINT fk_bill_cus FOREIGN KEY (idcustomer) REFERENCES user(id);
ALTER TABLE bill ADD CONSTRAINT fk_bill_film FOREIGN KEY (idfilm) REFERENCES film(id);
ALTER TABLE bill ADD CONSTRAINT fk_bill_cinema FOREIGN KEY (idcinema) REFERENCES cinema(id);

CREATE TABLE IF NOT EXISTS schedules(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  idfilm bigint NOT NULL unique,
  idcinema bigint not null,
  timestart timestamp not null,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE schedules ADD CONSTRAINT fk_schedules_film FOREIGN KEY (idfilm) REFERENCES film(id);
ALTER TABLE schedules add CONSTRAINT fk_schedeles_cinema FOREIGN KEY (idcinema) REFERENCES cinema(id);

CREATE TABLE IF NOT EXISTS post(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  title VARCHAR(255) NULL,
  thumbnail VARCHAR(255) NULL,
  shortdescription TEXT NULL,
  content TEXT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

insert into role(code,name) values('ADMIN','Qu???n Tr??? Vi??n');
insert into role(code,name) values('USER','Kh??ch H??ng');

insert into user(username, password, fullname, status, roleid, email, phone) values("admin", "$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG", "Ho??i Thu", 1, 1, "admin@gmail.com", "0123465978");
insert into user(username, password, fullname, status, roleid, email, phone) values("nguyenvana", "$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG", "Nguy???n V??n A", 1, 2, "nguyenvana@gmail.com", "1323465978");
insert into user(username, password, fullname, status, roleid, email, phone) values("phanthanhhao", "$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG", "Phan Thanh H???o", 1, 1, "phanvanb@gmail.com", "01234656241");
insert into user(username, password, fullname, status, roleid, email, phone) values("tranvanbinh", "$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG", "Tr???n V??n B??nh", 1, 1, "tranthic@gmail.com", "012375424242");

INSERT INTO `qnucinema`.`film` (`cast`, `description`, `director`, `genre`, `rated`, `release_date`, `running_time`, `thumbnail`, `title`, `trailer`) VALUES ('Johny Tr?? Nguy???n', 'phim hay', 'Dustin Nguy???n', 'H??nh ?????ng, C??? trang', 'C???m tr??? em d?????i 15 tu???i', '10-10-2018', '1h45\'', 'dong-mau-anh-hung.jpg', 'D??ng M??u Anh H??ng', 'http://www.youtube.com');
INSERT INTO `qnucinema`.`film` (`cast`, `description`, `director`, `genre`, `rated`, `release_date`, `running_time`, `thumbnail`, `title`, `trailer`) VALUES ('Tr?????ng Giang, M???c V??n Khoa', 'phim hay', 'Tr?????ng Giang', 'H??i nh???m nh??', 'C???m tr??? em d?????i 5 tu???i', '10-10-2018', '1h45\'', '30-chua-phai-la-tet.jpg', '30 Ch??a Ph???i L?? T???t', 'http://www.youtube.com');
INSERT INTO `qnucinema`.`film` (`cast`, `description`, `director`, `genre`, `rated`, `release_date`, `running_time`, `thumbnail`, `title`, `trailer`) VALUES ('Jane Foster, Cris Hemwork', 'phim hay', 'Jane Foster', 'Vi???n t?????ng, H??nh ?????ng', 'C???m tr??? em d?????i 10 tu???i', '10-10-2018', '1h45\'', 'thor-love-thunder.jpg', 'Thor: Love And Thunder', 'http://www.youtube.com');
INSERT INTO `qnucinema`.`film` (`cast`, `description`, `director`, `genre`, `rated`, `release_date`, `running_time`, `thumbnail`, `title`, `trailer`) VALUES ('Johny Tr?? Nguy???n', 'phim hay', 'Dustin Nguy???n', 'H??nh ?????ng, C??? trang', 'C???m tr??? em d?????i 15 tu???i', '10-10-2018', '1h45\'', 'dong-mau-anh-hung.jpg', 'D??ng M??u Anh H??ng', 'http://www.youtube.com');
INSERT INTO `qnucinema`.`film` (`cast`, `description`, `director`, `genre`, `rated`, `release_date`, `running_time`, `thumbnail`, `title`, `trailer`) VALUES ('Johny Tr?? Nguy???n', 'phim hay', 'Dustin Nguy???n', 'H??nh ?????ng, C??? trang', 'C???m tr??? em d?????i 15 tu???i', '10-10-2018', '1h45\'', 'dong-mau-anh-hung.jpg', 'D??ng M??u Anh H??ng', 'http://www.youtube.com');
INSERT INTO `qnucinema`.`film` (`cast`, `description`, `director`, `genre`, `rated`, `release_date`, `running_time`, `thumbnail`, `title`, `trailer`) VALUES ('Johny Tr?? Nguy???n', 'phim hay', 'Dustin Nguy???n', 'H??nh ?????ng, C??? trang', 'C???m tr??? em d?????i 15 tu???i', '10-10-2018', '1h45\'', 'dong-mau-anh-hung.jpg', 'D??ng M??u Anh H??ng', 'http://www.youtube.com');
INSERT INTO `qnucinema`.`film` (`cast`, `description`, `director`, `genre`, `rated`, `release_date`, `running_time`, `thumbnail`, `title`, `trailer`) VALUES ('Johny Tr?? Nguy???n', 'phim hay', 'Dustin Nguy???n', 'H??nh ?????ng, C??? trang', 'C???m tr??? em d?????i 15 tu???i', '10-10-2018', '1h45\'', 'dong-mau-anh-hung.jpg', 'D??ng M??u Anh H??ng', 'http://www.youtube.com');
