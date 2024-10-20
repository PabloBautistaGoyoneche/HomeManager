CREATE DATABASE db_cvinmobiliaria;

USE db_cvinmobiliaria;

-- Tabla: administrator
DROP TABLE IF EXISTS administrator;
CREATE TABLE administrator (
    id_administrator INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hashing VARCHAR(255) NOT NULL
);

-- Tabla: state_user
DROP TABLE IF EXISTS state_user;
CREATE TABLE state_user (
    id_state_user INT AUTO_INCREMENT PRIMARY KEY,
    name_state VARCHAR(50) NOT NULL
);

-- Tabla: newsletter_consent
DROP TABLE IF EXISTS newsletter_consent;
CREATE TABLE newsletter_consent (
    id_newsletter_consent INT AUTO_INCREMENT PRIMARY KEY,
    name_newsletter_consent VARCHAR(50) NOT NULL
);

-- Tabla: user (dependiente de state_user y newsletter_consent)
DROP TABLE IF EXISTS user;
CREATE TABLE user (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20),
    email VARCHAR(100) NOT NULL,
    id_state_user INT,
    id_newsletter_consent INT,
    date_user DATE,
    FOREIGN KEY (id_state_user) REFERENCES state_user(id_state_user),
    FOREIGN KEY (id_newsletter_consent) REFERENCES newsletter_consent(id_newsletter_consent)
);

-- Tabla: state_property
DROP TABLE IF EXISTS state_property;
CREATE TABLE state_property (
    id_state_property INT AUTO_INCREMENT PRIMARY KEY,
    name_state_property VARCHAR(50) NOT NULL
);

-- Tabla: category_property
DROP TABLE IF EXISTS category_property;
CREATE TABLE category_property (
    id_category_property INT AUTO_INCREMENT PRIMARY KEY,
    name_category VARCHAR(50) NOT NULL
);

-- Tabla: type_service
DROP TABLE IF EXISTS type_service;
CREATE TABLE type_service (
    id_type_service INT AUTO_INCREMENT PRIMARY KEY,
    name_type_service VARCHAR(50) NOT NULL
);

-- Tabla: property (dependiente de category_property y type_service)
DROP TABLE IF EXISTS property;
CREATE TABLE property (
    id_property INT AUTO_INCREMENT PRIMARY KEY,
    title_property VARCHAR(100) NOT NULL,
    id_category_property INT,
    address VARCHAR(255),
    price DECIMAL(10, 2),
    land_area DECIMAL(10, 2),
    built_area DECIMAL(10, 2),
    antique INT,
    number_of_floors INT,
    number_main_rooms INT,
    number_secondary_rooms INT,
    number_garages INT,
    water_service INT,
    electric_energy INT,
    drainage_service INT,
    gas_service INT,
    location_latitude_longitude VARCHAR(100),
    path_main_photo VARCHAR(255),
    FOREIGN KEY (id_category_property) REFERENCES category_property(id_category_property),
    FOREIGN KEY (water_service) REFERENCES type_service(id_type_service),
    FOREIGN KEY (electric_energy) REFERENCES type_service(id_type_service),
    FOREIGN KEY (drainage_service) REFERENCES type_service(id_type_service),
    FOREIGN KEY (gas_service) REFERENCES type_service(id_type_service)
);

-- Tabla: gallery_photos_property (dependiente de property)
DROP TABLE IF EXISTS gallery_photos_property;
CREATE TABLE gallery_photos_property (
    id_photo_gallery INT AUTO_INCREMENT PRIMARY KEY,
    id_property INT,
    path_photo_gallery VARCHAR(255),
    FOREIGN KEY (id_property) REFERENCES property(id_property)
);

-- Tabla: type_transaction
DROP TABLE IF EXISTS type_transaction;
CREATE TABLE type_transaction (
    id_type_transaction INT AUTO_INCREMENT PRIMARY KEY,
    name_type_transaction VARCHAR(50) NOT NULL
);

-- Tabla: request (dependiente de type_transaction, user y property)
DROP TABLE IF EXISTS request;
CREATE TABLE request (
    id_request INT AUTO_INCREMENT PRIMARY KEY,
    id_type_transaction INT,
    id_user INT,
    message TEXT,
    id_property INT,
    FOREIGN KEY (id_type_transaction) REFERENCES type_transaction(id_type_transaction),
    FOREIGN KEY (id_user) REFERENCES user(id_user),
    FOREIGN KEY (id_property) REFERENCES property(id_property)
);

-- Tabla: newsletters (dependiente de property)
DROP TABLE IF EXISTS newsletters;
CREATE TABLE newsletters (
    id_newsletters INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description_newsletter TEXT,
    id_property INT,
    FOREIGN KEY (id_property) REFERENCES property(id_property)
);

-- Tabla: agents_call_center
DROP TABLE IF EXISTS agents_call_center;
CREATE TABLE agents_call_center (
    id_agent INT AUTO_INCREMENT PRIMARY KEY,
    name_agent VARCHAR(100),
    contact_number_agent VARCHAR(20),
    contact_number_fixed_agent VARCHAR(20),
    email_agent VARCHAR(100),
    address_agent VARCHAR(255),
    path_photo_agent VARCHAR(255)
);
