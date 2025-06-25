-- Create databases
CREATE DATABASE IF NOT EXISTS petshop_db;
CREATE DATABASE IF NOT EXISTS nextcloud_db;

-- Create users
CREATE USER IF NOT EXISTS 'petshop_user'@'%' IDENTIFIED BY 'petshop_password';
CREATE USER IF NOT EXISTS 'nextcloud_user'@'%' IDENTIFIED BY 'nextcloud_password';

-- Grant privileges
GRANT ALL PRIVILEGES ON petshop_db.* TO 'petshop_user'@'%';
GRANT ALL PRIVILEGES ON nextcloud_db.* TO 'nextcloud_user'@'%';

FLUSH PRIVILEGES;

-- Create tables for pet shop
USE petshop_db;

CREATE TABLE IF NOT EXISTS categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_jenis VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(50) DEFAULT 'user',
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price INT NOT NULL,
  jumlah_stok INT NOT NULL,
  image_url VARCHAR(500),
  category_id INT,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- Insert sample data
INSERT INTO categories (nama_jenis) VALUES 
('Makanan Kucing'),
('Mainan Anjing'),  
('Kandang'),
('Aksesoris');

INSERT INTO products (name, description, price, jumlah_stok, image_url, category_id) VALUES
('Royal Canin Kitten', 'Makanan kucing premium untuk anak kucing', 150000, 50, 'https://example.com/royal-canin.jpg', 1),
('Bola Mainan Anjing', 'Mainan bola karet untuk anjing', 25000, 100, 'https://example.com/bola-anjing.jpg', 2);