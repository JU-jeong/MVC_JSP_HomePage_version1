<%@page import="com.javalec.jsp_homepage.Dao.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "dto" class = "com.javalec.jsp_homepage.Dto.MemberDto"/>
<jsp:setProperty name = "dto" property="*"/>
<% 
	dto.setrDate(new Timestamp(System.currentTimeMillis()));
	MemberDao dao = MemberDao.getInstance();
	if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT){
%>
	<script language = "javascript">
		alert("아이디가 이미 존재합니다.");
		history.back();
	</script>
<%
	} else {
		int ri = dao.insertMember(dto);
		if(ri == MemberDao.MEMBER_JOIN_SUCCESS){
			session.setAttribute("id", dto.getId());
%>

	<script language = "javascript">
		alert("회원가입을 축하합니다.");
		document.location.href= "login.jsp";
	</script>
	
<%
		} else { 
%>
	<script language = "javascript">
		alert("회원가입에 실패했습니다.");
		document.location.href= "login.jsp";
	</script>
<%
		}
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="main.css" rel="stylesheet" type="text/css">
    <link href="fontawesome-all.min.css" rel="stylesheet" type="text/css">
</head>
<body>

</body>
</html>