import { useState, useEffect } from "react";
import { useAuth } from "../context/AuthContext";
import axios from "axios";
import { BASE_URL } from "../utils";
import { Link } from "react-router-dom";

const Profile = () => {
    const { user, logout } = useAuth();
    const [profile, setProfile] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState("");

    useEffect(() => {
        const fetchProfile = async () => {
            if (!user) {
                setLoading(false);
                return;
            }

            try {
                const token = localStorage.getItem('token');
                const response = await axios.get(`${BASE_URL}/profile`, {
                    headers: {
                        Authorization: `Bearer ${token}`
                    }
                });
                
                if (response.data.success) {
                    setProfile(response.data.user);
                }
            } catch (err) {
                console.error('Error fetching profile:', err);
                setError('Failed to load profile');
            } finally {
                setLoading(false);
            }
        };

        fetchProfile();
    }, [user]);

    const handleLogout = async () => {
        try {
            await logout();
        } catch (err) {
            console.error('Logout error:', err);
        }
    };

    if (!user) {
        return (
            <div className="text-center py-12">
                <h2 className="text-2xl font-bold mb-4">
                    Please login to view your profile
                </h2>
                <Link to="/login" className="text-blue-600 hover:underline">
                    Login here
                </Link>
            </div>
        );
    }

    if (loading) {
        return (
            <div className="text-center py-12">
                <div className="animate-spin rounded-full h-32 w-32 border-b-2 border-blue-600 mx-auto"></div>
                <p className="mt-4 text-gray-600">Loading profile...</p>
            </div>
        );
    }

    const displayUser = profile || user;

    return (
        <div className="max-w-4xl mx-auto">
            <h1 className="text-3xl font-bold mb-8">My Profile</h1>

            <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                {/* Profile Info */}
                <div className="bg-white p-6 rounded-lg shadow-md">
                    <div className="text-center">
                        <div className="w-24 h-24 rounded-full mx-auto mb-4 flex items-center justify-center bg-blue-500 text-white text-3xl font-bold">
                            {displayUser.username 
                                ? displayUser.username.charAt(0).toUpperCase()
                                : "U"}
                        </div>
                        <h2 className="text-xl font-semibold mb-2">
                            {displayUser.username}
                        </h2>
                        <p className="text-gray-600 mb-2 capitalize">
                            Role: {displayUser.role}
                        </p>
                        {displayUser.createdAt && (
                            <p className="text-gray-500 text-sm mb-4">
                                Member since: {new Date(displayUser.createdAt).toLocaleDateString()}
                            </p>
                        )}
                        <button
                            onClick={handleLogout}
                            className="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition-colors"
                        >
                            Logout
                        </button>
                    </div>
                </div>

                {/* Profile Details */}
                <div className="lg:col-span-2">
                    <div className="bg-white p-6 rounded-lg shadow-md mb-6">
                        <h3 className="text-2xl font-semibold mb-4">Profile Information</h3>
                        <div className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">
                                    Username
                                </label>
                                <p className="text-gray-900 bg-gray-50 px-3 py-2 rounded border">
                                    {displayUser.username}
                                </p>
                            </div>
                            <div>
                                <label className="block text-sm font-medium text-gray-700 mb-1">
                                    Role
                                </label>
                                <p className="text-gray-900 bg-gray-50 px-3 py-2 rounded border capitalize">
                                    {displayUser.role}
                                </p>
                            </div>
                            {displayUser.createdAt && (
                                <div>
                                    <label className="block text-sm font-medium text-gray-700 mb-1">
                                        Account Created
                                    </label>
                                    <p className="text-gray-900 bg-gray-50 px-3 py-2 rounded border">
                                        {new Date(displayUser.createdAt).toLocaleString()}
                                    </p>
                                </div>
                            )}
                        </div>
                    </div>

                    {/* Order History Placeholder */}
                    <div className="bg-white p-6 rounded-lg shadow-md">
                        <h3 className="text-2xl font-semibold mb-4">Order History</h3>
                        <div className="text-center py-8 text-gray-500">
                            <p>Order history feature coming soon!</p>
                            <p className="text-sm mt-2">Your past orders will be displayed here.</p>
                        </div>
                    </div>
                </div>
            </div>

            {error && (
                <div className="mt-4 bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-md">
                    {error}
                </div>
            )}
        </div>
    );
};

export default Profile;