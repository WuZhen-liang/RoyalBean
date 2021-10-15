<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>RoyalBeanCafe</title>
 
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



<script type="text/javascript">
/*$(document).ready( function () {
	$('#article').DataTable( {
		
	    ajax:{
	    url:'./findallarticle',
	    dataSrc:'',
	    },
	    columns: [
	        { data: 'articletype' },
	        { data: 'articletitle' },
	        { data: 'CID' },
	        { data: 'articletime' },
	       // { data: null, "defaultContent": "<a href='findartid.index'><button type='button' class='btn btn-outline-warning'><i class='fa fa-pencil-square-o'></i></button>"  },
	    ],
	  //  <a href='findartid.index'><button type='button' class='btn btn-outline-warning'><i class='fa fa-pencil-square-o'></i></button>
	 // <form action='findartid.index' method='post'><input hidden name='uptID' value='${article.articleid}' /><button class='btn btn-info btn-sm' value='瀏覽' type='submit'>瀏覽</button></form>"
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
});*/

var indexPage = 1;
//var addbtn = document.getElementById('addarticle');
//var member = document.getElementById('member');
$(document).ready(function(){
    load(indexPage);
    //console.log($("#member").val());
  // adddisplay();
});



function change(page){
   indexPage = page;
  load(indexPage);
}

function load(indexPage){
$.ajax({
   type:'post',
   url:'/queryallarticlebypage/' + indexPage,
   dataType:'JSON',
   contentType:'application/json',
   success: function(data) {
     var json = JSON.stringify(data, null, 4);
     console.log("SUCCESS : ", json);
     var parsedObjinArray = JSON.parse(json);
     $('#showQA').empty(""); //清空table內的資料
       if(json=null){
         $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
       }else{
         var table = $('#showQA');
         table.append("<tr id='ptitle' style='font-size:20px'><th style='width:10%'>文章類型</th><th style='width:30%'>標題</th><th>編輯者</th><th style='width:20%'>新增時間</th><th style='width:10%'></th><th style='width:10%'></th></tr>");
         $.each(parsedObjinArray,function(i,a){
            var tr = "<tr align='left' style='font-size:20px'>" + "<td>" + a.articletype + "</td>" +
                     "<td>" + a.articletitle + "</td>" + "<td>" + a.company.name + "</td>" +
                     "<td>" + a.articletime + "</td>" +"<td><form action='findartid.index' method='post'><input hidden name='uptID' value=" +a.articleid+ " /><button class='btn btn-info btn-sm' value='瀏覽' type='submit'>瀏覽</button></form></td>"+
                     "</tr>";
           table.append(tr);
       });
    }
},
error: function() {
    console.log("error");
}
});
}

function adddisplay(){
	
	 if ($("#member").val() === null) {
		 $("#addarticle").hide();
		    
		  }

}



	
	

</script>

</head>

<body>
	<!-- 廠商登入後header -->
	<%@include file="/WEB-INF/pages/headerfooter/memberheader.jsp"%>
	<input type="hidden" name="memberID" value="${memberID}">
	<input type="hidden" id = "member" name="memberID" value="${companyID}">
	
	<!-- 廠商登入後header -->


    <!--  -->
    
   <!--   <section class="content">
      <div class="card">
        <div class="card-header">
          <h2 style="font-weight:bold;" class="card-title">所有廠商門市總表</h2>
        </div>
        <!-- /.card-header -->

       <!--   <div class="card-body">
          <div id="jsGrid1">
 
	        <table id="article" class="display" style="width:100%;color:#A0522D">
	        <thead style="color:black">
	            <tr>
	                <th>門市編號</th>
	                <th>門市名稱</th>
	                <th>電話</th>
	                <th>Zip</th>
	               
	                
	            </tr>
	        </thead>	        
	        </table>
         
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </section>
    
    <!-- Main content -->
	   <section class="content">
	
      <!-- Default box -->
	 <section class="content">
	<div class="container">
      <div class="card">
        <div class="card-header">          
			
          <div id="addarticle" class="card-tools">
		
          </div>
        <div class="card-header">
          <h2 style="font-weight:bold;" class="card-title">文章分享</h2>
        </div>
        <div class="card-body p-0">
        	<table id="showQA" class="table table-striped projects">
	</table>
	<table id="showpage" class="table table-striped projects">
		<tr>
			<td>Total Pages:${totalPages} Total Records:${totalElements}</td>
			<td colspan="3" align="right">Previous <c:forEach var="i"
					begin="1" end="${totalPages}" step="1">
					<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
				</c:forEach>Next
			</td>
		</tr>
	</table>
        	
        	<table id="showQA" class="table table-striped projects"></table>
    </div>
    </div>
    </div>
    </div>
    </section>
    <!-- /.content -->



   


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
    <script>
    
    </script>
</body>

</html>