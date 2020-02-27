<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="main.css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:set var="Modify_Result" value="${Modify_Result}" />
    <c:choose>
    <c:when test="${Modify_Result eq 1}">
        <script language = "javascript">
			alert("Modify Success");
		</script>
		<c:remove var="Modify_Result"/>
    </c:when>
    <c:when test="${Modify_Result eq 0}">
        <script language = "javascript">
			alert("Modify Failure");
		</script>
		<c:remove var="Modify_Result"/>
    </c:when>
    </c:choose>
    
    <c:set var="Delete_Result" value="${Delete_Result}" />
    <c:choose>
    <c:when test="${Delete_Result eq 1}">
        <script language = "javascript">
			alert("Delete Success");
		</script>
		<c:remove var="Delete_Result"/>
    </c:when>
    <c:when test="${Delete_Result eq 0}">
        <script language = "javascript">
			alert("Delete Failure");
		</script>
		<c:remove var="Delete_Result"/>
    </c:when>
    </c:choose>
    
    
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.bId}</td>
			<td>${dto.bName}</td>
			<td>
				<c:forEach begin="1" end="${dto.bIndent}">-</c:forEach>
				<a href="content_view.do?bId=${dto.bId}">${dto.bTitle}</a></td>
			<td>${dto.bDate}</td>
			<td>${dto.bHit}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5"> <a href="write_view.do">글작성</a> </td>
		</tr>
	</table>
	
</body>
</html>