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

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
	$(document).ready(function() {
		function getFormData($form) {
			var unindexed_array = $form.serializeArray();
			console.log(unindexed_array);
			var indexed_array = {};

			$.map(unindexed_array, function(n, i) {
				indexed_array[n['name']] = n['value'];
			});
			console.log(indexed_array);
			return indexed_array;
		}
		$("#send").click(function() {
			//var insertData = $("form").serialize();

			var $form = $("form");
			var data = getFormData($form);
			console.log(data);
			$.ajax({
				type : 'post',
				url : '/company/ajaxinsertshoppd',
				data : JSON.stringify(data),
				contentType : 'application/json',
				success : function() {
					swal.fire(
							'Success',
							'??????????????????!',
							'success'
						)
					location.href="shopSearch"
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		});
		//????????????
		$('#buttonUpload').click(function () {
		var fileinput = $('#pdPicture').val();
		if(fileinput == ''){
			console.log("please select photo");
			swal.fire({
           	  position: 'top',
           	  icon: 'warning',
           	  title: 'Please select photo.',
           	  showConfirmButton: false,
           	  timer: 1500
           	});
		}else{
			
			var form = document.getElementById("shoppdPhotoForm");
		    var formData = new FormData(form);
			console.log(formData.get("myfile"));

		    $.ajax({
		        type: "POST",  //??????POST??????,?????????????????????POST
		        enctype: 'multipart/form-data', //????????????????????? ?????????????????????????????????
		        url: "/uploadImg",
// 		        url: "shopphoto", //????????????????????????
		        data: formData,     //??????????????????
		        processData: false, //??????jquery???data??????query String
		        contentType: false, 
		        cache: false,  //????????????
		        async : false, //????????????
		        timeout: 1000000, //???????????????timeout,???????????????????????????
		        success: function (data) {
		            console.log("SUCCESS : ", data);
// 		            $('#pdpictureinfo').val("/shoppicture/"+data);
		            $('#pdpictureinfo').val(data);
		            console.log($('#pdPicture').val());
		            swal.fire({
		             	  position: 'top',
		             	  icon: 'success',
		             	  title: 'Upload Successd!',
		             	  showConfirmButton: false,
		             	  timer: 1500
		             	});
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		        }
		    })
		}
	});
		$("#onepass").click(function() {
			//var insertData = $("form").serialize();

			$("#pdname").val("????????????");
			$("#pdprice").val(140);
			$("#pdcount").val(20);
			$("#pdweight").val(200);
			$("#pdtype").val("??????");
			$("#pdbake").val("?????????");
			$("#savemethod").val("??????");
			$("#depiction").val("????????????????????????????????????-????????????????????????14???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????! ??????????????????");
			$("#ingredient").val("?????????");
			$("#origin").val("??????");
			$("#exptime").val("7???");
			$("#shipment").val("??????");
			$("#notice").val("?????????");
			swal.fire({
	           	  position: 'top',
	           	  icon: 'success',
	           	  title: 'onepass finish',
	           	  showConfirmButton: false,
	           	  timer: 1500
	           	});
		});
	});
</script>

</head>

<body>
	<%@include file="/WEB-INF/pages/shop/header/venderheadersecond.jsp"%>

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
						<div class="row">
							<div class="col-md-4 mb-3">
							<input type="hidden" class="form-control"/>
							</div>
							<div class="col-md-4 mb-3">							
							<input type="hidden" class="form-control"/>
							</div>
							<div class="col-md-4 mb-3">							
							<button id="onepass" position="absolute" left="20%" top="100px">????????????</button>
							</div>									
						</div>
						<div class="title-left">
							<h3>????????????:</h3>
						</div>
						<!-- Picture Start-->
		    		<form id="shoppdPhotoForm">
						<label>?????? *</label>
						<div class="row">
							<div class="col-md-6 mb-3">
								<input id="pdPicture" type="file" name="myfile" class="form-control"/>
								<span id="imgview"></span>
							</div>
							<div id="viewpicture"></div>
							<div class="col-md-6 mb-3">
								<input id="buttonUpload" type="button" value="Upload" class="btn btn-warning"/>
							</div>
						</div>	
					</form>	
					<!-- Picture End-->	
						<form class="needs-validation" method="POST">
							<div class="row">
								<div class="col-md-6 mb-3">
									<label>???????????? *</label> <input type="text"
										class="form-control" name="shopPdName" id="pdname">
									<div class="invalid-feedback">Valid first name is
										required.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label>?????? *</label> <input type="text"
										class="form-control" name="shopPdPrice" id="pdprice">
									<div class="invalid-feedback">Valid last name is
										required.</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label>?????? *</label> <input class="form-control"
										name="shopPdCount" id="pdcount">
									<div class="invalid-feedback">Valid first name is
										required.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label>?????? *</label> <input type="text"
										class="form-control" name="shopPdWeight" id="pdweight">
									<div class="invalid-feedback">Valid last name is
										required.</div>
								</div>
							</div>
							<div class="mb-3">
								<div class="input-group">
									<input name='shopPdPicture' type="hidden" id="pdpictureinfo">
								</div>
							</div>
							<div class="mb-3">
								<div class="row">
									<div class="col-md-4 mb-3">
										<label>?????? *</label> <select class="wide w-100"
											name="shopPdType" id="pdtype">
											<option value="Choose..." data-display="Select">Choose...</option>
											<option value="?????????">?????????</option>
											<option value="??????">??????</option>
											<option value="??????">??????</option>
										</select>
										<div class="invalid-feedback">Please select a valid
											Type.</div>
									</div>
									<div class="col-md-4 mb-3">
										<label>???????????? *</label> <select class="wide w-100"
											name="shopPdBaking" id="pdbake">
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
										<label>???????????? *</label> <select class="wide w-100"
											name="shopPdSaveMethod" id="savemethod">
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
								<label>?????? *</label>
								<textarea class="wide w-100" name="shopPdDepiction" id="depiction"></textarea>
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>?????? *</label> <input class="wide w-100"
									name="shopPdIngredient" id="ingredient">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>?????? *</label> <input class="wide w-100"
									name="shopPdOrigin" id="origin">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>???????????? *</label> <input class="wide w-100"
									name="shopPdExpTime" id="exptime">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>????????? *</label> <input class="wide w-100"
									name="shopPdShipment" id="shipment">
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
							<div class="mb-3">
								<label>???????????? *</label>
								<textarea class="wide w-100" name="shopPdNotice" id="notice"></textarea>
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
			</div>

		</div>
	</div>
	<!-- End Cart -->


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
</body>

</html>