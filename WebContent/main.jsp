<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="main.css" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
   
   	<c:set var="ValidMem" value="${ValidMem}" />
   	<c:if test="${ValidMem eq null}">
        <jsp:forward page = "login.do"></jsp:forward>
   	</c:if>
   	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${name}님 안녕하세요.</h2><br/>
	<form action = "logout.do" method = "post">
		<input type = "submit" value = "로그아웃"> 
		<input type = "button" value = "정보수정" onclick = "javascript:window.location='modify.do'">
		<input type = "button" value = "게시판" onclick = "javascript:window.location='list.do'">
	</form>
</body>
</html>