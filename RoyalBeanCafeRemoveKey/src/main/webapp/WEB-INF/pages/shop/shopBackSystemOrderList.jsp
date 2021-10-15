<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BackGroundSystem</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">

  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/jquery.dataTables.min.css">

  <!-- my css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <style>

    .onlybuttom{
      color: white;
      background-color: rgb(88, 135, 236);
      border: 0px;
      border-radius: 5px;
    }
    
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
<body class="hold-transition sidebar-mini">
<!-- 管理員登入後header -->
<%@include file="/WEB-INF/pages/headerfooter/backheader.jsp"%>	
<!-- 管理員登入後header -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>訂單管理</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item active">商城系統</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="container">
      <div class="card">
<!--         <div class="card-header"> -->
<%--         <center> --%>
<!--           <h2 style="font-weight:bold;" class="card-title">訂單資訊</h2> -->
<%--         </center> --%>
<!--         </div> -->
        <!-- /.card-header -->

        <div class="card-body">
          <div id="jsGrid1">
 
	        <table id="example" class="display" style="width:100%;color:#A0522D">
	        <thead style="color:black">
	            <tr>
	                <th>訂單編號</th>
	                <th>會員編號</th>
	                <th>訂單資訊</th>
	                <th>訂單時間</th>
	                <th>總金額</th>
<!-- 	                <th></th> -->
	            </tr>
	        </thead>	
	        <tbody>
	        	<c:forEach var="allOrderDetail" items="${allOrderDetail}">
<%-- 	        		<c:forEach var="userOrderDetail" items="${userOrderDetail}"> --%>
	        			<tr>
	        				<th scope="row">${allOrderDetail.shopCarId}</th>
	        				<td class="shopcarmemberid" id="${allOrderDetail.shopCarId}memberId"></td>
				    		<td class="shopcardetail" id="${allOrderDetail.shopCarId}detail"><input type="hidden" id="${allOrderDetail.shopCarId}" value="${allOrderDetail.shopCarId}"></td>
				    		<td class="hide">${allOrderDetail.shopOrderDate}"</td>
				    		<td>${allOrderDetail.pdToTalPrice}</td>
	        			</tr>	        			
<%-- 	        		</c:forEach> --%>
	        		<script type="text/javascript">
 					     var shopcarid = $('#'+${allOrderDetail.shopCarId}).val();
//  						 console.log(shopcarid); 

 						$.ajax({
 							type : 'post',
 							url : '/shopcarDetail',
 							data : {shopcarid:shopcarid},
 							success : function(data) {
//  								console.log(data);
 								for (var i =0;i<data.length;i++){
 									$('#'+${allOrderDetail.shopCarId}+'detail').append('<span>'+data[i].pdname+'</span><span>x'+data[i].qty+'</span><br>');
 								}
 							},
 							error : function() {
 								//alert('error');  
 								console.log("error");
 							}
 						});
 						$.ajax({
 							type : 'post',
 							url : '/getOrderMemberId',
 							data : {shopcarid:shopcarid},
 							success : function(data) {
//  								console.log(data);
 									$('#'+${allOrderDetail.shopCarId}+'memberId').append('<span>'+data+'</span>');
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
  </div>
  <!-- /.content-wrapper -->

<!-- footer -->
<%@include file="/WEB-INF/pages/headerfooter/backfooter.jsp"%>	
<!-- footer -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
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
