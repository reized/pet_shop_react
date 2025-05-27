import { Sequelize } from "sequelize";
import dotenv from "dotenv";

dotenv.config();

// Inisialisasi koneksi ke database
const db = new Sequelize('pet_shop_db', 'root', '', {
  host: 'localhost',
  port: 3307,
  dialect: 'mysql'
});

// Ekspor koneksi untuk digunakan di file lain
export default db;