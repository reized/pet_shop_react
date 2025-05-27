import { createContext, useContext, useState, useEffect } from "react";

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

    useEffect(() => {
        // Simulate checking for existing session
        const savedUser = JSON.parse(localStorage.getItem("user") || "null");
        setUser(savedUser);
        setLoading(false);
    }, []);

    const login = async (email, password) => {
        // Simulate API call
        const mockUser = {
            id: 1,
            name: "John Doe",
            email: email,
            avatar: "https://via.placeholder.com/100",
        };
        setUser(mockUser);
        localStorage.setItem("user", JSON.stringify(mockUser));
        return mockUser;
    };

    const register = async (userData) => {
        // Simulate API call
        const mockUser = {
            id: Date.now(),
            ...userData,
            avatar: "https://via.placeholder.com/100",
        };
        setUser(mockUser);
        localStorage.setItem("user", JSON.stringify(mockUser));
        return mockUser;
    };

    const logout = () => {
        setUser(null);
        localStorage.removeItem("user");
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
