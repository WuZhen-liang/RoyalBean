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
            <h1>商城數據分析</h1>
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

    <!-- 圖表開始 -->
    <section class="content">
    <div class="container-fluid">
    	        <!-- Info boxes -->
        <div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-shopping-bag"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">商品總數</span>
                <span class="info-box-number shoppdtotal">
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-comments"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">留言數</span>
                <span class="info-box-number shoppdMessage"></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">訂單總數</span>
                <span class="info-box-number orderTotal"></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="far fa-credit-card"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">訂單總金額</span>
                <span class="info-box-number orderTotalPrice"></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
    
    
    
        <div class="row">
        	<div class="col-md-4">
        	
        	<div class="card card-info">
        		<div class="card-header">
                	<h3 class="card-title" style="font-size:24px" >商品類型</h3>
     			</div>
     			<div class="card-body">
	                <div class="chart">
	     	    	<canvas id="myChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
		     	    </div>
	     		</div>
     		</div>
     		
     		</div>
     		<div class="col-md-4">
        	
        	<div class="card card-info">
        		<div class="card-header">
                	<h3 class="card-title" style="font-size:24px" >訂單統計</h3>
     			</div>
     			<div class="card-body">
	                <div class="chart">
	     	    	<canvas id="myChart1" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
		     	    </div>
	     		</div>
     		</div>
     		
        </div>
     		<div class="col-md-4">
        	
        		<div class="card card-info">
        			<div class="card-header">
                		<h3 class="card-title" style="font-size:24px" >商品評分</h3>
     				</div>
     				<div class="card-body">
	                	<div class="chart">
	     	    		<canvas id="myChart2" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
		     	    	</div>
	     			</div>
     			</div>
     		
     		</div>
     </div>
     
    </section>
    <!-- 圖表結束 --> 
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
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
	
<script>

//查詢所有會員
var shopPdMember = [];
$.ajax({
	type:'post',
	url:'/admin/findAllMember',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
// 		console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
// 		console.log("SUCCESS : ", parsedObjinArray);
		
		//shopPdConpany陣列
		$.each(parsedObjinArray,function(i,n){
			var membername = n.memberContent.id;
			shopPdMember.push(membername);
		});
// 		console.log(shopPdMember);				     		   
	},
	error: function() {
		console.log("error");
	}
});



//圖表數據
//上架商品類型及總數
$.ajax({
	type:'post',
	url:'/admin/findAllPd',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
// 		console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
// 		console.log("SUCCESS : ", parsedObjinArray);
		
		//商品總數
		var pdlength = parsedObjinArray.length;
// 		console.log(pdlength);
		$('.shoppdtotal').html(pdlength);
		
		//shopPdTypeArray陣列
		var shopPdTypeArray = [];
		$.each(parsedObjinArray,function(i,n){
			var type = n.shopPdType;
			shopPdTypeArray.push(type);
		});
// 		console.log(shopPdTypeArray);
		
		//計算蛋糕
		var cake = 0;
		for (var i = 0; i < shopPdTypeArray.length; ++i) {
		    if(shopPdTypeArray[i] == "蛋糕"){
		    	cake++;
		    }
		}
// 	    console.log(cake);
	    
	  //計算咖啡
		var coffee = 0;
		for (var i = 0; i < shopPdTypeArray.length; ++i) {
		    if(shopPdTypeArray[i] == "咖啡"){
		    	coffee++;
		    }
		}
// 	    console.log(coffee);
	    
	  //計算咖啡豆
		var coffeebean = 0;
		for (var i = 0; i < shopPdTypeArray.length; ++i) {
		    if(shopPdTypeArray[i] == "咖啡豆"){
		    	coffeebean++;
		    }
		}
// 	    console.log(coffeebean);
	    	    
	    var data = [cake,coffee,coffeebean];
// 	    console.log(data);
	    
	    
		
		var ctx = $('#myChart');
		var myChart = new Chart(ctx, {
		  type: 'bar', //圖表類型
		  data: {
		    //標題
		    labels: ['蛋糕', '咖啡', '咖啡豆'],
		    datasets: [{
		      label: '商品類型', //標籤
		      data: data, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
// 		        'rgba(75, 192, 192, 0.2)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(255, 99, 132, 1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
// 		        'rgba(75, 192, 192, 1)'
		      ],
		      //外框線寬度
		      borderWidth: 1
		    }]
		  },
		  options: {
			legend: {
				display: false //標籤不顯示
			},
		    scales: {
		      yAxes: [{
		        ticks: {
		          beginAtZero: true,
		          responsive: true //符合響應式
		        }
		      }]
		    }
		    
		  }
		});	
				     		   
	},
	error: function() {
		console.log("error");
	}
});
//訂單資訊
//統計每個會員的訂單數
// var jsondata = JSON.parse(shopPdMember);
$.ajax({
	type:'post',
	url:'/admin/findAllShopOrder',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
// 		console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
// 		console.log("SUCCESS : ", parsedObjinArray);
		
		//訂單總數
		var orderlength = parsedObjinArray.length;
		$('.orderTotal').html(orderlength);
// 		console.log(orderlength);
		
		//shopOrderPrice陣列
		var shopOrderPrice = [];
		$.each(parsedObjinArray,function(i,n){
			var price = n.pdToTalPrice;
			shopOrderPrice.push(price);
		});
		
		
		//memberId陣列
		var shopOrderMemberId = [];
		$.each(parsedObjinArray,function(i,n){
			var memberId = n.member.id;
			shopOrderMemberId.push(memberId);
		});
// 		console.log(shopOrderMemberId);
		
		//計算總金額
		var totalprice = 0;
		for (var i = 0; i < shopOrderPrice.length; ++i) {
			totalprice+=shopOrderPrice[i];
		}
// 	    console.log(totalprice);
	    $('.orderTotalPrice').html(totalprice);

		//計算會員1有幾筆訂單
		var memberOnetotalOrder = 0;
		for (var i = 0; i < shopOrderMemberId.length; ++i) {
			if(shopOrderMemberId[i] == 1){
				memberOnetotalOrder++;
			}
		}
// 	    console.log(memberOnetotalOrder);	
	    
		//計算會員2有幾筆訂單
		var memberTwototalOrder = 0;
		for (var i = 0; i < shopOrderMemberId.length; ++i) {
			if(shopOrderMemberId[i] == 2){
				memberTwototalOrder++;
			}
		}
// 	    console.log(memberTwototalOrder);	
	    
	    	    
	    var data = [memberOnetotalOrder,memberTwototalOrder,orderlength];
// 	    console.log(data);
	    
		
		var ctx = $('#myChart1');
		var myChart = new Chart(ctx, {
		  type: 'bar', //圖表類型
		  data: {
		    //標題
		    labels: ['會員1','會員2','訂單總數'],
		    datasets: [{
		      label: '訂單總數', //標籤
		      data: data, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
// 		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(255, 99, 132, 1)',
		        'rgba(54, 162, 235, 1)',
// 		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)'
		      ],
		      //外框線寬度
		      borderWidth: 1
		    }]
		  },
		  options: {
			legend: {
				display: false //標籤不顯示
			},
		    scales: {
		      yAxes: [{
		        ticks: {
		          beginAtZero: true,
		          responsive: true //符合響應式
		        }
		      }]
		    }
		    
		  }
		});	
				     		   
	},
	error: function() {
		console.log("error");
	}
});
//圖表數據
//訂單評分
$.ajax({
	type:'post',
	url:'/admin/findAllShopPdMessaage',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
// 		console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
// 		console.log("SUCCESS : ", parsedObjinArray);
		
		//留言總數
		var pdMessagelength = parsedObjinArray.length;
// 		console.log(pdMessagelength);
		$('.shoppdMessage').html(pdMessagelength);
		
		//shopPdTypeArray陣列
		var shopPdMessageScore = [];
		$.each(parsedObjinArray,function(i,n){
			var score = n.shopPdMessageScore;
			shopPdMessageScore.push(score);
		});
		console.log(shopPdMessageScore);
		
		//計算1~5分各數
		var score1 = 0;
		var score2 = 0;
		var score3 = 0;
		var score4 = 0;
		var score5 = 0;
		for (var i = 0; i < shopPdMessageScore.length; ++i) {
		    if(shopPdMessageScore[i] == 1){
		    	score1++;
		    }else if(shopPdMessageScore[i] == 2){
		    	score2++;
		    }else if(shopPdMessageScore[i] == 3){
		    	score3++;
		    }else if(shopPdMessageScore[i] == 4){
		    	score4++;
		    }else if(shopPdMessageScore[i] == 5){
		    	score5++;
		    }
		}
	    console.log(score1);
	    console.log(score2);
	    console.log(score3);
	    console.log(score4);
	    console.log(score5);
	    
	    var data = [score1,score2,score3,score4,score5];
	    		
		var ctx = $('#myChart2');
		var myChart = new Chart(ctx, {
		  type: 'bar', //圖表類型
		  data: {
		    //標題
		    labels: ['一分', '二分', '三分','四分','五分'],
		    datasets: [{
		      label: '商品評分', //標籤
		      data: data, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(204, 206, 135, 0.3)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(255, 99, 132, 1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(204, 206, 135, 0.3)'
		      ],
		      //外框線寬度
		      borderWidth: 1
		    }]
		  },
		  options: {
			legend: {
				display: false //標籤不顯示
			},
		    scales: {
		      yAxes: [{
		        ticks: {
		          beginAtZero: true,
		          responsive: true //符合響應式
		        }
		      }]
		    }
		    
		  }
		});	
				     		   
	},
	error: function() {
		console.log("error");
	}
});



</script>

</body>
</html>
