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
							<th>공지번호</th>
							<th>공지제목</th>
							<th>작성자</th>
							<th>전체공지여부</th>
							<th>날짜</th>
						</tr>
						<c:forEach var = "noticeitem" items = "${noticelist}">
							<c:if test="${noticeitem.notice_yn eq 'Y'}">
								<tr>
									<td>${noticeitem.id}</td>
									<td><a href="/notice/content?id=${noticeitem.id}">${noticeitem.title}</a></td>
									<td>${noticeitem.created_by}</td>
									<td>공지여부 ${noticeitem.notice_yn}</td>
									<td>${noticeitem.created_at}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div id="board-main">
					<table class="table table-hover">
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>날짜</th>
						</tr>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.brd_id}</td>
								<td><a href="/board/content?id=${item.brd_id}">${item.brd_title}</a></td>
								<td>${item.reg_userid}</td>
								<td>${item.hit}</td>
								<td>${item.reg_date}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="paging"></div>
				<div id="write_button" class="text-right">
					<a type="button" class="btn btn-warning" href="/notice/write">공지사항쓰기</a>
					<a type="button" class="btn btn-primary" href="/board/write">글쓰기</a>
				</div>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>