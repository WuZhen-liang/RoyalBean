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
    
	<link href="/themes/krajee-fas/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <link href="/themes/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css"/>
<!--     評論區的星星加載 BootStrap -->
<!--     <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- 	<link href="/css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" /> -->
<!-- 	<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script> -->
<!-- 	<script src="/js/star-rating.min.js" type="text/javascript"></script> -->

<style type="text/css">
.buttonposition{
　position:absolute;
　top:20%;
　left:50%;
}
#div1,#div2,#div3,#div4,#div5{
	display: inline;
}
.nocolor{
	filter: grayscale(1);
}
#star1,#star2,#star3,#star4,#star5{
	width: 30px;
	height: 30px;
}
.color{
	filter: grayscale(0);
}

</style>


    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
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
                    <h2>商品資訊</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">商城</a></li>
                        <li class="breadcrumb-item active">商品資訊 </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Detail  -->
    <div class="shop-detail-box-main">
        <div class="container">
            <div class="row">     
                <div class="col-xl-5 col-lg-5 col-md-6">
<!--                     <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel"> -->
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active"> <img class="d-block w-100 my-cart-picture" src="${thisPdPicture}" alt="First slide"> </div>
                        </div>


<!--                     </div> -->
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                        <h2 class="my-cart-name">${thisPdName}</h2>
                        <span><strong style="color: brown">$&nbsp</strong></span><h5 class="my-cart-price" style="display: inline;">${thisPdPrice}</h5>
<%--                         <p class="available-stock"><span> 剩餘  <a href="#">${thisPdCount} </a></span> --%>
                            <p>
                                <h4>商品描述:</h4>
                                <p>${thisPdDepiction}</p>
                    </div>
                <div class="cart-and-bay-btn price-box-bars ">
                	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                	<a class="btn hvr-hover card-add " data-fancybox-close="" href="#" style="color: white">Add to cart</a>
				</div>
                </div>

            </div>

            <div class="row my-5">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>相關商品</h1>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme ">
                    <c:forEach items="${anotherPd}" var="anotherPd">
<!--                     <div id="relationpd"></div> -->
                        <div class="item">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                    <img src="${anotherPd.shopPdPicture}" class="img-fluid my-cart-picture" alt="Image">
                                    <div class="mask-icon">
                                        <ul>
                                            <li><a href="${anotherPd.shopPdNumber}/viewPdDetail" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye pdview"></i></a></li>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                        </ul>
                                        <a class="cart card-add " href="#">Add to Cart</a>
                                    </div>
                                </div>
                                <div class="why-text">
                                    <h4 id="${anotherPd.shopPdNumber}" class="my-cart-name product my-cart-id">${anotherPd.shopPdName}</h4>
                                    <span><strong>$</strong></span><span class="price my-cart-price">${anotherPd.shopPdPrice}</span>
                                </div>
                            </div>
                        </div>
   
                        </c:forEach>
                    </div>
                    <br> <br> <br>
                    <div ><br><br><h1>評論區:</h1>
                        <textarea rows="2px" cols="110px" class="something">
                        </textarea><br>
                    <span>商品分數:</span><span id="star"></span>
                    <span id="hint"></span>
                    <center><button style="color: brown" type="submit" id="send">評論</button></center>
                    <div>商品評分:<strong>&nbsp<span class="averagescore"></span></strong></div>
					<hr>
					<div class="append"></div>
<!-- 					<div class="append1"></div> -->
					</div>
                </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->




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
    <script src="/js/bootsnav.js"></script>
    <script src="/js/images-loded.min.js"></script>
    <script src="/js/isotope.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/baguetteBox.min.js"></script>
    <script src="/js/form-validator.min.js"></script>
    <script src="/js/contact-form-script.js"></script>
    <script src="/js/custom.js"></script>
<!--     <script src="/js/shopcarInsertTest.js"></script> -->
    <script src="/js/shopcarInsertTest2.js"></script>
<!--     <script src="/js/starSelect.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
        <!-- 評論區的星星加載 BootStrap -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/raty/2.8.0/jquery.raty.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

       
	<script>
	jQuery(document).ready(function() {
		//測試跨頁購物車資訊 0912
		var CartItem = JSON.parse(localStorage.getItem("CartItem"));
		var cartItem = JSON.stringify(CartItem);	
// // 		console.log(cartItem);
// // 		console.log(CartItem);
// 		updateCart(CartItem);
		//畫面一導入將購物車資訊帶入後端儲存				
		$.ajax({
			type : 'post',
			url : '/user/shopcaritem',
			data:{cartItem:cartItem},
			success : function(data) {
				var parsedObjinArray = JSON.parse(data);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
				console.log("SUCCESS : ", parsedObjinArray);	
				updateCart(parsedObjinArray);
			},
			error : function() {
				//alert('error');  
				console.log("error");
			}
		});	
	var scoreThisPdtotal = 0;			
	var scoreAverageofThisPd = 0;
	var thidPdMessageLength=0;
		//畫面一導入交商品所屬的留言帶出				
			$.ajax({
				type : 'post',
				url : '/user/showAllMesssageForThisPd',
				success : function(data) {
					console.log(data);
					console.log(data.length);
					thidPdMessageLength = data.length;
					if(data.length !=0){
						for(var i=0;i<data.length;i++){
							scoreThisPdtotal += data[i].shopPdMessageScore;
							$('.append').append('<div>'+data[i].shopPdMessageDetail+'</div><span id="star'+data[i].shopPdMessageId+'"></span><hr>');						
							$('#star'+data[i].shopPdMessageId).raty({
								path:   '/images/shop',
								starOff : 'star-off.png',
								starOn  : 'star-on.png',
					    		space: false,
								readOnly: true, score: data[i].shopPdMessageScore
						});
						}
						scoreAverageofThisPd = Math.round((scoreThisPdtotal/data.length)*10)/10;
						$('.averagescore').html(scoreAverageofThisPd);
						console.log(scoreThisPdtotal);
						console.log(scoreAverageofThisPd);
					}else{
						$('.append').append('<center><div class="nodata">目前無任何評論</div></center>');
					}
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});			
		
		
		//評論區
		var score1;
		var count = 0;
		$('#star').raty({
			  path:        '/images/shop',
// 			  half:         true,
			  starOff : 'star-off.png',
			  starOn  : 'star-on.png',
			  space: false,
			  target: '#hint',
			  hints: ['非常不滿意','不滿意','尚可','滿意','非常滿意'],
// 			  starHalf: 'star-half.png',
			  click : function(score) {
				  
				  score1=score;
				  }
		});
		//評論按下送出後端處理置資料庫
		$('#send').click(function(){
			var detail = $('.something').val();
			console.log(detail);
			console.log(score1);
			$.ajax({
				type : 'post',
				url : '/user/saveMessageWithPd',
				data:{detail:detail,score1:score1},
				success : function(data) {
					var watch = $('.append').text();;
					console.log(watch);
					if(watch =="目前無任何評論"){
						$('.averagescore').html(data.shopPdMessageScore);
						$('.append').html('');
						$('.append').append('<div>'+detail+'</div><span id="star'+data.shopPdMessageId+'"></span><hr>');	
						$('#star'+data.shopPdMessageId).raty({
						  	path:   '/images/shop',
						  	starOff : 'star-off.png',
						  	starOn  : 'star-on.png',
						  	space: false,
						  	readOnly: true, score: data.shopPdMessageScore
						});
						Swal.fire({
						  icon: 'success',
						  title: '成功',
						  text: '感謝您的評論!'
						})
					}else{
						var theNewScore =  scoreThisPdtotal+data.shopPdMessageScore;
						var theNewShopPdMessageLength = thidPdMessageLength+1;
						var theNewAverageScore = Math.round((theNewScore/theNewShopPdMessageLength)*10)/10;
						$('.averagescore').html(theNewAverageScore);
						$('.append').append('<div>'+detail+'</div><span id="star'+data.shopPdMessageId+'"></span><hr>');	
						$('#star'+data.shopPdMessageId).raty({
							  path:   '/images/shop',
							  starOff : 'star-off.png',
							  starOn  : 'star-on.png',
							  space: false,
							  readOnly: true, score: data.shopPdMessageScore
						});
						Swal.fire({
							  icon: 'success',
							  title: '成功',
							  text: '感謝您的評論!'
							})
					}
				},
				error : function() {
					//alert('error');  
					console.log("error");
				}
			});			
		});
	 
	});	
	</script>
	<script type="text/javascript">
	var CartItem = JSON.parse(localStorage.getItem("CartItem"));
	console.log(CartItem);
	var cart = CartItem;
	console.log(cart);

var updateCart = function (cart) {
    var totalCost = 0;
    var totalCount = 0;
//     var cart = getCart();
    //Add to shopping cart dropdown
    $('.cart-list').html('');
    for (var i = 0; i < cart.items.length; i++) {
      totalCost += (cart.items[i].qty * parseFloat(cart.items[i].price));
      totalCount += cart.items[i].qty;

      $('.cart-list').append(
        '<li><a class="photo"><img class="cart-thumb" src="' + cart.items[i].picture + '"></a>' +
		'<strong><span><a>'+ cart.items[i].name + '</a></span></strong>'+'<span display="inline-block">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<i id="my-cart-remove' + i + '" class="fa fa-times my-cart-remove cart-thumb" aria-hidden="true" display="inline-block"></i></span>'+
		'<p>'+cart.items[i].qty +'x- <span class="price">$'+cart.items[i].price + '</span></p>'+
        '<span display="inline-block">'+'數量: </span>' +"&nbsp&nbsp&nbsp&nbsp"+
        '<i display="inline-block" id="subtract-qty' + i + '" class="fa fa-minus-square update-qty subtract-qty cart-thumb" aria-hidden="true"></i><span> ' +"&nbsp&nbsp&nbsp&nbsp"+
        cart.items[i].qty +"&nbsp&nbsp&nbsp&nbsp"+
        ' <i display="inline-block" id="add-qty' + i + '" class="fa fa-plus-square update-qty add-qty cart-thumb" aria-hidden="true"></i>' 
      );

      (function () {
        var currentIndex = i;
        $('#add-qty' + currentIndex).on('click', function () {
          updateQuantity(cart.items[currentIndex].id, ++cart.items[currentIndex].qty);
        })
      })();

      (function () {
        var currentIndex = i;
        $('#subtract-qty' + currentIndex).on('click', function () {
          if (cart.items[currentIndex].qty != 1) {
            updateQuantity(cart.items[currentIndex].id, --cart.items[currentIndex].qty);
          }
        });
      })();

      (function () {
        var currentIndex = i;
        $('#my-cart-remove' + currentIndex).on('click', function () {
          removeFromCart(cart.items[currentIndex].id);
        });
      })();
    }
    //Update Counter
    updateCounter(totalCount);

    //Update Total
    updateTotal(totalCost);

    localStorage.setItem('CartItem', JSON.stringify(cart));	
  }
  
	//Update counter 
	var updateCounter = function (val) {
  		$('.my-cart-counter').html(val);
	}

	//Update total
	var updateTotal = function (val) {
		var cart = getCart();
		cart.total = val;
		$('.my-cart-total').html(val);
	}
	//Update cart quantity by id
	var updateQuantity = function (id, qty) {
  		var cart = getCart();
  		var cartIndex = cart.items.findIndex(x => x.id == id);
  		cart.items[cartIndex].qty = qty;
  	//Update popup cart
  		updateCart(cart);
	};
	//Get Cart
	var getCart = function () {
  		var myCart = cart;
  		return myCart;
	}

//Checkout to sandbox payment gateway
var checkout = function () {
  var cart = getCart();
  if (cart.items.length > 0) {
    alert("checkout!");
	  console.log(cart);
	  localStorage.setItem('Cart', JSON.stringify(cart));
	  location.href="shoppaypage"
  } else {
    alert("請選擇商品");
  }
};
//Remove from cart on id
var removeFromCart = function (id) {
  var cart = getCart();
  var cartIndex = cart.items.findIndex(x => x.id == id);

  cart.items.splice(cartIndex, 1);
  //Update popup cart
  updateCart(cart);
};
</script>
</body>

</html>