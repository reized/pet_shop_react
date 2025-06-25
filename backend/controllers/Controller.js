import Categories from "../models/CategoryModel.js";
import User from "../models/UserModel.js";
import Product from "../models/ProductModel.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import multer from 'multer';
import NextCloudService from '../services/NextCloudService.js';

// Setup multer untuk memory storage
const storage = multer.memoryStorage();
export const upload = multer({ 
    storage: storage,
    limits: {
        fileSize: 5 * 1024 * 1024 // 5MB limit
    },
    fileFilter: (req, file, cb) => {
        // Check file type
        if (file.mimetype.startsWith('image/')) {
            cb(null, true);
        } else {
            cb(new Error('Only image files are allowed!'), false);
        }
    }
});

// User Authentication Functions
const doRegister = async (req, res) => {
    const { username, password } = req.body;

    // Validasi input
    if (!username || !password) {
        return res.status(400).json({
            success: false,
            message: "Username and password are required",
        });
    }

    if (password.length < 6) {
        return res.status(400).json({
            success: false,
            message: "Password must be at least 6 characters long",
        });
    }

    try {
        const existingUser = await User.findOne({ where: { username } });
        if (existingUser) {
            return res.status(400).json({
                success: false,
                message: "Username already taken",
            });
        }

        const hashedPassword = await bcrypt.hash(password, 10);
        const newUser = await User.create({
            username,
            password: hashedPassword,
            role: "user", // default role
        });

        res.status(201).json({
            success: true,
            message: "User registered successfully",
            data: {
                id: newUser.id,
                username: newUser.username,
                role: newUser.role,
            },
        });
    } catch (error) {
        console.error("Registration error:", error);
        res.status(500).json({
            success: false,
            message: "Error registering user",
            error: error.message,
        });
    }
};

const doLogin = async (req, res) => {
    const { username, password } = req.body;

    // Validasi input
    if (!username || !password) {
        return res.status(400).json({
            success: false,
            message: "Username and password are required",
        });
    }

    try {
        const user = await User.findOne({ where: { username } });

        if (!user) {
            return res.status(401).json({
                success: false,
                message: "Invalid username or password",
            });
        }

        const passwordMatch = await bcrypt.compare(password, user.password);
        if (!passwordMatch) {
            return res.status(401).json({
                success: false,
                message: "Invalid username or password",
            });
        }

        const token = jwt.sign(
            {
                id: user.id,
                username: user.username,
                role: user.role,
            },
            process.env.JWT_SECRET || "fallback_secret_key_for_development",
            { expiresIn: "24h" }
        );

        res.json({
            success: true,
            token,
            message: "Login successful",
            user: {
                id: user.id,
                username: user.username,
                role: user.role,
            },
        });
    } catch (error) {
        console.error("Login error:", error);
        res.status(500).json({
            success: false,
            message: "Error logging in",
            error: error.message,
        });
    }
};

const doLogout = async (req, res) => {
    try {
        res.json({
            success: true,
            message: "Logout successful",
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error during logout",
            error: error.message,
        });
    }
};

// Fungsi untuk mendapatkan profile user
const getProfile = async (req, res) => {
    try {
        const user = await User.findByPk(req.user.id, {
            attributes: ["id", "username", "role", "createdAt"],
        });

        if (!user) {
            return res.status(404).json({
                success: false,
                message: "User not found",
            });
        }

        res.json({
            success: true,
            user: {
                id: user.id,
                username: user.username,
                role: user.role,
                createdAt: user.createdAt,
            },
        });
    } catch (error) {
        console.error("Get profile error:", error);
        res.status(500).json({
            success: false,
            message: "Error fetching profile",
            error: error.message,
        });
    }
};

// Category Functions
async function getCategoriesByID(req, res) {
    try {
        const categoryId = req.params.id;
        const categories = await Categories.findAll({
            where: { id: categoryId },
        });
        res.status(200).json(categories);
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ error: "Internal Server Error" });
    }
}

async function getCategories(req, res) {
    try {
        const categories = await Categories.findAll({});
        res.status(200).json(categories);
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ error: "Internal Server Error" });
    }
}

// Product Functions
const getProducts = async (req, res) => {
    try {
        const products = await Product.findAll({
            include: [{
                model: Categories,
                attributes: ['id', 'nama_jenis']
            }]
        });
        res.status(200).json(products);
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ error: "Internal Server Error" });
    }
};

const createProduct = async (req, res) => {
    try {
        const {
            name,
            description,
            price,
            jumlah_stok,
            category_id,
        } = req.body;

        let image_url = null;

        // Handle file upload to NextCloud
        if (req.file) {
            try {
                const fileName = `${Date.now()}-${req.file.originalname}`;
                image_url = await NextCloudService.uploadFile(
                    req.file.buffer, 
                    fileName, 
                    'petshop-images'
                );
                console.log('Image uploaded successfully:', image_url);
            } catch (uploadError) {
                console.error('Image upload failed:', uploadError);
                // Continue without image if upload fails
                image_url = null;
            }
        }

        const product = await Product.create({
            name,
            description,
            price: parseInt(price),
            jumlah_stok: parseInt(jumlah_stok),
            image_url,
            category_id: parseInt(category_id),
        });

        res.status(201).json({ 
            msg: "Product Added Successfully",
            product: product
        });
    } catch (error) {
        console.log('Create product error:', error.message);
        res.status(500).json({ 
            msg: "Error creating product", 
            error: error.message 
        });
    }
};

const getProductById = async (req, res) => {
    try {
        const product = await Product.findByPk(req.params.id, {
            include: [{
                model: Categories,
                attributes: ['id', 'nama_jenis']
            }]
        });
        if (!product)
            return res.status(404).json({ message: "Product not found" });
        res.status(200).json(product);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

const getProductByCategory = async (req, res) => {
    try {
        const categoryId = req.params.id;
        const products = await Product.findAll({
            where: { category_id: categoryId },
            include: [{
                model: Categories,
                attributes: ['id', 'nama_jenis']
            }]
        });

        res.status(200).json(products);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

const updateProduct = async (req, res) => {
    try {
        const {
            name,
            description,
            price,
            jumlah_stok,
            category_id,
        } = req.body;
        const productId = req.params.id;

        // Get existing product to check current image
        const existingProduct = await Product.findByPk(productId);
        if (!existingProduct) {
            return res.status(404).json({ msg: "Product not found" });
        }

        let image_url = existingProduct.image_url; // Keep existing image by default

        // Handle new file upload to NextCloud
        if (req.file) {
            try {
                const fileName = `${Date.now()}-${req.file.originalname}`;
                image_url = await NextCloudService.uploadFile(
                    req.file.buffer, 
                    fileName, 
                    'petshop-images'
                );
                console.log('New image uploaded successfully:', image_url);
            } catch (uploadError) {
                console.error('Image upload failed:', uploadError);
                // Keep existing image if new upload fails
            }
        }

        const result = await Product.update(
            { 
                name, 
                description, 
                price: parseInt(price), 
                jumlah_stok: parseInt(jumlah_stok), 
                image_url, 
                category_id: parseInt(category_id) 
            },
            {
                where: {
                    id: productId,
                },
            }
        );

        if (result[0] === 0) {
            return res.status(404).json({ msg: "Product not found or no changes made" });
        }

        res.status(200).json({ msg: "Product Updated Successfully" });
    } catch (err) {
        console.error('Update product error:', err);
        res.status(500).json({ message: err.message });
    }
};

const deleteProduct = async (req, res) => {
    try {
        const productId = req.params.id;
        console.log("Deleting product ID:", productId);

        const result = await Product.destroy({
            where: {
                id: productId,
            },
        });

        if (result) {
            res.json({ message: "Product deleted successfully!" });
        } else {
            res.status(404).json({ error: "Product not found!" });
        }
    } catch (error) {
        console.error("Error deleting Product:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};

export {
    getCategoriesByID,
    getCategories,
    getProducts,
    createProduct,
    getProductById,
    updateProduct,
    deleteProduct,
    getProductByCategory,
    doLogin,
    doRegister,
    doLogout,
    getProfile,
};