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
    <title>CouponManagement</title>
    
    <script src="https://kit.fontawesome.com/ccba314d23.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.2/dist/sweetalert2.all.min.js"></script>
    <!-- Ajax -->
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

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



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
			   url:'/couponfindbypage/' + indexPage,
			   dataType:'JSON', //??????JSON
			   contentType:'application/json', //??????JSON
			   success: function(data) { //????????????function??????data
						   var json = JSON.stringify(data, null, 4); //JSON.stringify()???data???????????????JSON??????, ??????????????? 4 bytes
						   console.log("SUCCESS : ", json);
						   var parsedObjinArray = JSON.parse(json);  //JSON.parse()??????JSON???????????????Javascript????????????
			     
			     		   $('#aCouponList').empty(""); //??????table????????????
			     
					       if(json=null){
					         $('table').prepend("<tr><td colspan='2'>????????????</td></tr>");
					       }else{
					         var table = $('#aCouponList');
					         table.append("<thead><tr><th scope='col'>???????????????</th><th scope='col'>???????????????</th><th scope='col'>??????????????????</th><th scope='col'>??????????????????</th><th scope='col'>??????</th><th scope='col'>??????</th></tr></thead>");
					         $.each(parsedObjinArray,function(i,n){
					            var tr = "<tbody><tr>" + 
					            		 "<th scope='row'>" + n.cpid + "</th>" +
					                     "<td>" + n.cpname + "</td>" + 
					                     "<td>" + n.cpsdate + "</td>" +
					                     "<td>" + n.cpddate + "</td>" +
					                     "<td><a href=" + '/coupon/update' + n.cpid + "><button type='button' class='btn btn-light'><i class='fa fa-pencil-square-o'/></button></a></td>" + 
					                     //"<td><a href=" + '/activity/delete' + n.sId + "><i class='far fa-trash-alt'/></a></td>" +
					                     "<td><button type='button' class='btn btn-light' id="+ n.cpid +" value="+ n.cpid +"><i class='far fa-trash-alt'/></button></td>" +
					                     "</tr></tbody>";
					         table.append(tr);
					         $("#"+n.cpid+"").click(			     		
							     		function confirmDelete() {
							     			var deleteID = $("#"+n.cpid+"").val();
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
										     	            url: '/coupon/' + deleteID ,
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
										     	      													     	      			
										     	            }
										     	        });						     				  
								     			  }
								     		});
							     	});
					       	 });
			    		}
				},
				error: function() {
				    		console.log("error");
				}
				
			});
		}
		
//-----------------------------------------------------------------------------------------------------------------------------------------		
		 
//-----------------------------------------------------------------------------------------------------------------------------------------								
    </script>

</head>

<body>
	
   <!-- Start Main Top -->
    <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="text-slid-box">
                        <div id="offer-box" class="carouselTicker">
                            <ul class="offer-box">
                                <li>
                                    <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT20
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT20
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="custom-select-box">
                        <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
						<option>????????????</option>
						<option selected="selected">??????</option>
                        <option>?????????</option>
					</select>
                    </div>
                    <div class="right-phone-box">
                        <p>Hello :- <a href="#">????????????</a></p>
                    </div>
                    <div class="our-link">
                        <ul>
                            <li><a href="MemberCenter">????????????</a></li>
                            <li><a href="Login">????????????</a></li>
                            <li><a href="#">????????????</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Top -->

    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="index.html"><img src="/images/logo.png" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="homepage">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.html">About Us</a></li>
                        <li class="dropdown megamenu-fw">

                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Product</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.html">????????????</a></li>
                                <li><a href="wishlist.html">??????????????????</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Activity</a>
                            <ul class="dropdown-menu">
                                <li><a href="activity.controller">????????????</a></li>
                                <li><a href="activityStore.controller">????????????</a></li>
                                <li><a href="my-account.html">????????????</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Coupon</a>
                            <ul class="dropdown-menu">
                                <li><a href="addCouponEntry">???????????????</a></li>
                                <li><a href="couponManagementEntry">???????????????</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">Service</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.html">????????????</a></li>
                                <li><a href="checkout.html">Q&A</a></li>
                                <li><a href="my-account.html">????????????</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="contact-us.html">Contact Us</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        <li class="side-menu"><a href="#">
						<i class="fa fa-shopping-bag"></i>
                            <span class="badge">3</span>
					</a></li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
            <!-- Start Side Menu -->
            <div class="side">
                <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                <li class="cart-box">
                    <ul class="cart-list">
                        <li>
                            <a href="#" class="photo"><img src="/images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Delica omtantur </a></h6>
                            <p>1x - <span class="price">$80.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="/images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Omnes ocurreret</a></h6>
                            <p>1x - <span class="price">$60.00</span></p>
                        </li>
                        <li>
                            <a href="#" class="photo"><img src="/images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
                            <h6><a href="#">Agam facilisis</a></h6>
                            <p>1x - <span class="price">$40.00</span></p>
                        </li>
                        <li class="total">
                            <a href="#" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                            <span class="float-right"><strong>Total</strong>: $180.00</span>
                        </li>
                    </ul>
                </li>
            </div>
            <!-- End Side Menu -->
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->


    <!-- Start MT  -->
    <div class="latest-blog">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>???????????????</h1>
                        <p>-???????????????????????????RoyalBeanCafe????????????????????????-</p>
                    </div>
                </div>
            </div>
            
            <ul id="storetitle" class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="couponManagement.controller">???????????????</a>
			  </li>
		<!--  	 
		      <li class="nav-item">
			    <a class="nav-link" aria-current="page" href="activityStoreAdd.controller">????????????</a>
			  </li>
			  
			  <li class="nav-item">
				  <form class="d-flex">
			        <input id="searchName" class="form-control me-2" type="text" placeholder="Search" aria-label="Search">
			        <button id="searchNameAction" class="btn btn-secondary" type="button">Search</button>
			      </form>
		      </li>
		-->      
			</ul>

            <table id="aCouponList" class="table table-hover">
				  <!--
				  <thead>
				    <tr>
				      <th scope="col">????????????</th>
				      <th scope="col">????????????</th>
				      <th scope="col">????????????</th>
				      <th scope="col">??????</th>
				      <th scope="col">??????</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach var="actstores" items="${actstores}">
				    <tr>
				      <th scope="row">${actstores.sId}</th>
				      <td>${actstores.sName}</td>
				      <td>${actstores.editDate}</td>
				      <td><a href="${actstores.sId}.updateStore"><i class="fa fa-pencil-square-o"/></a></td>
				      <td><a href="${actstores.sId}.deleteStore"><i class="far fa-trash-alt"/></a></td>
				    </tr>
				    </c:forEach>
				  </tbody>
				  -->  
				</table>
				
				<table class="table">
					<tr>
						<td id="pagebutton"> 
							<c:forEach var="i" begin="1" end="${totalPages}" step="1">
							<div class="btn-group" role="group" aria-label="First group">
							<button id="myPage" class="btn btn-outline-secondary" value="${i}" onclick="change(${i})">${i}</button>
							</div>
							</c:forEach>
						</td>
						<td id="totalElements" colspan="4" align="right">????????????${totalPages} / ????????????${totalElements}</td>
					</tr>	 
				</table>
        </div>
    </div>
    <!-- End MT  -->


    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/jquery.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/java.png" alt="" style="height: 150PX;"/>
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/ajax.jpg " alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/htmlcssjs.png" alt=""  style="height: 150PX;"/>
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/springboot.png" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/bootstrap.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/hubernate.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/sqlserver.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="/images/github.jpg" alt="" style="height: 150PX;" />
                    <div class="hov-in">
                        <a href="#"></a>
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
                            <h4>????????????</h4>
                            <ul>
                                <li style="color:#FFF8DC ;">HTML???CSS???JS</li><br>
                                <li style="color:#FFF8DC ;">AJAX</li><br>
                                <li style="color:#FFF8DC ;">JQuery</li><br>
                                <li style="color:#FFF8DC ;">bootstrap</h3></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>????????????</h4>
                            <ul>
                                <li style="color:#FFF8DC ;">Java</li><br>
                                <li style="color:#FFF8DC ;">SpringBoot</li><br>
                                <li style="color:#FFF8DC ;">Hibernate</li><br>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>?????????&????????????</h4>
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
    

</body>

</html>