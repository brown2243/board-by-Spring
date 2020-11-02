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

<title>BMS HOME</title>
</head>
<body>
	<header></header>
	<nav class="navbar navbar-expane-lg bg-light">
		<a class="navbar-brand" href="/home">BMS</a>
		<div class="navbar-nav">
			<ul class="navbar-nav mr-auto">
				<c:if test="${sessionScope.USERID_SESSION eq null }">
					<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/join">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.USERID_SESSION ne null }">
					<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/list">게시판</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<section>
		<article>

		</article>
	</section>
	<footer></footer>
</body>
</html>