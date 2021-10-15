<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<!DOCTYPE html>
			<html lang="en">
			<!-- Basic -->

			<head>
				<meta charset="utf-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">

				<!-- Mobile Metas -->
				<meta name="viewport" content="width=device-width, initial-scale=1">

				<!-- Site Metas -->
				<title>RoyalBeanCafe</title>
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
				<link href="/css/memberRegiter.css" rel="stylesheet">

				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
				<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
				<script src="/js/member.js"></script>

			</head>

			<body>

	<!-- 會員登入後header -->
	<%@include file="/WEB-INF/pages/headerfooter/memberheader.jsp"%>
	<!-- 會員登入後header -->

				<!-- Start All Title Box -->
				<div class="all-title-box">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<h2>會員內容</h2>
								<ul class="breadcrumb">
									<i class="fas fa-address-book"></i>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- End All Title Box -->
				<!-- information-->
				<div class="cart-box-main" style="margin: 5px auto;">
					<div class="container">
						<div class="row new-account-login">
							<div class="col-sm-6 col-lg-6 mb-3"></div>
						</div>
						<div class="row" style="margin: auto;">
							<div class="col-sm-12 col-lg-12 mb-3" style="margin: auto; max-width: 75%;">
								<div class="checkout-address " style="border: 10px;border-radius: 10px;">
									<div class="title-left">
										<h3 style="font-size: 30px;">基本資料</h3>
									</div>	
										<div class="row" style="margin: 5px auto;">
										<div class="col-md-6 mb-3 newlinesize" >
											姓名 : ${MemberContentResult.name}
										</div>
										<div class="col-md-6 mb-3 newlinesize">
											電話 : ${MemberContentResult.phone}
										</div>
										<div class="col-md-6 mb-3 newlinesize">
											生日 : ${MemberContentResult.birthday}
										</div>
										<div class="col-md-6 mb-3 newlinesize">
											住址 : ${MemberContentResult.city}
										</div>
										<div class="col-md-6 mb-3 newlinesize">
											地址 : ${MemberContentResult.address}
										</div>
										<div class="col-md-6 mb-3 newlinesize">
											性別 : ${MemberContentResult.gender}
										</div>
									    </div>
										<hr>
										<br>
										<div class="title-left">
											<h3 style="font-size: 30px;">您的照片</h3>
										</div>	
										<div class="col-md-6 mb-3" style="margin-left:200px;margin-top:50px;">
											<div class="newpicture">											
											<img src="${MemberContentResult.picture}" style="width: 300px;height: 300px;">
											</div>
										</div>
										</div>									
								
								<div class="col-12 d-flex shopping-box">
									<a href="member_content_resgiter" style="margin-left: 650px;">
									<button class="ml-auto btn hvr-hover" style="color: white; border: none;">
										更新資料
									</button>
									</a>
								</div>
								<hr>
							</div>
						</div>
					</div>

				</div>
				<!-- picture end-->				

    <!-- Footer -->
    <%@include file="/WEB-INF/pages/headerfooter/footer.jsp"%>
	<!-- Footer -->
				<!-- Start copyright  -->
				<div class="footer-copyright">
					<p class="footer-company">
						All Rights Reserved. &copy; 2021 <a href="#">RoyalBeanCafe</a> Design
						By : <a href="https://html.design/">html design</a>
					</p>
				</div>
				<!-- End copyright  -->

				<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

				<!-- ALL JS FILES -->
				<script src="/js/jquery-3.2.1.min.js"></script>
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
				<script src="/js/jquery-3.6.0.js"></script>
				<script>
					$(function () {
						var date = new Date();
						var year = date.getFullYear();
						var month = ('0' + (date.getMonth() + 1)).slice(-2);
						var day = ('0' + date.getDate()).slice(-2);
						var time = year + '-' + month + '-' + day;
						console.log(time);
						document.getElementById('date11').value = time;
						document.getElementById('date11').setAttribute('max', time);
					})
				</script>
			</body>

			</html>