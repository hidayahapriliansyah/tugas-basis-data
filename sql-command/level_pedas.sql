create table level_pedas (
id int unsigned not null auto_increment,
level_pedas_max int unsigned not null,
harga_per_level int unsigned default 0,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp,
restoran_username varchar(8) not null,
category_menu_id varchar(15) not null,
primary key (id),
constraint fk_level_pedas_restoran
foreign key (restoran_username) references restoran(username),
constraint fk_level_pedas_category_menu 
foreign key (category_menu_id) references category_menu(id)
) engine=InnoDB;

desc level_pedas;

create table level_pedas_pesanan_menu (
id int unsigned not null auto_increment,
tingkat_kepedasan int not null,
biaya_tambahan int default 0,
level_pedas_id int unsigned not null,
pesanan_menu_id int unsigned not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp,
primary key(id),
constraint fk_level_pedas_pesanan_menu_to_level_pedas
foreign key (level_pedas_id) references level_pedas(id),
constraint fk_level_pedas_pesanan_menu_to_pesanan_menu
foreign key (pesanan_menu_id) references pesanan_menu(id)
) engine=innodb;