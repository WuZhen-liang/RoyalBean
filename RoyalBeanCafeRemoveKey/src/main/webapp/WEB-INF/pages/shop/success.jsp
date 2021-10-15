<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script type="text/javascript">
  $(document).ready(function() {
      swal.fire({
     	  position: 'top',
     	  icon: 'success',
     	  title: 'Pay Successd!',
     	  showConfirmButton: false,
     	  timer: 1500
     	});	  
  });
  </script>
<title>Insert title here</title>
</head>
<body>
	<h1>Payment Success</h1>
	<a href="jpuserpage">Back Shop</a>
</body>
</html>