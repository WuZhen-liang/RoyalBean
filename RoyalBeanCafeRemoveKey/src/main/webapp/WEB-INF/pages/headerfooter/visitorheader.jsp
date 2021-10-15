<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .popover{
    position:fixed!important;
    left:50%!important;
    top:50%!important;
    transform:translate(-50%,-50%) translate3d(0,0,0)!important;
    margin: 0!important;
}
</style>
</head>
<body>
    <!-- 黑色Header開始 -->
    <!-- <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="text-slid-box">
                        <div id="offer-box" class="carouselTicker">
                           
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="nav navbar-nav ml-auto" style="background-color: white;width: 60px; border-radius: 5px;height: 60px;">
                        <li class="dropdown" style="margin: auto;">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px">
                                <i class="far fa-user-circle fa-2x" ></i></a>
                                
                            <ul class="dropdown-menu" style="font-size:20px;text-align: center;">
                                
                                <li style="width: 250px;height: 80px;"><i class="far fa-user-circle fa-2x"></i><br>歡迎加入</li>
                                <hr>
                                <a href="resgiter_all"><li><i class="fas fa-registered"></i> 註冊</li></a>
                                <hr>                                
                                <a href="user/login"><li><i class="fas fa-sign-in-alt"></i> 登入</li></a>                                
                                <hr> 
                                <a href="homepage"><li><i class="fas fa-home"></i> 首頁</li></a>                                  
                            </ul>
                        </li>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- 黑色Header結束 -->
    <!-- cfcfcf 999  e0e0e0 cccccc ced4da ffffff e8e8e8 ddd fff-->

    <!-- 主要Header開始 請各自加入路徑(目前預設#)!!! -->    
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- LOGO -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="#"><img src="/images/logo.png" class="logo" alt=""></a>
                </div>
        <!-- End Header Navigation -->

        <!-- 商城、活動、好康、服務 start-->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="homepage" style="font-size:20px"><i class="fas fa-home"></i>  首頁</a></li>
                        <li class="dropdown megamenu-fw">

                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-shopping-cart"></i>  商城</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a href="#">商品總覽</a></li>                                
                                <li><a href="#">訂單紀錄</a></li>                                
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-calendar-alt"></i>  活動</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a href="#">門市據點</a></li>
                                <li><a href="#">活動報名</a></li>
                                <li><a href="#">活動紀錄</a></li>
                            </ul>
                        </li>
                    
                        
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-info-circle"></i>  客服</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a href="/indexArticle">文章分享</a></li>
                                <li><a href="/findQA.index">Q&A</a></li>
                                <li><a href="#">問題回報</a></li>

                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="far fa-user-circle"></i> 會員</a>
                            <ul class="dropdown-menu" style="font-size:20px;text-align: center;border-radius: 10px;">
                                <li style="margin:30px auto;"><i class="far fa-user-circle fa-2x"></i><br>歡迎加入</li>
                                <hr>
                                <a href="resgiter_all"><li><i class="fas fa-registered"></i> 註冊</li></a>
                                <hr>                                
                                <a href="/user/login"><li style="margin: 20px;"><i class="fas fa-sign-in-alt"></i> 登入</li></a>                                
                            </ul>
                        </li>
                    </ul>
                </div>

        <!-- 商城、活動、好康、服務 end-->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        <li class="side-menu"><a href="#">
						<i class="fa fa-shopping-bag"></i>
                            <span class="badge"></span>
					</a></li>
                    <a href="https://lin.ee/IK1dV0e"><li><img src="https://scdn.line-apps.com/n/line_add_friends/btn/zh-Hant.png" alt="加入好友" height="36" border="0"></a></li>
                    </ul>
                </div>
                <div>
                    
                </div>
                <!-- End Atribute Navigation -->            
        </div> 
            <!-- Start Side Menu -->
            <div class="side">
                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                <li class="cart-box">
                    <ul class="cart-list">
                        <li>
                            <a href="#" class="photo"><img src="/images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Delica omtantur </a></h6>
                            <p>1x - <span class="price">$80.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="/images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Omnes ocurreret</a></h6>
                            <p>1x - <span class="price">$60.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="/images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
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
    <!-- 主要Header結束 -->
</body>
</html>