<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cart | ShopMate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="cart-container">

	<h3>${msg}</h3>

    <!-- EMPTY CART MESSAGE -->
    <c:if test="${empty cartList}">
        <div class="empty-cart-box">
            <img src="https://cdn-icons-png.flaticon.com/512/2038/2038854.png" class="empty-img">
            <h2>Your cart is empty</h2>
            <p>Looks like you haven’t added anything to your cart yet.</p>
            <a href="/products" class="empty-btn">Continue Shopping</a>
        </div>
    </c:if>

    <!-- SHOW TABLE ONLY IF CART HAS ITEMS -->
    <c:if test="${not empty cartList}">

        <!-- INIT TOTAL -->
        <c:set var="grandTotal" value="0" />

        <table class="cart-table">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Remove</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="p" items="${cartList}">
                <tr>
                    <td><img src="${p.imageUrl}" class="cart-img"></td>
                    <td>${p.productName}</td>
                    <td>₹${p.price}</td>
                    <td>
                        <a href="/removeFromCart/${p.productId}" class="remove-btn-table">
                            Remove
                        </a>
                    </td>
                </tr>

                <!-- Add price to Grand Total inside loop -->
                <c:set var="grandTotal" value="${grandTotal + p.price}" />

                </c:forEach>
            </tbody>



        </table>

        <!-- Cart Summary Box -->
        <div class="cart-summary">
            <h3>Total Amount: <span>₹${grandTotal}</span></h3>
            <a href="/buy-from-cart" class="checkout-btn">Buy Now</a>
        </div>

    </c:if>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>
