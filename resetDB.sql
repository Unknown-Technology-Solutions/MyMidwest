-- Zane Reick, My Midwest reset testing Database to default values.

-- Create Database if it doesn't exist
CREATE DATABASE IF NOT EXISTS MyMidwest_v1;

USE MyMidwest_v1;

-- Drop old tables, and create new ones

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;

CREATE TABLE users (
	uid        INT UNSIGNED AUTO_INCREMENT NOT NULL UNIQUE KEY PRIMARY KEY,
	username   VARCHAR(255) NOT NULL UNIQUE,
	password   VARCHAR(255) NOT NULL,
	firstName  VARCHAR(255) NOT NULL,
	lastName   VARCHAR(255) NOT NULL,
	company    VARCHAR(255) DEFAULT NULL
);

CREATE TABLE posts (
	pid        INT UNSIGNED AUTO_INCREMENT NOT NULL UNIQUE KEY PRIMARY KEY,
	title      VARCHAR(255) NOT NULL,
	author     VARCHAR(255) NOT NULL,
	submitDate VARCHAR(255) NOT NULL,
	content    VARCHAR(2048) NOT NULL,
	tags       VARCHAR(255) DEFAULT NULL
);

-- Insert defaults into tables

INSERT INTO users (username, password, firstName, lastName, company) VALUES 
	("admin", "password", "Admin", "Istrator", "Unknown Technology Solutions");

INSERT INTO posts (title, author, submitDate, content, tags) VALUES 
	("Test Post", "Admin", "10/16/2020", "This is a test post.", "test,admin,posting,testing");

