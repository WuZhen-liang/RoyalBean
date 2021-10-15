<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>RoyalBeanCafe</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/plugins/summernote/summernote-bs4.min.css">
  <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
var indexPage = 1;
$(document).ready(function(){
    load(indexPage);
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
         table.append("<tr id='ptitle' style='font-size:20px'><th style='width:10%'>Article#</th><th style='width:30%'>Title</th><th>編輯者</th><th style='width:20%'>新增時間</th><th style='width:10%'></th><th style='width:10%'></th></tr>");
         $.each(parsedObjinArray,function(i,a){
            var tr = "<tr align='left' style='font-size:20px'>" + "<td>" + a.articleid + "</td>" +
                     "<td>" + a.articletitle + "</td>" + "<td>" + a.company.name + "</td>" +
                     "<td>" + a.articletime + "</td>" +"<td><form action='./findartid.controller' method='post'><input hidden name='uptID' value=" +a.articleid+ " /><button class='btn btn-info btn-sm' value='瀏覽' type='submit'>瀏覽</button></form></td>"+
                     "<td><form action='./artdel.controller' method='post'><input hidden name='delID' value=" +a.articleid+ " /><button class='btn btn-info btn-sm' value='del' type='submit'>刪除</button></form></td>"+"</tr>";
           table.append(tr);
       });
    }
},
error: function() {
    console.log("error");
}
});
}
</script>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
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
            <h1>文章管理</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">文章管理</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
  
  
  <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">          
			
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
        <!-- /.card-body -->
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

<!-- ./wrapper -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/plugins/moment/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/dist/js/pages/dashboard.js"></script>
</body>
</html>
