<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
	
    <meta charset="UTF-8">
    <title>Login | ShopMate</title>

    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<c:if test="${not empty msg}">
	    <h3 class="msg-box-success">${msg}</h3>
	</c:if>

<div class="login-container">

    <div class="login-card">

        <h2>Welcome Back</h2>
        <p class="subtitle">Login to continue your journey with ShopMate</p>

        <form action="/verify-login" method="post">

            <label>Username</label>
            <input type="text" name="username" placeholder="Enter your username" required>

            <label>Password</label>
            <input type="password" name="password" placeholder="Enter your password" required>

            <button type="submit" class="login-btn">Login</button>

        </form>

        <p class="register-link">
            Don’t have an account? <a href="/register-page">Register here</a>
        </p>

    </div>

</div>

</body>
</html>
