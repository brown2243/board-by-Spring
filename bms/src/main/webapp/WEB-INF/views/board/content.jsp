<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<title>BMS BOARD</title>
</head>
<body>
	<header></header>
	<nav class="navbar navbar-expane-lg bg-light">
		<a class="navbar-brand" href="/home">BMS</a>
		<div class="navbar-nav">
			<ul class="navbar-nav mr-auto">
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class="container">
				<form role="form" method="post" action="/board/update">
					<input type="hidden" name="brd_id" value="${item.brd_id}" />
					<div class="form-group">
						<label for ="brd_title">제목</label>
						<input type="text" class="form-control" id="brd_title" name="brd_title" 
							   value="${item.brd_title}" />
					</div>
					
					<div class="form-group">
						<label for ="brd_content">내용</label>
						<textarea rows="10" class="form-control" id="brd_content" name="brd_content" >
						"${item.brd_content}"</textarea>
					</div>
					
					<div class="form-group">
						<label for ="reg_userid">작성자</label>
						<input type="text" class="form-control" id="reg_userid" name="reg_userid" 
							   value="${item.reg_userid}" readonly />
					</div>
					
					<div class="form-group">
						<label for ="reg_date">작성일</label>
						<input type="text" class="form-control" id="reg_date" name="reg_date" 
							   value="${item.reg_date}" readonly />
					</div>
					
					<div class="form-group">
						<label for ="hit">조회수</label>
						<input type="text" class="form-control" id="hit" name="hit" 
							   value="${item.hit}" readonly />
					</div>
					
					<div class="form-group">
						<label for ="img">이미지파일</label>
						<input type="file" class="form-control" id="img" name="img">
					</div>
					
					<div class="form-group text-center">
						<button type="submit" id="write-submit"
						 	 	class="btn btn-primary">수정</button>
						<a type="button" class="btn btn-warning" href="/home">취소</a>
					</div>
				</form>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>