<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product | ShopMate Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="product-add-container">

    <div class="product-add-card">

        <h2>Add Product</h2>
        <p class="subtitle">Fill details to add a new product</p>

        <!-- enctype added for image upload -->
        <form action="/add-product" method="post" enctype="multipart/form-data">

            <!-- Product Name -->
            <label>Product Name</label>
            <input type="text" name="productName" placeholder="Enter product name" required>

            <!-- Price -->
            <label>Price</label>
            <input type="text" name="price" placeholder="Enter product price" required>

            <!-- Quantity -->
            <label>Quantity</label>
            <input type="text" name="qty" placeholder="Enter quantity" required>

            <!-- Category Dropdown -->
            <label>Category</label>
            <select name="category" class="dropdown" required>
                <option value="">-- Select Category --</option>
                <option value="Mobile Phones">Mobile Phones</option>
                <option value="Laptops & Computers">Laptops & Computers</option>
                <option value="Wearables">Wearables</option>
                <option value="Audio Devices">Audio Devices</option>
                <option value="TV & Entertainment">TV & Entertainment</option>
                <option value="Home Appliances">Home Appliances</option>
                <option value="Cameras & Accessories">Cameras & Accessories</option>
            </select>

            <!-- Image Upload (from local storage) -->
            <label>Upload Product Image</label>
            <input type="file" name="imageFile" accept="image/*" class="file-input" required>

            <button type="submit" class="product-add-btn">Add Product</button>

        </form>

        <p class="bottom-link">Want to view all products?
            <a href="/products">Click here</a>
        </p>

    </div>

</div>

</body>
</html>
