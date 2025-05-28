import { useState, useEffect } from "react";
import { useParams, Link } from "react-router-dom";
import axios from "axios";
import { useCart } from "../context/CartContext";
import { BASE_URL } from "../utils";

const ProductDetail = () => {
    const { id } = useParams();
    const { addToCart } = useCart();
    const [quantity, setQuantity] = useState(1);
    const [product, setProduct] = useState(null);
    const [category, setCategory] = useState(null);

    useEffect(() => {
        axios
            .get(`${BASE_URL}/products/${id}`)
            .then((res) => {
                setProduct(res.data);
                return axios.get(`${BASE_URL}/categories/${res.data.category_id}`);
            })
            .then((res) => {
                // Jika response berupa array, ambil elemen pertama
                const cat = Array.isArray(res.data) ? res.data[0] : res.data;
                setCategory(cat);
            })
            .catch(() => setProduct(null));
    }, [id]);

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
                        src={product.image_url}
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
                            {category ? category.nama_jenis : ""}
                        </p>
                        <p className="text-gray-700 mb-6">
                            {product.description}
                        </p>

                        <div className="mb-6">
                            <span className="text-3xl font-bold text-blue-600">
                                Rp{product.price}
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
                                    disabled={quantity >= product.jumlah_stok}
                                >
                                    +
                                </button>
                            </div>
                        </div>

                        <button
                            onClick={handleAddToCart}
                            className="bg-blue-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors"
                            disabled={product.jumlah_stok === 0}
                        >
                            {product.jumlah_stok > 0
                                ? "Add to Cart"
                                : "Out of Stock"}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ProductDetail;
