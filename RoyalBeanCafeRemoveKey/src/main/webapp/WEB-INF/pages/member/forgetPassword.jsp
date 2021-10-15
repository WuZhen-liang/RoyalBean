<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!doctype html>
  <html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>RoyalBeanCafe</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">


    <!-- Bootstrap core CSS -->
    <link href="/css/Login.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>


    <!-- Custom styles for this template -->
    <link href="/css/memberLogin.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/js/member.js"></script>
    <script>
      $(function () {
        $('#sendEamil').click(function (e) {
          e.preventDefault();
          var email = $('#email').val();
          var params = {'email': email};
          console.log(params);
          $.ajax({
            type: 'post',
            url: 'forgetPasswordAction',
            contentType: 'application/json',
            data: JSON.stringify(params),
            success: function (data) {
              if(data=="Success"){
                console.log('Success');
                swal.fire(
                'Success',
                '已經重新將新的密碼寄到您的信箱!',
                'success'
                )
              }else{
                console.log('error');
                swal.fire(
                'fail',
                '請輸入正確信箱或是使用有申請的帳號!',
                'error'
                ) 
              }             
            },
            error: function () {
              console.log('error');
            }
          });
        });
      });

    </script>

  </head>

  <body class="text-center">

    <main class="form-signin">
      <form action="/user/login" method="post">
        <img class="mb-4" src="/build/coffeelogo.png" alt="" width="72" height="90">
        <h1 class="h3 mb-3 fw-normal">請輸入信箱</h1>
        <h2 class="h3 mb-3 fw-normal" style="font-size: 12px;color: brown;"> ${error}</h2>
        <div class="form-floating">
          <input type="email" class="form-control" id="email" placeholder="name@example.com" name="username" required>
          <label for="floatingInput">Email address</label>
        </div>
        <br>
        <div>
          <a href="/user/login" class="mt-5 mb-3 text-muted">返回會員登入</a>
        </div>
        <br>
        <input class="w-100 btn btn-lg btn-primary buttoncolor1" type="submit" value="寄出" id="sendEamil">
        <p class="mt-5 mb-3 text-muted">&copy; ROYAL BEAN 2021</p>
      </form>
    </main>



  </body>

  </html>