const Footer = () => {
    return (
        <footer className="bg-gray-800 text-white px-16 py-8 mt-12">
            <div className="container mx-auto px-4">
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div>
                        <h3 className="text-lg font-semibold mb-4">
                            🐾 PCC PetShop
                        </h3>
                        <p className="text-gray-300">
                            Your trusted partner for all pet needs
                        </p>
                    </div>
                    <div>
                        <h4 className="text-lg font-semibold mb-4">
                            Quick Links
                        </h4>
                        <ul className="space-y-2">
                            <li>
                                <a
                                    href="#"
                                    className="text-gray-300 hover:text-white"
                                >
                                    About Us
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="text-gray-300 hover:text-white"
                                >
                                    Contact
                                </a>
                            </li>
                            <li>
                                <a
                                    href="#"
                                    className="text-gray-300 hover:text-white"
                                >
                                    FAQ
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h4 className="text-lg font-semibold mb-4">Contact</h4>
                        <p className="text-gray-300">Email: info@pccpetshop.com</p>
                        <p className="text-gray-300">Phone: (555) 123-4567</p>
                    </div>
                </div>
                <div className="border-t border-gray-700 mt-8 pt-4 text-center">
                    <p className="text-gray-300">
                        &copy; 2025 PCC PetShop. All rights reserved.
                    </p>
                </div>
            </div>
        </footer>
    );
};

export default Footer;
