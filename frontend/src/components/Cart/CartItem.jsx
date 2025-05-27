import { useCart } from "../../context/CartContext";

const CartItem = ({ item }) => {
    const { removeFromCart, updateQuantity } = useCart();

    return (
        <div className="flex items-center space-x-4 bg-white p-4 rounded-lg shadow">
            <img
                src={item.image_url}
                alt={item.name}
                className="w-16 h-16 object-cover rounded"
            />
            <div className="flex-1">
                <h3 className="font-semibold">{item.name}</h3>
                <p className="text-gray-600">Rp{item.price.toLocaleString()}</p>
            </div>
            <div className="flex items-center space-x-2">
                <button
                    onClick={() => updateQuantity(item.id, item.quantity - 1)}
                    className="w-8 h-8 flex items-center justify-center bg-gray-200 rounded hover:bg-gray-300"
                >
                    -
                </button>
                <span className="w-8 text-center">{item.quantity}</span>
                <button
                    onClick={() => updateQuantity(item.id, item.quantity + 1)}
                    className="w-8 h-8 flex items-center justify-center bg-gray-200 rounded hover:bg-gray-300"
                >
                    +
                </button>
            </div>
            <div className="text-right">
                <p className="font-semibold">
                    Rp{(item.price * item.quantity).toLocaleString()}
                </p>
                <button
                    onClick={() => removeFromCart(item.id)}
                    className="text-red-500 hover:text-red-700 text-sm"
                >
                    Remove
                </button>
            </div>
        </div>
    );
};

export default CartItem;
