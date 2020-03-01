<%@page import="com.javalec.jsp_homepage.Dto.MemberDto"%>
<%@page import="com.javalec.jsp_homepage.Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="css_folder/assets/css/main.css" />
    
<%
	String id = (String)session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InfoUpdate Page</title>
<script language="JavaScript" src="members.js" ></script>
</head>
<body>
	<section id="footer">
	<div class="container">
	<header class="major">
		<h2>정보 수정 페이지</h2>
	</header>
	<form action = "loginOK.do" method = "post" name="reg_frm">
		<div class="row gtr-uniform">
			<div class="col-12"><input type = "text" name = "id" value = "<%=dto.getId() %>  --> ID는 바꿀수 없습니다." readonly/></div>
			<div class="col-12"><input type = "password" name = "pw" placeholder="PW" /></div>
			<div class="col-12"><input type ="password" name ="pw_check" placeholder="PW_CHECK" /></div>
			<div class="col-12"><input type ="text" name ="name" value = "<%=dto.getName()%>  --> 이름은 바꿀수 없습니다." readonly/></div>
			<div class="col-12"><input type = "text" name = "eMail" value = "<%=dto.geteMail() %>" placeholder="EMAIL" /></div>
			<div class="col-12"><input type="text" name="address" value="<%= dto.getAddress() %>" placeholder="ADDRESS" /></div>
			<div class="col-12">
				<ul class="actions special">
					<li><input type = "button" value = "수정" onclick = "updateInfoConfirm()" class="primary"></li>
					<li><input type = "reset" value = "취소" onclick = "javascript:window.location='login.do'" class="primary"></li>
				</ul>
			</div>
		</div>
	</form>
	</section>
</body>
</html>