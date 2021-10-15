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
  <!-- jsGrid -->
  <link rel="stylesheet" href="/plugins/jsgrid/jsgrid.min.css">
  <link rel="stylesheet" href="/plugins/jsgrid/jsgrid-theme.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/jquery.dataTables.min.css">
  
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.css"/>
  

 
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
            <h1><i class="far fa-folder-open"></i>  活動訂單管理</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">首頁</a></li>
              <li class="breadcrumb-item active">訂單管理</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="card">
        <div class="card-header">
          <h2 style="font-weight:bold;" class="card-title">所有廠商活動總表</h2>
        </div>
        <!-- /.card-header -->

        <div class="card-body">
          <div id="jsGrid1">
 
	        <table id="example" class="display" style="width:100%;color:#A0522D">
	        <thead style="color:black">
	            <tr>
	                <th>評論編號</th>
	                <th>訂單編號</th>
	                <th>場域</th>
	                <th>價格</th>
	                <th>內容</th>
	                <th>再訪</th>
	                <th>師資</th>
	                <th>其他</th>                
	                <th>評論日期</th>                
	            </tr>
	        </thead>
	        <tbody>
			<c:forEach var="satisfactions" items="${satisfactions}">
				<tr>
					<td>${satisfactions.asId}</td>
					<td>${satisfactions.activityOrder.aoId}</td>
					<td>${satisfactions.asPlace}  分</td>
					<td>${satisfactions.asPrice}  分</td>
					<td>${satisfactions.asProduct}  分</td>
					<td>${satisfactions.asRevisit}  分</td>
					<td>${satisfactions.asTeacher}  分</td>
					<td>${satisfactions.asContent}</td>
					<td>${satisfactions.asDate}</td>
				</tr>
			</c:forEach>
			</tbody>
	        </table>
         
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </section>
    
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
<!-- jsGrid -->
<script src="/plugins/jsgrid/demos/db.js"></script>
<script src="/plugins/jsgrid/jsgrid.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
<!-- Page specific script -->

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>

<script src="https://cdn.datatables.net/buttons/2.0.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.0/js/buttons.print.min.js"></script>

<script>
$(document).ready( function () {
	$('#example').DataTable( {	    
		dom: 'Bfrtip',
		buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
		select: true,
	    lengthMenu: [10],	    
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
