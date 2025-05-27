import { useState } from "react";
import { useParams, Link } from "react-router-dom";
import { mockProducts } from "../data/mockData";
import { useCart } from "../context/CartContext";

const ProductDetail = () => {
    const { id } = useParams();
    const { addToCart } = useCart();
    const [quantity, setQuantity] = useState(1);

    const product = mockProducts.find((p) => p.id === parseInt(id));

    if (!product) {
        return (
            <div className="text-center py-12">
                <h2 className="text-2xl font-bold mb-4">Product not found</h2>
                <Link to="/products" className="text-blue-600 hover:underline">
                    ← Back to Products
                </Link>
            </div>
        );
    }

    const handleAddToCart = () => {
        for (let i = 0; i < quantity; i++) {
            addToCart(product);
        }
    };

    return (
        <div>
            <Link
                to="/products"
                className="text-blue-600 hover:underline mb-6 inline-block"
            >
                ← Back to Products
            </Link>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                <div>
                    <img
                        src={product.image}
                        alt={product.name}
                        className="w-full h-96 object-cover rounded-lg"
                    />
                </div>

                <div className="flex flex-col justify-between">
                    <div>
                        <h1 className="text-3xl font-bold mb-4">
                            {product.name}
                        </h1>
                        <p className="text-gray-600 mb-4 bg-gray-200 px-1 rounded w-fit">
                            {product.category}
                        </p>
                        <p className="text-gray-700 mb-6">
                            {product.description}
                        </p>

                        <div className="mb-6">
                            <span className="text-3xl font-bold text-blue-600">
                                ${product.price}
                            </span>
                        </div>
                    </div>

                    <div>
                        <div className="flex items-center space-x-4 mb-6">
                            <p className="text-gray-700">
                                Stock: {product.jumlah_stok}
                            </p>
                            <div className="flex items-center space-x-2">
                                <button
                                    onClick={() =>
                                        setQuantity(Math.max(1, quantity - 1))
                                    }
                                    className="w-8 h-8 flex items-center justify-center bg-gray-200 rounded hover:bg-gray-300"
                                >
                                    -
                                </button>
                                <span className="w-8 text-center">
                                    {quantity}
                                </span>
                                <button
                                    onClick={() => setQuantity(quantity + 1)}
                                    className="w-8 h-8 flex items-center justify-center bg-gray-200 rounded hover:bg-gray-300"
                                >
                                    +
                                </button>
                            </div>
                        </div>

                        <button
                            onClick={handleAddToCart}
                            className="bg-blue-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors"
                        >
                            Add to Cart
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ProductDetail;
