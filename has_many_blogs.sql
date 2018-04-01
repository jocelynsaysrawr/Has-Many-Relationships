DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs;
\c has_many_blogs;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id SERIAL NOT NULL PRIMARY KEY,
    username VARCHAR(90) NOT NULL,
    first_name VARCHAR(90) DEFAULT NULL,
    last_name VARCHAR(90) DEFAULT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    post_id SERIAL NOT NULL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    title VARCHAR(180) DEFAULT NULL,
    url VARCHAR(510) DEFAULT NULL,
    content text DEFAULT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    comment_id SERIAL NOT NULL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    post_id INTEGER REFERENCES posts(post_id),
    body VARCHAR(510) DEFAULT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);