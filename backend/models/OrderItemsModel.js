import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const OrderItem = db.define("order_items", {
  order_id: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  product_id: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  jumlah: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
}, {
  timestamps: false
});

export default OrderItem;