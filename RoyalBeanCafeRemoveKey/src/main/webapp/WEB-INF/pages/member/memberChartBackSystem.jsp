<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>RoyalBeanCafe</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="/dist/css/adminlte.min.css">

        <!-- my css -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="/js/member.js"></script>
        <script>


        </script>
        <style>
          .onlybuttom {
            color: white;
            background-color: rgb(88, 135, 236);
            border: 0px;
            border-radius: 5px;
          }
        </style>


      </head>

      <body class="hold-transition sidebar-mini">


        <!-- 管理員登入後header -->
        <%@include file="/WEB-INF/pages/headerfooter/backheader.jsp" %>
          <!-- 管理員登入後header -->


          <!-- 內容開始 -->
          <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <div class="container-fluid">
                <div class="row mb-2">
                  <div class="col-sm-6">
                    <h1>會員數據分析</h1>
                  </div>
                </div>
              </div><!-- /.container-fluid -->
            </section style="border:0px">

            <!-- Main content -->
            <section class="content">
              <div class="row">
              <div class="col-lg-3 col-6">
                <!-- small card -->
                <div class="small-box bg-info">
                  <div class="inner">
                    <h3 id="addtotal"></h3>    
                    <p>2021年總登入人數</p>
                  </div>
                  <div class="icon">
                    <i class="fas fa-users"></i>
                  </div>
                </div>
              </div>
              <div class="col-lg-3 col-6">
                <!-- small card -->
                <div class="small-box bg-warning">
                  <div class="inner">
                    <h3>${ResPeople}</h3>    
                    <p>註冊人數</p>
                  </div>
                  <div class="icon">
                    <i class="fas fa-user-check"></i>
                  </div>
                </div>
              </div>
            </div>
              <!-- AREA CHART -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">2021登入人數</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="areaChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            
              <!-- DONUT CHART -->
              <div class="card card-danger">
                <div class="card-header">
                  <h3 class="card-title">會員性別比</h3>

                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                      <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                      <i class="fas fa-times"></i>
                    </button>
                  </div>
                </div>
                <div class="card-body">
                  <canvas id="donutChart"
                    style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
          </div>

          </section>
          <!-- /.content -->
          <!-- hidden value -->
          <input type="hidden" value="${manNumber}" id="manNumber">
          <input type="hidden" value="${womanNumber}" id="womanNumber">


          </div>
          <!-- /.content-wrapper -->
          <!-- 內容結束 -->

          <!-- footer -->
          <%@include file="/WEB-INF/pages/headerfooter/backfooter.jsp" %>
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
            <!-- ChartJS -->
            <script src="/plugins/chart.js/Chart.min.js"></script>
            <!-- AdminLTE App -->
            <script src="/dist/js/adminlte.min.js"></script>
            <!-- AdminLTE for demo purposes -->
            <script src="/dist/js/demo.js"></script>

            <script>
              $(function () {
                //-------------
                //- DONUT CHART -
                //-------------
                // Get context with jQuery - using jQuery's .get() method.
                var manNumber = $('#manNumber').val();
                var womanNumber = $('#womanNumber').val();

                var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
                var donutData = {
                  labels: [
                    '男性',
                    '女性',
                  ],
                  datasets: [
                    {
                      data: [manNumber, womanNumber],
                      backgroundColor: ['#00c0ef','#f56954'],
                    }
                  ]
                }
                var donutOptions = {
                  maintainAspectRatio: false,
                  responsive: true,
                }
                //Create pie or douhnut chart
                // You can switch between pie and douhnut using the method below.
                new Chart(donutChartCanvas, {
                  type: 'doughnut',
                  data: donutData,
                  options: donutOptions
                })



                //--------------
                //- AREA CHART -
                //--------------
                //  Get data
                var total=new Array();
                var addtotal =0 ;
                $(function(){
                  findTotal();
                });               
                function findTotal(){
                  $.ajax({
                    type:'get',
                    url:'TotalLoginPeople',
                    dataType: 'JSON',
                    success: function(data){
                      var json = JSON.stringify(data, null, 4);
                      var parsedObjinArray = JSON.parse(json);                      
                      
                      $.each(parsedObjinArray,function(i,n){
                        var number = n.number;
                        addtotal += number;
                        total.push(number);
                      });
                      var len= parsedObjinArray.length;
                      for(len;len<12;len++){
                        total.push(0);
                      }
                      console.log(total);
                      console.log(addtotal);
                      $('#addtotal').text(addtotal);
                      chart2(total)
                      console.log("success");
                    },
                    error: function(){
                      console.log("error");
                    }
                  });
                };

                function chart2(total){               
                // Get context with jQuery - using jQuery's .get() method.
                var areaChartCanvas = $('#areaChart').get(0).getContext('2d')

                var areaChartData = {
                  labels: ['一月', '二月', '三月', '四月', '五月', '六月', '七月','八月', '九月', '十月', '十一月', '十二月'],
                  datasets: [
                    {
                      label: 'Digital Goods',
                      backgroundColor: 'rgba(60,141,188,0.9)',
                      borderColor: 'rgba(60,141,188,0.8)',
                      pointRadius: false,
                      pointColor: '#3b8bba',
                      pointStrokeColor: 'rgba(60,141,188,1)',
                      pointHighlightFill: '#fff',
                      pointHighlightStroke: 'rgba(60,141,188,1)',
                      data: total 
                      // data: [total[0], 59, 80, 81, 56, 55, 40]
                    }                    
                  ]
                }
               
                var areaChartOptions = {
                  maintainAspectRatio: false,
                  responsive: true,
                  legend: {
                    display: false
                  },
                  scales: {
                    xAxes: [{
                      gridLines: {
                        display: false,
                      }
                    }],
                    yAxes: [{
                      gridLines: {
                        display: false,
                      }
                    }]
                  }
                }
                // This will get the first returned node in the jQuery collection.
                new Chart(areaChartCanvas, {
                  type: 'line',
                  data: areaChartData,
                  options: areaChartOptions
                })
              
                };
              });
            </script>

      </body>

      </html>