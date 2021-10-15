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
    <!-- summernote -->
  	<link rel="stylesheet" href="/../../plugins/summernote/summernote-bs4.min.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
 <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#addform").submit(function(event){
	event.preventDefault();
	var data ={
			"articletitle":$("#arttitle").val().toString(),
			"articlecontent":$("#artcontent").val().toString(),
			"articletype":$("#articletype").val().toString()
			
	};
	
	console.log(data);
	$.ajax({
		type:'POST',
		url:'/company/AddArticle.controller',
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
	<!-- 廠商登入後header -->
   

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-left">
                <img src="/images/banner-01.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> RoyalBeanCafe</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="/images/banner-02.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> RoyalBeanCafe</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-right">
                <img src="/images/banner-03.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> RoyalBeanCafe</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                            <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->
    <!-- Main content -->
    <section class="content">
    <form id="addform">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-outline card-info">
            <div class="card-header">
              <h3 class="card-title">
                <font  size="6">發表文章</font>
              </h3>
            </div>
            <!-- /.card-header -->
              <div class="card-body" >
              <label for="arttitle">標題</label>
    		<input type="text" class="form-control" id="arttitle" name="arttitle">
			<!-- <div class="col-md-6 mb-3"> -->
							<label>文章類型</label>
							<select class="form-control"  id="articletype">
								<option value="未選擇" label="請選擇文章類型"/>
								<option value="產品推廣專區" label="產品推廣專區"/>
								<option value="拉花專區"  label="拉花專區"/>
								<option value="其他"  label="其他"/>
							</select>
						<!--  </div>-->
            <label for="arttitle">內容</label>
              <textarea id="artcontent" rows="10" cols="50">
                
              </textarea>
            </div>
            <input type="submit" class="btn btn-primary" value="Submit">

          </div>
        </div>
        <!-- /.col-->
      </div>
      </form>
       <button id="onclickinput" class="btn btn-info">一鍵輸入</button>
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


   <!-- Footer -->
    <%@include file="/WEB-INF/pages/headerfooter/footer.jsp"%>
    <!-- Footer -->

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
    <!-- Summernote -->
	<script src="/../../plugins/summernote/summernote-bs4.min.js"></script>
	<script>
  $(function () {
    // Summernote
    $('#artcontent').summernote()

  })
  
  //一鍵輸入
$('#onclickinput').click(function () {
	$('#arttitle').val("咖啡6大產地");
	$('#articletype').val("其他");
	//$('#artcontent').val("巴西：比起其他中南美洲的咖啡豆，巴西咖啡豆的種植海拔相對較低，因此風味也比較獨特，酸度低並帶有巧克力及堅果的香氣，酸苦平衡佳且風味醇厚。越南：越南是咖啡輸出的主要國家之一，主要盛產羅布斯塔咖啡豆，咖啡風味相對苦澀，通常會加入煉乳飲用，屬於越南咖啡的特殊喝法。印尼：印尼咖啡具有獨特的木質香氣，風味醇厚、酸味明亮，常見的曼特寧、黃金曼特寧是印尼咖啡的代表作。哥倫比亞：水果香氣濃郁、咖啡酸度高並帶有清香是哥倫比亞咖啡豆的特色，有些甚至帶有堅果的香氣，堆疊出多層次的口感，喝起來香醇順口。印度：印度咖啡最著名的是風漬處理法製成的咖啡豆，咖啡酸味低、缺少層次感，但風味濃郁，獨特的風味使其獲得兩極的評價。衣索比亞：衣索比亞咖啡在精品咖啡界擁有一定的地位，常見的耶加雪菲就是衣索比亞咖啡的代表之一，酸質明亮、花香濃郁以及餘韻飽滿綿長的特色，是很多咖啡愛好者的首選");
	$('#artcontent').summernote('editor.pasteHTML', '<p style="font-family: &quot;Noto Serif TC&quot;, serif; color: rgb(122, 122, 122); font-size: 18px; list-style-position: inside !important; word-break: break-word !important;"><b>咖啡豆的產地主要來自非洲、南美洲及亞洲地區，非洲產出的咖啡豆大多帶有水果酸味及香氣；南美洲整體平衡感佳，口感明亮清爽；亞洲則是酸度低並帶有香料風味，建議根據個人喜好選擇合適的咖啡豆，以下為你介紹世界6大咖啡產地作為參考：</b></p><ol><li style="margin-bottom: 0.6em; margin-left: 1.3em; list-style-position: inside !important; word-break: break-word !important;">巴西：比起其他中南美洲的咖啡豆，巴西咖啡豆的種植海拔相對較低，因此風味也比較獨特，酸度低並帶有巧克力及堅果的香氣，酸苦平衡佳且風味醇厚。</li><li style="margin-bottom: 0.6em; margin-left: 1.3em; list-style-position: inside !important; word-break: break-word !important;">越南：越南是咖啡輸出的主要國家之一，主要盛產羅布斯塔咖啡豆，咖啡風味相對苦澀，通常會加入煉乳飲用，屬於越南咖啡的特殊喝法。</li><li style="margin-bottom: 0.6em; margin-left: 1.3em; list-style-position: inside !important; word-break: break-word !important;">印尼：印尼咖啡具有獨特的木質香氣，風味醇厚、酸味明亮，常見的曼特寧、黃金曼特寧是印尼咖啡的代表作。</li><li style="margin-bottom: 0.6em; margin-left: 1.3em; list-style-position: inside !important; word-break: break-word !important;">哥倫比亞：水果香氣濃郁、咖啡酸度高並帶有清香是哥倫比亞咖啡豆的特色，有些甚至帶有堅果的香氣，堆疊出多層次的口感，喝起來香醇順口。</li><li style="margin-bottom: 0.6em; margin-left: 1.3em; list-style-position: inside !important; word-break: break-word !important;">印度：印度咖啡最著名的是風漬處理法製成的咖啡豆，咖啡酸味低、缺少層次感，但風味濃郁，獨特的風味使其獲得兩極的評價。</li><li style="margin-bottom: 0.6em; margin-left: 1.3em; list-style-position: inside !important; word-break: break-word !important;">衣索比亞：衣索比亞咖啡在精品咖啡界擁有一定的地位，常見的耶加雪菲就是衣索比亞咖啡的代表之一，酸質明亮、花香濃郁以及餘韻飽滿綿長的特色，是很多咖啡愛好者的首選。</li></ol>');
	
})
</script>
</body>

</html>