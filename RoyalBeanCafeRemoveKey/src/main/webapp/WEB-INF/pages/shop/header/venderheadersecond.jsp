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
                        <p><a href="#">廠商編號 : ${companyID}<input type="hidden" name="companyID" value="${companyID}"></a></p>
                    </div>
                    <div class="our-link">
                        <ul>
                           <li><a href="logout">廠商登出  <i class="fas fa-sign-out-alt"></i></a></li>
                        </ul>
                    </div>
                </div> 
                <div class="nav navbar-nav ml-auto" style="margin-right: 10px;background-color: white;width: 60px; border-radius: 5px;height: 60px;">
                    <li class="dropdown" style="margin: auto;">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px">
                            <i class="far fa-building fa-2x" ></i></a>
                        <ul class="dropdown-menu" style="font-size:20px;text-align: center;">
                            <li style="width: 250px;height: 80px;"><i class="far fa-building fa-2x"></i><br>廠商編號 : ${companyID}</li>                              
                            <hr> 
                            <a href="logout"><li><i class="fas fa-sign-out-alt"></i> 登出</li></a>                                  
                        </ul>
                    </li>
                </div>
            </div>
        </div>
    </div>-->
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
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-shopping-cart"></i>  商城管理</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a href="secondinsertpd">新增商品</a></li>
                                <li><a href="shopSearch">查看上架商品</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-calendar-alt"></i>  活動管理</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a href="/company/${companyID}/activityStore">門市管理</a></li>
                                <li><a href="/company/${companyID}/activity">活動管理</a></li>
                                <li><a href="/company/${companyID}/activityOrder">活動訂單</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="fas fa-info-circle"></i>  客服管理</a>
                            <ul class="dropdown-menu" style="font-size:20px">
                                <li><a href="/company/${companyID}/indexArticle">文章分享</a></li>
                                <li><a href="/findQA.index">Q&A</a></li>
                                <li><a href="/company/${companyID}/AddReportEntry">問題回報</a></li>
                            </ul>
                        </li>   
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" style="font-size:20px"><i class="far fa-building"></i> 廠商</a>
                            <ul class="dropdown-menu" style="font-size:20px;text-align: center;border-radius: 10px;">
                                <li style="margin:30px auto;"><i class="far fa-building fa-2x"></i><br>廠商編號 : ${companyID}</li>
                                <hr>
                                <a href="/company/logout"><li style="margin: 20px;"><i class="fas fa-sign-out-alt"></i> 登出</li></a>
                            </ul>
                        </li>                     
                    </ul>
                    <a href="https://lin.ee/IK1dV0e"><img src="https://scdn.line-apps.com/n/line_add_friends/btn/zh-Hant.png" alt="加入好友" height="36" border="0"></a>
                </div>
            <!-- 商城、活動、好康、服務 end-->               
            </div>            
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