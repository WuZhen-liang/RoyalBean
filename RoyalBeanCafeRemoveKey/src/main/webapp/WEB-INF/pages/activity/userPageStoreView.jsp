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
                <img src="/images/store01.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Survive Monday, <br> get coffee.</strong></h1>
                            <p class="m-b-40">Having fun time is good use of your money.<br> We make the mornings better. We make the nights longer.</p>
                            <p><a class="btn hvr-hover" href="#">Visit Now</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="/images/store02.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong> Take a break,<br> drink some coffee.</strong></h1>
                            <p class="m-b-40">It won't be long before another day, were gonna have a good time. And no ones gonna take that time away. <br> You can stay as long as you like.</p>
                            <p><a class="btn hvr-hover" href="#">Visit Now</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-right">
                <img src="/images/store03.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong> We create <br> delicious memories.</strong></h1>
                            <p class="m-b-40">The most important things is to enjoy yourself and have a good time. <br>Coffee: nectar of the gods, a gift to us.</p>
                            <p><a class="btn hvr-hover" href="#">Visit Now</a></p>
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

<!-- Start Store Page  -->
    <div class="shop-box-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form>
                                <input id="searchName" class="form-control" placeholder="Search here..." type="text">
                                <button id="searchNameAction" type="button"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3><i class="fas fa-map-marker-alt"></i>  區域搜尋</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <button id="viewallstore" class="list-group-item list-group-item-action" style="font-size:20px;"> 全門市瀏覽 <small class="text-muted">( ${storeSize} ) </small></button>
                                <button id="northstore" class="list-group-item list-group-item-action" style="font-size:20px;"> 北北基門市 <small class="text-muted">( ${northSize} ) </small></button>
                                <button id="taoyuanstore" class="list-group-item list-group-item-action" style="font-size:20px;"> 桃竹苗門市 <small class="text-muted">( ${taoyuanSize}  ) </small></button>
                                <button id="centralstore" class="list-group-item list-group-item-action" style="font-size:20px;"> 中彰投門市 <small class="text-muted">( ${centralSize} ) </small></button>
                                <button id="tainanstore" class="list-group-item list-group-item-action" style="font-size:20px;"> 雲嘉南門市 <small class="text-muted">( ${tainanSize} ) </small></button>
                                <button id="southstore" class="list-group-item list-group-item-action" style="font-size:20px;"> 高屏花門市 <small class="text-muted">( ${southSize} ) </small></button>                                
                            </div>
                        </div>                 
                    </div>
                </div>
<!-------------- 門市 -------------->	
                <div id="storesboxes" class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
										<c:forEach var="allstores" items="${allstores}">
                                        <div class="row">
                                            <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
                                                <div class="products-single fix">
                                                    <div class="box-img-hover">
                                                        <div class="type-lb">
                                                            <p class="new" style="font-size:20px;"><i class="fas fa-wifi"></i> <i class="fab fa-apple-pay"></i> <i class="fas fa-smoking-ban"></i></p>
                                                             <!-- <p class="sale">Sale</p> -->
                                                        </div>
                                                        <img src="${allstores.sPhoto}" class="img-fluid" alt="Image">
<%--                                                         <img src="/activityphoto/${allstores.sPhoto}" class="img-fluid" alt="Image"> --%>
                                                        <div class="mask-icon">
                                                            <ul>
                                                                <li><a href="${allstores.sPhoto}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                            </ul>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
                                                <div class="why-text full-width">
                                                    <h1 style="color:#A0522D;">${allstores.sName}</h1>                                                   
                                                    
                                                    <table style="color:#A0522D;font-size:16px;">
                                                    	<tr>
	                                                    	<td colspan="5"><i class="fas fa-clock"></i>  營業時間：</td>
	                                                    </tr>
	                                                    <tr style="text-align:center;">
	                                                    	<td><i class="fas fa-coffee"></i>  星 期 一 ：  </td>
	                                                    	<td>  ${allstores.monOpen}  </td>
	                                                    	<td>  -  </td>
	                                                    	<td>  ${allstores.monClose}  </td>
	                                                    </tr>
	                                                    <tr style="text-align:center;">
	                                                    	<td><i class="fas fa-coffee"></i>  星 期 二 ：  </td>
	                                                    	<td>  ${allstores.tueOpen}  </td>
	                                                    	<td>  -  </td>
	                                                    	<td>  ${allstores.tueClose}  </td>
	                                                    </tr>
	                                                    <tr style="text-align:center;">
	                                                    	<td><i class="fas fa-coffee"></i>  星 期 三 ：  </td>
	                                                    	<td>  ${allstores.wedOpen}  </td>
	                                                    	<td>  -  </td>
	                                                    	<td>  ${allstores.wedClose}  </td>
	                                                    </tr>
	                                                    <tr style="text-align:center;">
	                                                    	<td><i class="fas fa-coffee"></i>  星 期 四 ：  </td>
	                                                    	<td>  ${allstores.thuOpen}  </td>
	                                                    	<td>  -  </td>
	                                                    	<td>  ${allstores.thuClose}  </td>
	                                                    </tr>
	                                                    <tr style="text-align:center;">
	                                                    	<td><i class="fas fa-coffee"></i>  星 期 五 ：  </td>
	                                                    	<td>  ${allstores.firOpen}  </td>
	                                                    	<td>  -  </td>
	                                                    	<td>  ${allstores.firClose}  </td>
	                                                    </tr>
	                                                    <tr style="text-align:center;">
	                                                    	<td><i class="fas fa-coffee"></i>  星 期 六 ：  </td>
	                                                    	<td>  ${allstores.satOpen}  </td>
	                                                    	<td>  -  </td>
	                                                    	<td>  ${allstores.satClose}  </td>
	                                                    </tr>
	                                                    <tr style="text-align:center;">
	                                                    	<td><i class="fas fa-coffee"></i>  星 期 日 ：  </td>
	                                                    	<td>  ${allstores.sunOpen}  </td>
	                                                    	<td>  -  </td>
	                                                    	<td>  ${allstores.sunClose}  </td>
	                                                    </tr>
	                                                    
                                                    </table>
                                                    <hr>
                                                    <button class="btn hvr-hover" id="map${allstores.sId}" style="color:#FFF8DC;"><i class="fas fa-map-marker-alt"></i>  立即前往</button>
                                                    <button class="btn hvr-hover" style="color:#FFF8DC;"><i class="fas fa-phone-square"></i>  ${allstores.sPhone}</button>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        
                                        <script type="text/javascript">
                                        $('#map'+${allstores.sId}).click(function () {		
											Swal.fire({
											  title: '立即前往',
											  icon: 'info',
											  html:
											    '<iframe width="400" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"'+ 
											    'src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+${allstores.sEw}+','+${allstores.sNs}+'&z=16&output=embed&t=></iframe>',
											  showCloseButton: true,
											});
										})
										</script>
                                        
                                        </c:forEach>
            </div>
<!-------------- 門市 -------------->                                     
        </div>
    </div>
    <!-- End Store Page -->

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
    //模糊查詢Ajax
    $('#searchNameAction').click(function () {

    	var findByName = $('#searchName').val();
		console.log(findByName);
		
    	$.ajax({
			   type:'post',
			   url:'/activitystoreusersearch/' + findByName,
			   dataType:'JSON', //送回JSON
			   //contentType:'', //送出JSON
			   
			   success: function(data) { //成功呼叫function帶入data
						   var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
			     
			     		   $('#storesboxes').empty(""); //清空AllStores
			     		   
			     		  if(json=null){
			     			 $('#storesboxes').prepend("<div>查無相關門市資料<div>");
			     		  }else{
			     			 var store = $('#storesboxes');
			     			 $.each(parsedObjinArray,function(i,n){
			     				 var s = 
			     					"<div class='row'>"+
                                 	"<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                     "<div class='products-single fix'>"+
                                         "<div class='box-img-hover'>"+
                                             "<div class='type-lb'>"+
                                                 "<p class='new' style='font-size:20px;'><i class='fas fa-wifi'></i> <i class='fab fa-apple-pay'></i> <i class='fas fa-smoking-ban'></i></p>"+
                                             "</div>"+
                                             "<img src='"+n.sPhoto+"'"+ "class='img-fluid' alt='Image'>"+
//                                              "<img src='/activityphoto/"+n.sPhoto+ "'" + "class='img-fluid' alt='Image'>"+
                                             "<div class='mask-icon'>"+
                                                 "<ul>"+
                                                     "<li><a href='"+n.sPhoto+"'"+ "data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
                                                     "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
                                                     "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
                                                 "</ul>"+

                                             "</div>"+
                                         "</div>"+
                                     "</div>"+
                                 "</div>"+
                                 
                                 "<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                     "<div class='why-text full-width'>"+
                                         "<h1 style='color:#A0522D;'>"+n.sName+"</h1>"+                                                   
                                         
                                         "<table style='color:#A0522D;font-size:16px;'>"+
                                         	"<tr>"+
                                             	"<td colspan='5'><i class='fas fa-clock'></i>  營業時間：</td>"+
                                             "</tr>"+
                                             "<tr style='text-align:center;'>"+
                                             	"<td><i class='fas fa-coffee'></i>  星 期 一 ：  </td>"+
                                             	"<td>"  +n.monOpen+  "</td>"+
                                             	"<td>  -  </td>"+
                                             	"<td>"  +n.monClose+  "</td>"+
                                             "</tr>"+
                                             "<tr style='text-align:center;'>"+
                                             	"<td><i class='fas fa-coffee'></i>  星 期 二 ：  </td>"+
                                             	"<td>"  +n.tueOpen+  "</td>"+
                                             	"<td>  -  </td>"+
                                             	"<td>"  +n.tueClose+  "</td>"+
                                             "</tr>"+
                                             "<tr style='text-align:center;'>"+
                                             	"<td><i class='fas fa-coffee'></i>  星 期 三 ：  </td>"+
                                             	"<td>"  +n.wedOpen+  "</td>"+
                                             	"<td>  -  </td>"+
                                             	"<td>"  +n.wedClose+  "</td>"+
                                             "</tr>"+
                                             "<tr style='text-align:center;'>"+
                                             	"<td><i class='fas fa-coffee'></i>  星 期 四 ：  </td>"+
                                             	"<td>"  +n.thuOpen+  "</td>"+
                                             	"<td>  -  </td>"+
                                             	"<td>"  +n.thuClose+  "</td>"+
                                             "</tr>"+
                                             "<tr style='text-align:center;'>"+
                                             	"<td><i class='fas fa-coffee'></i>  星 期 五 ：  </td>"+
                                             	"<td>"  +n.firOpen+  "</td>"+
                                             	"<td>  -  </td>"+
                                             	"<td>"  +n.firClose+  "</td>"+
                                             "</tr>"+
                                             "<tr style='text-align:center;'>"+
                                             	"<td><i class='fas fa-coffee'></i>  星 期 六 ：  </td>"+
                                             	"<td>"  +n.satOpen+  "</td>"+
                                             	"<td>  -  </td>"+
                                             	"<td>"  +n.satClose+  "</td>"+
                                             "</tr>"+
                                             "<tr style='text-align:center;'>"+
                                             	"<td><i class='fas fa-coffee'></i>  星 期 日 ：  </td>"+
                                             	"<td>"  +n.sunOpen+  "</td>"+
                                             	"<td>  -  </td>"+
                                             	"<td>"  +n.sunClose+  "</td>"+
                                             "</tr>"+
                                             
                                         "</table>"+
                                         "<hr>"+
                                         "<button class='btn hvr-hover' id='map"+n.sId+"' style='color:#FFF8DC;'><i class='fas fa-map-marker-alt'></i>  立即前往</button>"+ 
                                         "  <button class='btn hvr-hover' style='color:#FFF8DC;'><i class='fas fa-phone-square'></i>"+  n.sPhone+"</button>"+ 
                                     "</div>"+ 
                                 "</div>"+                                
                             "</div>";		     					 	 
			     			store.append(s);
			     			
                             $('#map'+n.sId).click(function () {		
									Swal.fire({
									  title: '立即前往',
									  icon: 'info',
									  html:
									    '<iframe width="400" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"'+ 
									    'src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+n.sEw+','+n.sNs+'&z=16&output=embed&t=></iframe>',
									  showCloseButton: true,
									});
								})
			     			 })	
			     		  }
					    
				},
				error: function(data) { 
					$('#storesboxes').empty("");
					$('#storesboxes').prepend("<div><h1>查無相關門市資料：請重新輸入或瀏覽全部。</h1><div>");
					console.log("search結果:null");
				}
				
			});
    	
	});
	
    
	//北北基宜門市		
	$('#northstore').click(function () {
		var zip = 0;
		var zip1= 3;
		console.log(zip,zip1);
		
		$.ajax({
			   type:'post',
			   url:'/activitystorezipsearch/' + zip + '/' + zip1,
			   dataType:'JSON', 
			   success: function(data) { //成功呼叫function帶入data
						   var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
			     
			     		   $('#storesboxes').empty(""); //清空AllStores
			     		   
			     		  if(json=null){
			     			 $('#storesboxes').prepend("<div>查無相關門市資料<div>");
			     		  }else{
			     			 var store = $('#storesboxes');
			     			 $.each(parsedObjinArray,function(i,n){
			     				 var s = 
			     					"<div class='row'>"+
                              	"<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='products-single fix'>"+
                                      "<div class='box-img-hover'>"+
                                          "<div class='type-lb'>"+
                                              "<p class='new' style='font-size:20px;'><i class='fas fa-wifi'></i> <i class='fab fa-apple-pay'></i> <i class='fas fa-smoking-ban'></i></p>"+
                                          "</div>"+
                                          "<img src='"+n.sPhoto+"'"+ "class='img-fluid' alt='Image'>"+
                                          "<div class='mask-icon'>"+
                                              "<ul>"+
                                                  "<li><a href='"+n.sPhoto+"'"+ "data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
                                              "</ul>"+

                                          "</div>"+
                                      "</div>"+
                                  "</div>"+
                              "</div>"+
                              
                              "<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='why-text full-width'>"+
                                      "<h1 style='color:#A0522D;'>"+n.sName+"</h1>"+                                                   
                                      
                                      "<table style='color:#A0522D;font-size:16px;'>"+
                                      	"<tr>"+
                                          	"<td colspan='5'><i class='fas fa-clock'></i>  營業時間：</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 一 ：  </td>"+
                                          	"<td>"  +n.monOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.monClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 二 ：  </td>"+
                                          	"<td>"  +n.tueOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.tueClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 三 ：  </td>"+
                                          	"<td>"  +n.wedOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.wedClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 四 ：  </td>"+
                                          	"<td>"  +n.thuOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.thuClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 五 ：  </td>"+
                                          	"<td>"  +n.firOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.firClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 六 ：  </td>"+
                                          	"<td>"  +n.satOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.satClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 日 ：  </td>"+
                                          	"<td>"  +n.sunOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.sunClose+  "</td>"+
                                          "</tr>"+
                                          
                                      "</table>"+
                                      "<hr>"+
                                      "<button class='btn hvr-hover' id='map"+n.sId+"' style='color:#FFF8DC;'><i class='fas fa-map-marker-alt'></i>  立即前往</button>"+ 
                                      "  <button class='btn hvr-hover' style='color:#FFF8DC;'><i class='fas fa-phone-square'></i>"+  n.sPhone+"</button>"+ 
                                  "</div>"+ 
                              "</div>"+                                
                          "</div>";		     					 	 
			     			store.append(s);
			     			
                          $('#map'+n.sId).click(function () {		
									Swal.fire({
									  title: '立即前往',
									  icon: 'info',
									  html:
									    '<iframe width="400" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"'+ 
									    'src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+n.sEw+','+n.sNs+'&z=16&output=embed&t=></iframe>',
									  showCloseButton: true,
									});
								})
			     			 })	
			     		  }					    
				},
				error: function(data) { 
					$('#storesboxes').empty("");
					$('#storesboxes').prepend("<div><h1>查無相關門市資料：請重新輸入或瀏覽全部。</h1><div>");
					console.log("search結果:null");
				}				
			});
	});
	
	
	//桃竹苗門市		
	$('#taoyuanstore').click(function () {
		var zip = 3;
		var zip1= 4;
		console.log(zip,zip1);
		
		$.ajax({
			   type:'post',
			   url:'/activitystorezipsearch/' + zip + '/' + zip1,
			   dataType:'JSON', 
			   success: function(data) { //成功呼叫function帶入data
						   var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
			     
			     		   $('#storesboxes').empty(""); //清空AllStores
			     		   
			     		  if(json=null){
			     			 $('#storesboxes').prepend("<div>查無相關門市資料<div>");
			     		  }else{
			     			 var store = $('#storesboxes');
			     			 $.each(parsedObjinArray,function(i,n){
			     				 var s = 
			     					"<div class='row'>"+
                              	"<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='products-single fix'>"+
                                      "<div class='box-img-hover'>"+
                                          "<div class='type-lb'>"+
                                              "<p class='new' style='font-size:20px;'><i class='fas fa-wifi'></i> <i class='fab fa-apple-pay'></i> <i class='fas fa-smoking-ban'></i></p>"+
                                          "</div>"+
                                          "<img src='"+n.sPhoto+"'"+ "class='img-fluid' alt='Image'>"+
                                          "<div class='mask-icon'>"+
                                              "<ul>"+
                                                  "<li><a href='"+n.sPhoto+"'"+ "data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
                                              "</ul>"+

                                          "</div>"+
                                      "</div>"+
                                  "</div>"+
                              "</div>"+
                              
                              "<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='why-text full-width'>"+
                                      "<h1 style='color:#A0522D;'>"+n.sName+"</h1>"+                                                   
                                      
                                      "<table style='color:#A0522D;font-size:16px;'>"+
                                      	"<tr>"+
                                          	"<td colspan='5'><i class='fas fa-clock'></i>  營業時間：</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 一 ：  </td>"+
                                          	"<td>"  +n.monOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.monClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 二 ：  </td>"+
                                          	"<td>"  +n.tueOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.tueClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 三 ：  </td>"+
                                          	"<td>"  +n.wedOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.wedClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 四 ：  </td>"+
                                          	"<td>"  +n.thuOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.thuClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 五 ：  </td>"+
                                          	"<td>"  +n.firOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.firClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 六 ：  </td>"+
                                          	"<td>"  +n.satOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.satClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 日 ：  </td>"+
                                          	"<td>"  +n.sunOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.sunClose+  "</td>"+
                                          "</tr>"+
                                          
                                      "</table>"+
                                      "<hr>"+
                                      "<button class='btn hvr-hover' id='map"+n.sId+"' style='color:#FFF8DC;'><i class='fas fa-map-marker-alt'></i>  立即前往</button>"+ 
                                      "  <button class='btn hvr-hover' style='color:#FFF8DC;'><i class='fas fa-phone-square'></i>"+  n.sPhone+"</button>"+ 
                                  "</div>"+ 
                              "</div>"+                                
                          "</div>";		     					 	 
			     			store.append(s);
			     			
                          $('#map'+n.sId).click(function () {		
									Swal.fire({
									  title: '立即前往',
									  icon: 'info',
									  html:
									    '<iframe width="400" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"'+ 
									    'src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+n.sEw+','+n.sNs+'&z=16&output=embed&t=></iframe>',
									  showCloseButton: true,
									});
								})
			     			 })	
			     		  }					    
				},
				error: function(data) { 
					$('#storesboxes').empty("");
					$('#storesboxes').prepend("<div><h1>查無相關門市資料：請重新輸入或瀏覽全部。</h1><div>");
					console.log("search結果:null");
				}				
			});
	});
	
	//中彰投門市		
	$('#centralstore').click(function () {
		var zip = 4;
		var zip1= 6;
		console.log(zip,zip1);
		
		$.ajax({
			   type:'post',
			   url:'/activitystorezipsearch/' + zip + '/' + zip1,
			   dataType:'JSON', 
			   success: function(data) { //成功呼叫function帶入data
						   var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
			     
			     		   $('#storesboxes').empty(""); //清空AllStores
			     		   
			     		  if(json=null){
			     			 $('#storesboxes').prepend("<div>查無相關門市資料<div>");
			     		  }else{
			     			 var store = $('#storesboxes');
			     			 $.each(parsedObjinArray,function(i,n){
			     				 var s = 
			     					"<div class='row'>"+
                              	"<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='products-single fix'>"+
                                      "<div class='box-img-hover'>"+
                                          "<div class='type-lb'>"+
                                              "<p class='new' style='font-size:20px;'><i class='fas fa-wifi'></i> <i class='fab fa-apple-pay'></i> <i class='fas fa-smoking-ban'></i></p>"+
                                          "</div>"+
                                          "<img src='"+n.sPhoto+"'"+ "class='img-fluid' alt='Image'>"+
                                          "<div class='mask-icon'>"+
                                              "<ul>"+
                                                  "<li><a href='"+n.sPhoto+"'"+ "data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
                                              "</ul>"+

                                          "</div>"+
                                      "</div>"+
                                  "</div>"+
                              "</div>"+
                              
                              "<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='why-text full-width'>"+
                                      "<h1 style='color:#A0522D;'>"+n.sName+"</h1>"+                                                   
                                      
                                      "<table style='color:#A0522D;font-size:16px;'>"+
                                      	"<tr>"+
                                          	"<td colspan='5'><i class='fas fa-clock'></i>  營業時間：</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 一 ：  </td>"+
                                          	"<td>"  +n.monOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.monClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 二 ：  </td>"+
                                          	"<td>"  +n.tueOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.tueClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 三 ：  </td>"+
                                          	"<td>"  +n.wedOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.wedClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 四 ：  </td>"+
                                          	"<td>"  +n.thuOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.thuClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 五 ：  </td>"+
                                          	"<td>"  +n.firOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.firClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 六 ：  </td>"+
                                          	"<td>"  +n.satOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.satClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 日 ：  </td>"+
                                          	"<td>"  +n.sunOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.sunClose+  "</td>"+
                                          "</tr>"+
                                          
                                      "</table>"+
                                      "<hr>"+
                                      "<button class='btn hvr-hover' id='map"+n.sId+"' style='color:#FFF8DC;'><i class='fas fa-map-marker-alt'></i>  立即前往</button>"+ 
                                      "  <button class='btn hvr-hover' style='color:#FFF8DC;'><i class='fas fa-phone-square'></i>"+  n.sPhone+"</button>"+ 
                                  "</div>"+ 
                              "</div>"+                                
                          "</div>";		     					 	 
			     			store.append(s);
			     			
                          $('#map'+n.sId).click(function () {		
									Swal.fire({
									  title: '立即前往',
									  icon: 'info',
									  html:
									    '<iframe width="400" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"'+ 
									    'src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+n.sEw+','+n.sNs+'&z=16&output=embed&t=></iframe>',
									  showCloseButton: true,
									});
								})
			     			 })	
			     		  }					    
				},
				error: function(data) { 
					$('#storesboxes').empty("");
					$('#storesboxes').prepend("<div><h1>查無相關門市資料：請重新輸入或瀏覽全部。</h1><div>");
					console.log("search結果:null");
				}				
			});
	});
	
	//雲嘉南門市		
	$('#tainanstore').click(function () {
		var zip = 6;
		var zip1= 8;
		console.log(zip,zip1);
		
		$.ajax({
			   type:'post',
			   url:'/activitystorezipsearch/' + zip + '/' + zip1,
			   dataType:'JSON', 
			   success: function(data) { //成功呼叫function帶入data
						   var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
			     
			     		   $('#storesboxes').empty(""); //清空AllStores
			     		   
			     		  if(json=null){
			     			 $('#storesboxes').prepend("<div>查無相關門市資料<div>");
			     		  }else{
			     			 var store = $('#storesboxes');
			     			 $.each(parsedObjinArray,function(i,n){
			     				 var s = 
			     					"<div class='row'>"+
                              	"<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='products-single fix'>"+
                                      "<div class='box-img-hover'>"+
                                          "<div class='type-lb'>"+
                                              "<p class='new' style='font-size:20px;'><i class='fas fa-wifi'></i> <i class='fab fa-apple-pay'></i> <i class='fas fa-smoking-ban'></i></p>"+
                                          "</div>"+
                                          "<img src='"+n.sPhoto+"'"+ "class='img-fluid' alt='Image'>"+
                                          "<div class='mask-icon'>"+
                                              "<ul>"+
                                                  "<li><a href='"+n.sPhoto+"'"+ "data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
                                              "</ul>"+

                                          "</div>"+
                                      "</div>"+
                                  "</div>"+
                              "</div>"+
                              
                              "<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='why-text full-width'>"+
                                      "<h1 style='color:#A0522D;'>"+n.sName+"</h1>"+                                                   
                                      
                                      "<table style='color:#A0522D;font-size:16px;'>"+
                                      	"<tr>"+
                                          	"<td colspan='5'><i class='fas fa-clock'></i>  營業時間：</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 一 ：  </td>"+
                                          	"<td>"  +n.monOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.monClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 二 ：  </td>"+
                                          	"<td>"  +n.tueOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.tueClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 三 ：  </td>"+
                                          	"<td>"  +n.wedOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.wedClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 四 ：  </td>"+
                                          	"<td>"  +n.thuOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.thuClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 五 ：  </td>"+
                                          	"<td>"  +n.firOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.firClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 六 ：  </td>"+
                                          	"<td>"  +n.satOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.satClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 日 ：  </td>"+
                                          	"<td>"  +n.sunOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.sunClose+  "</td>"+
                                          "</tr>"+
                                          
                                      "</table>"+
                                      "<hr>"+
                                      "<button class='btn hvr-hover' id='map"+n.sId+"' style='color:#FFF8DC;'><i class='fas fa-map-marker-alt'></i>  立即前往</button>"+ 
                                      "  <button class='btn hvr-hover' style='color:#FFF8DC;'><i class='fas fa-phone-square'></i>"+  n.sPhone+"</button>"+ 
                                  "</div>"+ 
                              "</div>"+                                
                          "</div>";		     					 	 
			     			store.append(s);
			     			
                          $('#map'+n.sId).click(function () {		
									Swal.fire({
									  title: '立即前往',
									  icon: 'info',
									  html:
									    '<iframe width="400" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"'+ 
									    'src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+n.sEw+','+n.sNs+'&z=16&output=embed&t=></iframe>',
									  showCloseButton: true,
									});
								})
			     			 })	
			     		  }					    
				},
				error: function(data) { 
					$('#storesboxes').empty("");
					$('#storesboxes').prepend("<div><h1>查無相關門市資料：請重新輸入或瀏覽全部。</h1><div>");
					console.log("search結果:null");
				}				
			});
	});
	
	//高屏花門市		
	$('#southstore').click(function () {
		var zip = 8;
		var zip1= 999;
		console.log(zip,zip1);
		
		$.ajax({
			   type:'post',
			   url:'/activitystorezipsearch/' + zip + '/' + zip1,
			   dataType:'JSON', 
			   success: function(data) { //成功呼叫function帶入data
						   var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
			     
			     		   $('#storesboxes').empty(""); //清空AllStores
			     		   
			     		  if(json=null){
			     			 $('#storesboxes').prepend("<div>查無相關門市資料<div>");
			     		  }else{
			     			 var store = $('#storesboxes');
			     			 $.each(parsedObjinArray,function(i,n){
			     				 var s = 
			     					"<div class='row'>"+
                              	"<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='products-single fix'>"+
                                      "<div class='box-img-hover'>"+
                                          "<div class='type-lb'>"+
                                              "<p class='new' style='font-size:20px;'><i class='fas fa-wifi'></i> <i class='fab fa-apple-pay'></i> <i class='fas fa-smoking-ban'></i></p>"+
                                          "</div>"+
                                          "<img src='"+n.sPhoto+"'"+ "class='img-fluid' alt='Image'>"+
                                          "<div class='mask-icon'>"+
                                              "<ul>"+
                                                  "<li><a href='"+n.sPhoto+"'"+ "data-toggle='tooltip' data-placement='right' title='View'><i class='fas fa-eye'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Compare'><i class='fas fa-sync-alt'></i></a></li>"+
                                                  "<li><a href='#' data-toggle='tooltip' data-placement='right' title='Add to Wishlist'><i class='far fa-heart'></i></a></li>"+
                                              "</ul>"+

                                          "</div>"+
                                      "</div>"+
                                  "</div>"+
                              "</div>"+
                              
                              "<div class='col-sm-6 col-md-6 col-lg-6 col-xl-6'>"+
                                  "<div class='why-text full-width'>"+
                                      "<h1 style='color:#A0522D;'>"+n.sName+"</h1>"+                                                   
                                      
                                      "<table style='color:#A0522D;font-size:16px;'>"+
                                      	"<tr>"+
                                          	"<td colspan='5'><i class='fas fa-clock'></i>  營業時間：</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 一 ：  </td>"+
                                          	"<td>"  +n.monOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.monClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 二 ：  </td>"+
                                          	"<td>"  +n.tueOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.tueClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 三 ：  </td>"+
                                          	"<td>"  +n.wedOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.wedClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 四 ：  </td>"+
                                          	"<td>"  +n.thuOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.thuClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 五 ：  </td>"+
                                          	"<td>"  +n.firOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.firClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 六 ：  </td>"+
                                          	"<td>"  +n.satOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.satClose+  "</td>"+
                                          "</tr>"+
                                          "<tr style='text-align:center;'>"+
                                          	"<td><i class='fas fa-coffee'></i>  星 期 日 ：  </td>"+
                                          	"<td>"  +n.sunOpen+  "</td>"+
                                          	"<td>  -  </td>"+
                                          	"<td>"  +n.sunClose+  "</td>"+
                                          "</tr>"+
                                          
                                      "</table>"+
                                      "<hr>"+
                                      "<button class='btn hvr-hover' id='map"+n.sId+"' style='color:#FFF8DC;'><i class='fas fa-map-marker-alt'></i>  立即前往</button>"+ 
                                      "  <button class='btn hvr-hover' style='color:#FFF8DC;'><i class='fas fa-phone-square'></i>"+  n.sPhone+"</button>"+ 
                                  "</div>"+ 
                              "</div>"+                                
                          "</div>";		     					 	 
			     			store.append(s);
			     			
                          $('#map'+n.sId).click(function () {		
									Swal.fire({
									  title: '立即前往',
									  icon: 'info',
									  html:
									    '<iframe width="400" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"'+ 
									    'src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+n.sEw+','+n.sNs+'&z=16&output=embed&t=></iframe>',
									  showCloseButton: true,
									});
								})
			     			 })	
			     		  }					    
				},
				error: function(data) { 
					$('#storesboxes').empty("");
					$('#storesboxes').prepend("<div><h1>查無相關門市資料：請重新輸入或瀏覽全部。</h1><div>");
					console.log("search結果:null");
				}				
			});
	});
	
    
	//查詢後返回瀏覽全部
    $('#viewallstore').click(function () {
    	location.reload();    	
	});
    
    </script>
</body>

</html>