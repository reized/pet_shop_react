import { Link } from "react-router-dom";
import { useCart } from "../context/CartContext";
import { useAuth } from "../context/AuthContext";
import CartItem from "../components/Cart/CartItem";

const Cart = () => {
    const { cartItems, getTotalPrice, clearCart } = useCart();
    const { user } = useAuth();

    const handleCheckout = () => {
        if (!user) {
            alert("Please login to proceed with checkout");
            return;
        }

        // Simulate checkout process
        alert(
            `Order placed successfully! Total: ${getTotalPrice().toFixed(2)}`
        );
        clearCart();
    };

    if (cartItems.length === 0) {
        return (
            <div className="text-center py-12">
                <h2 className="text-2xl font-bold mb-4">Your cart is empty</h2>
                <p className="text-gray-600 mb-6">
                    Add some products to get started!
                </p>
                <Link
                    to="/products"
                    className="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700"
                >
                    Continue Shopping
                </Link>
            </div>
        );
    }

    return (
        <div>
            <h1 className="text-3xl font-bold mb-8">Shopping Cart</h1>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <div className="lg:col-span-2">
                    <div className="space-y-4">
                        {cartItems.map((item) => (
                            <CartItem key={item.id} item={item} />
                        ))}
                    </div>
                </div>

                <div className="bg-white p-6 rounded-lg shadow-md h-fit">
                    <h3 className="text-xl font-semibold mb-4">
                        Order Summary
                    </h3>

                    <div className="space-y-2 mb-4">
                        <div className="flex justify-between">
                            <span>Subtotal:</span>
                            <span>${getTotalPrice().toFixed(2)}</span>
                        </div>
                        <div className="flex justify-between">
                            <span>Shipping:</span>
                            <span>Free</span>
                        </div>
                        <div className="border-t pt-2">
                            <div className="flex justify-between font-semibold text-lg">
                                <span>Total:</span>
                                <span>${getTotalPrice().toFixed(2)}</span>
                            </div>
                        </div>
                    </div>

                    <button
                        onClick={handleCheckout}
                        className="w-full bg-blue-600 text-white py-3 rounded-lg font-semibold hover:bg-blue-700 transition-colors mb-4"
                    >
                        Proceed to Checkout
                    </button>

                    <button
                        onClick={clearCart}
                        className="w-full bg-gray-300 text-gray-700 py-2 rounded-lg hover:bg-gray-400 transition-colors"
                    >
                        Clear Cart
                    </button>
                </div>
            </div>
        </div>
    );
};

export default Cart;
