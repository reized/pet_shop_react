import { useState, useEffect } from "react";
import axios from "axios";
import ProductCard from "../components/Product/ProductCard";
import ProductFilter from "../components/Product/ProductFilter";
import { useCart } from "../context/CartContext";
import { BASE_URL } from "../utils";

const Products = () => {
    const [products, setProducts] = useState([]);
    const [filteredProducts, setFilteredProducts] = useState([]);
    const [categories, setCategories] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [selectedCategory, setSelectedCategory] = useState("");
    const { addToCart } = useCart();

    useEffect(() => {
        axios
            .get(`${BASE_URL}/products`)
            .then((res) => {
                setProducts(res.data);
                setFilteredProducts(res.data);
            })
            .catch((err) => {
                console.error("Error fetching products:", err);
            });

        axios
            .get(`${BASE_URL}/categories`)
            .then((res) => setCategories(res.data))
            .catch((err) => {
                console.error("Error fetching categories:", err);
            });
    }, []);

    useEffect(() => {
        let filtered = products;

        if (searchTerm) {
            filtered = filtered.filter(
                (product) =>
                    product.name
                        .toLowerCase()
                        .includes(searchTerm.toLowerCase()) ||
                    product.description
                        .toLowerCase()
                        .includes(searchTerm.toLowerCase())
            );
        }

        if (selectedCategory) {
            filtered = filtered.filter(
                (product) => String(product.category_id) === String(selectedCategory)
            );
        }

        setFilteredProducts(filtered);
    }, [searchTerm, selectedCategory, products]);

    const handleAddToCart = (product) => {
        if (product.jumlah_stok > 0) {
            addToCart(product);
            setProducts((prev) =>
                prev.map((p) =>
                    p.id === product.id
                        ? { ...p, jumlah_stok: p.jumlah_stok - 1 }
                        : p
                )
            );
        }
    };

    return (
        <div>
            <h1 className="text-3xl font-bold mb-8">Our Products</h1>

            <ProductFilter
                categories={categories}
                selectedCategory={selectedCategory}
                onCategoryChange={setSelectedCategory}
                searchTerm={searchTerm}
                onSearchChange={setSearchTerm}
            />

            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                {filteredProducts.map((product) => {
                    // Cari nama kategori berdasarkan category_id
                    const category = categories.find(
                        (cat) => String(cat.id) === String(product.category_id)
                    );
                    return (
                        <ProductCard
                            key={product.id}
                            product={product}
                            categoryName={category ? category.nama_jenis : ""}
                            onAddToCart={() => handleAddToCart(product)}
                        />
                    );
                })}
            </div>

            {filteredProducts.length === 0 && (
                <div className="text-center py-12">
                    <p className="text-gray-500 text-lg">
                        No products found matching your criteria.
                    </p>
                </div>
            )}
        </div>
    );
};

export default Products;
