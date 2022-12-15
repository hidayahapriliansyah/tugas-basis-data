create table category_menu (
id int unsigned not null auto_increment,
nama varchar(20) not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp,
primary key (id)
) engine=InnoDB;

create table menu (
id int unsigned not null auto_increment,
kode varchar(5) not null,
nama varchar(25) not null,
description text not null,
stock_available int not null,
harga int not null,
foto1 varchar(255) not null,
foto2 varchar(255),
video_url varchar(255),
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp,
restoran_username varchar(8) not null,
category_id varchar(15) not null,
primary key(id),
unique key menu_restoran_unique (kode, restoran_username)
) engine=InnoDB;

show create table menu;

alter table menu 
add constraint fk_menu_restoran
foreign key (restoran_username) references restoran(username);

alter table menu 
add constraint fk_menu_category
foreign key (category_id) references category_menu(id);

alter table category_menu
modify id varchar(15) not null;

desc category_menu;

alter table menu
rename column category_id to category_menu_id;

alter table menu 
change kode code_pesanan varchar(20);

alter table menu
change category_id category_menu_id varchar(15);

