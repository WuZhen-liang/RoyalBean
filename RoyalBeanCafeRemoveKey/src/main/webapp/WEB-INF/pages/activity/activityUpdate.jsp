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
    <title>Activity</title>
    <script src="https://kit.fontawesome.com/ccba314d23.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.2/dist/sweetalert2.all.min.js"></script>
    
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

    <!-- 修改活動Start -->
	<div class="latest-blog">
		<div class="container" style="font-size:16.5px">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>活動管理</h1>
                        -請新增並定期更新您所有活動資訊，RoyalBeanCafe將協助您增加曝光-
					</div>
				</div>
			</div>

			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link  active" aria-current="page" href="#">新增活動</a></li>
			</ul>


			<div>
				<hr class="mb-4">
					<div class="title"><span><h3 style="color: #8B4513">Step1. 新增活動照片</h3></span></div>
				<hr class="mb-4">
				
		    	<form id="activiyPhotoForm">
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

				<form:form class="needs-validation" action="updateActivity" modelAttribute="activity/activityUpdate">
					<form:input type="hidden" class="form-control" path="aId"/>
					<form:input type="hidden" class="form-control" path="company"/>
					<form:input type="hidden" class="form-control" path="activityStore"/>
					<%--<form:label path="aPhoto">活動照片 *</form:label>--%>
					<form:input id="aPhotoValue" type="hidden" class="form-control" path="aPhoto"/>
					
					<hr class="mb-4">
					<div class="title"><span><h3 style="color: #8B4513">Step2. 填寫活動基本資料</h3></span></div>
					<hr class="mb-4">
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="aName">活動名稱 *</form:label>
							<form:input class="form-control" path="aName" />
							<div class="invalid-feedback">Valid first name is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="aCategory">活動性質 *</form:label>
							<form:select class="form-control" path="aCategory" >
								<form:option value="尚未選擇" label="Please Select..."/>
								<form:option value="DIY體驗"/>
								<form:option value="咖啡品嘗"/>
								<form:option value="職人課程"/>
							</form:select>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="aTarget">活動目標客群 *</form:label>
							<form:select class="form-control" path="aTarget" >
								<form:option value="尚未選擇" label="Please Select..."/>
								<form:option value="情侶約會"/>
								<form:option value="親子體驗"/>
								<form:option value="創業職人"/>
								<form:option value="凡熱愛咖啡者(須滿12歲以上)"/>
							</form:select>
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="aPeople">活動名額 *</form:label>
							<form:input class="form-control" path="aPeople" />
							<div class="invalid-feedback">Valid last name is required.</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="aPrice">活動金額 *</form:label>
							<form:input class="form-control" path="aPrice" />
							<div class="invalid-feedback">Valid first name is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="aTime">活動時間(單位分鐘) *</form:label>
							<form:input class="form-control" path="aTime" />
							<div class="invalid-feedback">Valid last name is required.</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="aContent">活動描述(限200字) *</form:label>
							<form:textarea class="form-control" path="aContent" rows="5"/>
						</div>
					</div>
					
					<hr class="mb-1">
					<div class="col-12 d-flex shopping-box">
						<form:button class="ml-auto btn hvr-hover" value="Send">
							<P style="color: #FFF8DC;">修改</P>
						</form:button>
					</div>

				</form:form>			
			
			</div>
		</div>
	</div>
	<!-- 修改活動 End -->

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
		var sPhotoValueNow = $('#aPhotoValue').val();
		var img = $("#show");
		img.attr("src", sPhotoValueNow);
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
			
			var form = document.getElementById("activiyPhotoForm");
		    var formData = new FormData(form);
			console.log(formData.get("myfile"));

		    $.ajax({
		        type: "POST",  //使用POST傳輸,檔案上傳只能用POST
		        enctype: 'multipart/form-data', //將資料加密傳輸 檔案上傳一定要有的屬性
		        url: "/uploadImg", //要傳輸對應的接口
		        //url: "/activity/activityphotoupload", //要傳輸對應的接口
		        data: formData,     //要傳輸的資料
		        processData: false, //防止jquery將data變成query String
		        contentType: false, 
		        cache: false,  //不做快取
		        async : false, //設為同步
		        timeout: 1000000, //設定傳輸的timeout,時間內沒完成則中斷
		        success: function (data) {
		            console.log("SUCCESS : ", data);
		            $('#aPhotoValue').val(data);
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