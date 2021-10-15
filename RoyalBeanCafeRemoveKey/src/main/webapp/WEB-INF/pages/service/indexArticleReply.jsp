<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<!-- summernote -->
<link rel="stylesheet"
	href="/../../plugins/summernote/summernote-bs4.min.css">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	var companyid= $("#companyID").val();
	var cid = $("#cid").val();
	var memberid = $("#memberID").val();
	if(companyid != cid || memberid != null){
		$("#uptbutton").hide();
		$("#delbutton").hide();
	}
	
	
	$("#reply").submit(function(event){
		var replyid = $("#replyID").val();
	event.preventDefault();
	var data ={			
			"replycontent":$("#replycontent").val().toString(),
			//"articleid":$("#replyID").val(),
						
	};
	
	console.log(data);
	$.ajax({
		type:'POST',
		url:'./AddReply.controller/' + replyid,
		data:JSON.stringify(data),			
		contentType : 'application/json',
		success : function() {
			alert("文章發表成功");
			location.href="./indexArticle"
			console.log($("#articletype").val().toString());
		},
		error : function() {
			//alert('error');  
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
	<input type="hidden" name="companyID" id="companyID"
		value="${companyID}">
	<input hidden name="cid" id="cid" value="${article.company.id }" />
	<!-- 廠商登入後header -->




	<!-- Main content -->
	<div class="row">

		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">文章分享</h3>
				</div>
				<!-- ./card-header -->
				<div class="card-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td colspan="5" align="center"><font size="5">${article.articletitle}</font></td>
							</tr>
						</thead>
						<tbody>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td colspan="2">發文者:${article.company.name}</td>

								<td>發文時間:${article.articletime}</td>

								<td>文章類型:${article.articletype }</td>
								<td>
									<form id="Updateform" action="updateentry.index" method="post">
										<input hidden name="uptID" id="uptID"
											value="${article.articleid}" /> <input type="submit"
											value="修改文章" id="uptbutton"
											class="btn btn-success float-center">
									</form>
								</td>


							</tr>
							<tr class="expandable-body">
								<td style="background-color: #E8E8E8" colspan="5"><font
									size="3">
										<p>${article.articlecontent}</p>
								</font></td>
							</tr>


							<c:forEach var="articlereply" items="${articlereply}">
								<tr data-widget="expandable-table" aria-expanded="false">
									<td colspan="2">回覆者:${articlereply.company.name }${articlereply.member.email }</td>

									<td colspan="3">回覆時間:${articlereply.replytime}</td>




								</tr>
								<tr class="expandable-body">
									<td style="background-color: #E8E8E8" colspan="5"><font
										size="3">
											<p>${articlereply.replycontent}</p>
									</font></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<form id="reply">
						<textarea id="replycontent" rows="10" cols="45">
               
              </textarea>
						<input hidden name="replyID" id="replyID"
							value="${article.articleid}" />
						<div style="text-align: center">
							<input class="btn btn-primary"  type="submit"  value="發表回覆" />
						</div>
							
					</form>
					 <button id="onclickinput" class="btn btn-info">一鍵輸入</button>
				</div>
			</div>

			<div>

				<form id="Delform" action="artdel.index" method="post">
					<input hidden name="delID" id="delID" value="${article.articleid}" />

					<input type="submit" value="刪除文章" id="delbutton"
						class="btn btn-success float-right">
				</form>
				<form action="indexArticle">
					<input type="submit" value="上一頁" class="btn btn-success float-left">
				</form>

			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
	</div>




	<!--  -->


	<!-- Start Categories  -->

	<!-- End Categories -->

	<!-- Start Products  -->

	<!-- End Products  -->

	<!-- Start Blog  -->

	<!-- End Blog  -->




	<!-- Footer -->
	<%@include file="/WEB-INF/pages/headerfooter/footer.jsp"%>
	<!-- Footer -->

	<!-- Start copyright  -->
	<div class="footer-copyright">
		<p class="footer-company">
			All Rights Reserved. &copy; 2021 <a href="#">RoyalBeanCafe</a> Design
			By : <a href="https://html.design/">html design</a>
		</p>
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
	<!-- Summernote -->
	<script src="/../../plugins/summernote/summernote-bs4.min.js"></script>
	<script>
  $(function () {
    // Summernote
    $('#replycontent').summernote()

  })
  
   //一鍵輸入
$('#onclickinput').click(function () {
	
	$('#replycontent').summernote('editor.insertText','感謝分享 長知識了');
	
})
</script>
</body>

</html>