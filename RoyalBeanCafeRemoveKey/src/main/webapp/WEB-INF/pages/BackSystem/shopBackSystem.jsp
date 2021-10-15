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

  <!-- my css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
  var indexPage = 1;
	$(document).ready(function () {
		findAllShopPd(indexPage);
	});
	$('#ShopPdSeacrch').click(function (e) {
		e.preventDefault();
		findAllShopPd(1);
	});
		
	function changeShopPd(page){
	   	indexPage = page;
	  	findAllShopPd(indexPage);
	}
	
	function shopPdUpdate(pdnumber) {
		console.log(pdnumber)
	}

	function findAllShopPd(indexPage){
		$.ajax({
			type: 'post',
			url: 'shopAdminSearchShopPd_findAlldata/'+indexPage,
			dataType:'JSON',
			contentType:'application/json',
			success: function (data) {
				var json = JSON.stringify(data, null, 4);
			 	var i = indexPage;

				var parsedObjinArray = JSON.parse(json);
					$('#AllShopPd').empty(""); 
					if(json=null){
					$('#AllShopPd').append("<tr><td colspan='2'>暫無資料</td></tr>");
					}else{
					var table = $('#AllShopPd');
					table.append("<thead><tr><th style=\"width: 1%\">#</th>"
					+"<th style=\"width: 8%\">編號</th>"
					+"<th style=\"width: 10%\">名稱</th>"
					+"<th style=\"width: 10%\">照片</th>"
					+"<th style=\"width: 10%\">價格</th>"
					+"<th style=\"width: 10%\">類型</th>"
					+"<th style=\"width: 10%\" >數量</th>"
					+"<th style=\"width: 10%\" >產地</th>"
					+"<th style=\"width: 10%\" >保存方式</th>"
					+"<th style=\"width: 20%\">"+"</th></tr></thead><tbody id=\"shoppdbody\"></tbody>");
	
					$.each(parsedObjinArray,function(i,n){
            var MCID =null;
          if(n.memberContent!=null){
            var MCID = n.memberContent.id;            
          }

					var tr = 
					
					// "<tr id=\"z"+n.id+"\">" +"<td>#</td>"+ "<td id=\'a"+n.id+"\'>" + n.id + "</td>" +
          //   "<td id=\'b"+n.id+"\'>" + n.email + "</td>" + "<td id=\'c"+n.id+"\'>" + n.pwd + "</td>" +
          //   "<td id=\'d"+n.id+"\'>" + n.active + "</td>" + "<td id=\'e"+n.id+"\'>" + n.blackList + "</td>"
					// +"<td id=\'f"+n.id+"\'>" + n.role + "</td>"
          "<tr>" +"<td>#</td>"+ "<td>" + n.shopPdNumber + "</td>" +
            "<td>" + n.shopPdName + "</td>" 
            + "<td>" +"<img width=\"100\" height=\"100\" src=\'" + n.shopPdPicture + "\'>"+"</td>" +
            "<td>" + n.shopPdPrice + "</td>" + "<td>" + n.shopPdType + "</td>"+
            "<td>" + n.shopPdCount + "</td>"
          + "<td>" + n.shopPdOrigin + "</td>"+"<td>" + n.shopPdSaveMethod + "</td>"
					+"<td class=\"project-actions text-right\">"
					+"<a class=\"btn btn-primary btn-sm\" href=\"#\">"
					+"<i class=\"fas fa-folder\"></i>View</a>"
					+"<a class=\"btn btn-info btn-sm\" href=\""+n.shopPdNumber+".adminupdate\">"
					+"<i class=\"fas fa-edit\"></i>Edit</a>"
					+"<a class=\"btn btn-danger btn-sm\" href=\""+n.shopPdNumber+".admindelete\">"
					+"<i class=\"fas fa-trash\"></i>delete</a></td></tr>";

					$('#shoppdbody').append(tr);
					})									
				}
			},
			error: function () {
				console.log('error');
			}
		});
	};

  </script>
  <style>

    .onlybuttom{
      color: white;
      background-color: rgb(88, 135, 236);
      border: 0px;
      border-radius: 5px;
    }


  </style>


</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<%@include file="/WEB-INF/pages/headerfooter/backheader.jsp"%>	

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>商城系統</h1>
            <form id="form_background">
            <a href="adminEntry"><input type="button" id="ShopPdSeacrch" class="onlybuttom" value="view"></a>
            <input type="button" class="onlybuttom" onclick="javascript:location.href='goto_addpd_form'" value="create">
<!--             <input type="submit" id="CompanySeacrch" class="onlybuttom" value="Company"> -->
            </form>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">ShopSystem</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box-1 Member -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">商品總覽</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <div class="card-body p-0">
          <table class="table table-striped projects" id="AllShopPd">  
          </table>
          <table id="showpage" class="table table-striped projects">
			<tr>
			<td>Total Pages:${totalPages_shoppd} Total Records:${totalElements_shoppd}</td>
			<td colspan="3" align="right">Previous <c:forEach var="i"
					begin="1" end="${totalPages_shoppd}" step="1">
					<button id="myPage" value="${i}" onclick="changeShopPd(${i})">${i}</button>
				</c:forEach>Next
			</td>
			</tr>
		  </table>                   
        </div>
        <!-- /.card-body -->
      </div>
   </div>
      <!-- /.card -->
    </section>
    <!-- /.content -->
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
</body>
</html>
