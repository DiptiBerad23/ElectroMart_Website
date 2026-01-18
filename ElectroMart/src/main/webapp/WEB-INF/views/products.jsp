<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products | ElectroMart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

    <!-- HEADER -->
    <jsp:include page="header.jsp" />

    <div class="shop-container">

        <!-- SUCCESS / INFO MESSAGE -->
        <c:if test="${not empty msg}">
            <h3 class="msg-box-success">${msg}</h3>
        </c:if>

        <!-- PAGE TITLE -->
        <h2 class="shop-title">Discover Smart Electronics</h2>
        <p class="shop-subtitle">
            Premium gadgets, trusted brands & unbeatable prices
        </p>

        <!-- CATEGORY FILTER (UI ONLY) -->
        <div class="filter-bar">
            <label>Browse by Category</label>
            <select id="categoryFilter">
                <option value="all">All Products</option>
                <option value="Mobile Phones">📱 Mobile Phones</option>
                <option value="Laptops & Computers">💻 Laptops & Computers</option>
                <option value="Wearables">⌚ Wearables</option>
                <option value="Audio Devices">🎧 Audio Devices</option>
                <option value="TV & Entertainment">📺 TV & Entertainment</option>
                <option value="Home Appliances">🏠 Home Appliances</option>
                <option value="Cameras & Accessories">📷 Cameras & Accessories</option>
                <option value="Power & Accessories">🔌 Power & Accessories</option>
                <option value="Computer Accessories">🖥 Computer Accessories</option>
            </select>
        </div>

        <!-- PRODUCT GRID -->
        <div class="product-grid">

            <c:forEach var="p" items="${productList}">

                <div class="product-card" data-category="${p.category}">

                    <img src="${p.imageUrl}" alt="${p.productName}">

                    <h3>${p.productName}</h3>

                    <p class="price">₹${p.price}</p>

                    <p class="product-category">
                        ${p.category}
                    </p>

                    <form action="/add-to-cart/${p.productId}" method="post">
                        <button type="submit">Add to Cart</button>
                    </form>

                </div>

            </c:forEach>

        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="footer.jsp" />

    <!-- UI ONLY CATEGORY FILTER SCRIPT -->
    <script>
        document.getElementById("categoryFilter").addEventListener("change", function () {
            const selectedCategory = this.value;
            const cards = document.querySelectorAll(".product-card");

            cards.forEach(card => {
                const cardCategory = card.getAttribute("data-category");

                if (selectedCategory === "all" || cardCategory === selectedCategory) {
                    card.style.display = "block";
                } else {
                    card.style.display = "none";
                }
            });
        });
    </script>

</body>
</html>
