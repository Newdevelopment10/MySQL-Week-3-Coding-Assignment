CREATE database if not exists onlinemedia;

use onlinemedia;

DROP table if exists posts;
DROP table if exists comments;
DROP table if exists users;

CREATE table users (
username_id int not null auto_increment,
first_name varchar(40),
last_name varchar(40),
email varchar(40),
password varchar(20),
location varchar(40),
PRIMARY KEY (username_id)
);

CREATE table posts (
post_id int not null auto_increment,
username_id int not null,
first_name varchar(40) not null,
last_name varchar(40) not null,
post text not null,
location varchar(40) not null,
publish_timestamp TIMESTAMP not null default current_timestamp,
PRIMARY KEY (post_id),
FOREIGN KEY (username_id) references users (username_id)
);

CREATE table comments (
comment_id int not null auto_increment,
post_id int not null,
username_id int not null,
first_name varchar(40),
last_name varchar(40),
location varchar(40),
comment text not null,
publish_timestamp timestamp not null default current_timestamp,
PRIMARY KEY (comment_id),
FOREIGN KEY (post_id) references posts (post_id),
FOREIGN KEY (username_id) references users (username_id)
);
