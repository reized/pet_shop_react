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
        <header className="bg-blue-600 text-white shadow-lg">
            <div className="container mx-auto px-4">
                <div className="flex items-center justify-between h-16">
                    <Link to="/" className="text-2xl font-bold">
                        🐾 PCC PetShop
                    </Link>

                    <nav className="hidden md:flex space-x-6">
                        <Link to="/" className="hover:text-blue-200">
                            Home
                        </Link>
                        <Link to="/products" className="hover:text-blue-200">
                            Products
                        </Link>
                    </nav>

                    <div className="flex items-center space-x-4">
                        <Link
                            to="/cart"
                            className="relative hover:text-blue-200"
                        >
                            🛒 Cart
                            {cartItemsCount > 0 && (
                                <span className="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs">
                                    {cartItemsCount}
                                </span>
                            )}
                        </Link>

                        {user ? (
                            <div className="flex items-center space-x-2">
                                <Link
                                    to="/profile"
                                    className="hover:text-blue-200"
                                >
                                    Profile
                                </Link>
                                <button
                                    onClick={logout}
                                    className="hover:text-blue-200"
                                >
                                    Logout
                                </button>
                            </div>
                        ) : (
                            <div className="flex items-center space-x-2">
                                <Link
                                    to="/login"
                                    className="hover:text-blue-200"
                                >
                                    Login
                                </Link>
                                <Link
                                    to="/register"
                                    className="hover:text-blue-200"
                                >
                                    Register
                                </Link>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </header>
    );
};

export default Header;
