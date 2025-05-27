// frontend/src/components/Layout/Header.jsx
import { useState } from "react";
import { Link } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import { useCart } from "../../context/CartContext";

const Header = () => {
    const { user, logout } = useAuth();
    const { cartItems } = useCart();
    const [isMenuOpen, setIsMenuOpen] = useState(false);

    const cartItemsCount = cartItems.reduce(
        (total, item) => total + item.quantity,
        0
    );

    return (
        <header className="bg-blue-600 text-white shadow-lg fixed w-full px-16 z-10">
            <div className="container mx-auto px-4">
                <div className="flex items-center justify-between h-16">
                    <Link to="/" className="text-2xl font-bold">
                        🐾 PCC PetShop
                    </Link>

                    {user && (
                        <>
                            <nav className="hidden md:flex space-x-6">
                                <Link to="/" className="hover:opacity-75">
                                    🏠Home
                                </Link>
                                <Link
                                    to="/products"
                                    className="hover:opacity-75"
                                >
                                    🛍️Products
                                </Link>
                                {user.role === "admin" && (
                                    <Link
                                        to="/admin"
                                        className="hover:opacity-75 bg-red-500 px-3 py-1 rounded"
                                    >
                                        👨‍💼Admin
                                    </Link>
                                )}
                            </nav>

                            <div className="flex items-center space-x-4">
                                {user.role !== "admin" && (
                                    <Link
                                        to="/cart"
                                        className="relative hover:opacity-75"
                                    >
                                        🛒 Cart
                                        {cartItemsCount > 0 && (
                                            <span className="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs">
                                                {cartItemsCount}
                                            </span>
                                        )}
                                    </Link>
                                )}
                                <div className="flex items-center space-x-2">
                                    <Link
                                        to="/profile"
                                        className="w-8 h-8 rounded-full mx-auto flex items-center justify-center bg-gray-500 hover:opacity-75 text-white text-sm font-bold"
                                    >
                                        {user.name
                                            ? user.name.charAt(0).toUpperCase()
                                            : "U"}
                                    </Link>
                                </div>
                            </div>
                        </>
                    )}
                </div>
            </div>
        </header>
    );
};

export default Header;
