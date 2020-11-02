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

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	$(document).ready(function() {

	}); //아이디 중복화면 숨기기
</script>
<title>BMS LOGIN</title>
</head>
<body>
	<header></header>
	<nav class="navbar navbar-expand-lg bg-light">
		<a class="navbar-brand" href="/">BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item">로그인</li>

			</ul>
		</div>
	</nav>
	<section>
		<article class="container">
			<div class="row">
				<div class="col-sm-6">
					<form class="form-signin" role="form" method="post" action="/member/login">
						<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
						<label for="userid" class="sr-only">사용자아이디</label>
						<input
							type="text" id="userid" name="userid" class="form-control"
							placeholder="아이디를 입력해주세요." required autofocus>
							<label
							for="userpw" class="sr-only">비밀번호</label> 
							<input
							type="password" id="userpw" name="userpw" class="form-control"
							placeholder="비밀번호를 입력해주세요." required>
						<div class="checkbox mb-3">
							
						</div>
						<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
						<p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
					</form>
				</div>
			</div>

		</article>
	</section>
	<footer></footer>
</body>

</html>