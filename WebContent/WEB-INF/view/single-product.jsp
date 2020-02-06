<%@page import="model.Goods"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>eShop</title>

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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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
							<li><a href="registration.html"><i class="fa fa-user"></i>
									Login</a></li>
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
						<li><a href="Catalog">Shop page</a></li>
						<li class="active"><a href="single-product.html">Description</a></li>
						<li><a href="Basket">Cart</a></li>
						<li><a href="checkout.html">Checkout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End mainmenu area -->


	<script>
		function addBasket(id){
			var dataStr = "id_good="+id;	
			alert("The good add in basket!");
			$.ajax(
				{
					type:"POST",
					url:"Info",
					data:dataStr,
					success:function(msg){
											
					}
				}		
			)
			
		}
		
	</script>


	<div class="single-product-area">
		<c:set var="good" scope="session" value="${goods}" />
		<div class="col-md-8">
			<div class="product-content-right">
				<div class="product-breadcroumb"></div>

				<div class="row">
					<div class="col-sm-6">
						<div class="product-images">
							<!--Картинка товара для описания-->
							<div class="product-main-img">
								<img src="${good.picture}" alt="">
							</div>
						</div>
					</div>
						<div class="col-sm-6">
							<div class="product-inner">
								<h2 class="product-name">${good.name}</h2>
								<div class="product-inner-price">
									<ins>$ ${good.price}</ins>
									<!-- <del>$800.00</del> -->
								</div>

								<div class="product-option-shop">
									<a class="add_to_cart_button" rel="nofollow"
										data-product_sku="" onclick="addBasket(${good.id})"
										href="Info?id=${good.id}">Add to cart</a>
								</div>

								<div role="tabpanel">
									<ul class="product-tab" role="tablist">
										<li role="presentation" class="active"><a href="#home"
											aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
									</ul>
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane fade in active" id="home">
											<h2>Product Description</h2>
											<p>${goods.info}</p>
										</div>

									</div>
								</div>

							</div>
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
							<!--
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
                        </div>
                        -->
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

					<!--
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </form>
                        </div>
                    </div>
                </div> -->
				</div>
			</div>
		</div>
		<br> <br> <br>

		<div class="footer-bottom-area">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="copyright">
							<p>&copy; 2018 eShop. All Rights Reserved.</p>
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

		<!-- End footer bottom area -->


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



</body>
</html>