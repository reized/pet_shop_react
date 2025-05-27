import { Sequelize } from "sequelize";
import dotenv from "dotenv";

dotenv.config();

// Inisialisasi koneksi ke database
const db = new Sequelize(
  process.env.DB_DATABASE,     // database name
  process.env.DB_USER,     // username
  process.env.DB_PASSWORD,
  {
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  dialect: process.env.DB_DIALECT
});

// Ekspor koneksi untuk digunakan di file lain
export default db;