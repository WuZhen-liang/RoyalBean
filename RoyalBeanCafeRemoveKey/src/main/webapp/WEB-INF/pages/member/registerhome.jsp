<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</head>

<body>
	
	<!-- 主頁後header -->
	<%@include file="/WEB-INF/pages/headerfooter/visitorheader.jsp"%>
	<!-- 主頁後header -->

    <!-- 內容 Start -->    
    <div class="container">
    
    
    </div>
    <!-- 內容 End -->

    <div class="my-account-box-main">
        <div class="container">
            <div class="my-account-page">
                <div class="row">
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="member_resgiter"> <i class="fa fa-user-circle"></i> </a>
                                </div>
                                <div class="service-desc">
                                    <h4>會員註冊</h4>
                                    <p>我們歡迎新會員</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="company_resgiter"><i class="far fa-building"></i></a>
                                </div>
                                <div class="service-desc">
                                    <h4>廠商註冊</h4>
                                    <p>這裡是安全的交易平台</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="account-box">
                            <div class="service-box">
                                <div class="service-icon">
                                    <a href="staff_resgiter"><i class="fas fa-users-cog"></i></a>
                                </div>
                                <div class="service-desc">
                                    <h4>管理員註冊</h4>
                                    <p>後臺管理</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>


    <!-- Footer Start -->
    <footer>
        <div class="footer-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>前端技術</h4>
                            <ul>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">HTML / CSS / Bootstrap</li><br>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">JavaScript / jQuery</li><br>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">AJAX</li><br>                             
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>後端技術</h4>
                            <ul>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">Java</li><br>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">SpringBoot</li><br>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">Hibernate</li><br>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>資料庫 & 整合技術</h4>
                            <ul>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">SQL Server</li><br>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">GitHub</li><br>
                                <li style="color:#FFF8DC;font-size:16px;font-weight:bold;">Eclipse</li><br>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer End   -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2021 
        <a href="#">RoyalBeanCafe</a> Design By : <a href="https://html.design/">EEIT12902</a></p>
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
</body>

</html>