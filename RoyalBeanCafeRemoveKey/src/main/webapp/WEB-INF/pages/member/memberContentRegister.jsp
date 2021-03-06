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
				<script>
					$(function () {
						var piclocation;
						$('#send11').click(function (e) {
							e.preventDefault();
							var userName = $('#userName11').val();
							var phone = $('#phone11').val();
							var birthday = $('#date11').val();
							var city = $('#city11').val();
							var address = $('#address11').val();
							var gender = $('#gender11').val();
							var params = {
								'name': userName,
								'phone': phone,
								'birthday': birthday,
								'city': city,
								'address': address,
								'gender': gender,
								'picture': piclocation,
							};
							$.ajax({
								type: 'post',
								url: 'member_content_resgiter_action',
								contentType: 'application/json',
								data: JSON.stringify(params),
								success: function () {
									console.log('Success');
									swal.fire('Success', '???????????????????????????', 'success')
								},
								error: function () {
									console.log('error');
									swal.fire('Fail', '???????????????????????????', 'fail')
								}
							});
						});

						$('#sendpic').click(function (e) {
							e.preventDefault();
							var fileinput = $('#picture11').val();
							if (fileinput == '') {
								swal.fire({
									position: 'top',
									icon: 'warning',
									title: 'Please select photo.',
									showConfirmButton: false,
									timer: 1500
								});
							} else {
								console.log(fileinput);
								var form = document.getElementById("picfile");
								var formData = new FormData(form);
								console.log(formData);
								$.ajax({
									type: "POST",
									enctype: 'multipart/form-data', //????????????????????? ?????????????????????????????????
									// url: "memberphoto", //????????????????????????
									url: "/uploadImg", //????????????????????????
									data: formData,     //??????????????????
									processData: false, //??????jquery???data??????query String
									contentType: false,
									cache: false,  //????????????
									async: false, //????????????
									timeout: 1000000, //???????????????timeout,???????????????????????????
									success: function (data) {
										console.log(data)
										swal.fire({
											position: 'top',
											icon: 'success',
											title: 'Upload Successd!',
											showConfirmButton: false,
											timer: 1500
										});
										// piclocation = "/memberpicture/" + data;
										// document.getElementById("imgpic").src = piclocation;
										piclocation = data;
										document.getElementById("imgpic").src = piclocation;
									},
									error: function (e) {
										console.log("ERROR : ", e);
									}
								})
							}
						});

						$('#save-info').change(function () {

							if (this.checked) {
								$('#userName11').val('?????????');
								$('#phone11').val('0912345678');
								$('#address11').val('???????????????????????????261-8');
								$('#city11').val('?????????');
							}else{
								$('#userName11').val('');
								$('#phone11').val('');
								$('#address11').val('');
							}
							
						});
					});



				</script>



			</head>

			<body>

	<!-- ???????????????header -->
	<%@include file="/WEB-INF/pages/headerfooter/memberheader.jsp"%>
	<!-- ???????????????header -->


				<!-- Start All Title Box -->
				<div class="all-title-box">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<h2>????????????</h2>
								<ul class="breadcrumb">
									<li class="breadcrumb-item active">????????????</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- End All Title Box -->
				<!-- picture-->
				<div class="cart-box-main" style="margin: 5px auto;">
					<div class="container">
						<div class="row new-account-login">
							<div class="col-sm-6 col-lg-6 mb-3"></div>
						</div>
						<div class="row" style="margin: auto;">
							<div class="col-sm-12 col-lg-12 mb-3" style="margin: auto; max-width: 75%;">
								<div class="checkout-address">
									<div class="title-left">
										<h3 style="font-size: 30px;">??????</h3>
									</div>
									<form class="needs-validation" id="picfile">
										<div class="mb-3">
											<label for="mPicture">Picture</label> <input type="file"
												class="form-control newinputstyle" id="picture11" name="myfile">
											<!-- <label for="mPicture">Picture</label> <input type="file"
												class="form-control newinputstyle" id="picture11" name="mPicture"> -->
										</div>
										<div class="col-12 d-flex shopping-box" >											
											<input type="button" class="ml-auto btn hvr-hover"
												style="color: white; border: none;" id="sendpic" value="??????????????????"></input>
											<!-- <img src="${filename}" alt="" id="imgpic" /> -->
											<br>
										</div>
										<br>
										<div class="col-12 d-flex shopping-box" style="margin-left: 25%;">
											<img src="" alt="" id="imgpic" style="width: 400px;" />
										</div>
								</div>
								<hr class="mb-2">
								</form>
							</div>

						</div>
					</div>

				</div>
				<!-- picture end-->
				<!-- Start Cart  -->
				<div class="cart-box-main" style="margin: 5px auto;">
					<div class="container">
						<div class="row new-account-login">
							<div class="col-sm-6 col-lg-6 mb-3"></div>
						</div>
						<div class="row" style="margin: auto;">
							<div class="col-sm-12 col-lg-12 mb-3" style="margin: auto; max-width: 75%;">
								<div class="checkout-address">
									<div class="title-left newtitle">
										<h3 style="font-size: 30px;">????????????</h3>
									</div>
									<form class="needs-validation" method="post">
										<div class="row">
											<!-- <div class="col-md-6 mb-3">
										<label for="firstName">id</label> <input type="hidden" class="form-control"
											id="memberID11" value="${memberID}">
									</div> -->
											<div class="col-md-6 mb-3">
												<label for="firstName" style="font-size: 20px;">??????</label> <input type="text"
													class="form-control newinputstyle" id="userName11" placeholder="?????????????????????"
													autocapitalize="off" name="userName" required>
												<div class="invalid-feedback">Valid first name is
													required.</div>
											</div>
											<div class="col-md-6 mb-3">
												<label for="lastName" style="font-size: 20px;">Phone</label> <input type="text"
													class="form-control newinputstyle" id="phone11" placeholder="???????????????"
													autocapitalize="off" name="phone" required>
												<div class="invalid-feedback">Valid last name is
													required.</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 mb-3">
												<label for="firstName" style="font-size: 20px;">??????</label> <input type="date"
													class="form-control newinputstyle" id="date11" name="birthday" required>
												<div class="invalid-feedback">Valid first name is
													required.</div>
											</div>
											<div class="col-md-6 mb-3">
												<label for="gender" style="font-size: 20px;">??????</label> <select class="wide w-100 newinputstyle" id="gender11"
													name="gender">
													<option value="???">??????</option>
													<option value="???">??????</option>
												</select>
												<div class="invalid-feedback">Please provide a valid
													state.</div>
											</div>
										</div>
										<hr>
										<div class="row">
											<div class="col-md-6 mb-3">
												<label for="city" style="font-size: 20px;">??????</label> <select class="wide w-100 newinputstyle" id="city11"
													name="city">
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
													<option value="?????????">?????????</option>
												</select>
												<div class="invalid-feedback">Please select a valid
													country.</div>
											</div>
										</div>
										<div class="mb-3">
											<label for="address" style="font-size: 20px;">Address</label> <input type="text"
												class="form-control newinputstyle" id="address11" placeholder="???????????????"
												autocapitalize="off" required name="address">
											<div class="invalid-feedback">Please enter your shipping
												address.</div>
										</div>
										<hr class="mb-4">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="save-info"> <label
												class="custom-control-label" for="save-info">??????????????????</label>
										</div>
										<div class="col-12 d-flex shopping-box">
											<input type="submit" value="Send" name="registerMember" id="send11"
												class="ml-auto btn hvr-hover" style="color: white; border: none;">
										</div>
								</div>
								<hr class="mb-1">
								</form>
							</div>

						</div>
					</div>

				</div>



    <!-- Footer -->
    <%@include file="/WEB-INF/pages/headerfooter/footer.jsp"%>
	<!-- Footer -->

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