<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" type="text/css" href="main.css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="Bmodify.do" method="post">
			<input type="hidden" name="bId" value="${content_view.bId}">
			<tr>
				<td> 번호 </td>
				<td> ${content_view.bId} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${content_view.bHit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> ${content_view.bName}</td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> ${content_view.bTitle}</td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> ${content_view.bContent}</td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp;
				 <a href="list.do">목록보기</a> &nbsp;&nbsp; 
				 <a href="delete.do?bId=${content_view.bId}?bName=${content_view.bName}">삭제</a> &nbsp;&nbsp; 
				 <a href="reply_view.do?bId=${content_view.bId}">답변</a></td>
			</tr>
		</form>
	</table>
	
</body>
</html>