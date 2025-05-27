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
    const [loading, setLoading] = useState(true);

    // Check if user is logged in on app start
    useEffect(() => {
        const token = localStorage.getItem("token");
        if (token) {
            // Verify token and get user info
            axios
                .get(`${BASE_URL}/profile`, {
                    headers: {
                        Authorization: `Bearer ${token}`,
                    },
                })
                .then((response) => {
                    if (response.data.success) {
                        setUser(response.data.user);
                    }
                })
                .catch((error) => {
                    console.error("Token verification failed:", error);
                    localStorage.removeItem("token");
                })
                .finally(() => {
                    setLoading(false);
                });
        } else {
            setLoading(false);
        }
    }, []);

    const login = async (username, password) => {
        try {
            const response = await axios.post(`${BASE_URL}/login`, {
                username,
                password,
            });

            if (response.data.success) {
                const { token, user } = response.data;
                localStorage.setItem("token", token);
                setUser(user);
                return { success: true, user };
            } else {
                throw new Error(response.data.message || "Login failed");
            }
        } catch (error) {
            console.error("Login error:", error);
            const message =
                error.response?.data?.message ||
                error.message ||
                "Login failed";
            throw new Error(message);
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
            const message =
                error.response?.data?.message ||
                error.message ||
                "Registration failed";
            throw new Error(message);
        }
    };

    const logout = async () => {
        try {
            const token = localStorage.getItem("token");
            if (token) {
                // Call logout endpoint (optional since JWT is stateless)
                await axios.post(
                    `${BASE_URL}/logout`,
                    {},
                    {
                        headers: {
                            Authorization: `Bearer ${token}`,
                        },
                    }
                );
            }
        } catch (error) {
            console.error("Logout error:", error);
        } finally {
            // Always clear local storage and user state
            localStorage.removeItem("token");
            setUser(null);
        }
    };

    const value = {
        user,
        login,
        register,
        logout,
        loading,
    };

    return (
        <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
    );
};
