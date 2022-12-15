use db_warung_makan;

create table restoran (
id int not null auto_increment,
username varchar(8) not null,
password varchar(255) not null,
nama varchar(25) not null,
alamat varchar(255) not null,
no_hp varchar(14) not null,
email varchar(25) not null,
process_on_postpaid bool default 0,
foto_profil varchar(255),
location_map text,
foto_sampul varchar(255),
pemilik varchar(25),
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
token_verifying varchar(255) not null,
is_verified bool default 0,
primary key(id),
unique key username_unique (username),
unique key email_unique (email),
unique key no_hp_unique (no_hp)
) engine=InnoDB;

create table ppn_active (
id int unsigned not null auto_increment,
category enum('persentase','perorder') not null,
value varchar(5) default '0',
restoran_username varchar(8) not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_ppn_active_restoran 
foreign key (restoran_username) references restoran(username)
) engine=innodb;


