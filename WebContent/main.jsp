<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="main.css" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
   
   	<c:set var="ValidMem" value="${ValidMem}" />
   	<c:if test="${ValidMem eq null}">
        <jsp:forward page = "login.do"></jsp:forward>
   	</c:if>
   	
   	<c:set var="Login_Result" value="${Login_Result}" />
   	<c:if test="${Login_Result eq 1}">
        <script language = "javascript">
			alert("Login Success");
		</script>
		<c:remove var="Login_Result"/>
   	</c:if>
		
   	<c:set var="Update_Result" value="${Update_Result}" />
   	<c:if test="${Update_Result eq 1}">
        <script language = "javascript">
			alert("Update Success");
		</script>
		<c:remove var="Update_Result"/>
   	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${name}님 안녕하세요.</h1><br/>
	<form action = "logout.do" method = "post">
		<input type = "submit" value = "로그아웃"> &nbsp;&nbsp;&nbsp; 
		<input type = "button" value = "정보수정" onclick = "javascript:window.location='modify.do'">
		<input type = "button" value = "게시판" onclick = "javascript:window.location='modify.do'">
	</form>
</body>
</html>