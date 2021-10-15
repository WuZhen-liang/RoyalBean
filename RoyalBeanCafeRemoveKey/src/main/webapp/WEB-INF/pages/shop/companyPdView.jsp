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
    <title>ActivityStore</title>
 
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

    <!-- 門市總表Start -->
    <div class="latest-blog">
        <div class="container" style="font-size:16.5px">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>實體門市資訊管理</h1>
                        -請新增並定期更新您所有實體門市資訊，RoyalBeanCafe將協助您增加曝光-
                    </div>
                </div>
            </div>
            
            <ul id="storetitle" class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="shopSearch">門市總表</a>
			  </li>
<!-- 			  <li class="nav-item"> -->
<!-- 			    <a class="nav-link" aria-current="page" href="activityStoreAdd">新增門市</a> -->
<!-- 			  </li> -->
<!-- 			  <li class="nav-item"> -->
<!-- 				  <form class="d-flex"> -->
<!-- 			        <input id="searchName" class="form-control me-2" type="text" placeholder="Search" aria-label="Search"> -->
<!-- 			        <button id="searchNameAction" class="btn btn-secondary" type="button">Search</button> -->
<!-- 			      </form> -->
<!-- 		      </li> -->
			</ul>
			
		<div style="padding:20px 0px 20px 0px;">
            <table id="aStoreList" class="display">
				  
				  <thead>
				    <tr>
				      <th scope="col">商品編號</th>
				      <th scope="col">名稱</th>
				      <th scope="col">照片</th>
				      <th scope="col">價</th>
				      <th scope="col">新增活動</th>
				      <th scope="col">更新日期</th>
				    </tr>
				  </thead>
				  
				  <tbody>
				    <c:forEach var="shopSearchResult" items="${shopSearchResult}">				    
				    <tr>
				      <th scope="row">${shopSearchResult.shopPdNumber}</th>
				      <td>${shopSearchResult.shopPdName}</td>
<%-- 				      <td><img src="${shopSearchResult.shopPdPicture}" style="width: 50px" height="50px"></td> --%>
				      <td><a href="storeupdate${shopSearchResult.shopPdNumber}"><button type='button' class='btn btn-outline-warning'><i class='fa fa-pencil-square-o'/></button></a></td>
				      <td><button type='button' class='btn btn-outline-danger' id="${actstores.sId}" value="${actstores.sId}"><i class='far fa-trash-alt'/></button></td>
				      <td><a href="activityadd${shopSearchResult.shopPdNumber}"><button type='button' class='btn btn-outline-info'><i class="fas fa-calendar-alt"/></button></a></td>
				      <td>${actstores.editDate}</td>
				    </tr>
				    
				    <script type="text/javascript">
 				    $('#'+${actstores.sId}).click(	function () {
 					     			var deleteID = $('#'+${actstores.sId}).val();
 						     		console.log(deleteID); 
						     		swal.fire({ 
 						     			title: 'Are you sure?', 
 						     			text: "You won't be able to revert this!", 
 						     			icon: 'warning', 
 						     			showCancelButton: true, 
 						     			confirmButtonColor: '#D2691E', 
 						     			cancelButtonColor: '#A9A9A9', 
 						     			confirmButtonText: 'Delete' 
 						     		}).then((result) => { 
 						     			  if (result.isConfirmed) { 
 						     				 $.ajax({ 
 								     	            url: '/storedelete' + deleteID , 
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
    <!-- 門市總表End -->

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
    	$('#aStoreList').DataTable( {    		
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

		
/*-----------------------------------------------------------------------------------------------------------------------------------------		
		$('#searchNameAction').click(function () {
			$('#pagebutton').hide();
			$('#totalElements').hide();
			
	    	var findByName = $('#searchName').val();
			console.log(findByName);
			$.ajax({
				   type:'post',
				   url:'/activityStorefindbyname/' + findByName,
				   dataType:'JSON', //送回JSON
				   //contentType:'', //送出JSON
				   success: function(data) { //成功呼叫function帶入data
							   var json = JSON.stringify(data, null, 4); //JSON.stringify()將data物件轉變為JSON字串, 每一資料佔 4 bytes
							   console.log("SUCCESS : ", json);
							   var parsedObjinArray = JSON.parse(json);  //JSON.parse()接收JSON字串，轉為Javascript物件陣列
				     
				     		   $('#aStoreList').empty(""); //清空table內的資料
						       $('#searchli').remove();
			     
						       if(json=null){
						         $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
						       }else{
						         var table = $('#aStoreList');
						         table.append("<thead><tr><th scope='col'>門市編號</th><th scope='col'>門市名稱</th><th scope='col'>更新日期</th><th scope='col'>編輯</th><th scope='col'>刪除</th></tr></thead>");
						         $.each(parsedObjinArray,function(i,n){
						            var tr = "<tbody><tr>" + 
						            		 "<th scope='row'>" + n.sId + "</th>" +
						                     "<td>" + n.sName + "</td>" + 
						                     "<td>" + n.editDate + "</td>" +
						                     "<td><a href=" + '/activity/update' + n.sId + "><button type='button' class='btn btn-light'><i class='fa fa-pencil-square-o'/></button></a></td>" +  
						                     "<td><button type='button' class='btn btn-light' id="+ n.sId +" value="+ n.sId +"><i class='far fa-trash-alt'/></button></td>" +
						                     "</tr></tbody>";
						           table.append(tr);
						           $("#"+n.sId+"").click(			     		
								     		function confirmDelete() {
								     			var deleteID = $("#"+n.sId+"").val();
									     		console.log(deleteID);
									     		swal.fire({
									     			title: 'Are you sure?',
									     			text: "You won't be able to revert this!",
									     			icon: 'warning',
									     			showCancelButton: true,
									     			confirmButtonColor: '#D2691E',
									     			cancelButtonColor: '#A9A9A9',
									     			confirmButtonText: 'Delete'
									     		}).then((result) => {
									     			  if (result.isConfirmed) {
									     				 $.ajax({
											     	            url: '/activity/' + deleteID ,
											     	            type: "POST",
											     	            success: function () {
											     	                swal.fire({
											     	                	  position: 'top',
											     	                	  icon: 'success',
											     	                	  title: 'ID: '+ deleteID + ' has been deleted',
											     	                	  showConfirmButton: false,
											     	                	  timer: 1500
											     	                	});
											     	               load(indexPage);
											     	               $('#pagebutton').show();
											     	  			   $('#totalElements').show();
											     	  			   $('#searchli').remove();											 
											     	            }
											     	        });						     				  
									     			  }
									     		});
								     	});
						           
						       	   });
				    		}
						    var searchElements = $('tbody').children('tr').length-1;
						    $('#storetitle').append("<li id='searchli'><p style='width:165px;color:#8B4513;font-weight:bold' align='right'>查詢到："+ searchElements +"筆資料</p></li>");
					},
					error: function() {
						$('#aStoreList').empty("");
						$('#searchli').remove();
						$('#aStoreList').prepend("<tr><td colspan='2'>查無資料</td></tr>");
					    console.log("error");
					}
				});
-----------------------------------------------------------------------------------------------------------------------------------------*/		
		
    </script>
    
</body>

</html>