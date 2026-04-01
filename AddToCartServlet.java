package com.shop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * AddToCartServlet handles POST requests to add a product to the session cart.
 * URL mapping: /addToCart
 */
@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Read product ID from the request
        String productId = request.getParameter("productId");

        if (productId == null || productId.trim().isEmpty()) {
            response.sendRedirect("index.html");
            return;
        }

        // Look up the product from the catalog
        Product product = ProductCatalog.findById(productId.trim());

        if (product == null) {
            response.sendRedirect("index.html");
            return;
        }

        // Get or create the session
        HttpSession session = request.getSession(true);

        // Retrieve existing cart or create a new one
        @SuppressWarnings("unchecked")
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Add the product to the cart
        cart.add(product);

        // Save the updated cart back to the session
        session.setAttribute("cart", cart);

        // Redirect back to the product page with a success flag
        response.sendRedirect("index.jsp?added=" + product.getName()
                .replace(" ", "+"));
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        // Support GET as well (for simple anchor/link usage)
        doPost(request, response);
    }
}
