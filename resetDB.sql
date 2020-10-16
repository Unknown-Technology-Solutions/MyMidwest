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

