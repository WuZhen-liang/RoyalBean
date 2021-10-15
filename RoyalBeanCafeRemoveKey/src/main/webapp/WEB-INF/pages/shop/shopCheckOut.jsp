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
    <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Paypal Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
<%@include file="/WEB-INF/pages/shop/header/memberheadersecond.jsp"%>
<!-- 會員登入後header -->


    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Checkout</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Checkout</li>
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
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>個人資訊</h3>
                        </div>
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="username">會員姓名 *</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="username" placeholder="" required value="${membername}">
                                    <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="phone">手機號碼 *</label>
                                <input type="text" class="form-control" id="phone" placeholder="" value="${memberphone}">
                                <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                            </div>
                            <div class="mb-3">
                                <label for="email">信箱 *</label>
                                <input type="email" class="form-control" id="email" placeholder="" value="${memberMail}">
                                <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                            </div>
                            <div class="mb-3">
                                <label for="address">地址 *</label>
                                <input type="text" class="form-control" id="address" placeholder="" required value="${memberAddress}">
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
<!--                             <hr class="mb-4"> -->
                            <div class="row">
                            	<div class="col-md-12 col-lg-12">
                            		<div class="title-left"> <h3>付費方式</h3> </div>
                            	</div>
                            	<div class="col-md-3 mb-3">
                            		<div class="d-block my-3">
<!--                                 		<div class="custom-control custom-radio"> -->
<!--                                     		<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required> -->
<!--                                     		<label class="custom-control-label" for="credit">Credit card</label> -->
<!--                                 		</div> -->
<!--                                 		<div class="custom-control custom-radio"> -->
<!--                                     		<input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required> -->
<!--                                     		<label class="custom-control-label" for="debit">Debit card</label> -->
<!--                                 		</div> -->
                                		<div class="custom-control custom-radio">
                                    		<input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                                    		<label class="custom-control-label" for="paypal">Paypal</label>
                                		</div>
                                	</div>
                                </div>	
                                                            	<div class="col-md-3 mb-3">
                            		<div class="d-block my-3">
<!--                                 		<div class="custom-control custom-radio"> -->
<!--                                     		<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required> -->
<!--                                     		<label class="custom-control-label" for="credit">Credit card</label> -->
<!--                                 		</div> -->
<!--                                 		<div class="custom-control custom-radio"> -->
<!--                                     		<input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required> -->
<!--                                     		<label class="custom-control-label" for="debit">Debit card</label> -->
<!--                                 		</div> -->
                                		<div class="custom-control custom-radio">
                                    		<input id="ecpay" name="paymentMethod" type="radio" class="custom-control-input" required>
                                    		<label class="custom-control-label" for="paypal">ecpay</label>
                                		</div>
                                	</div>
                                </div>	
                              	<div class="col-md-4 mb-3">
                                    <div class="payment-icon">
                                        <ul>
                                            <li><img class="img-fluid" src="/images/payment-icon/1.png" alt=""></li>
                                            <li><img class="img-fluid" src="/images/payment-icon/2.png" alt=""></li>
                                            <li><img class="img-fluid" src="/images/payment-icon/3.png" alt=""></li>
                                            <li><img class="img-fluid" src="/images/payment-icon/5.png" alt=""></li>
                                            <li><img class="img-fluid" src="/images/payment-icon/7.png" alt=""></li>
                                        </ul>
                                    </div>
                                </div>
                          	</div>      
						</form>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>運送方式</h3>
                                </div>
                                <div class="mb-4">
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio">
                                        <label class="custom-control-label" for="shippingOption1">Standard Delivery</label> <span class="float-right font-weight-bold">FREE</span> </div>
                                    <div class="ml-4 mb-2 small">(3-7 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption2">Express Delivery</label> <span class="float-right font-weight-bold">$10.00</span> </div>
                                    <div class="ml-4 mb-2 small">(2-4 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption3">Next Business day</label> <span class="float-right font-weight-bold">$20.00</span> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3>購物車 </h3>
                                </div>
                                <div class="rounded p-2 bg-light">
                                <div class="shopcaritem"></div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-12 col-lg-12">
                            <div class="order-box">
<!--                                 <div class="title-left"> -->
<!--                                     <h3>您的訂單</h3> -->
								<br>
                                <div class="d-flex gr-total">
                                    <h5>總計:</h5>
<!--                                     <div class="totalprice"></div> -->
                                    <div class="ml-auto h5 totalprice"></div>
                                </div>
								<hr>
                                	 
                           </div>
                           
                        </div>

                        	<div class="col-12 d-flex shopping-box">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="/"><button id="send" class="ml-auto btn hvr-hover my-cart-checkout" style="color: white">送出訂單</button> </a></div>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->



	<!-- Footer -->
		<%@include file="/WEB-INF/pages/headerfooter/footer.jsp"%>
	<!-- Footer -->


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
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
	<script>
		$(document).ready(function() {                       	
				var cartdetail = JSON.parse(localStorage.getItem("Cart"));
				console.log(cartdetail.items[0].id);
				for(let i=0; i < cartdetail.items.length ; i++){
				var itemperprice = parseFloat(cartdetail.items[i].price);
				var itemperqty = parseFloat(cartdetail.items[i].qty);
				var itemtotalprice = itemperprice*itemperqty;
					$('.shopcaritem').append('<div class="media mb-2 border-bottom"><div class="media-body"> <a href="detail.html">'+ cartdetail.items[i].name+'</a><div class="small text-muted">Price: $'+cartdetail.items[i].price+'<span class="mx-2">|</span> Qty: '+cartdetail.items[i].qty+'<span class="mx-2">|</span> Subtotal: $'+itemtotalprice+'</div></div></div>')					
				}
				$('.totalprice').html(cartdetail.total)
// 			$("#send").click(function() {
				var cart = JSON.parse(localStorage.getItem("Cart"));
// 				var paypal = JSON.parse(localStorage.getItem("paypalDetail"));
				var cartItem = JSON.stringify(cart.items);				
				var paypalDetail = JSON.stringify(paypal);				
				var pdtotalprice = cart.total;
				$.ajax({
					type : 'post',
					url : '/shopcarinsert.controller',
					data :{cartItem:cartItem,pdtotalprice:pdtotalprice},
					success : function(data) {
						console.log(data);
						console.log("success");
// 						location.href="/";
					},
					error : function() {
						console.log("error");
					}
				});
// 			});
				//傳送 基本資料給paypal 
				$("#paypal").click(function() {
					console.log("paypal click")
					var cart = JSON.parse(localStorage.getItem("Cart"));
					var cartItem = JSON.stringify(cart.items);				
					var pdtotalprice = cart.total;
					$.ajax({
						type : 'post',
						url : '/shopordermail',
						success : function(data) {
							console.log(data);							
							console.log(" send mail success");
// 							location.href="/";
						},
						error : function() {
							console.log("error");
						}
					});
				});	
		});
    </script>
</body>

</html>