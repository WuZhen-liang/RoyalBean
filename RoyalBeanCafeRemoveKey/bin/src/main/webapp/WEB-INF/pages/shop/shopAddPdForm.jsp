<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		function getFormData($form) {
			var unindexed_array = $form.serializeArray();
			var indexed_array = {};

			$.map(unindexed_array, function(n, i) {
				indexed_array[n['name']] = n['value'];
			});

			return indexed_array;
		}
		$("#send").click(function() {
			//var insertData = $("form").serialize();

			var $form = $("form");
			var data = getFormData($form);
			console.log(data);
			$.ajax({
				type : 'post',
				url : '/ajaxinsertshoppd',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					console.log("success");
					location.href="/shopSearch"
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		})
	});
</script>

</head>

<body>

	<!-- Start Main Top -->
	<div class="main-top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="text-slid-box">
						<div id="offer-box" class="carouselTicker">
							<ul class="offer-box">
								<li><i class="fab fa-opencart"></i> Off 10%! Shop Now Man</li>
								<li><i class="fab fa-opencart"></i> 50% - 80% off on
									Fashion</li>
								<li><i class="fab fa-opencart"></i> 20% off Entire Purchase
									Promo code: offT20</li>
								<li><i class="fab fa-opencart"></i> Off 50%! Shop Now</li>
								<li><i class="fab fa-opencart"></i> Off 10%! Shop Now Man</li>
								<li><i class="fab fa-opencart"></i> 50% - 80% off on
									Fashion</li>
								<li><i class="fab fa-opencart"></i> 20% off Entire Purchase
									Promo code: offT20</li>
								<li><i class="fab fa-opencart"></i> Off 50%! Shop Now</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="custom-select-box">
						<select id="basic" class="selectpicker show-tick form-control"
							data-placeholder="$ USD">
							<option>????????????</option>
							<option selected="selected">??????</option>
							<option>?????????</option>
						</select>
					</div>
					<div class="right-phone-box">
						<p>
							Hello :- <a href="#">????????????</a>
						</p>
					</div>
					<div class="our-link">
						<ul>
							<li><a href="#">????????????</a></li>
							<li><a href="#">????????????</a></li>
							<li><a href="#">????????????</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Main Top -->

	<!-- Start Main Top -->
	<header class="main-header">
		<!-- Start Navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
			<div class="container">
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar-menu" aria-controls="navbars-rs-food"
						aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="index.html"><img
						src="images/logo.png" class="logo" alt=""></a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class="nav-item active"><a class="nav-link"
							href="index.html">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="about.html">About
								Us</a></li>
						<li class="dropdown megamenu-fw">
						<li class="dropdown"><a href="#"
							class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Product</a>
							<ul class="dropdown-menu">
								<li><a href="shopPdEntry">????????????</a></li>
								<li><a href="shopSearch">??????????????????</a></li>
							</ul></li>
						<li class="dropdown"><a href="#"
							class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Activity</a>
							<ul class="dropdown-menu">
								<li><a href="cart.html">????????????</a></li>
								<li><a href="checkout.html">????????????</a></li>
								<li><a href="my-account.html">????????????</a></li>
							</ul></li>
						<li class="dropdown"><a href="#"
							class="nav-link dropdown-toggle arrow" data-toggle="dropdown">coupon</a>
							<ul class="dropdown-menu">
								<li><a href="cart.html">coupon</a></li>
							</ul></li>
						<li class="dropdown"><a href="#"
							class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Service</a>
							<ul class="dropdown-menu">
								<li><a href="cart.html">????????????</a></li>
								<li><a href="checkout.html">Q&A</a></li>
								<li><a href="my-account.html">????????????</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							href="contact-us.html">Contact Us</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->

				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="#"> <i
								class="fa fa-shopping-bag"></i> <span class="badge">3</span>
						</a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->
			</div>
			<!-- Start Side Menu -->
			<div class="side">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<li class="cart-box">
					<ul class="cart-list">
						<li><a href="#" class="photo"><img
								src="images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Delica omtantur </a>
							</h6>
							<p>
								1x - <span class="price">$80.00</span>
							</p></li>
						<li><a href="#" class="photo"><img
								src="images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Omnes ocurreret</a>
							</h6>
							<p>
								1x - <span class="price">$60.00</span>
							</p></li>
						<li><a href="#" class="photo"><img
								src="images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
							<h6>
								<a href="#">Agam facilisis</a>
							</h6>
							<p>
								1x - <span class="price">$40.00</span>
							</p></li>
						<li class="total"><a href="#"
							class="btn btn-default hvr-hover btn-cart">VIEW CART</a> <span
							class="float-right"><strong>Total</strong>: $180.00</span></li>
					</ul>
				</li>
			</div>
			<!-- End Side Menu -->
		</nav>
		<!-- End Navigation -->
	</header>
	<!-- End Main Top -->

	<!-- Start Top Search -->
	<div class="top-search">
		<div class="container">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-search"></i></span>
				<input type="text" class="form-control" placeholder="Search">
				<span class="input-group-addon close-search"><i
					class="fa fa-times"></i></span>
			</div>
		</div>
	</div>
	<!-- End Top Search -->

	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>AddProduct</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Shop</a></li>
						<li class="breadcrumb-item active">AddProduct</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->

	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">

			<div class="row">
				<div class="col-sm-6 col-lg-12 mb-3">
					<div class="checkout-address">
						<div class="title-left">
							<h3>Product Information</h3>
						</div>
						<form class="needs-validation" method="POST">
							<div class="row">
								<div class="col-md-6 mb-3">
									<label>Product name *</label> <input type="text"
										class="form-control" name="shopPdName">
									<div class="invalid-feedback">Valid first name is
										required.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label>Product Price *</label> <input type="text"
										class="form-control" name="shopPdPrice">
									<div class="invalid-feedback">Valid last name is
										required.</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label>Product Count *</label> <input class="form-control"
										name="shopPdCount">
									<div class="invalid-feedback">Valid first name is
										required.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label>Product Weight *</label> <input type="text"
										class="form-control" name="shopPdWeight">
									<div class="invalid-feedback">Valid last name is
										required.</div>
								</div>
							</div>
							<div class="mb-3">
								<div class="input-group">
									<label>Picture *</label> <input name='shopPdPicture'
										type="text">
									<div class="invalid-feedback" style="width: 100%;">Your
										Picture is required.</div>
								</div>
							</div>
							<div class="mb-3">
								<div class="row">
									<div class="col-md-4 mb-3">
										<label>Type *</label> <select class="wide w-100"
											name="shopPdType">
											<option value="Choose..." data-display="Select">Choose...</option>
											<option value="?????????">?????????</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
										</select>
										<div class="invalid-feedback">Please select a valid
											Type.</div>
									</div>
									<div class="col-md-4 mb-3">
										<label>Baking *</label> <select class="wide w-100"
											name="shopPdBaking">
											<option value="Choose..." data-display="Select">Choose...</option>
											<option value="?????????">?????????</option>
											<option value="????????????">????????????</option>
											<option value="????????????">????????????</option>
											<option value="????????????">????????????</option>
											<option value="????????????">????????????</option>
											<option value="???????????????">???????????????</option>
											<option value="????????????">????????????</option>
											<option value="????????????">????????????</option>
										</select>
										<div class="invalid-feedback">Please provide a valid
											Baking.</div>
									</div>
									<div class="col-md-4 mb-3">
										<label>SaveMethod *</label> <select class="wide w-100"
											name="shopPdSaveMethod">
											<option data-display="Select" value="Choose...">Choose...</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
										</select>
										<div class="invalid-feedback">SaveMethod code required.</div>
									</div>
								</div>
							</div>
							<div class="mb-3">
								<label>Depiction *</label>
								<textarea class="wide w-100" name="shopPdDepiction"></textarea>
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>Ingredient *</label> <input class="wide w-100"
									name="shopPdIngredient">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>Origin *</label> <input class="wide w-100"
									name="shopPdOrigin">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>ExpTime *</label> <input class="wide w-100"
									name="shopPdExpTime">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>Shipment *</label> <input class="wide w-100"
									name="shopPdShipment">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>Notice *</label>
								<textarea class="wide w-100" name="shopPdNotice"></textarea>
								<div class="invalid-feedback">Please enter your shipping
									Notice.</div>
							</div>
							<!-- <hr class="mb-1"> </form> -->

						</form>
						<div class="mb-3">
							<center>
								<button value="Send" id="send">Submit</button>
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</center>
						</div>


					</div>
				</div>

				<!-- <div class="col-sm-6 col-lg-2 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>????????????</h3>
                                </div>
                                <div class="mb-4">
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio">
                                        <label class="custom-control-label" for="shippingOption1">Standard Delivery</label> <span class="float-right font-weight-bold">FREE</span> </div>
                                    <div class="ml-4 mb-2 small">(3-7 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption2">Express Delivery</label> <span class="float-right font-weight-bold">$10.00</span> </div>
                                    <div class="ml-4 mb-2 small">(2-4 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption3">Next Business day</label> <span class="float-right font-weight-bold">$20.00</span> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3>Shopping cart</h3>
                                </div>
                                <div class="rounded p-2 bg-light">
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $80.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $80.00</div>
                                        </div>
                                    </div>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $60.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $60.00</div>
                                        </div>
                                    </div>
                                    <div class="media mb-2">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $40.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $40.00</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="order-box">
                                <div class="title-left">
                                    <h3>Your order</h3>
                                </div>
                                <div class="d-flex">
                                    <div class="font-weight-bold">Product</div>
                                    <div class="ml-auto font-weight-bold">Total</div>
                                </div>
                                <hr class="my-1">
                                <div class="d-flex">
                                    <h4>Sub Total</h4>
                                    <div class="ml-auto font-weight-bold"> $ 440 </div>
                                </div>
                                <div class="d-flex">
                                    <h4>Discount</h4>
                                    <div class="ml-auto font-weight-bold"> $ 40 </div>
                                </div>
                                <hr class="my-1">
                                <div class="d-flex">
                                    <h4>Coupon Discount</h4>
                                    <div class="ml-auto font-weight-bold"> $ 10 </div>
                                </div>
                                <div class="d-flex">
                                    <h4>Tax</h4>
                                    <div class="ml-auto font-weight-bold"> $ 2 </div>
                                </div>
                                <div class="d-flex">
                                    <h4>Shipping Cost</h4>
                                    <div class="ml-auto font-weight-bold"> Free </div>
                                </div>
                                <hr>
                                <div class="d-flex gr-total">
                                    <h5>Grand Total</h5>
                                    <div class="ml-auto h5"> $ 388 </div>
                                </div>
                                <hr> </div>
                        </div>
                        <div class="col-12 d-flex shopping-box"> <a href="checkout.html" class="ml-auto btn hvr-hover">Place Order</a> </div>
                    </div>
                </div>  -->
			</div>

		</div>
	</div>
	<!-- End Cart -->

	<!-- Start Instagram Feed  -->
	<div class="instagram-box">
		<div class="main-instagram owl-carousel owl-theme">
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/jquery.jpg" alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/java.png" alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/ajax.jpg " alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/htmlcssjs.png" alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/springboot.png" alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/bootstrap.jpg" alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/hubernate.jpg" alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/sqlserver.jpg" alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="ins-inner-box">
					<img src="images/github.jpg" alt="" style="height: 150PX;" />
					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Instagram Feed  -->


	<!-- Start Footer  -->
	<footer>
		<div class="footer-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link">
							<h4>????????????</h4>
							<ul>
								<li style="color: #FFF8DC;">HTML???CSS???JS</li>
								<br>
								<li style="color: #FFF8DC;">AJAX</li>
								<br>
								<li style="color: #FFF8DC;">JQuery</li>
								<br>
								<li style="color: #FFF8DC;">bootstrap
									</h3>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link">
							<h4>????????????</h4>
							<ul>
								<li style="color: #FFF8DC;">Java</li>
								<br>
								<li style="color: #FFF8DC;">SpringBoot</li>
								<br>
								<li style="color: #FFF8DC;">Hibernate</li>
								<br>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link">
							<h4>?????????&????????????</h4>
							<ul>
								<li style="color: #FFF8DC;">SQL Server</li>
								<br>
								<li style="color: #FFF8DC;">GitHub</li>
								<br>
								<li style="color: #FFF8DC;">Git</li>
								<br>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer  -->

	<!-- Start copyright  -->
	<div class="footer-copyright">
		<p class="footer-company">
			All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By
			: <a href="https://html.design/">html design</a>
		</p>
	</div>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="js/jquery.superslides.min.js"></script>
	<script src="js/bootstrap-select.js"></script>
	<script src="js/inewsticker.js"></script>
	<script src="js/bootsnav.js"></script>
	<script src="js/images-loded.min.js"></script>
	<script src="js/isotope.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/baguetteBox.min.js"></script>
	<script src="js/form-validator.min.js"></script>
	<script src="js/contact-form-script.js"></script>
	<script src="js/custom.js"></script>
</body>

</html>