<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								<input type="hidden" name="bId" value="${content_view.bId}"/>
								<input type="hidden" name="bName" value="${content_view.bName}"/>
								<div class="row gtr-uniform">
									<div class="col-6 col-12-xsmall">
										<input type="text" name="bTitle" value="${content_view.bTitle}" placeholder="Title" readonly/>
									</div>
									
									<div class="col-12">
										<textarea name="bContent" rows="6" readonly>${content_view.bContent}</textarea>
									</div>
									
								</div>
									<input type="submit" value="수정" class="button">
									<a href="list.do" class="button">목록보기</a> 
							</form>
								
								<form action="delete.do" method="post">
									<input type="hidden" name="bId" value="${content_view.bId}"/>
									<input type="hidden" name="name" value="${name}"/>
									<input type="submit" value="삭제" class="button">
									<a href="reply_view.do?bId=${content_view.bId}" class="button">답변</a>
								</form>
								
								
						</section>

						
					</div>
				</div>
			</section>
	
</body>
</html>