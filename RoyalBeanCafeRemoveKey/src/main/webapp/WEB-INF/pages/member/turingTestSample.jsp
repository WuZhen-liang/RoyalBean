<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>圖靈測試</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    .turingtest{
        color: white;
        background-color: rgb(43, 23, 226);
        border: 5px;
        border-radius: 5px;
        width: 150px;
        height: 50px;
        font-size: 50px;
        padding: 20px;
        text-align: center;
    }

    </style>
</head>
<body>
    <input type="text" id="textBox">
    <button id="send" value="">send</button><br><hr>
    <span id="result"></span><br><hr>
    <div id="turingtest" class="turingtest"></div><br>
    <button id="reload" value="">reflesh</button>
    
    
    <script src="js/turingtest.js"></script>
    
</body>
</html>