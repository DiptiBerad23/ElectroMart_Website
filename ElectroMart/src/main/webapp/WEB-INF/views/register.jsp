<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register | ShopMate</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="login-container">

    <div class="login-card">

        <h2>Create Account</h2>
        <p>Join ShopMate and start your smart shopping experience</p>

        <form action="/register" method="post">

            <label>Name</label>
            <input type="text" name="name" placeholder="Enter your full name" required>

            <label>Email</label>
            <input type="email" name="email" placeholder="Enter your email" required>


			<label>Mobile no.</label>
			<input type="text" name="mobile" placeholder="Enter mobile number" required>


			<label>Address</label>
			<input type="text" name="address" placeholder="Enter address" required>


			<label>Username</label>
			<input type="text" name="username" placeholder="Enter username" required>

            <label>Password</label>
            <input type="password" name="password" placeholder="Create a password" required>


            <button type="submit" class="login-btn">Register</button>

        </form>

        <p class="register-link">
            Already have an account? <a href="/login-page">Login here</a>
        </p>

    </div>

</div>
<br/>
</body>
</html>
