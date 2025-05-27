import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const Categories = db.define(
  "categories", // Nama tabel
  {
    nama_jenis: {
      type: Sequelize.STRING,
      allowNull: false
    }
  },
  {
    timestamps: false // Jangan buat createdAt & updatedAt
  }
);

export default Categories;