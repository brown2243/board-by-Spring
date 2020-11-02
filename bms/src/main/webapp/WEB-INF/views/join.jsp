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
<script>
$(document).ready(function(){
	$("#userid_dup").hide();
	$("#userid_uniq").hide();
	$("#pwcheck_fail").hide();
	$("#pwcheck_success").hide();
});
</script>
<title>BMS HOME</title>
</head>
<body>
	<header></header>
	<nav class="navbar navbar-expane-lg bg-light">
		<a class="navbar-brand" href="/home">BMS</a>
		<div>
			<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a href="#">회원가입</a></li>
			</ul>
		</div>
	</nav>
	<section>
		<article class="container">
			<div class="row">
				<div class="col-sm">
					<form role="form" method="POST" action="/member/join">
						<div class="form-group">
							<label for="userid">사용자아이디</label>
							<input class="form-control" type="text" id="userid" 
								   name="userid" placeholder="아이디를 입력하시오">
						</div>
						<div class="alert alert-danger" id="userid_dup">
							아이디 중복.
						</div>
						<div class="alert alert-success" id="userid_uniq">
							아이디 사용가능.
						</div>
						<div class="form-group">
							<label for="userpw">비밀번호</label>
							<input class="form-control" type="password" id="userpw" 
								   name="userpw" placeholder="비밀번호를 입력하시오">
						</div>
						<div class="form-group">
							<label for="userpwChk">비밀번호 확인</label>
							<input class="form-control" type="password" id="userpwChk" 
								   placeholder="다시 비밀번호를 입력하시오">
						</div>
						<div class="alert alert-danger" id="pwcheck_fail">
							비밀번호 불일치
						</div>
						<div class="alert alert-success" id="pwcheck_success">
							비밀번호 일치
						</div>
							<div class="form-group">
							<label for="username">이름</label>
							<input class="form-control" type="text" id="username" 
								   name="username" placeholder="이름을 입력하시오">
						</div>
						
						<div class="form-group">
							<label for="userphone">비밀번호</label>
							<input class="form-control" type="text" id="userphone" 
								   name="userphone" placeholder="휴대폰번호를 입력하시오">
						</div>
						<div class="form-group text-center">
							<button type="submit" id="join-submit" class="btn btn-primary">회원가입</button>
							<a type="button" class="btn btn-warning" href="/">취소</a>
						</div>
					</form>
					<script>
						$(function(){
							$("input").keyup(function(){
									var pw1 = $("#userpw").val();
									var pw2 = $("#userpwChk").val();

									if(pw1 != "" || pw2 != ""){
										if(pw1 == pw2){
											$("#pwcheck_success").show()
											$("#pwcheck_fail").hide()
											$("#join-submit").removeAttr("disabled")
										} else {
											$("#pwcheck_success").hide()
											$("#pwcheck_fail").show()
											$("#join-submit").attr("disabled", "disabled")
											}
										}
								});
							});
					</script>
				</div>
			</div>
		</article>
	</section>
	<footer></footer>
</body>
</html>