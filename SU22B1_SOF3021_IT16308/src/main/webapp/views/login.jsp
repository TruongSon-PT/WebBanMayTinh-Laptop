<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Đăng nhập</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body class="bg-light">
	<div class="m-5 p-5 row">
		<div class="col-3"></div>
		<div class="bg-info pt-5 m-4 mt-5 col-6 shadow p-3 mb-5 rounded">
			<div class="text-center text-light fs-1 fw-semibold">ĐĂNG NHẬP</div>
			<form class="p-5 px-4 pb-3" method="GET" action="/su22b1_it16308_sof3021/admin/login">
				<c:if test="${ success==null }">
					<div class="row p-2">
						<div class="col-4 pt-1">
							<label class="text-light fs-4">Tên đăng nhập*:</label>
						</div>
						<div class="col-8">
							<input class="form-control fs-4 text-info" name="username" type="text" value="${ login.username }"/>
						</div>
						<c:if test="${ err1 != null }">
							<div class="text-warning fs-5 pt-2">${ err1 }</div>
						</c:if>
					</div>
					<div class="row p-2 py-4">
						<div class="col-4 pt-1">
							<label class="text-light fs-4">Mật khẩu*:</label>
						</div>
						<div class="col-8">
							<input class="form-control fs-4 text-info" name="password" type="password" value="${ login.password }"/>
						</div>
						<c:if test="${ err2 != null }">
							<div class="text-warning fs-5 pt-2">${ err2 }</div>
						</c:if>
					</div>
					<hr class="text-info">
					<div class="text-center">
						<button class="btn btn-light border border-primary text-info fs-4 mt-3 px-5">Login</button>
					</div>
					<div class="text-center text-light fs-5 row py-2 mt-4">
						<div class="col-6">
							<a>Đăng ký</a>
						</div>
						<div class="col-6">
							<a class="text-light" href="/su22b1_it16308_sof3021/home/index" style="text-decoration: none;">Quay lại>></a>
						</div>
					</div>
				</c:if>
				<c:if test="${ success!=null }">
					<div class="text-center">
						<div class="text-success fw-semibold fs-3 pb-5">${ success }</div>
						<a class="btn btn-light border border-primary text-info fs-4 px-5" href="/su22b1_it16308_sof3021/home/index">OK</a>
					</div>
				</c:if>
			</form>
		</div>
		<div class="col-3"></div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>
