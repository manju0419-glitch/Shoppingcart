<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.shop.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Your Cart — ShopCart</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- ── Navigation ──────────────────────────── -->
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
      <span class="cart-count" id="cartCount">
        <%= request.getAttribute("cartCount") != null ? request.getAttribute("cartCount") : 0 %>
      </span>
    </a>
  </div>
</nav>

<!-- ── Cart Page ────────────────────────────── -->
<main class="cart-page">

  <h1 class="page-heading">Your Cart</h1>

  <%
    List<Product> cart = (List<Product>) request.getAttribute("cart");
    Double total        = (Double) request.getAttribute("total");
    int    count        = (cart != null) ? cart.size() : 0;
    if (total == null) total = 0.0;
  %>

  <p class="page-sub">
    <% if (count == 0) { %>
      Your cart is empty.
    <% } else { %>
      <%= count %> item<%= count == 1 ? "" : "s" %> ready to checkout.
    <% } %>
  </p>

  <% if (count == 0) { %>
  <!-- ── Empty State ──────────────────────── -->
  <div class="empty-cart">
    <span class="empty-icon">🛒</span>
    <h2>Nothing here yet</h2>
    <p>Add some products from the store and they'll appear here.</p>
    <a href="index.jsp" class="btn-primary">Browse products</a>
  </div>

  <% } else { %>
  <!-- ── Cart Items ────────────────────────── -->
  <div class="cart-items">
    <% for (Product p : cart) { %>
    <div class="cart-item">
      <span class="cart-item-emoji"><%= p.getEmoji() %></span>
      <div class="cart-item-info">
        <div class="cart-item-name"><%= p.getName() %></div>
        <div class="cart-item-cat"><%= p.getCategory() %></div>
      </div>
      <div class="cart-item-price">
        ₹<%= String.format("%,.0f", p.getPrice()) %>
      </div>
    </div>
    <% } %>
  </div>

  <!-- ── Summary ──────────────────────────── -->
  <div class="cart-summary">
    <div class="summary-row">
      <span>Subtotal (<%= count %> item<%= count == 1 ? "" : "s" %>)</span>
      <span>₹<%= String.format("%,.0f", total) %></span>
    </div>
    <div class="summary-row">
      <span>Delivery</span>
      <span style="color: var(--accent2);">Free</span>
    </div>
    <div class="summary-row">
      <span>Tax (18% GST)</span>
      <span>₹<%= String.format("%,.0f", total * 0.18) %></span>
    </div>

    <div class="summary-total">
      <span class="summary-total-label">Total</span>
      <span class="summary-total-value">₹<%= String.format("%,.0f", total * 1.18) %></span>
    </div>

    <div class="cart-actions">
      <a href="index.jsp" class="btn-ghost">
        ← Continue shopping
      </a>
      <form method="post" action="clearCart" style="flex:1; display:flex;">
        <button type="submit" class="btn-danger" style="width:100%;">
          🗑 Clear cart
        </button>
      </form>
      <button class="btn-primary" style="flex:1;"
              onclick="alert('Payment gateway not implemented in this version.')">
        Checkout →
      </button>
    </div>
  </div>

  <% } %>
</main>

<script>
  // Update cart badge from server-side count
  var count = <%= count %>;
  var badge = document.getElementById('cartCount');
  if (badge) badge.textContent = count;
</script>

</body>
</html>
