<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.2/dist/sweetalert2.all.min.js"></script>
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

	<!-- 會員登入後header -->
	<%@include file="/WEB-INF/pages/headerfooter/memberheader.jsp"%>
	<!-- 會員登入後header -->

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-left">
                <img src="/images/activity01.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Make Me Coffee, <br> Be Coffee.</strong></h1>
                            <p class="m-b-40">"What do you want?"  <br> - Just coffee. Black like my soul.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="/images/activity02.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Cake is for life, not just for birthdays! <br> </strong></h1>
                            <p class="m-b-40">Put "eat cake" on top of your to-do list today <br> and you're sure to get at least one task done.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-right">
                <img src="/images/activity03.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Latte Art, <br> I put coffee in my coffee.</strong></h1>
                            <p class="m-b-40">  Good communication is just as stimulating as black coffee, <br> and just as hard to sleep after.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->

    

    <!-- Start Activitys -->
    <div class="products-box">
        <div class="container">
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button class="active" data-filter="*" id="allactsbut">所有活動課程</button>
                            <button id="professor" data-filter=".professor" value="職人課程" type="button">創業職人課程</button>
                            <button id="cafetaste" data-filter=".cafetaste" value="咖啡品嘗" type="button">咖啡品嘗慢聊</button>
                            <button id="diyclass" data-filter=".diyclass" value="DIY體驗" type="button">DIY手作體驗</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="actboxes">
            <div class="row special-list">
            
<!-- 所有活動 -->
				<c:forEach var="actlists" items="${actlists}">
                <div class="col-lg-3 col-md-6 special-grid">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <img src="${actlists.aPhoto}" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="activityorder${actlists.aId}">前往報名</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4>${actlists.aName}</h4>
                            <h5> $${actlists.aPrice}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
<!-- 所有活動 -->

            </div>    
        </div>
    </div>
    </div>
    <!-- End Activitys  -->

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
    
    <script type="text/javascript">
    
    //職人類別查詢Ajax
    $('#professor').click(function () {
    	var findByCategory = $('#professor').val();
		console.log(findByCategory);
		
		$.ajax({
			   type:'post',
			   url:'/activitycategory/' + findByCategory,
			   dataType:'JSON', //送回JSON
			   
			   success: function(data) {
						   var json = JSON.stringify(data, null, 4);
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);
						   //把其他類清空
						   $('#cafebox').empty("");
						   $('#diybox').empty("");

						   //生成professorbox
						   $('#actboxes').append("<div id='professorbox' class='row special-list'></div>");
						   $('#professorbox').empty(""); //自己類清空
						   
						   var acts = $('#professorbox');
						   
							   $.each(parsedObjinArray,function(i,n){
								   var a =
									"<div class='col-lg-3 col-md-6 special-grid professor'>"+
				                    "<div class='products-single fix'>"+
				                        "<div class='box-img-hover'>"+
				                            "<div class='type-lb'>"+
				                                "<p class='sale'>Sale</p>"+
				                            "</div>"+
				                            "<img src='" +n.aPhoto+ "'" + "class='img-fluid' alt='Image'>"+
				                            "<div class='mask-icon'>"+
				                                "<ul>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
				                                "</ul>"+
				                                "<a class='cart' href='activityorder" +n.aId+ "'"+">前往報名</a>"+
				                            "</div>"+
				                        "</div>"+
				                        "<div class='why-text'>"+
				                            "<h4>" +n.aName+ "</h4>"+
				                            "<h5> $" +n.aPrice+ "</h5>"+
				                        "</div>"+
				                    "</div>"+
				                "</div>";
				           acts.append(a);
				           
						   });
							   
				},
				error: function() { 
					console.log("search結果:null");
				}
				
			});
		
	});
    
    
    //咖啡品嘗查詢Ajax
    $('#cafetaste').click(function () {
    	var findByCategory = $('#cafetaste').val();
		console.log(findByCategory);
		
		$.ajax({
			   type:'post',
			   url:'/activitycategory/' + findByCategory,
			   dataType:'JSON', //送回JSON
			   
			   success: function(data) {
						   var json = JSON.stringify(data, null, 4);
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);
						   //把其他類清空
						   $('#professorbox').empty("");
						   $('#diybox').empty("");
						   
						   //生成cafebox
						   $('#actboxes').append("<div id='cafebox' class='row special-list'></div>");
						   $('#cafebox').empty(""); //自己類清空
						   
						   var acts = $('#cafebox');						   
						   
							   $.each(parsedObjinArray,function(i,n){
								   var a =
									"<div class='col-lg-3 col-md-6 special-grid cafetaste'>"+
				                    "<div class='products-single fix'>"+
				                        "<div class='box-img-hover'>"+
				                            "<div class='type-lb'>"+
				                                "<p class='sale'>Sale</p>"+
				                            "</div>"+
				                            "<img src='" +n.aPhoto+ "'" + "class='img-fluid' alt='Image'>"+
				                            "<div class='mask-icon'>"+
				                                "<ul>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
				                                "</ul>"+
				                                "<a class='cart' href='activityorder" +n.aId+ "'"+">前往報名</a>"+
				                            "</div>"+
				                        "</div>"+
				                        "<div class='why-text'>"+
				                            "<h4>" +n.aName+ "</h4>"+
				                            "<h5> $" +n.aPrice+ "</h5>"+
				                        "</div>"+
				                    "</div>"+
				                "</div>";
				           acts.append(a);
				           
						   });
							   
				},
				error: function() { 
					console.log("search結果:null");
				}
				
			});
		
	});
    
    //DIY體驗查詢Ajax
    $('#diyclass').click(function () {
    	var findByCategory = $('#diyclass').val();
		console.log(findByCategory);
		
		$.ajax({
			   type:'post',
			   url:'/activitycategory/' + findByCategory,
			   dataType:'JSON', //送回JSON
			   
			   success: function(data) {
						   var json = JSON.stringify(data, null, 4);
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);
						   //把其他類清空
						   $('#professorbox').empty("");
						   $('#cafebox').empty("");
						   
						   //生成cafebox
						   $('#actboxes').append("<div id='diybox' class='row special-list'></div>");
						   $('#diybox').empty(""); //自己類清空
						   
						   var acts = $('#diybox');
						   
							   $.each(parsedObjinArray,function(i,n){
								   var a =
									"<div class='col-lg-3 col-md-6 special-grid diyclass'>"+
				                    "<div class='products-single fix'>"+
				                        "<div class='box-img-hover'>"+
				                            "<div class='type-lb'>"+
				                                "<p class='sale'>Sale</p>"+
				                            "</div>"+
				                            "<img src='" +n.aPhoto+ "'" + "class='img-fluid' alt='Image'>"+
				                            "<div class='mask-icon'>"+
				                                "<ul>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
				                                    "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
				                                "</ul>"+
				                                "<a class='cart' href='activityorder" +n.aId+ "'"+">前往報名</a>"+
				                            "</div>"+
				                        "</div>"+
				                        "<div class='why-text'>"+
				                            "<h4>" +n.aName+ "</h4>"+
				                            "<h5> $" +n.aPrice+ "</h5>"+
				                        "</div>"+
				                    "</div>"+
				                "</div>";
				           acts.append(a);
				           
						   });
							   
				},
				error: function() { 
					console.log("search結果:null");
				}
				
			});
		
	});
    
    $('#allactsbut').click(function () {
    	$('#professorbox').empty("");
		$('#cafebox').empty("");
		$('#diybox').empty("");
	});

    </script>
    
</body>

</html>