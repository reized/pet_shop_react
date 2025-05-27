import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const Product = db.define("products", {
  name: {
    type: Sequelize.STRING,
  },
  description: {
    type: Sequelize.TEXT,
  },
  price: {
    type: Sequelize.INTEGER,
  },
  jumlah_stok: {
    type: Sequelize.INTEGER,
  },
  image_url: {
    type: Sequelize.STRING,
  },
  category_id: {
    type: Sequelize.INTEGER,
  },
}, {
  timestamps: true // otomatis menambahkan createdAt dan updatedAt
});

// Relasi (jika kamu punya model Category dan Supplier nanti)
Product.associate = function (models) {
  Product.belongsTo(models.Category, {
    foreignKey: 'category_id',
    onDelete: 'SET NULL'
  });
};

export default Product;
