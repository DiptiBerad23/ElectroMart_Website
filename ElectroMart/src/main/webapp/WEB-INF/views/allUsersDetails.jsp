<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Users | ShopMate</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="users-container">

    <h2 class="users-title">📋 All Registered Users</h2>

    <table class="users-table">
        <thead>
            <tr>
                <th>User Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Username</th>
				<th>Update</th>
				<th>Delete</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="u" items="${usersList}">
                <tr>
                    <td>${u.userId}</td>
                    <td>${u.name}</td>
                    <td>${u.email}</td>
                    <td>${u.mobile}</td>
                    <td>${u.address}</td>
                    <td>${u.username}</td>
					<td>
					<div>
					    <a class="btn login" href="/update-req/${u.userId}">Update</a>
					</div>
					</td>
					<td>
					<div >
						<a class="btn logout" href="/delete-by-admin/${u.userId}">Delete</a>
					</div>
					</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

<jsp:include page="footer.jsp" />

</body>
</html>