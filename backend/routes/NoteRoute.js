import express from "express";
import {
    getCategoriesByID,
    getCategories,
    getProducts,
    createProduct,
    deleteProduct,
    getProductById,
    updateProduct,
    getProductByCategory,
    doRegister,
    doLogin,
    doLogout,
    getProfile,
} from "../controllers/Controller.js";
import { authenticateToken } from "../middleware/authenticateToken.js";

const router = express.Router();

// Public routes
router.post("/login", doLogin);
router.post("/register", doRegister);
router.get("/categories", getCategories);
router.get("/categories/:id", getCategoriesByID);
router.get("/products/category/:id", getProductByCategory);
router.get("/products", getProducts);
router.get("/products/:id", getProductById);

// Protected routes (require authentication)
router.use(authenticateToken); // Apply middleware to all routes below

router.post("/logout", doLogout);
router.get("/profile", getProfile);

// Admin routes (you can add role checking middleware here)
router.post("/add-product", createProduct);
router.put("/edit-product/:id", updateProduct);
router.delete("/delete-product/:id", deleteProduct);

router.post("/add-product", upload.single('image'), createProduct);
router.put("/edit-product/:id", upload.single('image'), updateProduct);

export default router;
