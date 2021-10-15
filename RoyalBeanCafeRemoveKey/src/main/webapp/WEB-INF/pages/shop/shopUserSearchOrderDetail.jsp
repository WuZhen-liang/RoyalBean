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
    
     <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/jquery.dataTables.min.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script type="text/javascript">
  $(document).ready(function() {
// 	  var a = ${userOrderDetail};
// 	  console.log(a);
//       swal.fire({
//      	  position: 'center',
//      	  icon: 'success',
//      	  title: 'Pay Successd!',
//      	  showConfirmButton: false,
//      	  timer: 3000
//      	});
      
  });
  </script>
    <style type="text/css">
    .hide{
	display: block;
	width: 90px;
	height: 20px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
    
    }
    </style>
</head>

<body>
	
	<%@include file="/WEB-INF/pages/shop/header/memberheadersecond.jsp"%>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    


    <!-- Main content -->
    <section class="content">
    <div class="container">
      <div class="card">
        <div class="card-header">
        <center>
          <h2 style="font-weight:bold;" class="card-title">訂單資訊</h2>
        </center>
        </div>
        <!-- /.card-header -->

        <div class="card-body">
          <div id="jsGrid1">
 
	        <table id="example" class="display" style="width:100%;color:#A0522D">
	        <thead style="color:black">
	            <tr>
	                <th>訂單編號</th>
	                <th>訂單資訊</th>
	                <th>訂單時間</th>
	                <th>總金額</th>
<!-- 	                <th></th> -->
	            </tr>
	        </thead>	
	        <tbody>
	        	<c:forEach var="userOrder" items="${userOrder}">
<%-- 	        		<c:forEach var="userOrderDetail" items="${userOrderDetail}"> --%>
	        			<tr>
	        				<th scope="row">${userOrder.shopCarId}</th>
				    		<td class="shopcardetail" id="${userOrder.shopCarId}detail"><input type="hidden" id="${userOrder.shopCarId}" value="${userOrder.shopCarId}"></td>
				    		<td class="hide">${userOrder.shopOrderDate}"</td>
				    		<td>${userOrder.pdToTalPrice}</td>
	        			</tr>	        			
<%-- 	        		</c:forEach> --%>
	        		<script type="text/javascript">
 					     var shopcarid = $('#'+${userOrder.shopCarId}).val();
//  						 console.log(shopcarid); 

 						$.ajax({
 							type : 'post',
 							url : '/shopcarDetail',
 							data : {shopcarid:shopcarid},
 							success : function(data) {
 								console.log(data);
 								for (var i =0;i<data.length;i++){
 									$('#'+${userOrder.shopCarId}+'detail').append('<span>'+data[i].pdname+'</span><span>x'+data[i].qty+'</span><br>');
 								}
//  								console.log(data.length);
// 							$('.shopcardetail').append('<div>123</div>');
 							},
 							error : function() {
 								//alert('error');  
 								console.log("error");
 							}
 						});						     				    
 				    </script> 
	        	</c:forEach>
	        </tbody>        
	        </table>
         
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    </section>
    
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

    <!-- Start Footer  -->
	<%@include file="/WEB-INF/pages/headerfooter/footer.jsp"%>
    <!-- End Footer  -->

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
	
	<script>
$(document).ready( function () {
	$('#example').DataTable( {
		    
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
	        
	});
	
	
});
</script>
</body>

</html>