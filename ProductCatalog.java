package com.shop;

import java.util.ArrayList;
import java.util.List;

/**
 * ProductCatalog provides the static list of products available in the store.
 * In a real application this would be loaded from a database.
 */
public class ProductCatalog {

    private static final List<Product> PRODUCTS = new ArrayList<>();

    static {
        PRODUCTS.add(new Product("p1", "MacBook Pro",
                "Apple M3 chip, 16GB RAM, 512GB SSD. The ultimate laptop for professionals.",
                129999.00, "Laptops", "💻"));

        PRODUCTS.add(new Product("p2", "Dell XPS 15",
                "Intel Core i9, 32GB RAM, 1TB SSD. Stunning 4K OLED display.",
                109999.00, "Laptops", "🖥️"));

        PRODUCTS.add(new Product("p3", "Logitech MX Master 3",
                "Advanced wireless mouse with ergonomic design and MagSpeed scroll wheel.",
                7999.00, "Peripherals", "🖱️"));

        PRODUCTS.add(new Product("p4", "Mechanical Keyboard",
                "Cherry MX Brown switches, RGB backlit, compact TKL layout.",
                5499.00, "Peripherals", "⌨️"));

        PRODUCTS.add(new Product("p5", "Sony WH-1000XM5",
                "Industry-leading noise cancellation, 30-hour battery, Hi-Res Audio.",
                29999.00, "Audio", "🎧"));

        PRODUCTS.add(new Product("p6", "Samsung 27\" 4K Monitor",
                "IPS panel, 144Hz refresh rate, USB-C hub, HDR600 support.",
                34999.00, "Displays", "🖥️"));
    }

    public static List<Product> getAllProducts() {
        return PRODUCTS;
    }

    public static Product findById(String id) {
        for (Product p : PRODUCTS) {
            if (p.getId().equals(id)) return p;
        }
        return null;
    }
}
