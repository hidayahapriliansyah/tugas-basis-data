create table grup_botram (
id int unsigned not null auto_increment,
nama varchar(25) not null,
jumlah_peserta int unsigned,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp,
restoran_username varchar(8) not null,
konsumen_username varchar(8) not null,
primary key(id),
constraint fk_grup_botram_restoran
foreign key (restoran_username) references restoran(username),
constraint fk_grup_botram_konsumen
foreign key (konsumen_username) references konsumen(username)
) engine=innodb;

desc grup_botram;

create table group_botram_admin (
id int unsigned not null auto_increment,
konsumen_username varchar(8) not null,
group_botram_id int unsigned not null,
created_at timestamp default current_timestamp,
primary key(id),
unique key konsumen_username_x_group_botram_unique (konsumen_username, group_botram_id),
constraint fk_group_botram_admin_x_konsumen
foreign key (konsumen_username) references konsumen(username)
) engine=innodb;

alter table group_botram_admin
add constraint fk_group_botram_admin_x_group_botram
foreign key (group_botram_id) references group_botram(id);

show create table group_botram_admin;
show create table group_botram;

alter table grup_botram rename to group_botram;

--  lieur neneangan group botram padahal ngaranan grup botram

create table participant_group_botram (
id int unsigned not null auto_increment,
is_approved int default 0,
konsumen_username varchar(8) not null,
group_botram_id int unsigned not null,
approved_by_admin_id int unsigned,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp,
primary key(id),
unique key konsumen_join_group_botram (konsumen_username, group_botram_id),
constraint fk_participant_group_botram_x_konsumen
foreign key (konsumen_username) references konsumen(username),
constraint fk_participant_group_botram_x_group_botram
foreign key (group_botram_id) references group_botram(id),
constraint fk_participant_group_botram_x_group_botram_id 
foreign key (approved_by_admin_id) references group_botram(id)
) engine=innodb;
