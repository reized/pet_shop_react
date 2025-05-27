import { useState } from "react";
import { useAuth } from "../context/AuthContext";

const Profile = () => {
    const { user, logout } = useAuth();
    const [orders] = useState([
        {
            id: 1,
            date: "2024-01-15",
            total: 89.99,
            status: "Delivered",
            items: [
                { name: "Premium Dog Food", quantity: 2, price: 29.99 },
                { name: "Cat Toy Set", quantity: 1, price: 19.99 },
            ],
        },
        {
            id: 2,
            date: "2024-01-10",
            total: 45.5,
            status: "Shipped",
            items: [
                { name: "Pet Shampoo", quantity: 1, price: 15.99 },
                { name: "Dog Leash", quantity: 1, price: 29.51 },
            ],
        },
    ]);

    if (!user) {
        return (
            <div className="text-center py-12">
                <h2 className="text-2xl font-bold mb-4">
                    Please login to view your profile
                </h2>
            </div>
        );
    }

    return (
        <div className="max-w-4xl mx-auto">
            <h1 className="text-3xl font-bold mb-8">My Profile</h1>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                {/* Profile Info */}
                <div className="bg-white p-6 rounded-lg shadow-md">
                    <div className="text-center">
                        <img
                            src={user.avatar}
                            alt={user.name}
                            className="w-24 h-24 rounded-full mx-auto mb-4"
                        />
                        <h2 className="text-xl font-semibold mb-2">
                            {user.name}
                        </h2>
                        <p className="text-gray-600 mb-4">{user.email}</p>
                        <button
                            onClick={logout}
                            className="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"
                        >
                            Logout
                        </button>
                    </div>
                </div>

                {/* Order History */}
                <div className="lg:col-span-2">
                    <h3 className="text-2xl font-semibold mb-6">
                        Order History
                    </h3>

                    <div className="space-y-4">
                        {orders.map((order) => (
                            <div
                                key={order.id}
                                className="bg-white p-6 rounded-lg shadow-md"
                            >
                                <div className="flex justify-between items-start mb-4">
                                    <div>
                                        <h4 className="font-semibold">
                                            Order #{order.id}
                                        </h4>
                                        <p className="text-gray-600">
                                            Date: {order.date}
                                        </p>
                                    </div>
                                    <div className="text-right">
                                        <p className="font-semibold">
                                            ${order.total}
                                        </p>
                                        <span
                                            className={`px-2 py-1 rounded text-sm ${
                                                order.status === "Delivered"
                                                    ? "bg-green-100 text-green-800"
                                                    : "bg-blue-100 text-blue-800"
                                            }`}
                                        >
                                            {order.status}
                                        </span>
                                    </div>
                                </div>

                                <div className="border-t pt-4">
                                    <h5 className="font-medium mb-2">Items:</h5>
                                    <ul className="space-y-1">
                                        {order.items.map((item, index) => (
                                            <li
                                                key={index}
                                                className="flex justify-between text-sm"
                                            >
                                                <span>
                                                    {item.name} x{item.quantity}
                                                </span>
                                                <span>${item.price}</span>
                                            </li>
                                        ))}
                                    </ul>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Profile;
