create table konsumen (
id int not null auto_increment,
username varchar(8) not null,
password varchar(2550) not null,
email varchar(25) not null,
gender enum('L','P'),
birthday date,
avatar varchar(255),
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
token_verifying varchar(255) not null,
is_verified bool default 0,
primary key(id),
unique key username_unique (username),
unique key email_unique (email)
) engine=InnoDB;