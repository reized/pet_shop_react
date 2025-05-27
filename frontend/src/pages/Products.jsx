import { useState, useEffect } from "react";
import { mockProducts } from "../data/mockData";
import ProductCard from "../components/Product/ProductCard";
import ProductFilter from "../components/Product/ProductFilter";
import { useCart } from "../context/CartContext";

const Products = () => {
    const [products, setProducts] = useState(mockProducts);
    const [filteredProducts, setFilteredProducts] = useState(mockProducts);
    const [searchTerm, setSearchTerm] = useState("");
    const [selectedCategory, setSelectedCategory] = useState("");
    const { addToCart } = useCart();

    const categories = [
        ...new Set(mockProducts.map((product) => product.category)),
    ];

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
                (product) => product.category === selectedCategory
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
                {filteredProducts.map((product) => (
                    <ProductCard
                        key={product.id}
                        product={product}
                        onAddToCart={() => handleAddToCart(product)}
                    />
                ))}
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
