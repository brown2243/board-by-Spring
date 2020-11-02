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
		<a class="navbar-brand" href="/home">BMS 공지사항</a>
		<div class="navbar-nav">
			<ul class="navbar-nav mr-auto">
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class="container">
				<form role="form" method="post" action="/notice/update">
					<input type="hidden" name="id" value="${item.id}" />
					<div class="form-group">
						<label for ="title">제목</label>
						<input type="text" class="form-control" id="title" name="title" 
							   value="${item.title}" />
					</div>
					
					<div class="form-group">
						<label for ="content">내용</label>
						<textarea rows="10" class="form-control" id="content" name="content" >
						"${item.content}"</textarea>
					</div>
					
					<div class="form-group">
						<label for ="created_by">작성자</label>
						<input type="text" class="form-control" id="created_by" name="created_by" 
							   value="${item.created_by}" readonly />
					</div>
					
					<div class="form-group">
						<label for ="created_at">작성일</label>
						<input type="text" class="form-control" id="created_at" name="created_at" 
							   value="${item.created_at}" readonly />
					</div>
					<c:if test="${item.modified_by ne null}">
					<div class="form-group">
						<label for ="modified_by">수정자</label>
						<input type="text" class="form-control" id="modified_by" name="modified_by" 
							   value="${item.modified_by}" readonly />
					</div>
		
					<div class="form-group">
						<label for ="modified_at">수정일</label>
						<input type="text" class="form-control" id="modified_at" name="modified_at" 
							   value="${item.modified_at}" readonly />
					</div>
					</c:if>
					
					<input type="hidden" value="${sessionScope.USERID_SESSION}" id ="modi" name="modi"/>
					<div class="form-group text-center">
						<button type="submit" id="write-submit"
						 	 	class="btn btn-primary">수정</button>
						<a type="button" class="btn btn-danger" href="/notice/delete?id=${item.id}">삭제</a>
				
						<a type="button" class="btn btn-warning" href="/notice/list">취소</a>
					</div>
				</form>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>