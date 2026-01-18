<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ElectroMart | Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
	<jsp:include page="header.jsp" />
	
	<c:if test="${not empty msg}">
	    <h3 class="msg-box-success">${msg}</h3>
	</c:if>

	<!-- ⭐ NEW CATEGORY SECTION -->

	<!-- ⭐ NEW OFFER BANNER -->
	<div class="offer-modern">
	    <h3>🔥 Big Festive Sale — Live Now!</h3>
	    <p>Get Up To <span>60% OFF</span> On Top Electronics</p>
	</div>


	<div class="cat-modern-grid">

	    <div class="cat-modern-card">
	        <img src="../images/iphone1.jpg">
	        <p>Mobiles</p>
	    </div>

	    <div class="cat-modern-card">
	        <img src="../images/L2.jpg">
	        <p>Laptops</p>
	    </div>

	    <div class="cat-modern-card">
	        <img src="../images/headphone1.jpg">
	        <p>Audio</p>
	    </div>

	    <div class="cat-modern-card">
	        <img src="../images/watch1.jpg">
	        <p>Watches</p>
	    </div>

	    <div class="cat-modern-card">
	        <img src="../images/TV1.webp">
	        <p>TV</p>
	    </div>

	    <div class="cat-modern-card">
	        <img src="../images/Freeze1.jpg">
	        <p>Refrigerator</p>
	    </div>

	</div>


	
	<!-- HERO BANNER (UNCHANGED) -->
	<section class="em-hero">
	    <div class="hero-text">

	        <h1 class="hero-heading">
	            Upgrade Your Life with 
	            <span class="brand-glow">ElectroMart</span>
	        </h1>

	        <p class="hero-sub">
	            ⚡ Top Deals • 📱 Latest Gadgets • 🚀 Fast Delivery
	        </p>

	        <div class="hero-underline"></div>

	    </div>

		<div class="hero-img">
			<img src="../images/home_img.jpg">
		</div>
	</section>



	<jsp:include page="footer.jsp" />

</body>
</html>
