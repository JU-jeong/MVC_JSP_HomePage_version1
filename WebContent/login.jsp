<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="main.css" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="ValidMem" value="${ValidMem}" />
    <c:if test="${ValidMem ne null}">
    <%
         response.sendRedirect("main.jsp"); 
    %>
    </c:if>
    
	<form action = "loginOK.do" method = "post">
		아이디: <input type = "text" name = "id" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id"));%>"> <br/>
		비밀번호: <input type = "password" name = "pw"><br/>
		<input type = "submit" value="로그인"> &nbsp;&nbsp; <input type = "button" value="회원가입" onclick = "javascript:window.location='join.do'">
	</form>
</body>
</html>