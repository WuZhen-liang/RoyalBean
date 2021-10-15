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
    <title>RoyalBeanCafe</title>
    <script src="https://kit.fontawesome.com/ccba314d23.js" crossorigin="anonymous"></script>
    
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                            <li><a href="MemberCenter">會員註冊</a></li>
                            <li><a href="Login">會員登入</a></li>
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
                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="homepage">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.html">About Us</a></li>
                        <li class="dropdown megamenu-fw">

                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Product</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.html">新增商品</a></li>
                                <li><a href="wishlist.html">查看上架商品</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Activity</a>
                            <ul class="dropdown-menu">
                                <li><a href="activity.controller">活動管理</a></li>
                                <li><a href="activityStore.controller">門市管理</a></li>
                                <li><a href="my-account.html">活動回饋</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">coupon</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.html">新增優惠券</a></li>
                                <li><a href="cart.html">查看優惠券</a></li>
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
                        <li class="side-menu"><a href="#">
						<i class="fa fa-shopping-bag"></i>
                            <span class="badge">3</span>
					</a></li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
            <!-- Start Side Menu -->
            <div class="side">
                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                <li class="cart-box">
                    <ul class="cart-list">
                        <li>
                            <a href="#" class="photo"><img src="images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Delica omtantur </a></h6>
                            <p>1x - <span class="price">$80.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Omnes ocurreret</a></h6>
                            <p>1x - <span class="price">$60.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Agam facilisis</a></h6>
                            <p>1x - <span class="price">$40.00</span></p>
                        </li>
                        <li class="total">
                            <a href="#" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                            <span class="float-right"><strong>Total</strong>: $180.00</span>
                        </li>
                    </ul>
                </li>
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
  

    <!-- Start MT  -->
	<div class="latest-blog">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title-all text-center">
						<h1>實體門市資訊管理</h1>
						<p>-請新增並定期更新您所有實體門市資訊，RoyalBeanCafe將協助您增加曝光-</p>
					</div>
				</div>
			</div>

			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="activityStore.controller">門市總表</a></li>
				<li class="nav-item"><a class="nav-link  active"
					aria-current="page" href="activityStoreAdd.controller">新增門市</a></li>
			</ul>


			<div>
				<form:form class="needs-validation" action="addStores" modelAttribute="activity/activityStoreAdd">
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
					<div class="row">
						<div class="col-md-4 mb-3">
							<form:label path="sZip">郵遞區號 *</form:label>
							<form:input class="form-control" path="sZip" />
							<div class="invalid-feedback">Zip code required.</div>
						</div>
						<div class="col-md-4 mb-3">
							<form:label path="sCity">縣市 *</form:label>
							<form:select class="form-control" path="sCity">
								<form:option value="NONE" label="Choose..." />
								<form:option value="台北市" />
								<!--<form:options items="${countryList}" />-->
							</form:select>
							<div class="invalid-feedback">Please select a valid country.</div>
						</div>
						<div class="col-md-4 mb-3">
							<form:label path="sDistrict">鄉鎮市區 *</form:label>
							<form:select class="form-control" path="sDistrict">
								<form:option value="NONE" label="Choose..." />
								<form:option value="中山區" />
								<!--<form:options items="${countryList}" />-->
							</form:select>
							<div class="invalid-feedback">Please provide a valid state.</div>
						</div>
					</div>
					<div class="mb-3">
						<form:label path="sAdd">詳細地址 *</form:label>
						<form:input class="form-control" path="sAdd" />
						<div class="invalid-feedback">Please enter your shipping address.</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<form:label path="sNs">緯度 *</form:label>
							<form:input class="form-control" path="sNs" />
							<div class="invalid-feedback">Valid first name is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<form:label path="sEw">經度 *</form:label>
							<form:input class="form-control" path="sEw" />
							<div class="invalid-feedback">Valid last name is required.</div>
						</div>
					</div>
					<div class="mb-3">
						<form:label path="sPhoto">門市照片 *</form:label>
						<form:input type="file" class="form-control" path="sPhoto" />
						<div class="invalid-feedback">Please enter your shipping address.</div>
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
						<form:button class="ml-auto btn hvr-hover" value="Send">
							<P style="color: #FFF8DC;">新增</P>
						</form:button>
					</div>

				</form:form>
			</div>
		</div>
	</div>
	<!-- End MT  -->


    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/jquery.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/java.png" alt="" style="height: 150PX;"/>
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/ajax.jpg " alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/htmlcssjs.png" alt=""  style="height: 150PX;"/>
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/springboot.png" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/bootstrap.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/hubernate.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/sqlserver.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/github.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
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
        <p class="footer-company">All Rights Reserved. &copy; 2021 <a href="#">RoyalBeanCafe</a> Design By :
            <a href="https://html.design/">html design</a></p>
    </div>
    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>