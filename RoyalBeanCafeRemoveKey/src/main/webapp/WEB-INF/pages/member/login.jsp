<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>RoyalBeanCafe</title>
<link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
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
      .homestyle{
        background-color: white;
        border: 0px;
      }



    </style>

    
    <!-- Custom styles for this template -->
    <link href="/css/memberLogin.css" rel="stylesheet">
  </head>
  <body class="text-center">   
  <main class="form-signin">
  <form action="/user/login" method="post">
    <img class="mb-4" src="/build/coffeelogo.png" alt="" width="72" height="90">
    <h1 class="h3 mb-3 fw-normal">登入畫面</h1>
    <h2 class="h3 mb-3 fw-normal" style="font-size: 12px;color: brown;"> ${error}</h2>
    <div class="form-floating">
      <input type="email" class="form-control" id="EmailInput" placeholder="name@example.com" name="username">
      <label for="floatingInput">請輸入信箱</label>  
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="PasswordInpunt" placeholder="Password" name="password">
      <label for="floatingPassword">請輸入密碼</label>
    </div>

    <div class="checkbox mb-3">
     <br>
    <input class="w-100 btn btn-lg btn-primary buttoncolor1" type="submit" value="登入">
    ${errors.msg}     
  </form>
  <br>
   	<div><br>
   		<a href="/company/login"><i class="far fa-building w-30 btn btn-lg btn-primary googlestyle"></i></a>
   		<a href="/admin/login"><i class="far fa-eye  w-30 btn btn-lg btn-primary googlestyle"></i></a>
    	<a href="/oauth2/authorization/google"><i class="fab fa-google w-30 btn btn-lg btn-primary googlestyle"></i></a>  	
    </div><br>
    <div>
        <input type="button" value="一鍵輸入" class="w-30 btn btn-lg btn-primary normalstyle" id="onebutton">
        <a href="/forgetPassword" class="mt-5 mb-3 text-muted"><input type="button" value="忘記密碼" class="w-30 btn btn-lg btn-primary normalstyle"></input></a>  
        <a href="/homepage" class="mt-5 mb-3 text-muted"><input type="button" value="首頁" class="w-30 btn btn-lg btn-primary normalstyle"></input></a>  
    </div>  
    <p class="mt-5 mb-3 text-muted">&copy; ROYAL BEAN 2021</p>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
 $('#onebutton').click(function(){
   $('#EmailInput').val('EEIT12902@gmail.com');
   $('#PasswordInpunt').val('EEIT12902EEIT12902');
 });
</script>
    
</body>
</html>
