<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 頂部橫條 Start -->
        <div class="wrapper">
          <!-- Navbar -->
          <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav" style="font-size:20px">
              <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
              </li>
              <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">首頁 >> </a>
              </li>              
            </ul>

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
              <!-- Navbar Search -->
              <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                  <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                  <form class="form-inline">
                    <div class="input-group input-group-sm">
                      <input class="form-control form-control-navbar" type="search" placeholder="Search"
                        aria-label="Search">
                      <div class="input-group-append">
                        <button class="btn btn-navbar" type="submit">
                          <i class="fas fa-search"></i>
                        </button>
                        <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                          <i class="fas fa-times"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </li>

              <!-- Messages Dropdown Menu -->
              <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                  <i class="far fa-comments"></i>
                  <span class="badge badge-danger navbar-badge">0</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                  <a href="#" class="dropdown-item">
                    <!-- Message Start -->
                    <div class="media">
                      <img src="/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                      <div class="media-body">
                        <h3 class="dropdown-item-title">
                          Brad Diesel
                          <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                        </h3>
                        <p class="text-sm">Call me whenever you can...</p>
                        <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                      </div>
                    </div>
                    <!-- Message End -->
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item">
                    <!-- Message Start -->
                    <div class="media">
                      <img src="/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                      <div class="media-body">
                        <h3 class="dropdown-item-title">
                          John Pierce
                          <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                        </h3>
                        <p class="text-sm">I got your message bro</p>
                        <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                      </div>
                    </div>
                    <!-- Message End -->
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item">
                    <!-- Message Start -->
                    <div class="media">
                      <img src="/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3" >
                      <div class="media-body">
                        <h3 class="dropdown-item-title">
                          Nora Silvester
                          <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                        </h3>
                        <p class="text-sm">The subject goes here</p>
                        <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                      </div>
                    </div>
                    <!-- Message End -->
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                </div>
              </li>
              <!-- Notifications Dropdown Menu -->
              <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                  <i class="far fa-bell"></i>
                  <span class="badge badge-warning navbar-badge">0</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                  <span class="dropdown-item dropdown-header">15 Notifications</span>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item">
                    <i class="fas fa-envelope mr-2"></i> 4 new messages
                    <span class="float-right text-muted text-sm">3 mins</span>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item">
                    <i class="fas fa-users mr-2"></i> 8 friend requests
                    <span class="float-right text-muted text-sm">12 hours</span>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item">
                    <i class="fas fa-file mr-2"></i> 3 new reports
                    <span class="float-right text-muted text-sm">2 days</span>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                </div>
              </li>
                           
              <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                  <i class="fas fa-th-large"></i>
                </a>
              </li>

          <!-- logout -->
              <li class="nav-item">
                <a class="nav-link" data-widget="" href="/admin/logout" role="button">
                  <i class="fas fa-sign-out-alt"></i>
                </a>              
              </li>
          <!-- logout -->
            </ul>
          </nav>
<!-- 頂部橫條 End -->

<!-- 右邊深藍區塊 Start -->
          <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="#" class="brand-link">
              <img src="/dist/img/coffeelogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                style="opacity: .8">
              <span class="brand-text" style="font-weight:bold;">  RoyalStaff 後台管理</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
              <!-- Sidebar user (optional) -->
              <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                  <!-- <img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image"> -->
                </div>
                <div class="info">
                  
                </div>
              </div>

              <!-- SidebarSearch Form -->
              <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                  <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                    aria-label="Search">
                  <div class="input-group-append">
                    <button class="btn btn-sidebar">
                      <i class="fas fa-search fa-fw"></i>
                    </button>
                  </div>
                </div>
              </div>

          <!-- 會員、商城、活動、服務 start -->
              <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false" style="font-size:20px;font-weight:bold;">
                  
                  <li class="nav-item">
                    <a href="#" class="nav-link"><i class="fas fa-mug-hot"></i>
                      <p>會員系統<i class="fas fa-angle-left right"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                      <li class="nav-item">
                        <a href="memberBackSystem" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>會員管理</p>
                        </a>
                        <a href="companyBackSystem" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>廠商管理</p>
                        </a>
                        <a href="memberBackSystemData" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>會員數據分析</p>
                        </a>
                      </li>                     
                    </ul>
                  </li>
                  
                  <li class="nav-item">
                    <a href="#" class="nav-link"><i class="fas fa-mug-hot"></i>  
                      <p>商城系統<i class="fas fa-angle-left right"></i></p>
                    </a>
	                <ul class="nav nav-treeview">
	                  <li class="nav-item">
	                    <a href="orderDetail" class="nav-link">
	                      <i class="far fa-circle nav-icon"></i>
	                      <p>訂單管理</p>                      
	                    </a>
	                    <a href="adminEntry" class="nav-link">
	                      <i class="far fa-circle nav-icon"></i>
	                      <p>商品管理</p>                      
	                    </a>
	                    <a href="statisticalDiagram" class="nav-link">
	                      <i class="far fa-circle nav-icon"></i>
	                      <p>商城數據分析</p>                      
	                    </a>
	                  </li>
	                </ul>
                  </li>
                  
                  <li class="nav-item">
	                <a href="#" class="nav-link"><i class="fas fa-mug-hot"></i>
	                  <p>  活動系統  <i class="fas fa-angle-left right"></i></p>
	                </a>
	                <ul class="nav nav-treeview">
	                  <li class="nav-item">
	                    <a href="store" class="nav-link">
	                      <i class="far fa-circle nav-icon"></i>
	                      <p>門市管理</p>
	                    </a>
	                    <a href="activity" class="nav-link">
	                      <i class="far fa-circle nav-icon"></i>
	                      <p>活動管理</p>
	                    </a>
	                    <a href="activityorder" class="nav-link">
	                      <i class="far fa-circle nav-icon"></i>
	                      <p>活動訂單</p>
	                    </a>
	                    <a href="activitysatisfaction" class="nav-link">
	                      <i class="far fa-circle nav-icon"></i>
	                      <p>活動評論</p>
	                    </a>
	                    <a href="activitycharts" class="nav-link">
	                      <i class="far fa-circle nav-icon"></i>
	                      <p>活動數據分析</p>
	                    </a>
	                  </li>
	                </ul>
	              </li>	                               
                  
                  <li class="nav-item">
                    <a href="#" class="nav-link"><i class="fas fa-mug-hot"></i>
                      <p>客服系統<i class="fas fa-angle-left right"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                      <li class="nav-item">
                        <a href="/admin/Article" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>文章管理</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="/admin/QAmainpage.controller" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Q&A管理</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="/admin/ReportQuery" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>問題回報管理</p>
                        </a>
                      </li>
                    </ul>
                  </li>
              <!-- 會員、商城、活動、服務 end -->

              </nav>
              <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
          </aside>
<!-- 右邊深藍區塊 End -->


</body>
</html>