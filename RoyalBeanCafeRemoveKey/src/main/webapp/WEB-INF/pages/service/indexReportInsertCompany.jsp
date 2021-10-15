<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function() {
		$("#picture").change(function() {
			var readFile = new FileReader();
			var fileShow = $("#picture")[0].files[0];  //document.getElementById('file')等於$("#myfile")[0]
			readFile.readAsDataURL(fileShow);
			readFile.onload = function() {
			var img = $("#preview");
			img.attr("src", this.result);
			console.log(fileShow);
			}
		});
		
		
		
		$("#addReport").submit(function(event){
		event.preventDefault();
		var any=document.getElementById("picture")
		/*var data ={
				
				"reporttitle":$("#Reporttitle").val().toString(),
				"reportcontent":$("#Reportcontent").val().toString(),
				"picture":any.files[0]
				
		};*/
		var formdata = new FormData($("#addReport")[0]);
		//var picture={"picture":any.files[0]};
		console.log(any.files[0])
		console.log(formdata);

		/*$.ajax({
			type:'POST',
			url:'/AddReport',
			data:data,	
			cache:false,
			async:false,
			processData:false,
			contentType:false,
			enctType : 'multipart/form-data',
			success : function() {
				console.log("success");
				//location.href="./indexReportInsert"
				alert("回報成功");
			},
			error : function() {
				//alert('error');  
				console.log("error");
			}
		});*/
		$.ajax({
			type:'POST',
			url:'/company/AddReport',
			data:formdata,
			processData:false,
			enctype:'multiprat/form-data',
			contentType:false,
			cache:false,
			async:false,
			success:function(){
				location.href="./cht"
				alert("回報成功，請等候工作人員與您聯絡");
			},
			error:function(){
				console.log("error");
			}
			
		});
		});
		});

</script>

</head>

<body>
	
   	<!-- 廠商登入後header -->
	<%@include file="/WEB-INF/pages/headerfooter/venderheader.jsp"%>
	<input type="hidden" name="memberID" value="${memberID}">
	<!-- 廠商登入後header -->
    
    
    <!-- Main content -->
   <!--   <section class="content"   >-->
   	
       
          <!-- left column -->
          
      		<div class="container">
      		<div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary" align="center" >
              <div class="card-header" align="center" >
                <h3 class="card-title">問題回報表單</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="addReport" enctype="multipart/form-data">
              
              <input hidden type="text" id="companyID" name="companyID" value="${companyID}">
                <div class="card-body" align="center" >
                  <div class="form-group" align="center" >
                    <label for="question title">標題</label>
                    <input type="text" class="form-control" id="Reporttitle" name="Reporttitle">
                  </div>
                  <div class="form-group" align="center" >
                    <label for="exampleInputPassword1">問題內容</label>
                    <input type="text" class="form-control" id="Reportcontent" name="Reportcontent" placeholder="請敘述你所遇到的問題">
                  </div>
                  <div class="form-group" align="center" >
                    <label for="exampleInputFile">image upload</label>
                    <div class="input-group" align="center" >
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="picture" name="picture" accept="image/*">
                        <label class="custom-file-label" for="exampleInputFile">Choose image</label>

                      </div>
                      

                    </div>
                  </div>
                       <figure class="figure">
					  <img src="" id="preview" name="preview" class="figure-img img-fluid rounded" width="400px">
					  <figcaption class="figure-caption">如有需要請上傳問題相關圖片</figcaption>
					</figure>

                </div>
                <!-- /.card-body -->

                <div class="card-footer" align="center" >
                  <input type="submit" class="btn btn-primary" value="Submit">
                </div>
                
              </form>
              <button id="onclickinput" class="btn btn-info">一鍵輸入</button>
            </div>
            </div>
            </div>
            </div>
            </div>
            
            </section>

    <!-- Start Categories  -->
    
    <!-- End Categories -->

    <!-- Start Products  -->
    
    <!-- End Products  -->

    <!-- Start Blog  -->
    
    <!-- End Blog  -->


    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/jquery.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/java.png" alt="" style="height: 150PX;"/>
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/ajax.jpg " alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/htmlcssjs.png" alt=""  style="height: 150PX;"/>
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/springboot.png" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/bootstrap.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/hubernate.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/sqlserver.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/github.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Instagram Feed  -->


    <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>前端技術</h4>
                            <ul>
                                <li style="color:#FFF8DC ;">HTML、CSS、JS</li><br>
                                <li style="color:#FFF8DC ;">AJAX</li><br>
                                <li style="color:#FFF8DC ;">JQuery</li><br>
                                <li style="color:#FFF8DC ;">bootstrap</h3></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>後端技術</h4>
                            <ul>
                                <li style="color:#FFF8DC ;">Java</li><br>
                                <li style="color:#FFF8DC ;">SpringBoot</li><br>
                                <li style="color:#FFF8DC ;">Hibernate</li><br>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>資料庫&整合技術</h4>
                            <ul>
                                <li style="color:#FFF8DC ;">SQL Server</li><br>
                                <li style="color:#FFF8DC ;">GitHub</li><br>
                                <li style="color:#FFF8DC ;">Git</li><br>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer  -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2021 <a href="#">RoyalBeanCafe</a> Design By :
            <a href="https://html.design/">html design</a></p>
    </div>
    <!-- End copyright  -->

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
    <script>
    $('#onclickinput').click(function () {
    	$('#Reporttitle').val("產品內容物有誤");
    	$('#Reportcontent').val("送來的產品跟我下單的品項不一樣");
    	})
    </script>
</body>

</html>