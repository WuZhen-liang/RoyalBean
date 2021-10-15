<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RoyalBeanCafe</title>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>RoyalBeanCafe</title>
    
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
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/jquery.dataTables.min.css">

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
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-left">
                <img src="/images/activity01.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Make Me Coffee, <br> Be Coffee.</strong></h1>
                            <p class="m-b-40">"What do you want?"  <br> - Just coffee. Black like my soul.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="/images/activity02.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Cake is for life, not just for birthdays! <br> </strong></h1>
                            <p class="m-b-40">Put "eat cake" on top of your to-do list today <br> and you're sure to get at least one task done.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-right">
                <img src="/images/activity03.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Latte Art, <br> I put coffee in my coffee.</strong></h1>
                            <p class="m-b-40">  Good communication is just as stimulating as black coffee, <br> and just as hard to sleep after.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->
    
    
    <!-- 活動紀錄 Start -->
    <div class="latest-blog">
    <div class="container" style="font-size:16.5px">

    <ul id="storetitle" class="nav nav-tabs">
		<li class="nav-item">
		<a class="nav-link active" aria-current="page" href="activitysatisfaction">我的活動</a>
		</li>
	</ul>

    
    <div style="padding:20px 0px 20px 0px;">
            <table id="orderSatList" class="table table-hover display">
				  
				  <thead>
				    <tr>
				      <th scope="col">訂單編號</th>
				      <th scope="col">訂單日期</th>
				      <th scope="col">活動名稱</th>
				      <th scope="col">活動地點</th>
				      <th scope="col">金額</th>
				      <th scope="col">活動日期</th>				      
				      <th scope="col">目前狀態</th>				      
				      <th scope="col">評論</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach var="orderSat" items="${orderSat}">
				    <tr>
				    	<th scope="row">${orderSat.aoId}</th>
				      	<td>${orderSat.aorderDate}</td>
				      	<td>${orderSat.activity.aName}</td>
				      	<td><button class="btn hvr-hover" id="map${orderSat.aoId}" style="color:#FFF8DC;"><i class="fas fa-map-marker-alt"></i></button>  ${orderSat.activity.activityStore.sName}</td>
				      	<td>$  ${orderSat.aoPrice}</td>
				      	<td>${orderSat.aResDate}</td>
				      	<td><span id="now${orderSat.aoId}">已完成</span></td>
				      	<td><button type='button' class='btn btn-warning' id="${orderSat.aoId}" value="${orderSat.aoId}"><i class="far fa-star"></i></button></td>
				    </tr>
				    
				    <script type="text/javascript">
				    
				    $(function() {
				    	var resdate = '${orderSat.aResDate}';						 
						console.log(resdate);
						var today = new Date();
						var mon = today.getMonth()+1;
						if(mon<10){mon="0"+mon};
						var day = today.getDate();
						if(day<10){day="0"+day};
						
						var t = today.getFullYear()+ "-" + mon + "-" + day;
						//console.log(t);
						if(resdate > t){
							$('#'+${orderSat.aoId}).prop('disabled', true);
							$('#'+${orderSat.aoId}).css('background', 'gray');
							$('#now'+${orderSat.aoId}).text('已付款');
						};
				    });
				    				    
				    $('#'+${orderSat.aoId}).click(function () {
					     var satID = $('#'+${orderSat.aoId}).val();
						 console.log(satID);
						 swal.fire({
						 	title: '請評價此次活動：'+satID,
						    html:"<form action='/satisfactionsubmit' method='post' style='color:#8B4513'>"+
						    	 "<label for='asPlace' name='asPlace'><i class='far fa-star'></i> 活動場域舒適度：</label>"+
						    	  "<select class='form-select' id='asPlace' name='asPlace' style='color:#8B4513'>"+
						    	    "<option selected>請評分...</option>"+
						    	    "<option value='5'>非常滿意</option>"+
						    	    "<option value='4'>滿意</option>"+
						    	    "<option value='3'>普通</option>"+
						    	    "<option value='2'>待加強</option>"+
						    	    "<option value='1'>不滿意</option>"+
						    	  "</select><br>"+
						    	 "<label for='asPrice' name='asPrice'><i class='far fa-star'></i> 活動價格接受度：</label>"+
						    	  "<select class='form-select' id='asPrice' name='asPrice' style='color:#8B4513'>"+
						    	  "<option selected>請評分...</option>"+
						    	    "<option value='5'>非常滿意</option>"+
						    	    "<option value='4'>滿意</option>"+
						    	    "<option value='3'>普通</option>"+
						    	    "<option value='2'>待加強</option>"+
						    	    "<option value='1'>不滿意</option>"+
						    	  "</select><br>"+
						    	 "<label for='asProduct' name='asProduct'><i class='far fa-star'></i> 活動內容豐富度：</label>"+
						    	  "<select class='form-select' id='asProduct' name='asProduct' style='color:#8B4513'>"+
						    	  "<option selected>請評分...</option>"+
						    	    "<option value='5'>非常滿意</option>"+
						    	    "<option value='4'>滿意</option>"+
						    	    "<option value='3'>普通</option>"+
						    	    "<option value='2'>待加強</option>"+
						    	    "<option value='1'>不滿意</option>"+
						    	  "</select><br>"+
						    	 "<label for='asRevisit' name='asRevisit'><i class='far fa-star'></i> 活動再訪意願度：</label>"+
						    	  "<select class='form-select' id='asRevisit' name='asRevisit' style='color:#8B4513'>"+
						    	  "<option selected>請評分...</option>"+
						    	    "<option value='5'>非常滿意</option>"+
						    	    "<option value='4'>滿意</option>"+
						    	    "<option value='3'>普通</option>"+
						    	    "<option value='2'>待加強</option>"+
						    	    "<option value='1'>不滿意</option>"+
						    	  "</select><br>"+
						    	 "<label for='asTeacher' name='asTeacher'><i class='far fa-star'></i> 活動講師專業度：</label>"+
						    	  "<select class='form-select' id='asTeacher' name='asTeacher' style='color:#8B4513'>"+
						    	  "<option selected>請評分...</option>"+
						    	    "<option value='5'>非常滿意</option>"+
						    	    "<option value='4'>滿意</option>"+
						    	    "<option value='3'>普通</option>"+
						    	    "<option value='2'>待加強</option>"+
						    	    "<option value='1'>不滿意</option>"+
						    	  "</select><br>"+
						    	 "<label for='asContent' name='asContent'> 其他評論：</label><br>"+
						    	  "<textarea id='asContent' name='asContent' rows='3' style='color:#8B4513'>"+
						    	  "</textarea><br>"+
						    	  "<input type='hidden' id='aoId' name='aoId' value='"+satID+"'/>"+
						    	  "<input type='submit' class='btn btn-warning' id='satSave' value='送出評論'/>"+
						 		 "</form>",
						   
						    showCloseButton: true,
						    showCancelButton: false,
						    showConfirmButton: false,
						    
						 }).then((result) => {
						    if (result.isConfirmed) {
						     	$.ajax({
									url: '',
								    type: '',
								    							        
								    success: function () {
								     	     	swal.fire({
									     	        position: 'top',
									     	        icon: 'success',
									     	        title: 'ID: '+ deleteID + ' has been deleted',
									     	        showConfirmButton: false,
									     	        timer: 3000
								     	        });
								     	     }
								});						     				  
							}
						});					 
						 
					});
				    
                    $('#map'+${orderSat.aoId}).click(function () {		
						Swal.fire({
						  title: '立即前往',
						  icon: 'info',
						  html:
						    '<iframe width="400" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"'+ 
						    'src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q='+${orderSat.activity.activityStore.sEw}+','+${orderSat.activity.activityStore.sNs}+'&z=16&output=embed&t=></iframe>',
						  showCloseButton: true,
						});
					})
					
				    </script>
				    
				    </c:forEach>
				    
				  </tbody>
				   
				</table>
			</div>
		</div>
	</div>
		
    
    <!-- 活動紀錄 End -->
    
    
    
    
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
    
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="http://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>
    
    <script type="text/javascript">
    
    $(document).ready( function () {
    	$('#orderSatList').DataTable( {    		
    		select: true,    	        	    
    	    lengthMenu: [5, 10],    	    
    		"language": {
    			lengthMenu: "每頁顯示 _MENU_ 項結果",
    	        zeroRecords: "沒有符合的結果",
    	        info: "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
    	        infoEmpty: "顯示第 0 至 0 項結果，共 0 項",
    		    paginate: {
    	            "first": "第一頁",
    	            "previous": "上一頁",
    	            "next": "下一頁",
    	            "last": "最後一頁"
    	        } 
    	    }
    	        
    	} );
    });
    </script>

</body>
</html>