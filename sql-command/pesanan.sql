create table pesanan (
id int unsigned not null auto_increment,
kode varchar(20) not null,
total_pesanan int unsigned not null,
ppn_total int unsigned not null,
all_total int unsigned not null,
status enum('nonactive', 'active', 'accepted', 'processed', 'done') default 'nonactive',
is_paid bool default 0,
restoran_username varchar(8) not null,
konsumen_username varchar(8) not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
unique key kode_unique (kode),
constraint fk_pesanan_botram_restoran
foreign key (restoran_username) references restoran(username),
constraint fk_pesanan_botram_konsumen
foreign key (konsumen_username) references konsumen(username)
) engine=InnoDB;

create table pesanan_menu (
id int unsigned not null auto_increment,
qty int unsigned not null,
is_accepted bool default 1,
menu_id int unsigned not null,
pesanan_kode varchar(20) not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_pesanan_menu_menu
foreign key (menu_id) references menu(id),
constraint fk_pesanan_menu_pesanan
foreign key (pesanan_kode) references pesanan(kode)
) engine=innodb;


create table pesanan_custom_menu (
id int unsigned not null auto_increment,
qty int not null,
is_accepted bool default 1,
created_custom_menu_id int unsigned not null,
pesanan_kode varchar(20) not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_pesanan_custom_menu_x_created_custom_menu
foreign key (created_custom_menu_id) references created_custom_menu(id),
constraint fk_pesanan_custom_menu_x_pesanan_kode
foreign key (pesanan_kode) references pesanan(kode)
) engine=innodb;

create table pesanan_menu_group_botram (
id int unsigned not null auto_increment,
is_paid bool default 0,
paid_confirmed_by_admin_id int unsigned not null,
is_accepted bool default 1,
pesanan_menu_id int unsigned not null,
group_botram_id int unsigned not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_pesanan_menu_group_botram_x_pesanan_menu 
foreign key (pesanan_menu_id) references pesanan_menu(id),
constraint fk_pesanan_menu_group_botram_x_group_botram 
foreign key (group_botram_id) references group_botram(id)
) engine=innodb;

create table pesanan_custom_menu_group_botram (
id int unsigned not null auto_increment,
is_paid bool default 0,
paid_confirmed_by_admin_id int unsigned not null,
is_accepted bool default 1,
pesanan_custom_menu_id int unsigned not null,
group_botram_id int unsigned not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_pesanan_custom_menu_group_botram_x_pesanan_custom_menu 
foreign key (pesanan_custom_menu_id) references pesanan_menu(id),
constraint fk_pesanan_custom_menu_group_botram_x_group_botram 
foreign key (group_botram_id) references group_botram(id)
) engine=innodb;

create table pesanan_group_botram (
id int unsigned not null auto_increment,
group_botram_id int unsigned not null,
pesanan_kode varchar(20) not null,
created_at timestamp default current_timestamp,
primary key(id),
unique key group_botram_x_pesanan_unique (group_botram_id, pesanan_kode),
constraint fk_pesanan_group_botram_x_pesanan
foreign key (pesanan_kode) references pesanan(kode),
constraint fk_pesanan_group_botram_x_group_botram
foreign key (group_botram_id) references group_botram(id)
) engine=innodb;

