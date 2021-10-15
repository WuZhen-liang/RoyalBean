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
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//照片上傳
		$('#buttonUpload').click(function () {
		var fileinput = $('#pdPicture').val();
		if(fileinput == ''){
			console.log("please select photo");
			swal.fire({
           	  position: 'top',
           	  icon: 'warning',
           	  title: 'Please select photo.',
           	  showConfirmButton: false,
           	  timer: 1500
           	});
		}else{
			
			var form = document.getElementById("shoppdPhotoForm");
		    var formData = new FormData(form);
			console.log(formData.get("PdPicture"));

		    $.ajax({
		        type: "POST",  //使用POST傳輸,檔案上傳只能用POST
		        enctype: 'multipart/form-data', //將資料加密傳輸 檔案上傳一定要有的屬性
		        url: "adminshopphoto", //要傳輸對應的接口
		        data: formData,     //要傳輸的資料
		        processData: false, //防止jquery將data變成query String
		        contentType: false, 
		        cache: false,  //不做快取
		        async : false, //設為同步
		        timeout: 1000000, //設定傳輸的timeout,時間內沒完成則中斷
		        success: function (data) {
		            console.log("SUCCESS : ", data);
		            $('#pdpictureinfo').val("/shoppicture/"+data);
		            console.log($('#pdPicture').val());
		            swal.fire({
		             	  position: 'top',
		             	  icon: 'success',
		             	  title: 'Upload Successd!',
		             	  showConfirmButton: false,
		             	  timer: 1500
		             	});
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		        }
		    })
		}
	})
	});
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
            <h1>ShopSystem</h1>
            <form id="form_background">
            <a href="adminEntry"><input type="button" id="ShopPdSeacrch" class="onlybuttom" value="view"></a>
            <input type="submit" id="ShopPdCreate" class="onlybuttom" value="create">
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
          <h3 class="card-title">請輸入你要修改的內容:</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
       <!-- Picture Start-->
		   <form id="shoppdPhotoForm" class="needs-validation">
                <div class="card-body">
                  		<div class="form-group">
						   <label>商品照片</label>
							<input id="pdPicture" type="file" name="PdPicture" class="form-control"/>
						</div>
						<div class="form-group">
							<input id="buttonUpload" type="button" value="Upload" class="btn btn-warning"/>
						</div>
				</div>	
			</form>	
		<!-- Picture End-->	
        
           <form:form class="needs-validation" action="adminupdatePd" modelAttribute="shop/shopBackSystemUpdate" method="post">
                <form:input path="shopPdNumber" type="hidden"/>
                <div class="card-body">
                  <div class="form-group">
                      <form:label path="shopPdName" for="firstName">商品名稱</form:label>
                      <form:input class="form-control" path="shopPdName"></form:input>
                  </div>
                  <div class="form-group">
                      <form:label path="shopPdPrice">價格</form:label>
                      <form:input class="form-control" path="shopPdPrice"></form:input>
                  </div>
                  <div class="form-group">
                      <form:label path="shopPdCount">數量</form:label>
                      <form:input class="form-control" path="shopPdCount"></form:input>
                  </div>
                  <div class="form-group">
 					  <form:label path="shopPdWeight">重量</form:label>
                      <form:input class="form-control" path="shopPdWeight"></form:input>
                  </div>
                  <div class="form-group">
					<form:input path='shopPdPicture' type="hidden" id="pdpictureinfo"/>
                  </div>
                    <div class="row">
                    <div class="col-sm-4">
                      <!-- Select multiple-->
                      <div class="form-group">
                         <form:label path="shopPdType">類型</form:label>
                         	<form:select class="wide w-100" path="shopPdType">                                   
                            	<form:option value="Choose..." data-display="Select">Choose...</form:option>
                                <form:option value="咖啡豆">咖啡豆</form:option>
                                <form:option value="咖啡">咖啡</form:option>
                                <form:option value="蛋糕">蛋糕</form:option>
                            </form:select>  
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <!-- Select multiple-->
                      <div class="form-group">
                      	<form:label path="shopPdBaking">烘培程度</form:label>
                        	<form:select class="wide w-100" path="shopPdBaking">
                            	<form:option value="Choose..." data-display="Select">Choose...</form:option>
                            	<form:option value="淺烘焙">淺烘焙</form:option>
                            	<form:option value="肉桂烘焙">肉桂烘焙</form:option>
                            	<form:option value="微中烘焙">微中烘焙</form:option>
                            	<form:option value="濃度烘焙">濃度烘焙</form:option>
                            	<form:option value="城市烘焙">城市烘焙</form:option>
                            	<form:option value="深城市烘焙">深城市烘焙</form:option>
                            	<form:option value="法式烘焙">法式烘焙</form:option>
                            	<form:option value="義式烘焙">義式烘焙</form:option>
                            </form:select>
                      </div>
                    </div>                 
                    <div class="col-sm-4">
                      <div class="form-group">
                      	<form:label path="shopPdSaveMethod">保存方式</form:label>
                        	<form:select class="wide w-100" path="shopPdSaveMethod">
                            	<form:option data-display="Select" value="Choose...">Choose...</form:option>
                                <form:option value="冷凍">冷凍</form:option>
                                <form:option value="冷藏">冷藏</form:option>
                                <form:option value="常溫">常溫</form:option>
                            </form:select>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                  	<form:label path="shopPdDepiction">簡述</form:label>
                    <form:textarea class="wide w-100" path="shopPdDepiction"></form:textarea>
                  </div>
                  <div class="form-group">
                    <form:label path="shopPdIngredient">成分</form:label>
                    <form:input class="wide w-100" path="shopPdIngredient"></form:input>
                  </div>
                  <div class="form-group">
                  	<form:label path="shopPdOrigin">產地</form:label>
                    <form:input class="wide w-100" path="shopPdOrigin"></form:input>
                  </div>
                  <div class="form-group">
                  	<form:label path="shopPdExpTime">保存期限</form:label>
                    <form:input class="wide w-100" path="shopPdExpTime"></form:input>
                  </div>
                  <div class="form-group">
                  	<form:label path="shopPdShipment">出貨地</form:label>
                    <form:input class="wide w-100" path="shopPdShipment"></form:input>
                  </div>
                  <div class="form-group">
                  	<form:label path="shopPdNotice">注意事項</form:label>
                    <form:textarea class="wide w-100" path="shopPdNotice"></form:textarea>                  </div>
                </div>
                <!-- /.card-body -->
              	<center>
               		<div class="card-footer">
                  		<button value="Send" id="send">確定更新</button>
                	</div>
                </center>	
         </form:form>

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
