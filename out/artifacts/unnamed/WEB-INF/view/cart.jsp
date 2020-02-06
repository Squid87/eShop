<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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


<title>eShop</title>
</head>
<body>
	<div class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="user-menu">
						<ul>
							<!-- <li><a href="#"><i class="fa fa-user"></i> My Account</a></li>-->
							<li><a href="Basket"><i class="fa fa-user"></i> My
									Cart</a></li>
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

						<a href="cart.html">Cart - <span class="cart-amunt">$
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
						<li class="active"><a href="Basket">Cart</a></li>
						<li><a href="checkout.html">Checkout</a></li>
						<!--<li><a href="#">Category</a></li>-->
						<!--<li><a href="#">Others</a></li>-->
						<!-- <li><a href="#">Contact</a></li>-->
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End mainmenu area -->


	<script>
		function delItemInBasket(id){
			var dataStr = "id_good="+id;	
			alert("Товар удален из корзины!");
			$.ajax(
				{
					type:"POST",
					url:"Basket",
					data:dataStr,
					success:function(msg){				
					}
				}		
			)
			
		}
		
	</script>

	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="product-content-right">
						<div class="woocommerce">
							<form method="post" action="#">

								<c:if test="${total == 0}">
									<p>
									<h1>Basket is empty!</h1>
									</p>
								</c:if>

								<c:if test="${total > 0}">
									<table cellspacing="0" class="shop_table cart">
										<thead>
											<tr>
												<th class="product-remove"></th>
												<th class="product-thumbnail"></th>
												<th class="product-name">Product</th>
												<th class="product-price">Price</th>
											</tr>
										</thead>
										<tbody>

											<!-- create basket item -->
											<c:set var="id_good" value="${0}" />
											<c:forEach items="${basket}" varStatus="num" var="b">

												<tr class="cart_item">
													<td class="product-remove"><a title="Remove this item"
														onclick="delItemInBasket(${b.id_basket})" href='Basket'
														class="remove" href="#">x</a></td>

													<td class="product-thumbnail"><a
														href="Info?id=${b.id}"><img width="145" height="145"
															class="shop_thumbnail" src="${b.picture}"></a></td>

													<td class="product-name"><a href="Info?id=${b.id}">${b.name}</a></td>

													<td class="product-price"><span class="amount">$
															${b.price}</span></td>

												
											</c:forEach>

											<tr>
												<td class="actions" colspan="3">
													<div class="coupon"></div> <label for="coupon_code">
														<input type="submit" value="Proceed to Checkout"
														name="proceed"
														class="checkout-button button alt wc-forward">
												</td>

												<td class="actions" colspan="5">
													<h4>
														Total:
														<c:out value=" $ ${total}" />
													</h4> </label>
												</td>
											</tr>
											<!-- end of create basket item -->
										</tbody>
									</table>
								</c:if>
							</form>
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

	<!-- End footer top area -->

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
</html>