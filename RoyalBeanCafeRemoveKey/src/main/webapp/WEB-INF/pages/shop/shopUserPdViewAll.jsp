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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>

<body>
	
    <!-- Start Main Top -->
    <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="text-slid-box">
                        <div id="offer-box" class="carouselTicker">
                            <ul class="offer-box">
                                <li>
                                    <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT20
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT20
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="custom-select-box">
                        <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
						<option>一般會員</option>
						<option selected="selected">廠商</option>
                        <option>管理員</option>
					</select>
                    </div>
                    <div class="right-phone-box">
                        <p>Hello :- <a href="#">會員編號</a></p>
                    </div>
                    <div class="our-link">
                        <ul>
                            <li><a href="#">會員註冊</a></li>
                            <li><a href="#">會員登入</a></li>
                            <li><a href="#">聯絡我們</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Top -->

    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="index.html"><img src="/images/logo.png" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.html">About Us</a></li>
                        <li class="dropdown megamenu-fw">

                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Product</a>
                            <ul class="dropdown-menu">
                                <li><a href="shopPdEntry">新增商品</a></li>
                                <li><a href="shopSearch">查看上架商品</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Activity</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.html">活動資訊</a></li>
                                <li><a href="checkout.html">門市據點</a></li>
                                <li><a href="my-account.html">活動回饋</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">coupon</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.html">coupon</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Service</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.html">文章分享</a></li>
                                <li><a href="checkout.html">Q&A</a></li>
                                <li><a href="my-account.html">問題回報</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="contact-us.html">Contact Us</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        <li class="side-menu">
                        	<a href="#" class="my-cart-icon">
							<i class="fa fa-shopping-bag"></i>
                            	<span class="badge my-cart-counter">0</span>
							</a>
						</li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
            <!-- Start Side Menu -->
            <div class="side my-cart-popup">
       			<form method="post">
                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                <li class="cart-box">
                    <ul class="cart-list">
                    </ul>
                </li>
                <div class="shopping-cart-header">
          			<div class="shopping-cart-total">
<!--             		<span class="lighter-text">Total:</span> -->
<!--             		<span class="main-color-text my-cart-total"></span> -->
            		    <li class="total">
                            <span class="lighter-text" style="color: brown">Total:</span>
                            <span class="main-color-text my-cart-total" style="color: red;" id="pdToTalPrice"></span>
<!--                             <span class="float-right my-cart-total"><strong>Total:</strong>0</span> -->
                        </li>
          			</div>
        		</div>
       		</form>     
                 <button><button class="btn btn-default hvr-hover btn-cart my-cart-checkout">check out</button></button>
           </div> 
            <!-- End Side Menu -->
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

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
    <div class="categories-shop">
        <div class="categories-shop">
        	<div class="container">
            	<div class="row">
              		<c:forEach items="${shopSearchResult}" var="shopSearchResult"> 
<%--               			<input type="hidden" name="cid" value="${cid}"/>  --%>
                		<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <img src="${shopSearchResult.shopPdPicture}" class="img-fluid my-cart-picture" alt="Image" >
                                    <div class="mask-icon">
                                        <ul>
                                            <li><a href="viewPdDetail" data-toggle="tooltip" data-placement="right" title="View" class="pdview"><i class="fas fa-eye"></i></a></li>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
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
    <!-- End Cart -->

    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/jquery.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/java.png" alt="" style="height: 150PX;"/>
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/ajax.jpg " alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/htmlcssjs.png" alt=""  style="height: 150PX;"/>
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/springboot.png" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/bootstrap.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/hubernate.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/sqlserver.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/github.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Instagram Feed  -->


    <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>前端技術</h4>
                            <ul>
                                <li style="color:#FFF8DC ;">HTML、CSS、JS</li><br>
                                <li style="color:#FFF8DC ;">AJAX</li><br>
                                <li style="color:#FFF8DC ;">JQuery</li><br>
                                <li style="color:#FFF8DC ;">bootstrap</h3></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>後端技術</h4>
                            <ul>
                                <li style="color:#FFF8DC ;">Java</li><br>
                                <li style="color:#FFF8DC ;">SpringBoot</li><br>
                                <li style="color:#FFF8DC ;">Hibernate</li><br>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>資料庫&整合技術</h4>
                            <ul>
                                <li style="color:#FFF8DC ;">SQL Server</li><br>
                                <li style="color:#FFF8DC ;">GitHub</li><br>
                                <li style="color:#FFF8DC ;">Git</li><br>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer  -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
            <a href="https://html.design/">html design</a></p>
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
<!--     <script src="/js/shopcarInsertTest.js"></script> -->
<!--     <script src="/js/shopcar.js"></script> -->
    <script src="/js/shopcarInsertTest.js"></script>
    <script type="text/javascript">
// 	$(document).ready(function() {
// 		$(".my-cart-checkout").click(function() {
// 			var data = {   自己手動抓
// 					pdToTalPrice: $(".my-cart-total").html()
// 			}
			
// 			$.ajax({
// 				type : 'post',
// 				url : '/shopcarinsert.controller',
// 				data : JSON.stringify(data),
// 				contentType : 'application/json',
// 				success : function() {
// 					console.log("success");
// 					location.href="/shoppaypage"
// 				},
// 				error : function() {
// 					//alert('error');  
// 					console.log("error");
// 				}
// 			});
// 		})
// 	});
</script>
</body>

</html>