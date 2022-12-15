create table custom_menu_group (
id int unsigned not null auto_increment,
nama varchar(25) not null,
description text,
banyak_material int unsigned default 0,
restoran_username varchar(8) not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_custom_menu_group
foreign key (restoran_username) references restoran(username)
) engine=innodb;

create table custom_menu_material (
id int unsigned not null auto_increment,
name varchar(25) not null,
price int unsigned not null,
stock_available int not null,
detail text,
restoran_username varchar(8) not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_custom_menu_material_restoran
foreign key (restoran_username) references restoran(username)
) engine=innodb;

create table custom_menu_material_group (
id int unsigned not null auto_increment,
custom_menu_group_id int unsigned not null,
custom_menu_material_id int unsigned not null,
created_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_custom_menu_material_group_x_custom_menu_group
foreign key (custom_menu_group_id) references custom_menu_group(id),
constraint fk_custom_menu_material_group_x_custom_menu_material
foreign key (custom_menu_material_id) references custom_menu_material(id)
) engine=innodb;

create table created_custom_menu (
id int unsigned not null auto_increment,
name varchar(25) not null,
konsumen_username varchar(8) not null,
custom_menu_group_id int unsigned not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint fk_created_custom_menu_x_konsumen
foreign key (konsumen_username) references konsumen(username),
constraint fk_created_custom_menu_x_custom_menu_group
foreign key (custom_menu_group_id) references custom_menu_group(id)
) engine=innodb;

create table picked_custom_menu_material (
id int unsigned not null auto_increment,
qty int not null,
created_custom_menu_id int unsigned not null,
custom_menu_material_id int unsigned not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp default current_timestamp not null,
primary key(id),
constraint created_custom_menu_x_custom_menu_material_unique
unique key (created_custom_menu_id, custom_menu_material_id),
constraint fk_picked_custom_menu_material_x_created_custom_menu
foreign key (created_custom_menu_id) references created_custom_menu(id),
constraint fk_picked_custom_menu_material_x_custom_menu_material
foreign key (custom_menu_material_id) references custom_menu_material(id)
) engine=innodb;

show create table picked_custom_menu_material;


