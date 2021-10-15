 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var venderpdcount = ${count};
// 		console.log(venderpdcount);		
		//呈現所有廠商的名子		
		$.ajax({
			type : 'post',
			url : '/user/search_for_company',
			success : function(data) {
				console.log(data);
// 					$('.venderSearchAll').html('');
						$('.venderSearchAll').append('<a class="list-group-item list-group-item-action" href="#sub-men2" data-toggle="collapse" aria-expanded="false" aria-controls="sub-men2">廠商<small class="text-muted">('+data.length+')</small>');						
					for(var i=0;i<data.length;i++){
// 						$('.venderAllName').append('<a href="'+data[i].id+'.searchCompanyPd" class="list-group-item list-group-item-action ">'+data[i].name +'<small class="text-muted">('+${count}[i]+')</small></a>');											
						$('.venderAllName').append('<a href="#" class="list-group-item list-group-item-action selectcompanypd">'+data[i].name +'<small class="text-muted">('+${count}[i]+')</small><input type="hidden" value='+data[i].id+' class="companyid"></a>');											
					}

			},
			error : function() {
				//alert('error');  
				console.log("error");
			}
		});
		
		//點選廠商名稱跳至廠商對應的商品
		$(document).on('click', '.selectcompanypd', function(e){
			//var insertData = $("form").serialize();
			var cid= $(this).find('.companyid').val();
			console.log(cid);
			$.ajax({
				type : 'post',
				url : '/user/searchCompanyPd',
				data :{cid:cid},
				success : function(data) {
					console.log(data.length);
					console.log(data);
					
					if(data !=''){
					$('.addsearchPd').html('');
						for(var i=0;i<data.length;i++){
						$('.addsearchPd').append('<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4"><div class="products-single fix"><div class="box-img-hover"><img src="' + data[i].shopPdPicture + '"class="img-fluid my-cart-picture" alt="Image">'+
							'<div class="mask-icon">'+'<ul><li><a href="'+data[i].shopPdNumber+'/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>'+
							'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>'+
							'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li></ul>'+
							'<a class="cart card-add" href="#">Add to Cart</a></div></div>'+'<div class="why-text">'+'<h4 id="'+ data[i].shopPdNumber +'" class="my-cart-name product my-cart-id">'+data[i].shopPdName +'</h4>'+
							'<span><strong>$</strong></span><span class="price my-cart-price">'+ data[i].shopPdPrice +'</span></div></div></div>'
						);						
						}	
					}else{
						Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: '此廠商未上架商品!'
							})
					}
					
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		});
				
		$(".searchname").keyup(function() {
			//var insertData = $("form").serialize();
			
			var data = $('.searchname').val();
			console.log(data);
			var jsondata = JSON.stringify(data);
			console.log(jsondata);
			$.ajax({
				type : 'post',
				url : '/user/search_for_user_keyin',
				data :{data:data},
				success : function(data) {
					console.log(data.length);
					console.log(data);
					
					if(data !=''){
					$('.addsearchPd').html('');
						for(var i=0;i<data.length;i++){
						$('.addsearchPd').append('<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4"><div class="products-single fix"><div class="box-img-hover"><img src="' + data[i].shopPdPicture + '"class="img-fluid my-cart-picture" alt="Image">'+
							'<div class="mask-icon">'+'<ul><li><a href="'+data[i].shopPdNumber+'/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>'+
							'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>'+
							'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li></ul>'+
							'<a class="cart card-add" href="#">Add to Cart</a></div></div>'+'<div class="why-text">'+'<h4 id="'+ data[i].shopPdNumber +'" class="my-cart-name product my-cart-id">'+data[i].shopPdName +'</h4>'+
							'<span><strong>$</strong></span><span class="price my-cart-price">'+ data[i].shopPdPrice +'</span></div></div></div>'
						);						
						}	
					}else{
// 						Swal.fire({
// 							  icon: 'error',
// 							  title: 'Oops...',
// 							  text: '查無資料!'
// 							})
					}
					
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		});
		//價格排序 高--->低
		$(".selectPreferenceType").change(function() {
			var selectType = $(this).val();
			console.log(selectType);
			$.ajax({
				type : 'post',
				url : '/user/search_for_user_orderByPrice_upTodown',
				success : function(data) {
					console.log(data);
					if(selectType == '2'){
						$('.addsearchPd').html('');
						for(var i=0;i<data.length;i++){
							$('.addsearchPd').append('<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4"><div class="products-single fix"><div class="box-img-hover"><img src="' + data[i].shopPdPicture + '"class="img-fluid my-cart-picture" alt="Image">'+
								'<div class="mask-icon">'+'<ul><li><a href="'+data[i].shopPdNumber+'/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li></ul>'+
								'<a class="cart card-add" href="#">Add to Cart</a></div></div>'+'<div class="why-text">'+'<h4 id="'+ data[i].shopPdNumber +'" class="my-cart-name product my-cart-id">'+data[i].shopPdName +'</h4>'+
								'<span><strong>$</strong></span><span class="price my-cart-price">'+ data[i].shopPdPrice +'</span></div></div></div>'
							);						
						}
					}
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		});
		
		//價格排序 低--->高
		$(".selectPreferenceType").change(function() {
			var selectType = $(this).val();
			console.log(selectType);
			$.ajax({
				type : 'post',
				url : '/user/search_for_user_orderByPrice_downToup',
				success : function(data) {
					console.log(data);
					if(selectType == '3'){
						$('.addsearchPd').html('');
						for(var i=0;i<data.length;i++){
							$('.addsearchPd').append('<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4"><div class="products-single fix"><div class="box-img-hover"><img src="' + data[i].shopPdPicture + '"class="img-fluid my-cart-picture" alt="Image">'+
								'<div class="mask-icon">'+'<ul><li><a href="'+data[i].shopPdNumber+'/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li></ul>'+
								'<a class="cart card-add" href="#">Add to Cart</a></div></div>'+'<div class="why-text">'+'<h4 id="'+ data[i].shopPdNumber +'" class="my-cart-name product my-cart-id">'+data[i].shopPdName +'</h4>'+
								'<span><strong>$</strong></span><span class="price my-cart-price">'+ data[i].shopPdPrice +'</span></div></div></div>'
							);						
						}
					}
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		});
		
		//選擇商品種類 -->蛋糕
		$(".selectCake").click(function() {
			$.ajax({
				type : 'post',
				url : '/user/search_for_user_shoptype_cake',
				success : function(data) {
					console.log(data);
						$('.addsearchPd').html('');
						for(var i=0;i<data.length;i++){
							$('.addsearchPd').append('<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4"><div class="products-single fix"><div class="box-img-hover"><img src="' + data[i].shopPdPicture + '"class="img-fluid my-cart-picture" alt="Image">'+
								'<div class="mask-icon">'+'<ul><li><a href="'+data[i].shopPdNumber+'/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li></ul>'+
								'<a class="cart card-add" href="#">Add to Cart</a></div></div>'+'<div class="why-text">'+'<h4 id="'+ data[i].shopPdNumber +'" class="my-cart-name product my-cart-id">'+data[i].shopPdName +'</h4>'+
								'<span><strong>$</strong></span><span class="price my-cart-price">'+ data[i].shopPdPrice +'</span></div></div></div>'
							);						
						}

				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		});
		
		//選擇商品種類 -->咖啡
		$(".selectCoffee").click(function() {
			$.ajax({
				type : 'post',
				url : '/user/search_for_user_shoptype_coffee',
				success : function(data) {
					console.log(data);
						$('.addsearchPd').html('');
						for(var i=0;i<data.length;i++){
							$('.addsearchPd').append('<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4"><div class="products-single fix"><div class="box-img-hover"><img src="' + data[i].shopPdPicture + '"class="img-fluid my-cart-picture" alt="Image">'+
								'<div class="mask-icon">'+'<ul><li><a href="'+data[i].shopPdNumber+'/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li></ul>'+
								'<a class="cart card-add" href="#">Add to Cart</a></div></div>'+'<div class="why-text">'+'<h4 id="'+ data[i].shopPdNumber +'" class="my-cart-name product my-cart-id">'+data[i].shopPdName +'</h4>'+
								'<span><strong>$</strong></span><span class="price my-cart-price">'+ data[i].shopPdPrice +'</span></div></div></div>'
							);						
						}

				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		});
		
		//選擇商品種類 -->咖啡豆
		$(".selectCoffeeBean").click(function() {
			$.ajax({
				type : 'post',
				url : '/user/search_for_user_shoptype_coffeebean',
				success : function(data) {
// 					console.log(data);
						$('.addsearchPd').html('');
						for(var i=0;i<data.length;i++){
							$('.addsearchPd').append('<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4"><div class="products-single fix"><div class="box-img-hover"><img src="' + data[i].shopPdPicture + '"class="img-fluid my-cart-picture" alt="Image">'+
								'<div class="mask-icon">'+'<ul><li><a href="'+data[i].shopPdNumber+'/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>'+
								'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li></ul>'+
								'<a class="cart card-add" href="#">Add to Cart</a></div></div>'+'<div class="why-text">'+'<h4 id="'+ data[i].shopPdNumber +'" class="my-cart-name product my-cart-id">'+data[i].shopPdName +'</h4>'+
								'<span><strong>$</strong></span><span class="price my-cart-price">'+ data[i].shopPdPrice +'</span></div></div></div>'
							);						
						}

				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});
		});
		
		//選擇查看商品詳細資訊
// 		$(".pdview").click(function() {
// 			var id = $(this).parent().parent().parent().parent().parent().parent().find('.my-cart-id').attr('id');
// 			console.log(id)
// 			$.ajax({
// 				type : 'get',
// 				url : '/user/find${mid}/viewPdDetail',
// 				data:{pdid:id},
// 				success : function(data) {
// 					console.log("success");
					
// 				},
// 				error : function() {
// 					console.log("error");
// 				}
// 			});
// 		});
				
	});
</script>    
    

</head>

<body>
	<!-- 會員登入後header -->
		<%@include file="/WEB-INF/pages/shop/header/memberheadersecond.jsp"%>
	<!-- 會員登入後header -->

	
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Shop</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Shop</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Page  -->
    <div class="shop-box-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form action="#">
                                <input class="form-control searchname" placeholder="Search here..." type="text">
                                <button type="submit" id="searchforuser"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>類別</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <div class="list-group-collapse sub-men">
                                    <a class="list-group-item list-group-item-action" href="#sub-men1" data-toggle="collapse" aria-expanded="true" aria-controls="sub-men1">商品種類 <small class="text-muted">(3)</small>
								</a>
                                    <div class="collapse show" id="sub-men1" data-parent="#list-group-men">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action  selectCake">蛋糕 <small class="text-muted">(${cakes})</small></a>
                                            <a href="#" class="list-group-item list-group-item-action selectCoffee">咖啡 <small class="text-muted">(${coffees})</small></a>
                                            <a href="#" class="list-group-item list-group-item-action selectCoffeeBean">咖啡豆 <small class="text-muted">(${coffeeBeans})</small></a> 
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-collapse sub-men venderSearchAll">
                                    <div class="collapse" id="sub-men2" data-parent="#list-group-men">
                                        <div class="list-group venderAllName">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left">
                                <div class="toolbar-sorter-right">
                                    <span>Sort by </span>
                                    <select id="basic preference" class="selectpicker show-tick form-control selectPreferenceType" data-placeholder="$ USD">
									<option data-display="Select">Nothing</option>
									<option value="1">Popularity</option>
									<option value="2">High Price → Low Price</option>
									<option value="3">Low Price → High Price</option>
								</select>
                                </div>
                                <p>Showing all 4 results</p>
                            </div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                    </li>
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="row product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row addsearchPd">
                                    	<c:forEach items="${shopSearchResult}" var="shopSearchResult"> 
                                        	<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                            	<div class="products-single fix">
                                                	<div class="box-img-hover">
                                                    	<img src="${shopSearchResult.shopPdPicture}" class="img-fluid my-cart-picture" alt="Image">
                                                    	<div class="mask-icon">
                                                        	<ul>
                                                            	<li><a href="${shopSearchResult.shopPdNumber}/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>
                                                            	<li><a href="viewPdDetail" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                                            	<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                        	</ul>
                                                        	<a class="cart card-add" href="#">Add to Cart</a>
                                                    	</div>
                                                	</div>
                                                	<div class="why-text">
														<h4 id="${shopSearchResult.shopPdNumber}" class="my-cart-name product my-cart-id">${shopSearchResult.shopPdName}</h4>
                                    					<span><strong>$</strong></span><span class="price my-cart-price">${shopSearchResult.shopPdPrice}</span>
                                                	</div>
                                            	</div>
                                        	</div>
                                   		</c:forEach>
                                   </div>     
                               </div>
                           </div>
                        </div>
                     </div>
                 </div>
              </div>
            </div>
        </div>
    </div>
    <!-- End Shop Page -->


    <!-- Start Footer  -->
	<%@include file="/WEB-INF/pages/headerfooter/footer.jsp"%>
    <!-- End Footer  -->


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
<!--     <script src="/js/shopcarInsertTest.js"></script> -->
<!--     <script src="/js/shopcar.js"></script> -->
    <script src="/js/shopcarInsertTest.js"></script>
</body>

</html>