
//import Note from "../models/NoteModel.js";
import Categories from "../models/CategoryModel.js";
import User from "../models/UserModel.js";
import Product from "../models/ProductModel.js";
import bcrypt from "bcrypt"; // Add this import
import jwt from "jsonwebtoken"; 

const doRegister = async (req, res) => {
    const { username, password } = req.body;
    try {
      const existingUser = await User.findOne({ where: { username } });
      if (existingUser) {
        return res.status(400).json({ message: 'Username already taken' });
      }
      
      const hashedPassword = await bcrypt.hash(password, 10);
      await User.create({ username, password: hashedPassword, role: 'user' });
      res.status(201).json({ message: 'User registered successfully' });
    } catch (error) {
      res.status(500).json({ message: 'Error registering user', error });
    }
}


const doLogin = async (req, res) => {
  const { username, password } = req.body;
  try {
    const user = await User.findOne({ where: { username } });
    
    // First problem: check if user exists
    if (!user) {
      console.log('Invalid username ddasdor password');
      return res.status(401).json({ message: 'Invalid username dddddasdaor password' });
    }
    
    // Second problem: use user.password instead of User.password
    
    const passwordMatch = await bcrypt.compare(password, user.password);
    if (!passwordMatch) {
      console.log('Invalidcasda username or password');
      return res.status(401).json({ message: 'Invalid dasascacusername or password' });
    }

    // Third problem: use user.id instead of User.id and provide a fallback JWT_SECRET
    
    const token = jwt.sign(
      { id: user.id }, 
      process.env.JWT_SECRET || 'fallback_secret_key_for_development',
      { expiresIn: '1h' }
    );
    
    res.json({ token, message: 'Login successful' });
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ message: 'Error logging in', error: error.message });
  }
}

// GET
async function getCategoriesByID(req, res) {
  try {
    const categoryId = req.params.id;
    const categories = await Categories.findAll({
      where: { id: categoryId }
    });
    res.status(200).json(categories);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
}

async function getCategories(req, res) {
  try {
    const categories = await Categories.findAll({});
    res.status(200).json(categories);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
}

const getProducts  = async (req, res) => {
  try {
    const products = await Product.findAll();
    res.status(200).json(products);
  } catch (error) {
    console.error(error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
}

const createProduct  = async (req, res) => {
  try {
    const { name, 
            desc,
            price,
            image_url,
            jumlah_stock,
            categoryId 
          } = req.body;
        
    //const userId = req.user.id; // from JWT middleware

    await Product.create({ name, 
                        desc,
                        price,
                        image_url,
                        jumlah_stock,
                        categoryId  /*user_id: userId*/ });

    res.status(201).json({ msg: "Product Added" });
  } catch (error) {
    console.log(error.message);
    res.status(500).json({ msg: "Error creating Note" });
  }
};

// Get single product by ID
const getProductById = async (req, res) => {
  try {
    const product = await Product.findByPk(req.params.id);
    if (!product) return res.status(404).json({ message: "Product not found" });
    res.status(200).json(product);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const getProductByCategory = async (req, res) => {
  try {
    try {
    const categoryId = req.params.id;
    const products = await Product.findAll({
      where: { category_id: categoryId }
    });

    res.status(200).json(products);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

// Update product
const updateProduct = async (req, res) => {
  try {
    const { name, description, price, jumlah_stok, image_url, category_id } = req.body;
    const productId = req.params.id;
    const result = await Product.update(
      { name, description, price, jumlah_stok, image_url, category_id },
      {
        where: {
          id: productId,
        }
      }
    );

    if (result[0] === 0) {
      return res.status(404).json({ msg: "Product not found or unauthorized" });
    }

    res.status(200).json({ msg: "Product Updated" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Delete product
const deleteProduct = async (req, res) => {
  try {
      const productId = req.params.id;  // Correct
      //const userId = req.user.id;  
      
      const result = await Note.destroy({
          where: { 
            id: productId,
            //user_id: userId
          } // Pastikan ada kondisi where
      });

      if (result) {
          res.json({ message: "Product deleted successfully!" });
      } else {
          res.status(404).json({ error: "Note not found!" });
      }
  } catch (error) {
      console.error("Error deleting Note:", error);
      res.status(500).json({ error: "Internal server error" });
  }
};




export {  getCategoriesByID,
          getCategories, 
          getProducts, 
          createProduct,
          getProductById,
          updateProduct,
          deleteProduct,
          getProductByCategory,
          doLogin,
          doRegister };