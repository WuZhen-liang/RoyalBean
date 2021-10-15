<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Activity</title>
 
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
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/jquery.dataTables.min.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	
	<!-- 廠商登入後header -->
	<%@include file="/WEB-INF/pages/headerfooter/venderheader.jsp"%>
	<!-- 廠商登入後header --> 

    <!-- 活動總表Start -->
    <div class="latest-blog">
        <div class="container" style="font-size:16.5px">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>活動管理</h1>
                        -請新增並定期更新您所有活動資訊，RoyalBeanCafe將協助您增加曝光-
                    </div>
                </div>
            </div>
            
            <ul id="storetitle" class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="activity">活動總表</a>
			  </li>
			</ul>
			
			<div style="padding:20px 0px 20px 0px;">
            <table id="activityList" class="table table-hover display">
				  
				  <thead>
				    <tr>
				      <th scope="col">活動編號</th>
				      <th scope="col">活動名稱</th>
				      <th scope="col">舉辦門市</th>
				      <th scope="col">活動編輯</th>
				      <th scope="col">活動刪除</th>
				      <th scope="col">更新日期</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach var="actlist" items="${actlist}">
				    <tr>
				      <th scope="row">${actlist.aId}</th>
				      <td>${actlist.aName}</td>
				      <td>${actlist.activityStore.sName}</td>
				      <td><a href="activityupdate${actlist.aId}"><button type='button' class='btn btn-outline-warning'><i class='fa fa-pencil-square-o'/></button></a></td>
				      <td><button type='button' class='btn btn-outline-danger' id="${actlist.aId}" value="${actlist.aId}"><i class='far fa-trash-alt'/></button></td>
				      <td>${actlist.aDate}</td>
				    </tr>
				    
				    <script type="text/javascript">
				    $('#'+${actlist.aId}).click(function () {
					     var deleteID = $('#'+${actlist.aId}).val();
						 console.log(deleteID);
						 swal.fire({
						 	title: '確認要刪除活動：'+deleteID+'?',
						    text: "(請e-mail通知已預約該活動之顧客)",
						    icon: 'warning',
						    showCancelButton: true,
						    confirmButtonColor: '#D2691E',
						    cancelButtonColor: '#A9A9A9',
						    confirmButtonText: 'Delete'
						 }).then((result) => {
						    if (result.isConfirmed) {
						     	$.ajax({
									url: '/activitydelete' + deleteID ,
								    type: "POST",
								    success: function () {
								     	     	swal.fire({
									     	        position: 'top',
									     	        icon: 'success',
									     	        title: 'ID: '+ deleteID + ' has been deleted',
									     	        showConfirmButton: false,
									     	        timer: 1500
								     	        });
								     	        location.reload()
								     	     }
								});						     				  
							}
						});
					});
				    </script>
				    
				    </c:forEach>
				    
				  </tbody>
				   
				</table>
			</div>
        </div>
    </div>
    <!-- End MT  -->

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
    	$('#activityList').DataTable( {    		
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