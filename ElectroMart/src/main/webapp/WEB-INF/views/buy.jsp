<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Order Summary | ShopMate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="cart-container">

    <h2 class="cart-title">🧾 Order Summary</h2>
    <p class="cart-subtitle">💵 Review your bill before placing order</p>

    <!-- IF CART EMPTY -->
    <c:if test="${empty cartList}">
        <div class="empty-cart-box">
            <img src="https://cdn-icons-png.flaticon.com/512/2038/2038854.png" class="empty-img">
            <h2>No Products Found</h2>
            <p>Please add items to your cart first.</p>
            <a href="/products" class="empty-btn">Continue Shopping</a>
        </div>
    </c:if>


    <!-- SHOW WHEN CART HAS ITEMS -->
    <c:if test="${not empty cartList}">

        <!-- INIT TOTAL -->
        <c:set var="grandTotal" value="0" />

        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                </tr>
            </thead>

            <tbody>

                <c:forEach var="p" items="${cartList}">
                <tr>
                    <td>${p.productName}</td>
                    <td>₹${p.price}</td>
                </tr>

                <!-- Add price to grand total -->
                <c:set var="grandTotal" value="${grandTotal + p.price}" />

                </c:forEach>

            </tbody>

            <tfoot>
                <tr class="grand-row">
                    <td style="text-align:right; font-weight:bold;">Grand Total:</td>
                    <td style="font-weight:bold; color:#2575fc;">₹${grandTotal}</td>
                </tr>
            </tfoot>
        </table>

        <!-- Order Summary Box -->
        <div class="cart-summary">
            <h3>Total Payable: <span>₹${grandTotal}</span></h3>
            <a href="/pay-bill" class="checkout-btn">Place Order</a>
			<a onclick="window.print()" class="checkout-btn">Print Bill</a>
        </div>

    </c:if>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>
