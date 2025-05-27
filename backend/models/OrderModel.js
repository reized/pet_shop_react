import { Sequelize } from "sequelize";
import db from "../config/Database.js";

const Order = db.define("orders", {
  user_id: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  status: {
    type: Sequelize.STRING(30),
    defaultValue: "pending"
  }
}, {
  timestamps: true
});

export default Order;