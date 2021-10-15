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


</script>

</head>

<body>
	<!-- 廠商登入後header -->
	<%@include file="/WEB-INF/pages/headerfooter/venderheader.jsp"%>
	<input type="hidden" name="memberID" value="${memberID}">
	<input type="hidden" name="memberID" value="${companyID}">
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
	       
	       <div class="container">
	       <div class="card-header">
              <h3 class="card-title">
                <font  size="6">QA</font>
              </h3>
            </div>
	       <c:forEach var="qalist" items="${qalist}">
        <div class="row">
            <div class="col-12" id="accordion">
                <div class="card card-primary card-outline">
                    <a class="d-block w-100" data-toggle="collapse" href="#collapse${qalist.QAid }">
                        <div class="card-header">
                            <h4 class="card-title w-100">
                                ${qalist.QAtitle }
                            </h4>
                        </div>
                    </a>                  
                    <div id="collapse${qalist.QAid }" class="collapse" data-parent="#accordion">
                        <div class="card-body">
                           ${qalist.QAanswer }
                        </div>
                    </div>
                </div>
                </div>
                </div>               
                 </c:forEach> 
                 </div> 
                </section>
	
      <!-- Default box -->
	
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