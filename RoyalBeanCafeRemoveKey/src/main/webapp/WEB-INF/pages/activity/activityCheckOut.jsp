<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <script src="https://kit.fontawesome.com/ccba314d23.js" crossorigin="anonymous"></script>
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
<!--     <div id="slides-shop" class="cover-slides"> -->
<!--         <ul class="slides-container"> -->
<!--             <li class="text-left"> -->
<!--                 <img src="/images/activity01.jpg" alt=""> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-md-12"> -->
<!--                             <h1 class="m-b-20"><strong>Make Me Coffee, <br> Be Coffee.</strong></h1> -->
<!--                             <p class="m-b-40">"What do you want?"  <br> - Just coffee. Black like my soul.</p> -->
<!--                             <p><a class="btn hvr-hover" href="#">Shop New</a></p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </li> -->
<!--             <li class="text-center"> -->
<!--                 <img src="/images/activity02.jpg" alt=""> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-md-12"> -->
<!--                             <h1 class="m-b-20"><strong>Cake is for life, not just for birthdays! <br> </strong></h1> -->
<!--                             <p class="m-b-40">Put "eat cake" on top of your to-do list today <br> and you're sure to get at least one task done.</p> -->
<!--                             <p><a class="btn hvr-hover" href="#">Shop New</a></p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </li> -->
<!--             <li class="text-right"> -->
<!--                 <img src="/images/activity03.jpg" alt=""> -->
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-md-12"> -->
<!--                             <h1 class="m-b-20"><strong>Latte Art, <br> I put coffee in my coffee.</strong></h1> -->
<!--                             <p class="m-b-40">  Good communication is just as stimulating as black coffee, <br> and just as hard to sleep after.</p> -->
<!--                             <p><a class="btn hvr-hover" href="#">Shop New</a></p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </li> -->
<!--         </ul> -->
<!--         <div class="slides-navigation"> -->
<!--             <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a> -->
<!--             <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a> -->
<!--         </div> -->
<!--     </div> -->
    <!-- End Slider -->

    

    <!-- Start OrderCheckOut -->    
    <div class="cart-box-main">
        <div class="container" style="width:750px">            
            <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="order-box">
                            <div class="title-left">                            	
                                <h1 style="color:#8B4513;text-align:center;font-weight:bold;"><i class="far fa-credit-card" style="font-size:100px;"></i><br><br><br> 
                                <i class="far fa-check-circle" style="color:#00FF00;"></i>  請付款以完成預約<br><br></h1>
                            </div>
                            <div class="d-flex">
                                <div class="font-weight-bold">活動名稱 - 預約日期</div>
                                <div class="ml-auto font-weight-bold">總計</div>
                            </div>
                            <hr class="my-1">
                            <div class="d-flex">
                                <h4>${insertOrder.activity.aName} - ${insertOrder.aResDate}</h4>
                                <div class="ml-auto font-weight-bold"> $ ${insertOrder.aoPrice} </div>
                            </div>                               
                            <hr>
                            <div class="d-flex gr-total" >
                                <h5>總計</h5>
                                <div class="ml-auto h5"> $ ${insertOrder.aoPrice} </div>                                
                            </div>
                            <br>
                            <div>
                        		<hr>
		                        <ul><h3>[ 取消預約辦法 ]</h3>
		                        	<li><i class="fas fa-chevron-circle-right"></i>  出發日前 7 日前 (不含出發日) 通知取消，扣除手續費後，退回款項，手續費依付款方式而有所不同。</li>
		                        	<li><i class="fas fa-chevron-circle-right"></i>  出發日前 6 日至前 4 日內 (不含出發日) 通知取消，將退回已付金額的 50%。</li>
		                        	<li><i class="fas fa-chevron-circle-right"></i>  出發日前 3 日至當日內不接受取消，並不予退回款項。</li>
		                        	<li><i class="fas fa-chevron-circle-right"></i>  建議您出發日前 6 日內如須取消，可將名額轉讓但請務必告知RoyalBean，代理者的姓名及聯絡資訊。</li>
		                        </ul>
		                        <br>
		                        <ul><h3>[ 更改日期辦法 ]</h3>
		                        	<li><i class="fas fa-chevron-circle-right"></i>  出發日前 6 日至前 4 日內 (不含出發日) 可更改日期。但僅限一次，並僅限於同一主辦單位之活動。</li>
		                        	<li><i class="fas fa-chevron-circle-right"></i>  如更改後產生差價，費用多退少補。</li>
		                        	<li><i class="fas fa-chevron-circle-right"></i>  出發日前 3 日至當日內不接受更改日期。</li>
		                        	<li><i class="fas fa-chevron-circle-right"></i>  建議您出發日前 3 日內如須改期，可將名額轉讓但請務必告知RoyalBean，代理者的姓名及聯絡資訊。</li>                        
		                        </ul>
		                        </br>
                            </div>
	                        <div class="custom-control custom-radio">
	                        	<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" required >
                                <label class="custom-control-label" for="credit">我已同意上述辦法立即線上付款</label>
                            </div>
                            <hr>
                            <div class="custom-control">
	                        	<input type="checkbox">
                                <label >ePay多元付款</label>
                            </div>
                            <div class="custom-control">
	                        	<input type="checkbox">
                                <label >Paypal帳戶付款</label>
                            </div>
                            <div style="text-align:center">
                            	<form action="orderepay" method="post">
                            		<button type="submit" id="ajaxepay" class="ml-auto btn hvr-hover"><P style="color: #FFF8DC;">付款</P></button>
                                </form>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!-- End OrderCheckOut  -->
    
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
    <script src="/js/bootsnav.js."></script>
    <script src="/js/images-loded.min.js"></script>
    <script src="/js/isotope.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/baguetteBox.min.js"></script>
    <script src="/js/form-validator.min.js"></script>
    <script src="/js/contact-form-script.js"></script>
    <script src="/js/custom.js"></script>
    
    <script type="text/javascript">
    //異步寄mail
	$('#ajaxepay').click(function () {
    	$.ajax({
		   type:'post',
		   url:'/ordermail',		   
		   success: function(data) {
			   console.log(data);						   	   
			},
			error: function() { 
				console.log("error");
			}				
		});
	})
    </script>
    
</body>

</html>