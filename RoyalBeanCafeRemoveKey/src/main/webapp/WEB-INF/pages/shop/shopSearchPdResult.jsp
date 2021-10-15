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
    <style type="text/css">
    .hide{
	display: block;
	width: 50px;
	height: 20px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
    
    }
    </style>

</head>

<body>
	
	<%@include file="/WEB-INF/pages/shop/header/venderheadersecond.jsp"%>

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>ProductInformation</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">ProductInformation</li>
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
                        <div class="title-left">
                            <h3>Product Information</h3>
                        </div>
                        <table>
                        	<thead>
                        		<th style="width: 6%">編號</th>
                        		<th style="width: 7%">產品名稱</th>
                        		<th style="width: 6%">照片</th>
                        		<th style="width: 6%">價格</th>
                        		<th style="width: 6%">重量</th>                      	
                        		<th style="width: 6%">類型</th>                      	
                        		<th style="width: 6%">簡述</th>                      	
                        		<th style="width: 6%">烘培程度</th>                      	
                        		<th style="width: 6%">成分</th>                      	
                        		<th style="width: 6%">產地</th>                      	
                        		<th style="width: 6%">保存方式</th>                      	
                        		<th style="width: 6%">保存期限</th>                      	
                        		<th style="width: 6%">出貨地</th>                      	
                        		<th style="width: 6%">注意事項</th>                      	
                        	</thead>
                        	<tbody>
								<c:forEach items="${shopSearchResult}" var="shopSearchResult">
								<tr>
									<td>${shopSearchResult.shopPdNumber}</td>
								                        								
									<td>${shopSearchResult.shopPdName}</td>
									
									<td><img src="${shopSearchResult.shopPdPicture}" style="width: 50px" height="50px"></td>
								                       					
									<td>${shopSearchResult.shopPdPrice}</td>
								                       					
									<td>${shopSearchResult.shopPdWeight}</td>
									
									<td>${shopSearchResult.shopPdType}</td>
								                  
									<td><div class="hide">${shopSearchResult.shopPdDepiction}</div></td>
									
									<td>${shopSearchResult.shopPdBaking}</td>
									
									<td>${shopSearchResult.shopPdIngredient}</td>
									
									<td>${shopSearchResult.shopPdOrigin}</td>
									
									<td>${shopSearchResult.shopPdSaveMethod}</td>
									
									<td>${shopSearchResult.shopPdExpTime}</td>
									
									<td>${shopSearchResult.shopPdShipment}</td>
									
									<td>${shopSearchResult.shopPdNotice}</td>
									
									<td class="project-actions text-right">
<!--                           				<a class="btn btn-primary btn-sm" href="#">	 -->
<!-- 										<i class="far fa-eye"></i> -->
<!--                               					View -->
<!--                           				</a> -->
                          				<a class="btn btn-info btn-sm" href="${shopSearchResult.shopPdNumber}.up">
										<i class="fas fa-edit"></i>
                              					Edit
                          				</a>
                          				<a class="btn btn-danger btn-sm" href="${shopSearchResult.shopPdNumber}.del">
                              			<i class="fas fa-trash">
                              			</i>
                              				Delete
                          				</a>
                      				</td>
									
								</tr>                        	
                        	
								</c:forEach>
                        	</tbody>
                        </table>                           
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->


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
</body>

</html>