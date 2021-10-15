<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QAList</title>
</head>
<body>
<form action="./QAListAll.controller" method="post">
<input type="submit" value="送出" id="submit" >
</form>

<table class='table'>
            <thead>
              <tr>
                <th>#</th>
                <th>編輯員工</th>
                <th>標題</th>
                <th>新增時間</th>
                <th class='actions'>
                  Actions
                </th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="QAList" items="${QAList}">      
              <tr class='success'>
                <td>${QAList.QAid}</td>
                <td>${QAList.eID}</td>
                <td>${QAList.QAtitle}</td>
                <td>${QAList.QAtime}</td>               
                <td class='action'>
                  <form action="./findQAid.controller" method="post"><input hidden name="uptID" value=${QAList.QAid} /><button value="修改" type="submit">修改</button></form>
                  <form action="./QAdel.controller" method="post"><input hidden name="delID" value=${QAList.QAid} /><button value="刪除" type="submit">刪除</button></form>
                  </td>                
              </tr>
               </c:forEach>
            </tbody>
          </table>

<!--<c:forEach items="${QAList}" var="QAList">
	
	${QAList.QAid};<br>
	${QAList.eID};<br>
	${QAList.QAtitle};<br>
	${QAList.QAanswer};<br>
	${QAList.QAtime};<br>

	
</c:forEach>
-->
</body>
</html>