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
          var nowMember = 1;
          var nowMemberContent = 1;
          var nowCompany =1 ;
          $(function(){
            findAllMember(indexPage);
            findAllMemberContent(indexPage);
          });
          $('#MemberSeacrch').click(function (e) {
            e.preventDefault();
            findAllMember(1);
          });

          function changeMember(page) {
            indexPage = page;
            nowMember = indexPage;
            findAllMember(indexPage);
          }
          function changeMemberContent(page) {
            indexPage = page;
            nowMemberContent = indexPage;
            findAllMemberContent(indexPage);
          }
          // ------------------- Ban-----------------------

          function memberBan(id) {
            $.ajax({
              type: 'get',
              url: 'member_ban/' + id,
              success: function () {
                findAllMember(nowMember);
                console.log('Success');
              },
              error: function () {
                console.log('error');
              }
            });
          }

          //  --------------unlock----------------
          function memberOpen(id) {
            $.ajax({
              type: 'get',
              url: 'member_open/' + id,
              success: function () {
                findAllMember(nowMember);
                console.log('Success');
              },
              error: function () {
                console.log('error');
              }
            });
          }

// --------------- \/\/\/\/\/\/\/ update \/\/\/\/\/\/\/ ----------------
          function memberContentUpadate(id) {
            var id = $("#a" + id).text();
            var name = $("#b" + id).text();
            var phone = $("#c" + id).text();
            var birthday = $("#d" + id).text();
            var city = $("#e" + id).text();
            var address = $("#f" + id).text();
            var gender = $("#g" + id).text();
            var picture = $("#h" + id).attr('src');
            // $("#z"+id).remove(); //刪除
            $("#z" + id).empty();
            var tr =
              "<td>#</td>"
              + "<td id=\'a" + id + "\'>" + id + "</td>"
              + "<td>" + "<input type=\"text\" id=\'b" + id + "\' value=\"" + name + "\" style=\"width:70px;\" class=\"DSchangeinput\">" + "</td>"
              + "<td>" + "<input type=\"text\" id=\'c" + id + "\' value=\"" + phone + "\" style=\"width:80px;\" class=\"DSchangeinput\">" + "</td>"
              + "<td>" + "<input type=\"text\" id=\'d" + id + "\' value=\"" + birthday + "\" style=\"width:80px;\" class=\"DSchangeinput\">" + "</td>"
              + "<td>" + "<input type=\"text\" id=\'e" + id + "\' value=\"" + city + "\" style=\"width:80px;\" class=\"DSchangeinput\">" + "</td>"
              + "<td>" + "<input type=\"text\" id=\'f" + id + "\' value=\"" + address + "\" style=\"width:100px;\" class=\"DSchangeinput\">" + "</td>"
              + "<td>" + "<input type=\"text\" id=\'g" + id + "\' value=\"" + gender + "\" style=\"width:30px;\" class=\"DSchangeinput\">" + "</td>"
              +"<td><img src=\'" + picture + "\'  style=\"width: 200px;height: 200px;\" id=\'h" + id + "\'>"+"</td>"
              // + "<td>" + "<input type=\"text\" id=\'h" + id + "\' value=\"" + picture + "\">" + "</td>"
              + "<td class=\"project-actions text-right\">"
              + "<button class=\"btn btn-info btn-sm\" onclick=\"yes(" + id + ")\">"
              + "<i class=\"fas fa-pencil-alt\"></i>Yes</button>"
              + "<button class=\"btn btn-danger btn-sm\" onclick=\"no()\">"
              + "<i class=\"fas fa-trash\"></i>No</button></td>";

            $("#z" + id).append(tr);

          }

          function yes(id) {
            var id = $("#a" + id).text();
            var name = $("#b" + id).val();
            var phone = $("#c" + id).val();
            var birthday = $("#d" + id).val();
            var city = $("#e" + id).val();
            var address = $("#f" + id).val();
            var gender = $("#g" + id).val();
            var picture = $("#h" + id).attr('src');
            var params = { 
              'id':id,
              'name': name, 
              'phone': phone ,
              'birthday':birthday,
              'city':city,
              'address':address,
              'gender':gender,
              'picture':picture
            };
            console.log(params);
            $.ajax({
              type: 'post',
              url: 'member_content_update',
              contentType: 'application/json',
              data: JSON.stringify(params),
              success: function () {
                console.log('Success');
                swal.fire(
                  'Success',
                  '已經成功修改完畢!',
                  'success'
                )
                findAllMemberContent(nowMemberContent);
              },
              error: function () {
                console.log('error');
              }
            });
          };

          function no(){
            findAllMemberContent(nowMemberContent);
          };
 // ---------------^^^^^^^^^^^^^^^^^^ update   ^^^^^^^^^^^^----------------

          function findAllMember(indexPage) {
            $.ajax({
              type: 'post',
              url: 'BackgroundSearchMember_findAlldata/' + indexPage,
              dataType: 'JSON',
              contentType: 'application/json',
              success: function (data) {
                var json = JSON.stringify(data, null, 4);
                var i = indexPage;

                var parsedObjinArray = JSON.parse(json);
                $('#AllMember').empty("");
                if (json = null) {
                  $('#AllMember').append("<tr><td colspan='2'>暫無資料</td></tr>");
                } else {
                  var table = $('#AllMember');
                  table.append("<thead><tr><th style=\"width: 1%\">#</th>"
                    + "<th >會員 ID</th>"
                    + "<th >會員信箱</th>"
                    + "<th >會員密碼</th>"
                    + "<th  class=\"text-center\">生效</th>"
                    + "<th>黑名單</th>"
                    + "<th>會員內容 ID</th>"
                    + "<th style=\"width: 20%\">" + "</th></tr></thead><tbody id=\"memberbody\"></tbody>");

                  $.each(parsedObjinArray, function (i, n) {
                    var MCID = "暫無資料";
                    if (n.memberContent != null) {
                      var MCID = n.memberContent.id;
                    }
                    var ACID = "暫無資料";
                    if (n.active != null) {
                      var ACID = n.active;
                    }
                    var PCID = "暫無資料";
                    if (n.pwd != null) {
                      var PCID = n.pwd;
                    }
                    var BCID = "暫無資料";
                    if (n.blackList != null) {
                      var BCID = n.blackList;
                    }

                    var tr =
                      "<tr>" +"<td>#</td>"+ "<td>" + n.id + "</td>" +
                        "<td>" + n.email + "</td>" + "<td style=\"font-size:2px;word-break: break-all;\">" + PCID + "</td>" +
                        "<td>" + ACID + "</td>" + "<td>" + BCID + "</td>"
                      + "<td>" + MCID + "</td>"
                      + "<td class=\"project-actions text-right\">"
                      + "<button class=\"btn btn-primary btn-sm\" onclick=\"memberOpen(" + n.id + ")\">"
                      + "<i class=\"far fa-check-square\"></i></button>"
                      +" "
                      + "<button class=\"btn btn-danger btn-sm\" onclick=\"memberBan(" + n.id + ")\">"
                      + "<i class=\"fas fa-ban\"></i></button></td></tr>";
                     
                    $('#memberbody').append(tr);
                  })
                }
              },
              error: function () {
                console.log('error');
              }
            });
          };



          $('#MemberContentSeacrch').click(function (e) {
            e.preventDefault();
            findAllMemberContent(1);
          });


          function findAllMemberContent(indexPage) {
            $.ajax({
              type: 'post',
              url: 'BackgroundMemberContent_findAlldata/' + indexPage,
              dataType: 'JSON',
              contentType: 'application/json',
              success: function (data) {
                var json = JSON.stringify(data, null, 4);
                console.log("SUCCESS : ", json);
                var i = json.length;

                var parsedObjinArray = JSON.parse(json);
                $('#AllMemberContent').empty("");
                if (json = null) {
                  $('#AllMemberContent').append("<tr><td colspan='2'>暫無資料</td></tr>");
                } else {
                  var table = $('#AllMemberContent');
                  table.append("<thead><tr><th style=\"width: 5%\">#</th>"
                    + "<th style=\"width: 15%\">會員內容 ID</th>"
                    + "<th style=\"width: 15%\">名稱</th>"
                    + "<th style=\"width: 15%\">電話</th>"
                    + "<th style=\"width: 8%\">生日</th>"
                    + "<th style=\"width: 8%\">城市</th>"
                    + "<th style=\"width: 20%\">住址</th>"
                    + "<th style=\"width: 8%\">性別</th>"
                    + "<th style=\"width: 20%\">照片</th>"
                    + "<th style=\"width: 20%\">" + "</th></tr></thead><tbody id=\"memberContentbody\"></tbody>");

                  $.each(parsedObjinArray, function (i, n) {
                    var tr =

                      "<tr id=\"z" + n.id + "\">" + "<td>#</td>" + "<td id=\'a" + n.id + "\'>" + n.id + "</td>" +
                      "<td id=\'b" + n.id + "\'>" + n.name + "</td>" + "<td id=\'c" + n.id + "\'style=\"word-break: break-all;\">" + n.phone + "</td>" +
                      "<td id=\'d" + n.id + "\'>" + n.birthday + "</td>" + "<td id=\'e" + n.id + "\'>" + n.city + "</td>"
                      + "<td id=\'f" + n.id + "\' style=\"word-break: break-all;\">" + n.address+ "</td>"+ "<td id=\'g" + n.id + "\'>" + n.gender+ "</td>" 
                      +"<td><img src=\'" + n.picture + "\'  style=\"width: 200px;height: 200px;\" id=\'h" + n.id + "\'>"+"</td>"
                      // +"<td id=\'h" + n.id + "\' >" + n.picture+"</td>"
                      + "<td class=\"project-actions text-right\">"
                      + "<button class=\"btn btn-info btn-sm\" onclick=\"memberContentUpadate(" + n.id + ")\">"
                      + "<i class=\"fas fa-pencil-alt\"></i>Edit</button>"

                    $('#memberContentbody').append(tr);
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
          .DSchangeinput{
            border:0px;
            background-color: rgb(167, 165, 165);
            height: 30px;
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
                    <h1>會員管理</h1>
                    <form id="form_background">
                      <input type="submit" id="MemberSeacrch" class="onlybuttom" value="會員">
                      <input type="submit" id="MemberContentSeacrch" class="onlybuttom" value="會員內容">
                    </form>
                  </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="#">首頁</a></li>
                      <li class="breadcrumb-item active">會員系統</li>
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
                  <h3 class="card-title">會員</h3>

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
                  <table class="table table-striped projects" id="AllMember">
                  </table>
                  <table id="showpage" class="table table-striped projects">
                    <tr>
                      <td>總頁數 : ${totalPages_member} 共有 : ${totalElements_member} 筆資料</td>
                      <td colspan="3" align="right"><c:forEach var="i" begin="1" end="${totalPages_member}"
                          step="1">
                          <button id="myPage" value="${i}" onclick="changeMember(${i})" style="border: 5px; border-radius: 5px; background-color: cadetblue;">${i}</button>
                        </c:forEach>
                      </td>
                    </tr>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
              <!-- Default box-2 MemberContent -->
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">會員內容</h3>

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


                  <table class="table table-striped projects" id="AllMemberContent">
                  </table>
                  <table id="showpage" class="table table-striped projects">
                    <tr>
                      <td>總頁數 : ${totalPages_MemberContent} 共有 : ${totalElements_MemberContent} 筆資料</td>
                      <td colspan="3" align="right"> <c:forEach var="s" begin="1"
                          end="${totalPages_MemberContent}" step="1">
                          <button id="myPage" value="${s}" onclick="changeMemberContent(${s})" style="border: 5px; border-radius: 5px; background-color: cadetblue;">${s}</button>
                        </c:forEach>
                      </td>
                    </tr>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
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