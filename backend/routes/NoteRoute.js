import express from "express";
import {getCategoriesByID, 
        getCategories,
        getProducts,
        createProduct,
        deleteProduct,
        getProductById,
        updateProduct,
        getProductByCategory,
        doRegister,
        doLogin,
        } from '../controllers/Controller.js'


const router = express.Router();
//import { authenticateToken } from '../middleware/authenticateToken.js';

router.get("/categories", getCategories);
router.get("/categories/:id", getCategoriesByID);
router.get("/products/category/:id", getProductByCategory);
router.get('/products', getProducts);
router.get('/products/:id', getProductById);
router.post('/add-product', createProduct);
router.put('/edit-product/:id', updateProduct);
router.delete('/delete-product/:id', deleteProduct);

router.post('/login', doLogin);
router.post('/register', doRegister)

export default router;
