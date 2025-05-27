import { Sequelize } from "sequelize";
import db from "../config/Database.js";

// Membuat tabel "user"
const Users = db.define(
  "users", // Table Name
  {
    // All fields should be defined in a single object
    username: {
      type: Sequelize.STRING
    },
    password: {
      type: Sequelize.STRING
    }, 
    role: {
      type: Sequelize.STRING
    },
  }
);

db.sync().then(() => console.log("Database synced"));

export default Users;
