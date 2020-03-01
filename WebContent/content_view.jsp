<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" href="css_folder/assets/css/main.css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물</title>
</head>
<body>
	<section id="four" class="main">
				<div class="container">
					<div class="content">
						<section>
							<h4>게시물</h4>
							<form action="Bmodify.do" method="post">
								<div class="row gtr-uniform">
									<div class="col-6 col-12-xsmall">
										<input type="text" name="bTitle" value="${content_view.bTitle}" placeholder="Name" />
									</div>
									
									<div class="col-12">
										<textarea name="bContent" rows="6">${content_view.bContent}</textarea>
									</div>
									<input type="submit" value="수정">
									<a href="list.do">목록보기</a> &nbsp;&nbsp; 
									<a href="delete.do?bId=${content_view.bId}?bName=${content_view.bName}">삭제</a> &nbsp;&nbsp; 
									<a href="reply_view.do?bId=${content_view.bId}">답변</a>
								</div>
							</form>
						</section>

						
					</div>
				</div>
			</section>
	
</body>
</html>