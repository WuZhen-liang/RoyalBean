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
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/js/member.js"></script>
	<script>
	$(function(){
		$('#send3').click(function (e) {
		e.preventDefault();
		var username = $('#username').val();
		var password = $('#pwd').val();
		var params = { 'username': username, 'password': password };
		console.log(params);
		$.ajax({
			type: 'post',
			url: 'Staff_resgiter_action',
			contentType: 'application/json',
			data: JSON.stringify(params),
			success: function () {
				console.log('Success');
				swal.fire(
						'Success',
						'可以使用會員了',
						'success'
				)
			},
			error: function () {
				console.log('error');
				swal.fire(
						'Fail',
						'不好意思發現錯誤。',
						'fail'
				)
			}
		});

		});
		$('#onebutton').click(function () {
			$('#username').val('Admin');
			$('#pwd').val('test123456');
		});	
	});
	</script>

	</head>

	<body>

		<!-- Start Main Top -->
		<!-- 主頁後header -->
		<%@include file="/WEB-INF/pages/headerfooter/visitorheader.jsp"%>
		<!-- 主頁後header -->

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
						<h2>後台註冊</h2>
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
								<h3>後台註冊</h3>
							</div>
							<form class="needs-validation" id="form1">
								<div class="row">
									<div class="col-md-12 mb-3">
										<label for="firstName">帳號</label>
										<input type="text" name="username" id="username" size="45" class="form-control"
											placeholder="請輸入帳號" autocapitalize="off" required>
										<span>${errors.email}${Addresult}</span><br>
										<label for="firstName">密碼</label>
										<input type="password" name="pwd" id="pwd" size="45" placeholder="使用者密碼"
											autocapitalize="off" class="form-control" required>
										<span>${errors.pwd}</span><br>
									</div>
									<div class="col-md-12 mb-3" style="text-align: center;">
										<input type="submit" id="send3" value="送出" class="ml-auto btn hvr-hover"
											style="color: white; border: none; border-radius: 5px;">
										<input type="reset" value="清除" class="ml-auto btn hvr-hover"
											style="color: white; border: none;  border-radius: 5px;">
										<input type="button" value="一鍵輸入" class="ml-auto btn hvr-hover"
											style="color: white; border: none;  border-radius: 5px;"
											id="onebutton">
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

			<!-- Footer -->
			<%@include file="/WEB-INF/pages/headerfooter/footer.jsp" %>
			<!-- Footer -->

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