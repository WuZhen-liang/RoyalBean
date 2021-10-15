<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Royal Staff</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- Ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
</head>

<body class="hold-transition sidebar-mini">

<!-- 管理員登入後header -->
<%@include file="/WEB-INF/pages/headerfooter/backheader.jsp"%>	
<!-- 管理員登入後header -->

<!-- 內容開始 -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!-- Content Header (Page header) -->
    
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>活動數據分析</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item active">活動數據分析</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
    <!-- 圖表開始 -->
    <section class="content">
    <div class="container-fluid">
    
    <!-- Small boxes (Start) -->
        <div class="row">
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3 id="storetotal"></h3>
                <p>門市總計</p>
              </div>
              <div class="icon">
				<i class="fas fa-store"></i>
              </div>
              <a href="store" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3 id="acttotal"></h3>
                <p>活動總計</p>
              </div>
              <div class="icon">
                <i class="fas fa-calendar-alt"></i>
              </div>
              <a href="activity" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3 id="sales"></h3>
                <p>營業額</p>
              </div>
              <div class="icon">
                <i class="fas fa-dollar-sign"></i>
              </div>
              <a href="activityorder" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3 id="avgsat"></h3>
                <p>綜合評價</p>
              </div>
              <div class="icon">
                <i class="fas fa-star-half-alt"></i>
              </div>
              <a href="activitysatisfaction" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          
        </div>
    <!-- Small boxes (End) -->
    
        <div class="row">
        	<div class="col-md-6">        	
        	<div class="card card-info">
        		<div class="card-header" style="background-color:#343a40">
                	<h3 class="card-title" style="font-size:24px" > <a id="download" download="ChartImage.jpg" href="" class="btn btn-primary" title="Descargar Gráfico"><i class="fa fa-download"></i></a>
                	門市區域分布圖 </h3>
     			</div>
     			<div class="card-body">
	                <div class="chart">
	     	    	<canvas id="storeChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
		     	    </div>
	     		</div>
     		</div>     		
     		</div>
     		
        	<div class="col-md-6">        	
        	<div class="card card-info">
        		<div class="card-header" style="background-color:#343a40">
                	<h3 class="card-title" style="font-size:24px"> <a id="download1" download="ChartImage.jpg" href="" class="btn btn-primary" title="Descargar Gráfico"><i class="fa fa-download"></i></a>
                	活動類型比例圖</h3>
     			</div>
     			<div class="card-body">
	                <div class="chart">
	     	    	<canvas id="activityChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
		     	    </div>
	     		</div>
     		</div>     		
     		</div>
        </div>
        
        <div class="row">
        	<div class="col-md-6">        	
        	<div class="card card-info">
        		<div class="card-header" style="background-color:#343a40"> 
                	<h3 class="card-title" style="font-size:24px"> <a id="download2" download="ChartImage.jpg" href="" class="btn btn-primary" title="Descargar Gráfico"><i class="fa fa-download"></i></a>
                	 顧客性別比</h3>
     			</div>
     			<div class="card-body">
	                <div class="chart">
	     	    	<canvas id="genderChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
		     	    </div>
	     		</div>
     		</div>     		
     		</div>
     		
        	<div class="col-md-6">        	
        	<div class="card card-info">
        		<div class="card-header" style="background-color:#343a40">
                	<h3 class="card-title" style="font-size:24px" > <a id="download3" download="ChartImage.jpg" href="" class="btn btn-primary" title="Descargar Gráfico"><i class="fa fa-download"></i></a>
                	 顧客年齡層</h3>
     			</div>
     			<div class="card-body">
	                <div class="chart">
	     	    	<canvas id="ageChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
		     	    </div>
	     		</div>
     		</div>     		
     		</div>
        </div>
        
        <div class="row">
        	<div class="col-md-12">        	
        	<div class="card card-info">
        		<div class="card-header" style="background-color:#343a40">
                	<h3 class="card-title" style="font-size:24px"> <a id="download4" download="ChartImage.jpg" href="" class="btn btn-primary" title="Descargar Gráfico"><i class="fa fa-download"></i></a>
                	顧客滿意度分析</h3>
     			</div>
     			<div class="card-body">
	                <div class="chart">
	     	    	<canvas id="satChart"></canvas>
		     	    </div>
	     		</div>
     		</div>     		
     		</div>        	
        </div>
        
     </div>
     
    </section>
    <!-- 圖表結束 --> 
       
  <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <!-- 內容結束 -->
  
  <!-- footer -->
      <%@include file="/WEB-INF/pages/headerfooter/backfooter.jsp"%>	
  <!-- footer -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->


<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
<!-- Page specific script -->

<script>

//Download Chart Image
document.getElementById("download").addEventListener('click', function(){
  /*Get image of canvas element*/
  var url_base64jp = document.getElementById("storeChart").toDataURL("image/jpg");
  /*get download button (tag: <a></a>) */
  var a =  document.getElementById("download");
  /*insert chart image url to download button (tag: <a></a>) */
  a.href = url_base64jp;
});


document.getElementById("download1").addEventListener('click', function(){
  var url_base64jp = document.getElementById("activityChart").toDataURL("image/jpg");
  var a =  document.getElementById("download1");
  a.href = url_base64jp;
});

document.getElementById("download2").addEventListener('click', function(){
  var url_base64jp = document.getElementById("genderChart").toDataURL("image/jpg");
  var a =  document.getElementById("download2");
  a.href = url_base64jp;
});

document.getElementById("download3").addEventListener('click', function(){
  var url_base64jp = document.getElementById("ageChart").toDataURL("image/jpg");
  var a =  document.getElementById("download3");
  a.href = url_base64jp;
});

document.getElementById("download4").addEventListener('click', function(){
  var url_base64jp = document.getElementById("satChart").toDataURL("image/jpg");
  var a =  document.getElementById("download4");
  a.href = url_base64jp;
});




//門市數據
$.ajax({
	type:'post',
	url:'/admin/getstoresdata',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
		//console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
		console.log("SUCCESS : ", parsedObjinArray);
		
		//門市總數
		var slength = parsedObjinArray.length;
		console.log(slength);
		$('#storetotal').text(slength);
		
		//sCity陣列
		var cityArray = [];
		$.each(parsedObjinArray,function(i,n){
			var city = n.sCity;
			cityArray.push(city);
		});
		console.log(cityArray);
		
		//計算北部
		var north = 0;
		for (var i = 0; i < cityArray.length; ++i) {
		    if(cityArray[i] == "臺北市"||cityArray[i] == "新北市"||cityArray[i] == "基隆市"||cityArray[i] == "宜蘭縣"||cityArray[i] == "新竹市"||cityArray[i] == "新竹縣"||cityArray[i] == "桃園市"){
		    	north++;
		    }
		}
	    console.log(north);
	    
	  //計算中部
		var central = 0;
		for (var i = 0; i < cityArray.length; ++i) {
		    if(cityArray[i] == "苗栗縣"||cityArray[i] == "臺中市"||cityArray[i] == "彰化縣"||cityArray[i] == "南投縣"||cityArray[i] == "雲林縣"||cityArray[i] == "金門縣"){
		    	central++;
		    }
		}
	    console.log(central);
	    
	  //計算南部
		var south = 0;
		for (var i = 0; i < cityArray.length; ++i) {
		    if(cityArray[i] == "嘉義縣"||cityArray[i] == "嘉義市"||cityArray[i] == "台南市"||cityArray[i] == "高雄市"||cityArray[i] == "屏東縣"||cityArray[i] == "澎湖縣"){
		    	south++;
		    }
		}
	    console.log(south);
	    
	  //計算東部
		var east = 0;
		for (var i = 0; i < cityArray.length; ++i) {
		    if(cityArray[i] == "臺東縣"||cityArray[i] == "花蓮縣"){
		    	east++;
		    }
		}
	    console.log(east);
	    
	    var northpercent = ((north/slength)*100).toFixed(2);
	    console.log(northpercent);
	    var centralpercent = ((central/slength)*100).toFixed(2);
	    console.log(centralpercent);
	    var southpercent = ((south/slength)*100).toFixed(2);
	    console.log(southpercent);
	    var eastpercent = ((east/slength)*100).toFixed(2);
	    console.log(eastpercent);
	    
	    var data = [northpercent,centralpercent,southpercent,eastpercent];
	    console.log(data);
		
		var ctx = $('#storeChart');
		var storeChart = new Chart(ctx, {
		  type: 'doughnut', //圖表類型
		  data: {
		    //標題
		    labels: ['北部', '中部', '南部', '東部'],
		    datasets: [{
		      label: '門市總數', //標籤
		      data: data, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(255, 99, 132, 1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)'
		      ],
		      //外框線寬度
		      borderWidth: 2
		    }]
		  },
		});					     		   
	},
	error: function() {
		console.log("error");
	}
});

//活動數據
$.ajax({
	type:'post',
	url:'/admin/getactsdata',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
		//console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
		console.log("SUCCESS : ", parsedObjinArray);
		
		//活動總數
		var alength = parsedObjinArray.length;
		console.log(alength);
		$('#acttotal').text(alength);
		
		//aCategory陣列
		var categoryArray = [];
		$.each(parsedObjinArray,function(i,n){
			var category = n.aCategory;
			categoryArray.push(category);
		});
		console.log(categoryArray);
		
		//計算DIY體驗
		var diy = 0;
		for (var i = 0; i < categoryArray.length; ++i) {
		    if(categoryArray[i] == "DIY體驗"){
		    	diy++;
		    }
		}
	    console.log(diy);
	    
		//計算咖啡品嘗
		var taste = 0;
		for (var i = 0; i < categoryArray.length; ++i) {
		    if(categoryArray[i] == "咖啡品嘗"){
		    	taste++;
		    }
		}
	    console.log(taste);
	    
		//計算職人課程
		var professor = 0;
		for (var i = 0; i < categoryArray.length; ++i) {
		    if(categoryArray[i] == "職人課程"){
		    	professor++;
		    }
		}
	    console.log(professor);
	    
	    var diypercent = ((diy/alength)*100).toFixed(2);
	    console.log(diypercent);
	    var tastepercent = ((taste/alength)*100).toFixed(2);
	    console.log(tastepercent);
	    var professorpercent = ((professor/alength)*100).toFixed(2);
	    console.log(professorpercent);
	  	    
	    var data = [diypercent,tastepercent,professorpercent];
	    console.log(data);
	    
		
		var ctx = $('#activityChart');
		var activityChart = new Chart(ctx, {
		  type: 'doughnut', //圖表類型
		  data: {
		    //標題
		    labels: ['DIY體驗類', '咖啡品嘗類', '職人課程類'],
		    datasets: [{
		      label: '活動種類', //標籤
		      data: data, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 206, 86, 0.2)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(255, 99, 132, 1)',
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 206, 86, 1)'
		      ],
		      //外框線寬度
		      borderWidth: 2
		    }]
		  }
		});				     		   
	},
	error: function() {
		console.log("error");
	}
});

//訂單男女比數據
$.ajax({
	type:'post',
	url:'/admin/getordersdata',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
		//console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
		console.log("SUCCESS : ", parsedObjinArray);
		
		//訂單總數
		var olength = parsedObjinArray.length;
		console.log(olength);
		
		//營業額計算
		var sales = 0;
		$.each(parsedObjinArray,function(i,n){
			var sale = Number(n.aoPrice);
			sales=sales+sale;
		});
		sales = Number(parseFloat(sales).toFixed(0)).toLocaleString("en", {minimumFractionDigits: 0 })
		console.log(sales);
		$('#sales').append(sales+"  <sup style='font-size: 20px'>元</sup>");
		
		//aoGender陣列
		var genderArray = [];
		$.each(parsedObjinArray,function(i,n){
			var gender = n.aoGender;
			genderArray.push(gender);
		});
		console.log(genderArray);
		
		//計算男生
		var male = 0;
		for (var i = 0; i < genderArray.length; ++i) {
		    if(genderArray[i] == "male"){
		    	male++;
		    }
		}
	    console.log(male);
	    
		//計算女生
		var female = 0;
		for (var i = 0; i < genderArray.length; ++i) {
		    if(genderArray[i] == "female"){
		    	female++;
		    }
		}
	    console.log(female);
	  
	    var malepercent = ((male/olength)*100).toFixed(2);
	    console.log(malepercent);
	    var femalepercent = ((female/olength)*100).toFixed(2);
	    console.log(femalepercent);
	    
	    var data = [malepercent,femalepercent];
	    console.log(data);
		
		var ctx = $('#genderChart');
		var genderChart = new Chart(ctx, {
		  type: 'doughnut', //圖表類型
		  data: {
		    //標題
		    labels: ['男性', '女性'],
		    datasets: [{
		      label: '男女比', //標籤
		      data: data, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 99, 132, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)'
		      ],
		      //外框線寬度
		      borderWidth: 2
		    }]
		  },
		});					     		   
	},
	error: function() {
		console.log("error");
	}
});

//訂單年齡數據
$.ajax({
	type:'post',
	url:'/admin/getordersdata',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
		//console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
		console.log("SUCCESS : ", parsedObjinArray);
		
		//訂單總數
		var olength = parsedObjinArray.length;
		console.log(olength);
				
		//aoAge陣列
		var ageArray = [];
		$.each(parsedObjinArray,function(i,n){
			var age = n.aoAge;
			ageArray.push(age);
		});
		console.log(ageArray);
		
		//計算'20(含)以下'
		var age20 = 0;
		for (var i = 0; i < ageArray.length; ++i) {
		    if(ageArray[i] == "20(含)以下"){
		    	age20++;
		    }
		}
	    console.log(age20);
	    
		//計算'21-25'
		var age2125 = 0;
		for (var i = 0; i < ageArray.length; ++i) {
		    if(ageArray[i] == "21-25"){
		    	age2125++;
		    }
		}
	    console.log(age2125);
	    
		//計算'26-30'
		var age2630 = 0;
		for (var i = 0; i < ageArray.length; ++i) {
		    if(ageArray[i] == "26-30"){
		    	age2630++;
		    }
		}
	    console.log(age2630);
	    
		//計算'31-35'
		var age3135 = 0;
		for (var i = 0; i < ageArray.length; ++i) {
		    if(ageArray[i] == "31-35"){
		    	age3135++;
		    }
		}
	    console.log(age3135);
	    
		//計算'36-40'
		var age3640 = 0;
		for (var i = 0; i < ageArray.length; ++i) {
		    if(ageArray[i] == "36-40"){
		    	age3640++;
		    }
		}
	    console.log(age3640);
	    
		//計算'41-45'
		var age4145 = 0;
		for (var i = 0; i < ageArray.length; ++i) {
		    if(ageArray[i] == "41-45"){
		    	age4145++;
		    }
		}
	    console.log(age4145);
	    
		//計算'46-50'
		var age4650 = 0;
		for (var i = 0; i < ageArray.length; ++i) {
		    if(ageArray[i] == "46-50"){
		    	age4650++;
		    }
		}
	    console.log(age4650);
	    
		//計算'51(含)以上'
		var age51 = 0;
		for (var i = 0; i < ageArray.length; ++i) {
		    if(ageArray[i] == "51(含)以上"){
		    	age51++;
		    }
		}
	    console.log(age51);
	  
	    var age20percent = ((age20/olength)*100).toFixed(2);
	    console.log(age20percent);
	    var age2125percent = ((age2125/olength)*100).toFixed(2);
	    console.log(age2125percent);
	    var age2630percent = ((age2630/olength)*100).toFixed(2);
	    console.log(age2630percent);
	    var age3135percent = ((age3135/olength)*100).toFixed(2);
	    console.log(age3135percent);
	    var age3640percent = ((age3640/olength)*100).toFixed(2);
	    console.log(age3640percent);
	    var age4145percent = ((age4145/olength)*100).toFixed(2);
	    console.log(age4145percent);
	    var age4650percent = ((age4650/olength)*100).toFixed(2);
	    console.log(age4650percent);
	    var age51percent = ((age51/olength)*100).toFixed(2);
	    console.log(age51percent);
	    
	    var data = [age20percent,age2125percent,age2630percent,age3135percent,age3640percent,age4145percent,age4650percent,age51percent];
	    console.log(data);
		
		var ctx = $('#ageChart');
		var ageChart = new Chart(ctx, {
		  type: 'line', //圖表類型
		  data: {
		    //標題
		    labels: ['20(含)以下', '21-25','26-30','31-35','36-40','41-45','46-50','51(含)以上'],
		    datasets: [{
		      label: '年齡層', //標籤
		      data: data, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(255, 228, 11, 0.2)',
		        'rgba(255, 240, 15, 0.2)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 99, 132, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)',
		        'rgba(210, 105, 1, 1)',
		        'rgba(255, 105, 11, 1)'
		      ],
		      //外框線寬度
		      borderWidth: 2
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

//評論數據
$.ajax({
	type:'post',
	url:'/admin/satisfactionsdata',
	dataType:'JSON', //送回JSON
	success: function(data) { //成功呼叫function帶入data
		var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
		//console.log("SUCCESS : ", json);
		var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
		console.log("SUCCESS : ", parsedObjinArray);
		
		//評論總數
		var salength = parsedObjinArray.length;
		console.log(salength);
		
		//總評分計算
		var grades = 0;
		$.each(parsedObjinArray,function(i,n){
			var grade = n.asPlace + n.asPrice + n.asProduct + n.asRevisit + n.asTeacher;
			grades=grades+grade;
		});
		var avggrades = (grades/salength/5).toFixed(2);
		console.log(avggrades);
		$('#avgsat').append(avggrades+"  <sup style='font-size: 20px'>顆星</sup>");
		
		//場域舒適度
		var places = 0;
		$.each(parsedObjinArray,function(i,n){
			var place = n.asPlace;
			places=places+place;
		});
		var avgplaces = (places/salength).toFixed(2);
		console.log(avgplaces);
		
		//價格接受度
		var prices = 0;
		$.each(parsedObjinArray,function(i,n){
			var price = n.asPrice;
			prices=prices+price;
		});
		var avgprices = (prices/salength).toFixed(2);
		console.log(avgprices);
		
		//內容豐富度
		var products = 0;
		$.each(parsedObjinArray,function(i,n){
			var product = n.asProduct;
			products=products+product;
		});
		var avgproducts = (products/salength).toFixed(2);
		console.log(avgproducts);
		
		//再訪意願度
		var revisits = 0;
		$.each(parsedObjinArray,function(i,n){
			var revisit = n.asRevisit;
			revisits=revisits+revisit;
		});
		var avgrevisits = (revisits/salength).toFixed(2);
		console.log(avgrevisits);
		
		//講師專業度
		var teachers = 0;
		$.each(parsedObjinArray,function(i,n){
			var teacher = n.asTeacher;
			teachers=teachers+teacher;
		});
		var avgteachers = (teachers/salength).toFixed(2);
		console.log(avgteachers);
	    
	    var data = [avgplaces,avgprices,avgproducts,avgrevisits,avgteachers];
	    console.log(data);
		
		var ctx = $('#satChart');
		var satChart = new Chart(ctx, {
		  type: 'radar', //圖表類型
		  data: {
		    //標題
		    labels: ['場域舒適度', '價格接受度','內容豐富度','再訪意願度','講師專業度'],
		    datasets: [{
		      label: '顧客滿意度分析', //標籤
		      
		      data: data, //資料
		      //圖表背景色
		      backgroundColor: [
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(255, 206, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(153, 102, 255, 0.2)'
		      ],
		      //圖表外框線色
		      borderColor: [
		        'rgba(54, 162, 235, 1)',
		        'rgba(255, 99, 132, 1)',
		        'rgba(255, 206, 86, 1)',
		        'rgba(75, 192, 192, 1)',
		        'rgba(153, 102, 255, 1)'
		      ],
		      //外框線寬度
		      borderWidth: 2
		    }]
		  },
		  options: {
		    scale: {
			    ticks: {
			        beginAtZero: true,
			        max: 5,
			        min: 0,
			        stepSize: 1
			    },
			    pointLabels: {
		            fontSize: 15
		        }
			},
			legend: {
				display: false //標籤不顯示
			},
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
