<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 黑色Header開始 -->
    <!-- <div class="main-top">
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
						<option>廠商</option>
                        <option>管理員</option>
					</select>
                    </div>
                    <div class="right-phone-box">
                        <p><a href="#">會員編號 : ${memberID}  <input type="hidden" name="memberID" value="${memberID}"></a></p>
                    </div>
                    <div class="our-link">
                        <ul>
                        	<li><a href="member_center_${memberID}">會員中心</a></li>
                            <li><a href="logout">會員登出  <i class="fas fa-sign-out-alt"></i></a></li>
                            <li></li>
                        </ul>
                    </div>
                </div> 
                <div class="nav navbar-nav ml-auto" style="margin-right: 10px;background-color: white;width: 60px; border-radius: 5px;height: 60px;">
                    <li class="dropdown" style="margin: auto;">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px">
                            <i class="far fa-user-circle fa-2x" ></i></a>
                        <ul class="dropdown-menu" style="font-size:20px;text-align: center;">
                            <li style="width: 250px;height: 80px;"><i class="far fa-user-circle fa-2x"></i><br>會員編號: ${memberID}</li>
                            <hr>
                            <a href="member_center_${memberID}"><i class="far fa-address-book"></i> 會員中心</li></a>                              
                            <hr> 
                            <a href="logout"><li><i class="fas fa-sign-out-alt"></i> 登出</li></a>                                  
                        </ul>
                    </li>
                </div>
            </div>
        </div>
    </div> -->
<!-- 黑色Header結束 -->

<!-- 主要Header開始 請各自加入路徑(目前預設#)!!! --> 
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="#"><img src="/images/logo.png" class="logo" alt=""></a>
                </div>
        <!-- End Header Navigation -->

        <!-- 商城、活動、好康、服務 start -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="/homepage" style="font-size:20px"><i class="fas fa-home"></i>  首頁</a></li>
                        <li class="dropdown megamenu-fw">

                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-shopping-cart"></i>  商城</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a class="shoppd" href="find${memberID}/usershopSearchAll">商品總覽</a></li>
                                <li><a class="shoppd" href="find${memberID}/userOrderSearch">訂單紀錄</a></li>
                                
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-calendar-alt"></i>  活動</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a href="/user/${memberID}/store">門市據點</a></li>
                                <li><a href="/user/${memberID}/activity">活動報名</a></li>
                                <li><a href="/user/${memberID}/activitysatisfaction">活動紀錄</a></li>
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-info-circle"></i>  客服</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a href="/user/${memberID}/indexArticle">文章分享</a></li>
                                <li><a href="/user/${memberID}/findQA.index">Q&A</a></li>
                                <li><a href="/user/${memberID}/AddReportEntry">問題回報</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="far fa-user-circle"></i> 會員</a>
                            <ul class="dropdown-menu" style="font-size:20px;text-align: center;border-radius: 10px;">
                                <li style="margin:30px auto;"><i class="far fa-user-circle fa-2x"></i><br>會員編號: ${memberID}</li>
                                <hr>
                                <a href="member_center_${memberID}"><i class="far fa-address-book"></i> 會員中心</li></a>                              
                                <hr> 
                                <a href="/user/logout"><li style="margin: 20px;"><i class="fas fa-sign-out-alt"></i> 登出</li></a>
                            </ul>
                        </li>
                    </ul>
                </div>
            <!-- 商城、活動、好康、服務 end-->

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
                        <a href="https://lin.ee/IK1dV0e"><li><img src="https://scdn.line-apps.com/n/line_add_friends/btn/zh-Hant.png" alt="加入好友" height="36" border="0"></a></li>
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
						<li class="total" style="background-color: white">
                            <span class="lighter-text" >合計:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                            <span class="main-color-text my-cart-total" id="pdToTalPrice"></span>
                        </li>
                	</li>
       			</form> 
                <br/> <center><button class="btn btn-default hvr-hover btn-cart my-cart-checkout">結帳</button></center>
       		</div>	    
            <!-- End Side Menu -->
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- 主要Header結束 -->
    
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

</body>
</html>