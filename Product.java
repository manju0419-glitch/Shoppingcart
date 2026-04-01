package com.shop;

import java.io.Serializable;

/**
 * Product model class representing an item in the store.
 * Implements Serializable so it can be stored in HttpSession.
 */
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;
    private String name;
    private String description;
    private double price;
    private String category;
    private String emoji;

    public Product() {}

    public Product(String id, String name, String description,
                   double price, String category, String emoji) {
        this.id          = id;
        this.name        = name;
        this.description = description;
        this.price       = price;
        this.category    = category;
        this.emoji       = emoji;
    }

    // Getters
    public String getId()          { return id;          }
    public String getName()        { return name;        }
    public String getDescription() { return description; }
    public double getPrice()       { return price;       }
    public String getCategory()    { return category;    }
    public String getEmoji()       { return emoji;       }

    // Setters
    public void setId(String id)                   { this.id          = id;          }
    public void setName(String name)               { this.name        = name;        }
    public void setDescription(String description) { this.description = description; }
    public void setPrice(double price)             { this.price       = price;       }
    public void setCategory(String category)       { this.category    = category;    }
    public void setEmoji(String emoji)             { this.emoji       = emoji;       }

    @Override
    public String toString() {
        return "Product{id='" + id + "', name='" + name + "', price=" + price + "}";
    }
}
