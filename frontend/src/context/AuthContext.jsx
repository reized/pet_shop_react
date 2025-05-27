import { createContext, useContext, useState, useEffect } from "react";
import axios from "axios";
import { BASE_URL } from "../utils";

const AuthContext = createContext();

export const useAuth = () => {
    const context = useContext(AuthContext);
    if (!context) {
        throw new Error("useAuth must be used within an AuthProvider");
    }
    return context;
};

export const AuthProvider = ({ children }) => {
    const [user, setUser] = useState(null);
    const [token, setToken] = useState(localStorage.getItem("token"));
    const [loading, setLoading] = useState(true);

    // Set up axios default headers
    useEffect(() => {
        if (token) {
            axios.defaults.headers.common["Authorization"] = `Bearer ${token}`;
            // Verify token and get user info
            verifyToken();
        } else {
            delete axios.defaults.headers.common["Authorization"];
            setLoading(false);
        }
    }, [token]);

    const verifyToken = async () => {
        try {
            const response = await axios.get(`${BASE_URL}/profile`);
            if (response.data.success) {
                setUser(response.data.user);
            } else {
                logout();
            }
        } catch (error) {
            console.error("Token verification failed:", error);
            logout();
        } finally {
            setLoading(false);
        }
    };

    const login = async (username, password) => {
        try {
            const response = await axios.post(`${BASE_URL}/login`, {
                username,
                password,
            });

            if (response.data.success) {
                const { token: newToken, user: userData } = response.data;

                // Save to localStorage
                localStorage.setItem("token", newToken);

                // Update state
                setToken(newToken);
                setUser(userData);

                // Set axios default header
                axios.defaults.headers.common[
                    "Authorization"
                ] = `Bearer ${newToken}`;

                return { success: true, user: userData };
            } else {
                throw new Error(response.data.message || "Login failed");
            }
        } catch (error) {
            console.error("Login error:", error);
            throw new Error(
                error.response?.data?.message || error.message || "Login failed"
            );
        }
    };

    const register = async (username, password) => {
        try {
            const response = await axios.post(`${BASE_URL}/register`, {
                username,
                password,
            });

            if (response.data.success) {
                return { success: true, message: response.data.message };
            } else {
                throw new Error(response.data.message || "Registration failed");
            }
        } catch (error) {
            console.error("Registration error:", error);
            throw new Error(
                error.response?.data?.message ||
                    error.message ||
                    "Registration failed"
            );
        }
    };

    const logout = async () => {
        try {
            // Call logout endpoint (optional)
            await axios.post(`${BASE_URL}/logout`);
        } catch (error) {
            console.error("Logout error:", error);
        } finally {
            // Clear local storage
            localStorage.removeItem("token");

            // Clear state
            setToken(null);
            setUser(null);

            // Remove axios default header
            delete axios.defaults.headers.common["Authorization"];
        }
    };

    const value = {
        user,
        token,
        loading,
        login,
        register,
        logout,
        isAuthenticated: !!user,
        isAdmin: user?.role === "admin",
    };

    return (
        <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
    );
};
