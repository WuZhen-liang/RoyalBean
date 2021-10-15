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
          var indexPage = 1;
          var nowCompany =1 ;
          $(function(){
            findAllCompany(indexPage);
          });

          function changecompany(page) {
            indexPage = page;
            nowCompany = indexPage;
            findAllCompany(indexPage);
          }
          // ------------------- Ban-----------------------

          function companyBan(id) {
            $.ajax({
              type: 'get',
              url: 'company_Ban/' + id,
              success: function () {
                findAllCompany(nowCompany)
                console.log('Success');
              },
              error: function () {
                console.log('error');
              }
            });
          }
//   ----------------- unlock---------------
          function companyOpen(id) {
            $.ajax({
              type: 'get',
              url: 'company_Open/' + id,
              success: function () {
                findAllCompany(nowCompany);
                console.log('Success');
              },
              error: function () {
                console.log('error');
              }
            });
          }


// --------------- \/\/\/\/\/\/\/ update \/\/\/\/\/\/\/ ----------------
         
 // ---------------^^^^^^^^^^^^^^^^^^ update   ^^^^^^^^^^^^----------------

          $('#CompanySeacrch').click(function (e) {
            e.preventDefault();
            findAllCompany(1);
          });


          function findAllCompany(indexPage) {
            $.ajax({
              type: 'post',
              url: 'company_finded_all/' + indexPage,
              dataType: 'JSON',
              contentType: 'application/json',
              success: function (data) {
                var json = JSON.stringify(data, null, 4);
                // console.log("SUCCESS : ", json);
                var i = json.length;

                var parsedObjinArray = JSON.parse(json);
                $('#AllCompany').empty("");
                if (json = null) {
                  $('#AllCompany').append("<tr><td colspan='2'>暫無資料</td></tr>");
                } else {
                  var table = $('#AllCompany');
                  table.append("<thead><tr><th style=\"width: 5%\">#</th>"
                    + "<th style=\"width: 8%\">廠商 ID</th>"
                    + "<th >密碼</th>"
                    + "<th style=\"width: 15%\">名稱</th>"
                    + "<th>帳號</th>"
                    + "<th style=\"width: 5%\">生效</th>"
                    + "<th style=\"width: 5%\">黑名單</th>"
                    + "<th style=\"width: 20%\">" + "</th></tr></thead><tbody id=\"companybody\"></tbody>");

                  $.each(parsedObjinArray, function (i, n) {
                    var tr =

                      "<tr>" + "<td>#</td>" + "<td>" + n.id + "</td>" +
                      "<td style=\"font-size:2px; word-break: break-all;\">" + n.pwd + "</td>" + "<td>" + n.name + "</td>" +
                      "<td>" + n.number + "</td>" + "<td>" + n.active + "</td>"
                      + "<td>" + n.blackList + "</td>"
                      + "<td class=\"project-actions text-right\">"
                      + "<button class=\"btn btn-primary btn-sm\" onclick=\"companyOpen(" + n.id + ")\">"
                      + "<i class=\"far fa-check-square\"></i></button>"
                      +" "
                      + "<button class=\"btn btn-danger btn-sm\" onclick=\"companyBan(" + n.id + ")\">"
                      + "<i class=\"fas fa-ban\"></i></button></td></tr>";

                    $('#companybody').append(tr);
                  })
                }
              },
              error: function () {
                console.log('error');
              }
            });
          };
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
<%@include file="/WEB-INF/pages/headerfooter/backheader.jsp"%>	
<!-- 管理員登入後header -->


<!-- 內容開始 -->
          <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <div class="container-fluid">
                <div class="row mb-2">
                  <div class="col-sm-6">
                    <h1>廠商管理</h1>
                    <form id="form_background">
                      <input type="submit" id="CompanySeacrch" class="onlybuttom" value="廠商">
                    </form>
                  </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="#">首頁</a></li>
                      <li class="breadcrumb-item active">廠商</li>
                    </ol>
                  </div>
                </div>
              </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
              <!-- /.card -->
              <!-- Default box-3 Company align="right"-->
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">廠商</h3>

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
                  <table class="table table-striped projects" id="AllCompany">
                  </table>
                  <table id="showpage" class="table table-striped projects">
                    <tr>
                      <td >總頁數 : ${totalPages_company} 共有 : ${totalElements_company} 筆資料</td>
                      <td colspan="3" align="right"><c:forEach var="k" begin="1" end="${totalPages_company}"
                          step="1">
                          <button id="myPage" value="${k}" onclick="changecompany(${k})" style="border: 5px; border-radius: 5px; background-color: cadetblue;">${k}</button>
                        </c:forEach>
                      </td>
                    </tr>
                  </table>
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