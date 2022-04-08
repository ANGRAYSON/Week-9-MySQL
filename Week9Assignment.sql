CREATE DATABASE IF NOT EXISTS users;

USE users;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
	username VARCHAR(20) not null,
	password VARCHAR(25) not null,
	email VARCHAR(40) not null,
	first_name VARCHAR(15) not null,
	last_name VARCHAR(15) not null,
	PRIMARY KEY(username)
);

CREATE TABLE posts(
	post_number INT(10) not null auto_increment,
	username VARCHAR(20) not null,
	description VARCHAR(255) not null,
	time TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
	PRIMARY KEY(post_number),
	FOREIGN KEY(username) REFERENCES users(username)
);

CREATE TABLE comments(
	post_number INT(10) not null,
	username VARCHAR(20) not null,
	description VARCHAR(255) not null,
	time TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
	FOREIGN KEY(post_number) REFERENCES posts(post_number),
	FOREIGN KEY(username) REFERENCES users(username)
);


