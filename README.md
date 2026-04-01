# Online Shopping Cart — Java Servlet Project

A mini e-commerce web app built with Java Servlets, JSP, HTML/CSS/JS, and Apache Tomcat.

---

## Project Structure

```
ShoppingCart/
├── src/main/java/com/shop/
│   ├── Product.java              ← Model class
│   ├── ProductCatalog.java       ← Static product list
│   ├── AddToCartServlet.java     ← Handles add-to-cart POST
│   ├── ViewCartServlet.java      ← Reads session, forwards to cart.jsp
│   └── ClearCartServlet.java     ← Empties the cart
├── src/main/webapp/
│   ├── index.html                ← Product listing page
│   ├── cart.jsp                  ← Cart display + total
│   ├── css/style.css
│   ├── js/cart.js
│   └── WEB-INF/web.xml
└── pom.xml
```

---

## Setup & Run (VS Code + Tomcat)

### Prerequisites
- Java 11 or higher
- Apache Tomcat 9 or 10
- VS Code with:
  - Extension Pack for Java
  - Tomcat for Java extension

### Steps

1. **Open the project in VS Code**
   ```
   code ShoppingCart/
   ```

2. **Build with Maven**
   ```bash
   mvn clean package
   ```
   This produces `target/ShoppingCart.war`

3. **Deploy to Tomcat**
   - In VS Code: right-click `ShoppingCart.war` → "Run on Tomcat Server"
   - Or copy the WAR to `$TOMCAT_HOME/webapps/`

4. **Open in browser**
   ```
   http://localhost:8080/ShoppingCart/
   ```

---

## How It Works

| Action | What happens |
|--------|-------------|
| Open index.html | Product listing is shown (static HTML) |
| Click "Add to cart" | JS POSTs to `/addToCart` servlet |
| Servlet receives request | Gets/creates `HttpSession`, adds `Product` to `ArrayList` |
| Click cart icon | Browser navigates to `/viewCart` |
| ViewCartServlet runs | Reads `ArrayList` from session, forwards to `cart.jsp` |
| cart.jsp renders | Loops the list, shows items + GST + total |
| "Clear cart" button | POSTs to `/clearCart`, removes session attribute |

---

## Key Concepts Demonstrated

- **Java Servlet lifecycle** — `doGet` / `doPost` override
- **Session management** — `HttpSession` to persist cart across requests
- **Java Collections** — `ArrayList<Product>` as the cart data structure
- **JSP scriptlets** — iterating the cart and computing totals server-side
- **MVC pattern** — Servlet (controller) → JSP (view) → Product (model)
- **HTML/CSS/JS frontend** — fetch API for async add-to-cart

---

## Future Enhancements (from PRD)

- [ ] MySQL database for products and orders
- [ ] User authentication (login/signup)
- [ ] Remove individual items from cart
- [ ] Payment gateway integration
- [ ] Product images and search
- [ ] Order history page

