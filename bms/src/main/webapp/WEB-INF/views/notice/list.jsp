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
		<a href="/home">BMS</a>
		<a href="/notice/list">공지사항 게시판</a><a href="/board/list">일반 게시판</a>
		<div class="navbar-nav">
			<ul class="navbar-nav mr-auto">
				
			</ul>
		</div>
	</nav>
		<div></div>
	<section>
		<article>
			<div class="container text-center">
				<form role="form" method="get" action="/board/list"
					class="form-inline">
					<input class="form-control input-md" type="text" name="search"
						placeholder="검색어 입력하시오" /> <input type="submit"
						class="btn btn-primary" value="검색" />
				</form>
				<div id="board-main">
					<table class="table table-hover">
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>공지사항여부</th>
							<th>날짜</th>
						</tr>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.id}</td>
								<td><a href="/notice/content?id=${item.id}">${item.title}</a></td>
								<td>${item.created_by}</td>
								<td>${item.notice_yn}</td>
								<td>${item.created_at}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="paging"></div>
				<div id="write_button" class="text-right">
					<a type="button" class="btn btn-primary" href="/notice/write">공지사항쓰기</a>
				</div>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>