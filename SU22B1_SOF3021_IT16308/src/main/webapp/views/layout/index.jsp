<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet"
	href="/SU22B1_SOF3021_IT16308/css/bootstrap.min.css" />
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="bg-secondary">
		<jsp:include page="/views/layout/header.jsp"></jsp:include>
		<jsp:include page="/views/layout/nav.jsp"></jsp:include>
		<c:if test="${ views != null }">
			<jsp:include page="${ views }"></jsp:include>
		</c:if>
		<jsp:include page="/views/layout/footer.jsp"></jsp:include>
	</div>

	<!-- Script -->
	<script src="/SU22B1_SOF3021_IT16308/js/jquery.min.js"></script>
	<script src="/SU22B1_SOF3021_IT16308/js/popper.min.js"></script>
	<script src="/SU22B1_SOF3021_IT16308/js/bootstrap.min.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>