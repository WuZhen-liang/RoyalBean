<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ActivityStore</title>
    <script src="https://kit.fontawesome.com/ccba314d23.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.2/dist/sweetalert2.all.min.js"></script>
    <!-- Ajax -->
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
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

</head>

<body>
	
    <!-- 廠商登入後header -->
	<%@include file="/WEB-INF/pages/headerfooter/venderheader.jsp"%>
	<!-- 廠商登入後header -->  

    <!-- 修改門市Start -->
	<div class="latest-blog">
		<div class="container" style="font-size:16.5px">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>實體門市資訊管理</h1>
						-請新增並定期更新您所有實體門市資訊，RoyalBeanCafe將協助您增加曝光-
					</div>
				</div>
			</div>

			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="activityStore">門市總表</a></li>
				<li class="nav-item"><a class="nav-link  active"
					aria-current="page" href="#">修改門市</a></li>
			</ul>


			<div>
				<hr class="mb-4">
					<div class="title"><span><h3 style="color: #8B4513">Step1. 選擇一張門市照片</h3></span></div>
				<hr class="mb-4">
				
		    	<form id="storePhotoForm">
		    		<figure class="figure">
					  <img src="" id="show" class="figure-img img-fluid rounded" width="400px">
					  <figcaption class="figure-caption">(檔案格式：.jpg, .jpeg, .png )</figcaption>
					</figure>
					<div class="row">
						<div class="col-md-6 mb-3">
							<input id="fileinput" type="file" name="myfile" class="form-control"/>
						</div>
						<div class="col-md-6 mb-3">
							<input id="buttonUpload" type="button" value="Upload" class="btn btn-warning"/>
						</div>
					</div>	
				</form>
			
				<form:form class="needs-validation" action="updateStore" modelAttribute="activity/activityStoreUpdate">
					<form:input type="hidden" path="sId" />
					<form:input type="hidden" path="company" />
					<hr class="mb-4">
					<div class="title"><span><h3 style="color: #8B4513">Step1. 門市基本資料</h3></span></div>
					<hr class="mb-4">
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="sName">門市名稱 *</form:label>
							<form:input class="form-control" path="sName" />
							<div class="invalid-feedback">Valid first name is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="sPhone">門市電話 *</form:label>
							<form:input class="form-control" path="sPhone" />
							<div class="invalid-feedback">Valid last name is required.</div>
						</div>
					</div>
					<div class="mb-3">
					
							<div id="twzipcode" class="form-row">
							<div class="form-group col">
								  <form:label path="sCity">縣市 *</form:label>
								  <form:input id="sCityvalue" class="form-control" path="sCity" type="hidden"/>
								  <div id="county" data-role="county" data-style="form-control" data-value=""></div>
								  <div class="invalid-feedback">Zip code required.</div>
							</div>
							<div class="form-group col">
								  <form:label path="sDistrict">鄉鎮市區 *</form:label>
								  <form:input id="sDistrictvalue" class="form-control" path="sDistrict" type="hidden"/>
								  <div id="district" data-role="district" data-style="form-control" data-value=""></div>
								  <div class="invalid-feedback">Zip code required.</div>
							</div>
							<div class="form-group col">  
								  <form:label path="sZip">郵遞區號 *</form:label>
								  <form:input id="sZipvalue" class="form-control" path="sZip" type="hidden"/>
								  <div id="zipcode" data-role="zipcode" data-style="form-control" data-value=""></div>
								  <div class="invalid-feedback">Zip code required.</div>  
							</div>
							</div>
							
					</div>

					<div class="mb-3">
						<form:label path="sAdd">詳細地址 *</form:label>
						<form:input class="form-control" path="sAdd" />
						<div class="invalid-feedback">Please enter your shipping address.</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="sNs">經度 *</form:label>
							<form:input class="form-control" path="sNs" />
							<div class="invalid-feedback">Valid first name is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="sEw">緯度 *</form:label>
							<form:input class="form-control" path="sEw" />
							<div class="invalid-feedback">Valid last name is required.</div>
						</div>
					</div>
					<div class="mb-3">
						<!-- <form:label path="sPhoto">門市照片 *</form:label> -->
						<form:input id="sPhotoValue" type="hidden" class="form-control" path="sPhoto"/>	
					</div>
					<hr class="mb-4">
					<div class="title"><span><h3 style="color: #8B4513">Step2. 營業時間</h3></span></div>
					<hr class="mb-4">
					<h4 style="color: #8B4513">星期一</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="monOpen">開店時間</form:label>
							<form:input type="Time" class="form-control" path="monOpen" />
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="monClose">關店時間</form:label>
							<form:input type="Time" class="form-control" path="monClose" />
						</div>
					</div>
					<h4 style="color: #8B4513">星期二</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="tueOpen">開店時間</form:label>
							<form:input type="Time" class="form-control" path="tueOpen" />
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="tueClose">關店時間</form:label>
							<form:input type="Time" class="form-control" path="tueClose" />
						</div>
					</div>
					<h4 style="color: #8B4513">星期三</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="wedOpen">開店時間</form:label>
							<form:input type="Time" class="form-control" path="wedOpen" />
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="wedClose">關店時間</form:label>
							<form:input type="Time" class="form-control" path="wedClose" />
						</div>
					</div>
					<h4 style="color: #8B4513">星期四</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="thuOpen">開店時間</form:label>
							<form:input type="Time" class="form-control" path="thuOpen" />
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="thuClose">關店時間</form:label>
							<form:input type="Time" class="form-control" path="thuClose" />
						</div>
					</div>
					<h4 style="color: #8B4513">星期五</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="firOpen">開店時間</form:label>
							<form:input type="Time" class="form-control" path="firOpen" />
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="firClose">關店時間</form:label>
							<form:input type="Time" class="form-control" path="firClose" />
						</div>
					</div>
					<h4 style="color: #8B4513">星期六</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="satOpen">開店時間</form:label>
							<form:input type="Time" class="form-control" path="satOpen" />
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="satClose">關店時間</form:label>
							<form:input type="Time" class="form-control" path="satClose" />
						</div>
					</div>
					<h4 style="color: #8B4513">星期日</h4>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="sunOpen">開店時間</form:label>
							<form:input type="Time" class="form-control" path="sunOpen" />
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="sunClose">關店時間</form:label>
							<form:input type="Time" class="form-control" path="sunClose" />
						</div>
					</div>
					
					<hr class="mb-1">
					<div class="col-12 d-flex shopping-box">
						<form:button id="updatebutton" class="ml-auto btn hvr-hover" value="Send">
							<P style="color: #FFF8DC;">修改</P>
						</form:button>
					</div>

				</form:form>
			</div>
		</div>
	</div>
	<!-- 修改門市End -->

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
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="/js/jquery.twzipcode.min.js"></script>
    
    
	<script type="text/javascript">
	
	$(document).ready(function () {
		//顯示目前照片
		var sPhotoValueNow = $('#sPhotoValue').val();
		var img = $("#show");
		img.attr("src", sPhotoValueNow);
		//img.attr("src", "/activityphoto/"+sPhotoValueNow);
	});
	
	//顯示目前縣市區
	var countyvalueNow = $('#sCityvalue').val();
	var districtvalueNow = $('#sDistrictvalue').val();
	var zipvalueNow = $('#sZipvalue').val();

	$("#twzipcode").twzipcode({
		
		'zipcodeSel': zipvalueNow,
	    'countySel': countyvalueNow,
	    'districtSel': districtvalueNow,
		
	    //重選縣市區
		onCountySelect: function() {
			var countyvalue = $('#county').children().val();
			console.log(countyvalue);
			$('#sCityvalue').val(countyvalue);
			
			var districtvalue =$('#district').children().val();
			console.log(districtvalue);
			$('#sDistrictvalue').val(districtvalue);
			
			var zipvalue =$('#zipcode').children().val();
			console.log(zipvalue);
			$('#sZipvalue').val(zipvalue);
		},
		onDistrictSelect: function() {
			var districtvalue =$('#district').children().val();
			console.log(districtvalue);
			$('#sDistrictvalue').val(districtvalue);
			
			var zipvalue =$('#zipcode').children().val();
			console.log(zipvalue);
			$('#sZipvalue').val(zipvalue);
		},
		
	});
	
	//照片預覽
	$("#fileinput").change(function() {
		var readFile = new FileReader();
		var fileShow = $("#fileinput")[0].files[0];  //document.getElementById('file')等於$("#myfile")[0]
		readFile.readAsDataURL(fileShow);
		readFile.onload = function() {
		var img = $("#show");
		img.attr("src", this.result);
		}
	});
	
	
	//照片上傳
	$('#buttonUpload').click(function () {
		var fileinput = $('#fileinput').val();
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
			
			var form = document.getElementById("storePhotoForm");
		    var formData = new FormData(form);
			console.log(formData.get("myfile"));

		    $.ajax({
		        type: "POST",  //使用POST傳輸,檔案上傳只能用POST
		        enctype: 'multipart/form-data', //將資料加密傳輸 檔案上傳一定要有的屬性
		        url: "/uploadImg", //要傳輸對應的接口
		        //url: "/activity/activityphotouploadcontroller", //要傳輸對應的接口
		        data: formData,     //要傳輸的資料
		        processData: false, //防止jquery將data變成query String
		        contentType: false, 
		        cache: false,  //不做快取
		        async : false, //設為同步
		        timeout: 1000000, //設定傳輸的timeout,時間內沒完成則中斷
		        success: function (data) {
		            console.log("SUCCESS : ", data);
		            $('#sPhotoValue').val(data);
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
	})

	</script>
</body>

</html>