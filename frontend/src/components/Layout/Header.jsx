import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";
import { useCart } from "../../context/CartContext";

const Header = () => {
    const { user, logout } = useAuth();
    const { cartItems } = useCart();
    const [isMenuOpen, setIsMenuOpen] = useState(false);
    const navigate = useNavigate();

    const cartItemsCount = cartItems.reduce(
        (total, item) => total + item.quantity,
        0
    );

    const handleLogout = async () => {
        try {
            await logout();
            navigate('/login');
        } catch (error) {
            console.error('Logout failed:', error);
        }
    };

    return (
        <header className="bg-blue-600 text-white shadow-lg fixed w-full px-16 z-10">
            <div className="container mx-auto px-4">
                <div className="flex items-center justify-between h-16">
                    <Link to="/" className="text-2xl font-bold">
                        🐾 PCC PetShop
                    </Link>

                    {user ? (
                        <>
                            {/* Navigation Menu */}
                            <nav className="hidden md:flex space-x-6">
                                <Link to="/" className="hover:opacity-75 transition-opacity">
                                    🏠 Home
                                </Link>
                                <Link
                                    to="/products"
                                    className="hover:opacity-75 transition-opacity"
                                >
                                    🛍️ Products
                                </Link>
                                {user.role === "admin" && (
                                    <Link
                                        to="/admin"
                                        className="hover:opacity-75"
                                    >
                                        👨‍💼 Admin
                                    </Link>
                                )}
                            </nav>

                            {/* User Actions */}
                            <div className="flex items-center space-x-4">
                                {/* Cart - Only show for non-admin users */}
                                {user.role !== "admin" && (
                                    <Link
                                        to="/cart"
                                        className="relative hover:opacity-75 transition-opacity"
                                    >
                                        🛒 Cart
                                        {cartItemsCount > 0 && (
                                            <span className="absolute -top-2 -right-2 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center text-xs">
                                                {cartItemsCount}
                                            </span>
                                        )}
                                    </Link>
                                )}

                                {/* User Profile Dropdown */}
                                <div className="relative">
                                    <button
                                        onClick={() => setIsMenuOpen(!isMenuOpen)}
                                        className="flex items-center space-x-2 hover:opacity-75 transition-opacity"
                                    >
                                        <div className="w-8 h-8 rounded-full bg-gray-500 flex items-center justify-center text-white text-sm font-bold">
                                            {user.username
                                                ? user.username.charAt(0).toUpperCase()
                                                : "U"}
                                        </div>
                                        <span className="hidden sm:block">{user.username}</span>
                                        <svg 
                                            className={`w-4 h-4 transition-transform ${isMenuOpen ? 'rotate-180' : ''}`} 
                                            fill="currentColor" 
                                            viewBox="0 0 20 20"
                                        >
                                            <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd" />
                                        </svg>
                                    </button>

                                    {/* Dropdown Menu */}
                                    {isMenuOpen && (
                                        <div className="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50">
                                            <Link
                                                to="/profile"
                                                className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                                                onClick={() => setIsMenuOpen(false)}
                                            >
                                                👤 Profile
                                            </Link>
                                            <button
                                                onClick={() => {
                                                    setIsMenuOpen(false);
                                                    handleLogout();
                                                }}
                                                className="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                                            >
                                                🚪 Logout
                                            </button>
                                        </div>
                                    )}
                                </div>
                            </div>

                            {/* Mobile Menu Button */}
                            <button
                                className="md:hidden"
                                onClick={() => setIsMenuOpen(!isMenuOpen)}
                            >
                                <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                                </svg>
                            </button>
                        </>
                    ) : (
                        /* Login/Register buttons for non-authenticated users */
                        <div className="flex items-center space-x-4">
                            <Link
                                to="/login"
                                className="bg-blue-700 hover:bg-blue-800 px-4 py-2 rounded transition-colors"
                            >
                                Login
                            </Link>
                            <Link
                                to="/register"
                                className="border border-gray-300 hover:bg-blue-800 px-4 py-2 rounded transition-colors"
                            >
                                Register
                            </Link>
                        </div>
                    )}
                </div>

                {/* Mobile Menu */}
                {isMenuOpen && user && (
                    <div className="md:hidden">
                        <div className="px-2 pt-2 pb-3 space-y-1 sm:px-3 bg-blue-700">
                            <Link
                                to="/"
                                className="block px-3 py-2 rounded-md text-base font-medium hover:bg-blue-800"
                                onClick={() => setIsMenuOpen(false)}
                            >
                                🏠 Home
                            </Link>
                            <Link
                                to="/products"
                                className="block px-3 py-2 rounded-md text-base font-medium hover:bg-blue-800"
                                onClick={() => setIsMenuOpen(false)}
                            >
                                🛍️ Products
                            </Link>
                            {user.role !== "admin" && (
                                <Link
                                    to="/cart"
                                    className="block px-3 py-2 rounded-md text-base font-medium hover:bg-blue-800"
                                    onClick={() => setIsMenuOpen(false)}
                                >
                                    🛒 Cart ({cartItemsCount})
                                </Link>
                            )}
                            {user.role === "admin" && (
                                <Link
                                    to="/admin"
                                    className="block px-3 py-2 rounded-md text-base font-medium bg-red-500 hover:bg-red-600"
                                    onClick={() => setIsMenuOpen(false)}
                                >
                                    👨‍💼 Admin
                                </Link>
                            )}
                            <Link
                                to="/profile"
                                className="block px-3 py-2 rounded-md text-base font-medium hover:bg-blue-800"
                                onClick={() => setIsMenuOpen(false)}
                            >
                                👤 Profile
                            </Link>
                            <button
                                onClick={() => {
                                    setIsMenuOpen(false);
                                    handleLogout();
                                }}
                                className="block w-full text-left px-3 py-2 rounded-md text-base font-medium hover:bg-blue-800"
                            >
                                🚪 Logout
                            </button>
                        </div>
                    </div>
                )}
            </div>
        </header>
    );
};

export default Header;