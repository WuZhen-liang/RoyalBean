<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    textarea {
        border: none;
        background-color: mistyrose;
        resize: none;
        width:100%;
        height: 450px;}
        
    .title{
        background-color: mediumturquoise;
        width: 100%;
    }
    #title1{       
        color: mediumblue;
        font-size: 30px;
    }
    #submit{
        position: fixed;
        right:50px ;
        font-size: 25px;
        background-color: mediumturquoise;
        
    }
    body{
        background-color: mistyrose;
    }

</style>
</head>
<body>
<form action="./UptQA.controller" method="post">
        <div class="title">
            <span id="title1">Q&A</span>
            <span><input type="submit" value="送出" id="submit" ></span>
        </div>
        <label>標題:</label>
        <input hidden name="QAid" value=${qa.QAid} />
            <input type="text" name="QAtitle" id="QAtitle" value="${qa.QAtitle}">
            <textarea name="QAanswer" id="QAanswer"               
                  onfocus="if(value=='輸入內容'){value=''}"
                  onblur="if(value==''){value='輸入內容。'}"
                  >${qa.QAanswer}</textarea>                              
    </form>
<!--    <script src="./styles/jquery-3.6.0.js"></script>
    <script>
    $(function(){
    	$('#QAtitle').blur(function(){
    		var title = document.getElementById("QAtitle").value;
    		if(title == ""){
    			alert("請輸入標題");   			   		  			
    		}else{
    			document.getElementById("submit").disabled=false;
    		}
    	})
    })

    </script> --> 
</body>
</html>