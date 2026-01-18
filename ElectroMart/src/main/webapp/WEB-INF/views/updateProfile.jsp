<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User | ShopMate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="login-container">

    <div class="login-card">

        <h2>Update User</h2>
        <p>Modify user details and save changes</p>

        <form action="/update-user" method="post">

            <label>User ID</label>
            <input type="text" name="userId" value="${user.userId}" readonly>

            <label>Name</label>
            <input type="text" name="name" value="${user.name}" required>

            <label>Email</label>
            <input type="email" name="email" value="${user.email}" required>

            <label>Mobile No.</label>
            <input type="text" name="mobile" value="${user.mobile}" required>

            <label>Address</label>
            <input type="text" name="address" value="${user.address}" required>

            <label>Username</label>
            <input type="text" name="username" value="${user.username}" required>

            <label>Password</label>
            <input type="text" name="password" value="${user.password}" required>
            <button type="submit" class="login-btn">Update</button>

        </form>

        <p class="register-link">
            Go back to <a href="/user">Profile</a>
        </p>

    </div>

</div>

<br />

<jsp:include page="footer.jsp" />

</body>
</html>
