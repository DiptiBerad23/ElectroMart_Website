<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details | ShopMate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<div class="single-user-container">

    <h2 class="single-user-title">👤 Profile </h2>

    <table class="single-user-table">

        <tr>
            <th>Name</th>
            <td>${user.name}</td>
        </tr>

        <tr>
            <th>Email</th>
            <td>${user.email}</td>
        </tr>

        <tr>
            <th>Mobile</th>
            <td>${user.mobile}</td>
        </tr>

        <tr>
            <th>Address</th>
            <td>${user.address}</td>
        </tr>

        <tr>
            <th>Username</th>
            <td>${user.username}</td>
        </tr>
    </table>

	<div class="right-buttons">
	    <a class="btn login" href="/update-req/${user.userId}">Update</a>
		<a class="btn logout" href="/delete-req/${user.userId}">Delete</a>
	</div>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>
