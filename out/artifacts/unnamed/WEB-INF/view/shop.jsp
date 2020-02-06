<%@page import="model.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>eShop</title>
<!-- Google Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/responsive.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
	<div class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="user-menu">
						<ul>
							<li><a href="Basket"><i class="fa fa-user"></i> My Cart</a></li>
							<li><a href="checkout.html"><i class="fa fa-user"></i>
									Checkout</a></li>
							<li><a href="registration.html"><i class="fa fa-user"></i> Login</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-4">
					<div class="header-right">
						<ul class="list-unstyled list-inline">
							<a href="#"><span class="key">Contact us :</span><span
								class="value"> </span><b></b></a>

							<li class="dropdown dropdown-small"><a
								data-toggle="dropdown" data-hover="dropdown"
								class="dropdown-toggle" href="#"><span class="key">+7-962-819-48-18</span></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End header area -->

	<div class="site-branding-area">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="logo">
						<h1>
							<a href="index.html">e<span>Shop</span></a>
						</h1>
					</div>
				</div>

				<div class="col-sm-6">
					<div class="shopping-item">

						<c:set var="total" value="${0}" />
						<c:set var="countInBasket" value="${0}" />
						<c:forEach items="${basket}" varStatus="num" var="b">
							<c:set var="total" value="${total+b.price}" />
							<c:set var="countInBasket" value="${countInBasket+1}" />
						</c:forEach>

						<a href="Basket">Cart - <span class="cart-amunt">$
								${total}</span> <i class="fa fa-shopping-cart"></i> <span
							class="product-count">${countInBasket}</span></a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End site branding area -->

	<div class="mainmenu-area">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="index.html">Home</a></li>
						<li class="active"><a href="Catalog">Shop page</a></li>
						<li><a href="Basket">Cart</a></li>
						<li><a href="checkout.html">Checkout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End mainmenu area -->

	<!-- addToBasket -->

	<script>
		function addBasket(id){
			var dataStr = "id_good="+id;	
			alert("The good add in basket!");
			$.ajax(
				{
					type:"POST",
					url:"Catalog",
					data:dataStr,
					success:function(msg){
											
					}
				}		
			)
			
		}
		
	</script>

	<!-- ensAddToBasket -->


	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<c:forEach items="${goods}" varStatus="num" var="good">
				<div class="col">
					<div class="col-md-3 col-sm-6">
						<div class="single-shop-product">
							<div class="product-upper">
								<img src="${good.picture}" alt="">
							</div>
							<h2>
								<a href="Info?id=${good.id}">${good.name}</a>
							</h2>
							<div class="product-carousel-price">
								<ins>$ ${good.price}</ins>
								<!--  <del>$40.00</del> -->
							</div>
							<div class="product-option-shop">
								<a class="add_to_cart_button" rel="nofollow" data-product_sku=""
									onclick="addBasket(${good.id})" href="Catalog">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<div class="row">
				<div class="col-md-12">
					<div class="product-pagination text-center">
						<nav>
						<ul class="pagination">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="footer-top-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="footer-about-us">
						<h2>
							e<span>Shop</span>
						</h2>
						<p>Thank you for your shopping in our store. We are waiting
							for you again.</p>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-menu">
						<h2 class="footer-wid-title">User Navigation</h2>
						<ul>
							<li><a href="#">My account</a></li>
							<li><a href="#">Order history</a></li>
							<li><a href="#">Front page</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-menu">
						<h2 class="footer-wid-title">Categories</h2>
						<ul>
							<li><a href="#">Phone powerbank</a></li>
							<li><a href="#">LED Fleshlights</a></li>
							<li><a href="#">Home and Garden</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End footer top area -->

	<br>
	<br>
	<br>


	<div class="footer-bottom-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="copyright">
						<p>2018 eShop. All Rights Reserved.</p>
						<!--Coded with <i class="fa fa-heart"></i> by <a href="http://wpexpand.com" target="_blank">WP Expand</a></p>-->
					</div>
				</div>

				<div class="col-md-4">
					<div class="footer-card-icon">
						<i class="fa fa-cc-mastercard"></i> <i class="fa fa-cc-paypal"></i>
						<i class="fa fa-cc-visa"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Latest jQuery form server -->
	<script src="https://code.jquery.com/jquery.min.js"></script>

	<!-- Bootstrap JS form CDN -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- jQuery sticky menu -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>

	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- Main Script -->
	<script src="js/main.js"></script>
</body>
</html>