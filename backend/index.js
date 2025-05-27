import express, { response } from "express";
import cors from "cors";
import NoteRoute from "./routes/NoteRoute.js";
import bodyParser from "body-parser"
import path from 'path';
import {fileURLToPath} from 'url';
import { dirname } from 'path';

const app = express();
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

import dotenv from 'dotenv';
dotenv.config();

app.use(cors());
app.use(express.json());
app.use(NoteRoute);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.set('views', './views')
app.set('view engine', 'ejs')
app.use(express.static(path.join(__dirname, 'client/build')))
app.listen(5000, () => console.log("Backend server connected"));
//console.log('Secret:', process.env.JWT_SECRET);

// Handle React routes
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'client/build', 'index.html'));
});
