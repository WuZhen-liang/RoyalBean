<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
	<html lang="en">
	<!-- Basic -->

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Site Metas -->
		<title>RoyalCoffee</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Site Icons -->
		<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
		<link rel="apple-touch-icon" href="/images/apple-touch-icon.png">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="/css/bootstrap.min.css">
		<!-- Site CSS -->
		<link rel="stylesheet" href="/css/style.css">
		<!-- Responsive CSS -->
		<link rel="stylesheet" href="/css/responsive.css">
		<!-- Custom CSS -->
		<link rel="stylesheet" href="/css/custom.css">
		

		<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<!-- my css -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/js/member.js"></script>

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
							<select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
								<option>一般會員</option>
								<option>廠商</option>
								<option>管理員</option>
							</select>
						</div>
						<div class="right-phone-box">
							<p>
								Hello :- <a href="#">會員編號</a>
							</p>
						</div>
						<div class="our-link">
							<ul>
								<li><a href="#">會員註冊</a></li>
								<li><a href="#">會員登入</a></li>
								<li><a href="#">聯絡我們</a></li>
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
			<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
				<div class="container">
					<!-- Start Header Navigation -->
					<div class="navbar-header">
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu"
							aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
							<i class="fa fa-bars"></i>
						</button>
						<a class="navbar-brand" href="index.html"><img src="/images/logo.png" class="logo" alt=""></a>
					</div>
					<!-- End Header Navigation -->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="navbar-menu">
						<ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
							<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
							<li class="nav-item"><a class="nav-link" href="about.html">About
									Us</a></li>
							<li class="dropdown megamenu-fw">
							<li class="dropdown"><a href="#" class="nav-link dropdown-toggle arrow"
									data-toggle="dropdown">Product</a>
								<ul class="dropdown-menu">
									<li><a href="cart.html">所有商品</a></li>
									<li><a href="wishlist.html">熱銷排行榜</a></li>
									<li><a href="checkout.html">精選咖啡豆</a></li>
									<li><a href="my-account.html">甜點</a></li>
									<li><a href="shop-detail.html">新品</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="#" class="nav-link dropdown-toggle arrow"
									data-toggle="dropdown">Activity</a>
								<ul class="dropdown-menu">
									<li><a href="cart.html">活動資訊</a></li>
									<li><a href="checkout.html">門市據點</a></li>
									<li><a href="my-account.html">活動回饋</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="#" class="nav-link dropdown-toggle arrow"
									data-toggle="dropdown">coupon</a>
								<ul class="dropdown-menu">
									<li><a href="cart.html">coupon</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="#" class="nav-link dropdown-toggle arrow"
									data-toggle="dropdown">Service</a>
								<ul class="dropdown-menu">
									<li><a href="cart.html">文章分享</a></li>
									<li><a href="checkout.html">Q&A</a></li>
									<li><a href="my-account.html">問題回報</a></li>
								</ul>
							</li>
							<li class="nav-item"><a class="nav-link" href="contact-us.html">Contact Us</a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->

					<!-- Start Atribute Navigation -->
					<div class="attr-nav">
						<ul>
							<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
							<li class="side-menu"><a href="#"> <i class="fa fa-shopping-bag"></i> <span
										class="badge">3</span>
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
							<li><a href="#" class="photo"><img src="/images/img-pro-01.jpg" class="cart-thumb"
										alt="" /></a>
								<h6>
									<a href="#">Delica omtantur </a>
								</h6>
								<p>
									1x - <span class="price">$80.00</span>
								</p>
							</li>
							<li><a href="#" class="photo"><img src="/images/img-pro-02.jpg" class="cart-thumb"
										alt="" /></a>
								<h6>
									<a href="#">Omnes ocurreret</a>
								</h6>
								<p>
									1x - <span class="price">$60.00</span>
								</p>
							</li>
							<li><a href="#" class="photo"><img src="/images/img-pro-03.jpg" class="cart-thumb"
										alt="" /></a>
								<h6>
									<a href="#">Agam facilisis</a>
								</h6>
								<p>
									1x - <span class="price">$40.00</span>
								</p>
							</li>
							<li class="total"><a href="#" class="btn btn-default hvr-hover btn-cart">VIEW CART</a> <span
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
					<span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
				</div>
			</div>
		</div>
		<!-- End Top Search -->

		<!-- Start All Title Box -->
		<div class="all-title-box">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2>會員內容</h2>
						<ul class="breadcrumb">
							<li class="breadcrumb-item active">會員內容</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- End All Title Box -->



		<!-- Start Cart  -->
		<div class="cart-box-main" style="margin: 5px auto;">
			<div class="container">
				<div class="row new-account-login">
					<div class="col-sm-6 col-lg-6 mb-3"></div>
				</div>
				<div class="row" style="margin: auto;">
					<div class="col-sm-12 col-lg-12 mb-3" style="margin: auto; max-width: 75%;">
						<div class="checkout-address">
							<div class="title-left">
								<h3>會員註冊</h3>
							</div>
							<form class="needs-validation" id="form1">
								<div class="row">
									<div class="col-md-12 mb-3">
										<label for="firstName">帳號</label>
										<input type="email" name="email" id="email" size="45" class="form-control"
											placeholder="請輸入信箱" autocapitalize="off" required>
										<span>${errors.email}${Addresult}</span><br>
										<label for="firstName">密碼</label>
										<input type="password" name="pwd" id="pwd" size="45" placeholder="使用者密碼"
											autocapitalize="off" class="form-control" required>
										<span>${errors.pwd}</span><br>
									</div>
									<div class="col-md-12 mb-3" style="text-align: center;">
										<input type="submit" id="send1" value="送出" class="ml-auto btn hvr-hover"
											style="color: white; border: none; border-radius: 5px;">
										<input type="reset" value="清除" class="ml-auto btn hvr-hover"
											style="color: white; border: none;  border-radius: 5px;">
									</div>
								</div>
								<hr class="mb-1">
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- End Cart -->

		<!-- Start Instagram Feed  -->
		<div class="instagram-box">
			<div class="main-instagram owl-carousel owl-theme">
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-01.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-02.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-03.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-04.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-05.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-06.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-07.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-08.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-09.jpg" alt="" />
						<div class="hov-in">
							<a href="#"><i class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="ins-inner-box">
						<img src="/images/instagram-img-05.jpg" alt="" />
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
								<h4>前端技術</h4>
								<ul>
									<li style="color:#FFF8DC ;">HTML、CSS、JS</li><br>
									<li style="color:#FFF8DC ;">AJAX</li><br>
									<li style="color:#FFF8DC ;">JQuery</li><br>
									<li style="color:#FFF8DC ;">bootstrap</h3>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="footer-link">
								<h4>後端技術</h4>
								<ul>
									<li style="color:#FFF8DC ;">Java</li><br>
									<li style="color:#FFF8DC ;">SpringBoot</li><br>
									<li style="color:#FFF8DC ;">Hibernate</li><br>
								</ul>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="footer-link">
								<h4>資料庫&整合技術</h4>
								<ul>
									<li style="color:#FFF8DC ;">SQL Server</li><br>
									<li style="color:#FFF8DC ;">GitHub</li><br>
									<li style="color:#FFF8DC ;">Git</li><br>
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
			<p class="footer-company">All Rights Reserved. &copy; 2021 <a href="#">RoyalBeanCafe</a> Design By :
				<a href="https://html.design/">html design</a>
			</p>
		</div>
		<!-- End copyright  -->

		<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

		<!-- ALL JS FILES -->
		
	<!---->  <script src="/js/jquery-3.2.1.min.js"></script>
		<script src="/js/popper.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<!-- ALL PLUGINS -->
		<script src="/js/jquery.superslides.min.js"></script>
		<script src="/js/bootstrap-select.js"></script>
		<script src="/js/inewsticker.js"></script>
		<script src="/js/bootsnav.js"></script>
		<script src="/js/images-loded.min.js"></script>
		<script src="/js/isotope.min.js"></script>
		<script src="/js/owl.carousel.min.js"></script>
		<script src="/js/baguetteBox.min.js"></script>
		<script src="/js/form-validator.min.js"></script>
		<script src="/js/contact-form-script.js"></script>
		<script src="/js/custom.js"></script>
	</body>

	</html>