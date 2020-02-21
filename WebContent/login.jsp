<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("ValidMem") != null){ %>
 	<jsp:forward page = "main.jsp"></jsp:forward>
<% } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var = "ri" value = "${ri}"/>
	
	<c:choose>
    <c:when test="${ri eq 1}">
        <script language = "javascript">
			alert("Join Success");
		</script>
    </c:when>
    <c:when test="${ri eq 0}">
        <script language = "javascript">
			alert("Join Failure");
		</script>
    </c:when>
    <c:when test="${ri eq -1}">
        <script language = "javascript">
			alert("Join Failure");
		</script>
    </c:when>
	</c:choose>

	<form action = "loginOK.do" method = "post">
		아이디: <input type = "text" name = "id" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id"));%>"> <br/>
		비밀번호: <input type = "password" name = "pw"><br/>
		<input type = "submit" value="로그인"> &nbsp;&nbsp; <input type = "button" value="회원가입" onclick = "javascript:window.location='join.jsp'">
	</form>
</body>
</html>