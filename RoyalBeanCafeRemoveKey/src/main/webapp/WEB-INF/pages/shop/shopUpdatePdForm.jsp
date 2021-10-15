<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//照片上傳
		$('#buttonUpload').click(function () {
		var fileinput = $('#pdPicture').val();
		if(fileinput == ''){
			console.log("please select photo");
			swal.fire({
           	  position: 'top',
           	  icon: 'warning',
           	  title: 'Please select photo.',
           	  showConfirmButton: false,
           	  timer: 1500
           	});
		}else{
			
			var form = document.getElementById("shoppdPhotoForm");
		    var formData = new FormData(form);
			console.log(formData.get("PdPicture"));

		    $.ajax({
		        type: "POST",  //使用POST傳輸,檔案上傳只能用POST
		        enctype: 'multipart/form-data', //將資料加密傳輸 檔案上傳一定要有的屬性
		        url: "shopphoto", //要傳輸對應的接口
		        data: formData,     //要傳輸的資料
		        processData: false, //防止jquery將data變成query String
		        contentType: false, 
		        cache: false,  //不做快取
		        async : false, //設為同步
		        timeout: 1000000, //設定傳輸的timeout,時間內沒完成則中斷
		        success: function (data) {
		            console.log("SUCCESS : ", data);
		            $('#pdpictureinfo').val("/shoppicture/"+data);
		            console.log($('#pdPicture').val());
		            swal.fire({
		             	  position: 'top',
		             	  icon: 'success',
		             	  title: 'Upload Successd!',
		             	  showConfirmButton: false,
		             	  timer: 1500
		             	});
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		        }
		    })
		}
	})
	});
</script>

</head>

<body>

<%@include file="/WEB-INF/pages/headerfooter/venderheader.jsp"%>

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>UpdateProduct</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">UpdateProduct</li>
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
                 <!-- Picture Start-->
		    		<form id="shoppdPhotoForm">
						<label>Picture *</label>
						<div class="row">
							<div class="col-md-6 mb-3">
								<input id="pdPicture" type="file" name="PdPicture" class="form-control"/>
							</div>
							<div class="col-md-6 mb-3">
								<input id="buttonUpload" type="button" value="Upload" class="btn btn-warning"/>
							</div>
						</div>	
					</form>	
					<!-- Picture End-->	
                        <form:form class="needs-validation" action="updatePd" modelAttribute="shop/shopUpdatePdForm" method="post">
                            <form:input path="shopPdNumber" type="hidden"/>
                            <form:input type="hidden" path="company"/> 
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <form:label path="shopPdName" for="firstName">Product name *</form:label>
                                    <form:input class="form-control" path="shopPdName"></form:input>
                                    <div class="invalid-feedback"> Valid first name is required. </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                	<form:label path="shopPdPrice">Product Price *</form:label>
                                	<form:input class="form-control" path="shopPdPrice"></form:input>
                                    <div class="invalid-feedback"> Valid last name is required. </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <form:label path="shopPdCount">Product Count *</form:label>
                                	<form:input class="form-control" path="shopPdCount"></form:input>
                                    <div class="invalid-feedback"> Valid first name is required. </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <form:label path="shopPdWeight">Product Weight *</form:label>
                                	<form:input class="form-control" path="shopPdWeight"></form:input>
                                    <div class="invalid-feedback"> Valid last name is required. </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="input-group">
                                	<form:input path='shopPdPicture' type="hidden" id="pdpictureinfo"/>
                                    <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                    	<form:label path="shopPdType">Type *</form:label>
                                		<form:select class="wide w-100" path="shopPdType">                                   
                                        	<form:option value="Choose..." data-display="Select">Choose...</form:option>
                                        	<form:option value="咖啡豆">咖啡豆</form:option>
                                        	<form:option value="咖啡">咖啡</form:option>
                                        	<form:option value="蛋糕">蛋糕</form:option>
                                    	</form:select>   
                                        <div class="invalid-feedback"> Please select a valid Type. </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <form:label path="shopPdBaking">Baking *</form:label>
                                        <form:select class="wide w-100" path="shopPdBaking">
                                        	<form:option value="Choose..." data-display="Select">Choose...</form:option>
                                        	<form:option value="淺烘焙">淺烘焙</form:option>
                                        	<form:option value="肉桂烘焙">肉桂烘焙</form:option>
                                        	<form:option value="微中烘焙">微中烘焙</form:option>
                                        	<form:option value="濃度烘焙">濃度烘焙</form:option>
                                        	<form:option value="城市烘焙">城市烘焙</form:option>
                                        	<form:option value="深城市烘焙">深城市烘焙</form:option>
                                        	<form:option value="法式烘焙">法式烘焙</form:option>
                                        	<form:option value="義式烘焙">義式烘焙</form:option>
                                    	</form:select>
                                        <div class="invalid-feedback"> Please provide a valid Baking. </div>
                                    </div>                                   
                                    <div class="col-md-4 mb-3">
                                        <form:label path="shopPdSaveMethod">SaveMethod *</form:label>
                                        <form:select class="wide w-100" path="shopPdSaveMethod">
                                            <form:option data-display="Select" value="Choose...">Choose...</form:option>
                                            <form:option value="冷凍">冷凍</form:option>
                                            <form:option value="冷藏">冷藏</form:option>
                                            <form:option value="常溫">常溫</form:option>
                                        </form:select>
                                        <div class="invalid-feedback"> SaveMethod code required. </div>
                                    </div>
                                </div>
                           </div>
                            <div class="mb-3">
                                <form:label path="shopPdDepiction">Depiction *</form:label>
                                <form:textarea class="wide w-100" path="shopPdDepiction"></form:textarea>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            <div class="mb-3">
                                <form:label path="shopPdIngredient">Ingredient *</form:label>
                                <form:input class="wide w-100" path="shopPdIngredient"></form:input>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            <div class="mb-3">
                                <form:label path="shopPdOrigin">Origin *</form:label>
                                <form:input class="wide w-100" path="shopPdOrigin"></form:input>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            <div class="mb-3">
                                <form:label path="shopPdExpTime">ExpTime *</form:label>
                                <form:input class="wide w-100" path="shopPdExpTime"></form:input>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            <div class="mb-3">
                                <form:label path="shopPdShipment">Shipment *</form:label>
                                <form:input class="wide w-100" path="shopPdShipment"></form:input>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            <div class="mb-3">
                                <form:label path="shopPdNotice">Notice *</form:label>
                                <form:textarea class="wide w-100" path="shopPdNotice"></form:textarea>
                                <div class="invalid-feedback"> Please enter your shipping Notice. </div>
                            </div>
                            <!-- <hr class="mb-1"> </form> -->
                            <div class="mb-3">
                            <center>
                                <form:button value="Send">Submit</form:button>
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </center>
                            </div>
                            </form:form>
                            
                    </div>
                </div>
            
                    <!-- <div class="col-sm-6 col-lg-2 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>一鍵輸入</h3>
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
                                    <h3>Shopping cart</h3>
                                </div>
                                <div class="rounded p-2 bg-light">
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $80.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $80.00</div>
                                        </div>
                                    </div>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $60.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $60.00</div>
                                        </div>
                                    </div>
                                    <div class="media mb-2">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $40.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $40.00</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="order-box">
                                <div class="title-left">
                                    <h3>Your order</h3>
                                </div>
                                <div class="d-flex">
                                    <div class="font-weight-bold">Product</div>
                                    <div class="ml-auto font-weight-bold">Total</div>
                                </div>
                                <hr class="my-1">
                                <div class="d-flex">
                                    <h4>Sub Total</h4>
                                    <div class="ml-auto font-weight-bold"> $ 440 </div>
                                </div>
                                <div class="d-flex">
                                    <h4>Discount</h4>
                                    <div class="ml-auto font-weight-bold"> $ 40 </div>
                                </div>
                                <hr class="my-1">
                                <div class="d-flex">
                                    <h4>Coupon Discount</h4>
                                    <div class="ml-auto font-weight-bold"> $ 10 </div>
                                </div>
                                <div class="d-flex">
                                    <h4>Tax</h4>
                                    <div class="ml-auto font-weight-bold"> $ 2 </div>
                                </div>
                                <div class="d-flex">
                                    <h4>Shipping Cost</h4>
                                    <div class="ml-auto font-weight-bold"> Free </div>
                                </div>
                                <hr>
                                <div class="d-flex gr-total">
                                    <h5>Grand Total</h5>
                                    <div class="ml-auto h5"> $ 388 </div>
                                </div>
                                <hr> </div>
                        </div>
                        <div class="col-12 d-flex shopping-box"> <a href="checkout.html" class="ml-auto btn hvr-hover">Place Order</a> </div>
                    </div>
                </div>  -->
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
</body>

</html>