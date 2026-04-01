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
 * ViewCartServlet reads the session cart and forwards to cart.jsp.
 * URL mapping: /viewCart
 */
@WebServlet("/viewCart")
public class ViewCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        List<Product> cart = new ArrayList<>();

        if (session != null) {
            @SuppressWarnings("unchecked")
            List<Product> sessionCart =
                    (List<Product>) session.getAttribute("cart");
            if (sessionCart != null) {
                cart = sessionCart;
            }
        }

        // Calculate total price
        double total = 0;
        for (Product p : cart) {
            total += p.getPrice();
        }

        // Set attributes for cart.jsp
        request.setAttribute("cart",       cart);
        request.setAttribute("total",      total);
        request.setAttribute("cartCount",  cart.size());

        // Forward to the JSP view
        request.getRequestDispatcher("/cart.jsp")
               .forward(request, response);
    }
}
