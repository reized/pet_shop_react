import { useState } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Header from "./components/Layout/Header";
import Footer from "./components/Layout/Footer";
import Home from "./pages/Home";
import Products from "./pages/Products";
import ProductDetail from "./pages/ProductDetail";
import Cart from "./pages/Cart";
import Profile from "./pages/Profile";
import Login from "./pages/Login";
import Register from "./pages/Register";
import { CartProvider } from "./context/CartContext";
import { AuthProvider } from "./context/AuthContext";
import Admin from "./pages/Admin";

const App = () => {
    return (
        <div>
            <AuthProvider>
                <CartProvider>
                    <Router>
                        <div className="min-h-screen bg-gray-50">
                            <Header />
                            <main className="container mx-auto pt-24 px-16 py-8">
                                <Routes>
                                    <Route path="/" element={<Home />} />
                                    <Route
                                        path="/products"
                                        element={<Products />}
                                    />
                                    <Route
                                        path="/products/:id"
                                        element={<ProductDetail />}
                                    />
                                    <Route path="/cart" element={<Cart />} />
                                    <Route
                                        path="/profile"
                                        element={<Profile />}
                                    />
                                    <Route path="/login" element={<Login />} />
                                    <Route
                                        path="/register"
                                        element={<Register />}
                                    />
                                    <Route path="/admin" element={<Admin />} />
                                </Routes>
                            </main>
                            <Footer />
                        </div>
                    </Router>
                </CartProvider>
            </AuthProvider>
        </div>
    );
};

export default App;
