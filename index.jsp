<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.shop.Product, com.shop.ProductCatalog" %>
<%
  List<Product> sessionCart = (List<Product>) session.getAttribute("cart");
  int cartCount = (sessionCart != null) ? sessionCart.size() : 0;
  List<Product> products = ProductCatalog.getAllProducts();
  String added = request.getParameter("added");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ShopCart — Tech Store</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<nav>
  <a href="index.jsp" class="nav-logo">Shop<span>Cart</span></a>
  <div class="nav-right">
    <a href="viewCart" class="cart-btn">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
           stroke="currentColor" stroke-width="1.5" stroke-linecap="round">
        <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/>
        <line x1="3" y1="6" x2="21" y2="6"/>
        <path d="M16 10a4 4 0 01-8 0"/>
      </svg>
      Cart
      <span class="cart-count" id="cartCount"><%= cartCount %></span>
    </a>
  </div>
</nav>

<div id="toast">
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none"
       stroke="currentColor" stroke-width="2.5" stroke-linecap="round">
    <polyline points="20 6 9 17 4 12"/>
  </svg>
  <span class="toast-msg"></span>
</div>

<section class="hero">
  <div class="hero-tag">New arrivals · 2024</div>
  <h1>Premium <span class="accent">Tech</span><br>for Creators</h1>
  <p class="hero-sub">
    Curated hardware that helps you build, design, and ship.
    No noise — just the tools that matter.
  </p>
</section>

<section class="products-section">
  <div class="section-header">
    <span class="section-title"><%= products.size() %> products</span>
  </div>

  <div class="product-grid">
    <% for (Product p : products) { %>
    <div class="product-card">
      <span class="product-emoji"><%= p.getEmoji() %></span>
      <div>
        <div class="product-category"><%= p.getCategory() %></div>
        <div class="product-name"><%= p.getName() %></div>
      </div>
      <p class="product-desc"><%= p.getDescription() %></p>
      <div class="product-footer">
        <div class="product-price">
          <sub>&#8377;</sub><%= String.format("%,.0f", p.getPrice()) %>
        </div>
        <form method="post" action="addToCart" style="margin:0;">
          <input type="hidden" name="productId" value="<%= p.getId() %>">
          <button type="submit" class="add-btn" data-name="<%= p.getName() %>">
            + Add to cart
          </button>
        </form>
      </div>
    </div>
    <% } %>
  </div>
</section>

<script src="js/cart.js"></script>
<% if (added != null && !added.isEmpty()) { %>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    showToast('\u2713 <%= added.replace("+", " ") %> added to cart');
  });
</script>
<% } %>

</body>
</html>
