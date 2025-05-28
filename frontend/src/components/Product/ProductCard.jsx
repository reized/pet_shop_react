import React from "react";
import { Link } from "react-router-dom";
import { useCart } from "../../context/CartContext";

const ProductCard = ({ product, categoryName, onAddToCart }) => {
    const { addToCart } = useCart();

    const handleAddToCart = (e) => {
        e.preventDefault();
        if (onAddToCart) {
            onAddToCart();
        } else {
            addToCart(product);
        }
    };

    return (
        <div className="bg-white rounded-lg shadow-md overflow-hidden hover:scale-[102%] hover:shadow-lg duration-200 transition-all cursor-pointer">
            <Link to={`/products/${product.id}`}>
                <img
                    src={product.image_url}
                    alt={product.name}
                    className="w-full h-48 object-cover"
                />
            </Link>
            <div className="p-4">
                <Link to={`/products/${product.id}`}>
                    <h3 className="text-md font-semibold mb-3 hover:text-blue-600">
                        {product.name}
                    </h3>
                </Link>
                <div className="flex justify-between">
                    <p className="text-gray-600 text-sm mb-6 bg-gray-200 px-1 rounded">
                        {categoryName}
                    </p>
                    <p className="text-gray-500 text-sm mb-2">
                        Stock: {product.jumlah_stok}
                    </p>
                </div>
                <div className="flex items-center justify-between">
                    <span className="text-lg font-bold text-blue-600">
                        Rp{product.price}
                    </span>
                    <button
                        onClick={handleAddToCart}
                        className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition-colors"
                        disabled={product.jumlah_stok <= 0}
                    >
                        {product.jumlah_stok > 0
                            ? "Add to Cart"
                            : "Out of Stock"}
                    </button>
                </div>
            </div>
        </div>
    );
};

export default ProductCard;
