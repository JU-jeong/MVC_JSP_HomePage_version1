<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css_folder/assets/css/main.css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Board</title>
</head>
<body>
	<c:set var="Modify_Result" value="${Modify_Result}" />
	<c:choose>
		<c:when test="${Modify_Result eq 1}">
			<script language="javascript">
				alert("Modify Success");
			</script>
			<c:remove var="Modify_Result" />
		</c:when>
		<c:when test="${Modify_Result eq 0}">
			<script language="javascript">
				alert("권한이 없습니다.");
			</script>
			<c:remove var="Modify_Result" />
		</c:when>
	</c:choose>

	<c:set var="Delete_Result" value="${Delete_Result}" />
	<c:choose>
		<c:when test="${Delete_Result eq 1}">
			<script language="javascript">
				alert("Delete Success");
			</script>
			<c:remove var="Delete_Result" />
		</c:when>
		<c:when test="${Delete_Result eq 0}">
			<script language="javascript">
				alert("권한이 없습니다.");
			</script>
			<c:remove var="Delete_Result" />
		</c:when>
	</c:choose>
	<section id="four" class="main">
	<div class="container">
		<div class="content">
			<section>
			<h4>게시판</h4>
			<div class="table-wrapper">
				<table class="alt">
					<thead>
						<tr>
							<th>No.</th>
							<th>Writer</th>
							<th>Title</th>
							<th>Date</th>
							<th>Hit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.bId}</td>
								<td>${dto.bName}</td>
								<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach>
									<a href="content_view.do?bId=${dto.bId}">${dto.bTitle}</a></td>
								<td>${dto.bDate}</td>
								<td>${dto.bHit}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5"><a href="write_view.do">글작성</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.do">로그아웃</a></td>
						</tr>
					</tbody>
				</table>
			</div>
			</section>
		</div>
	</div>
	</section>

</body>
</html>