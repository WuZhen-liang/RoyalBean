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
    <style>
	repeat {
	    display:inline;
	}
	
	repeat[n="1"]:before {
	   content: "★";
	}
	
	repeat[n="2"]:before {
	   content: "★★";
	}
	
	repeat[n="3"]:before {
	   content: "★★★";
	}
	
	repeat[n="4"]:before {
	   content: "★★★★";
	}
	
	repeat[n="5"]:before {
	   content: "★★★★★";
	}
	</style>

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

    

    <!-- Start OrderActivitys -->
    <div class="contact-box-main">
        <div class="container">
        	<div class="row">
        	<div class="col-lg-12 col-sm-12" style="font-size:36px;font-weight:bold;color:#8B4513;padding:30px">
        	${thisact.aName}
        	<hr>
        	<div class="row" style="font-size:20px;">
        	<div class="col-lg-4 col-sm-12"><i class="far fa-clock"></i>  行程時間  ${thisact.aTime}  分鐘</div>
        	<div class="col-lg-4 col-sm-12"><i class="fas fa-mobile-alt"></i>  現場請出示報名完成Mail</div>
        	<div class="col-lg-4 col-sm-12"><i class="fas fa-user-check"></i>  適合：${thisact.aTarget}</div>
        	</div>
        	<hr>
        	</div>
        	
        	</div>
        	
            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="contact-info-left" style="background:white" >
                        <ul>
                            <li>
                                <h5 style="font-size:20px"><i class="fas fa-home"></i>  活動門市：${thisact.activityStore.sName}</h5>
                            </li>
                            <li>
                                <h5 style="font-size:20px"><i class="fas fa-map-marker-alt"></i>    門市地址：${thisact.activityStore.sZip} ${thisact.activityStore.sCity} ${thisact.activityStore.sDistrict} ${thisact.activityStore.sAdd} </h5>
                            </li>
                            <li>
                                <h5 style="font-size:20px"><i class="fas fa-phone-square"></i>  門市電話：${thisact.activityStore.sPhone} </h5>
                            </li>
                        </ul>
                        </br>
                        <h2>活動說明</h2>
                        <p style="font-size:20px;text-align:justify;">${thisact.aContent}</p>
                        </br>
                        <h2>取消與更改</h2>
                        <br>
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
                        <div id="satavg"></div>
                        <div id="satbox"></div>
                    </div>
                </div>                
                
                
                <div class="col-lg-4 col-sm-12">
                    <div class="contact-info-right" style="background:#FFFAF0;padding:15px">
                    	
                        <div class="type-lb" style="padding:15px">
                            <p class="sale">即刻預定</p>
                        </div>
                        
                    	<img src="${thisact.aPhoto}" class="img-fluid" alt="Image">
						<hr>						
                        
                        <h2>預約報名  <button id="orderinsertval" class="btn btn-outline-warning">一鍵輸入</button></h2>
                                           
                        <form:form class="needs-validation" action="ordersubmit" modelAttribute="activity/activityOrder">
                        <form:input type="hidden" path="member" value="${thismem.id}"/>
						<form:input type="hidden" path="activity" value="${thisact.aId}"/>
                    
                            <div class="row">                            
                                <div class="col-md-12">
                                	<form:label path="aResDate">選擇日期 *</form:label>
									<form:input type="date" class="form-control" id="aResDate" path="aResDate"/> 
                                    
                                </div>
                                
                                <div class="col-md-12">
                                	<form:label path="aResTime">選擇時間 *</form:label>
									<form:input type="time" class="form-control" path="aResTime" id="aResTime"/>                                    
                                </div>
                                
                                <div class="col-md-12">
                                	<form:label path="aoName">真實姓名 *</form:label>
									<form:input class="form-control" path="aoName" id="aoName"/>                                  
                                </div>
                                
                                <div class="col-md-12">
                                	<form:label path="aoEmail">E-mail *</form:label>
									<form:input class="form-control" path="aoEmail" id="aoEmail"/>                                  
                                </div>
                                
                                <div class="col-md-12">
                                	<form:label path="aoPhone">電話 *</form:label>
									<form:input class="form-control" path="aoPhone" id="aoPhone"/>                                  
                                </div>
                                
                                <div class="col-md-12">
                                	<form:label path="aoGender">性別 *</form:label>
									<form:input class="form-control" path="aoGender" id="aoGender"/>                                  
                                </div>
                                
                                <div class="col-md-12">
                                	<form:label path="aoAge">年齡 *</form:label>
									<form:input class="form-control" path="aoAge" id="aoAge"/>                                  
                                </div>                             
                                                                                          		
                                <div class="col-md-12">
                                	<div style="text-align:right;padding:0px 0px 10px 0px;">                                   
                                    <hr>
                                    結帳金額：$  ${thisact.aPrice}
                                    <input type="hidden" id="aoPrice" class="form-control" name="aoPrice" value="${thisact.aPrice}">                                    
                                    </div>                                     
                                </div>
                                
                                <div class="col-md-12" style="text-align:right;">
                                	<form:button class="ml-auto btn hvr-hover" value="Send">
										<P style="color: #FFF8DC;">確認結帳</P>
									</form:button>                                
                                </div>                                
                                
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End OrderActivitys  -->

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
    
    //評論Ajax查詢
    $(function() {
    	var aid = ${thisact.aId};
    	console.log(aid);
    	$.ajax({
			   type:'post',
			   url:'/satisfactionAjax/' + aid,
			   dataType:'JSON', //送回JSON
			   
			   success: function(data) {
						   var json = JSON.stringify(data, null, 4);
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);
						   
 						   if(json=='[]'){
 				     			$('#satbox').prepend("<div style='font-size:18px'>目前尚無評論<div>");
 				     	   }else{
				     		  var satbox = $('#satbox');
				     		  var total = 0.0;
				     		  var size = parsedObjinArray.length;
						   $.each(parsedObjinArray,function(i,n){
							   var score = (n.asPlace + n.asPrice + n.asProduct + n.asRevisit + n.asTeacher)/5;
							   total += score;
							   console.log(score.toFixed(1));
							   var s =
								   "<div class='border border-light' style='margin:10px 0px 10px 0px;border-radius:10px;padding:20px;background:#F5F5F5;font-size:18px'>"+
								   "<table style='width:650px;table-layout:fixed'>"+
								   "<tr><td colspan='4'><i class='far fa-user-circle' style='font-size:30px'></i>  活動訂單："+n.activityOrder.aoId+"</td><td colspan='1' align='right'><h1 style='color:#FFBB00'>  "+score.toFixed(1)+"  </h1></td></tr>"+
								   "<tr><td colspan='5'><hr></td></tr>"+
								   "<tr><td>環境  <repeat n='"+n.asPlace+"'style='color:#FFCC22'></repeat></td>"+
								   "<td>價格  <repeat n='"+n.asPrice+"'style='color:#FFCC22'></repeat></td>"+
								   "<td>內容  <repeat n='"+n.asProduct+"'style='color:#FFCC22'></repeat></td>"+
								   "<td>再訪  <repeat n='"+n.asRevisit+"'style='color:#FFCC22'></repeat></td>"+
								   "<td>師資  <repeat n='"+n.asTeacher+"'style='color:#FFCC22'></repeat></td>"+
								   "<tr><td colspan='5'><i class='fas fa-comment-dots'></i> "+n.asContent+"</td></tr>"+
								   "<tr><td colspan='5' align='right'>於  "+n.asDate+"  評論</td></tr></table>"+
								   "</div>";							   
								
			                satbox.append(s);
			           
					   });
						   var avg = total/size; 
						   console.log(avg.toFixed(1));
						   $('#satavg').prepend("<table style='width:680px;table-layout:fixed'><tr><td><h2>活動評論</h2></td><td align='right'><span style='font-size:40px;color:#FFCC22'>"+avg.toFixed(1)+"</span>  ("+size+")</td></td></tr></table>");
				    }		   
				},
				error: function() { 
					console.log("search結果:null");
				}
				
			});
    });
	
    //一鍵輸入
    $('#orderinsertval').click(function () {
		$('#aResDate').val("2021-10-10");
		$('#aResTime').val("13:00");
		$('#aoName').val("艾菲爾");
		$('#aoEmail').val("eeit12902@gmail.com");
		$('#aoPhone').val("0900000000");
		$('#aoGender').val("female");
		$('#aoAge').val("26-30");
	})
	
    </script>
    
</body>

</html>