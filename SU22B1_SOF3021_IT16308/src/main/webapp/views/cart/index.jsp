<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<div class="m-2 p-2">
	<table class="table table-bordered border-light">
		<tr>
			<td class="text-center text-light fw-bolder fs-4">STT</td>
			<td class="text-center text-light fw-bolder fs-4">Name</td>
			<td class="text-center text-light fw-bolder fs-4">Quantity</td>
			<td class="text-center text-light fw-bolder fs-4">Price</td>
			<td class="text-center text-light fw-bolder fs-4">Hành động</td>
		</tr>
		<c:set var="no" value="1"></c:set>
		<c:forEach var="item" items="${ cartItems }">
			<form action="/su22b1_it16308_sof3021/cart/update">
				<tr>
					<td class="text-light fw-semibold  fs-5">${ no }</td>
					<td class="text-light fw-semibold  fs-5">${ item.name }</td>
					<td>
						<div class="text-light fw-semibold fs-5 text-center">
							<input type="hidden" name="id" value="${ item.id }">
							<input type="number" name="quantity" value="${ item.quantity }" onblur="this.form.submit()" min=0 max=100>
						</div>
					</td>
					<td class="text-light fw-semibold  fs-5">
						<c:if test="${ item.price >= 10000000 }">${ item.price/1000000 }00.000</c:if>
						<c:if test="${ item.price < 10000000 && item.price >= 1000000 }">${ item.price/1000000 }00.000</c:if>
						<c:if test="${ item.price < 1000000 }">${ item.price/1000 }00</c:if>
						VND</td>
					<td>
						<div class="text-light fw-semibold fs-5 text-center">
							<a class="btn btn-danger text-light fw-semibold" href="/su22b1_it16308_sof3021/cart/remove/${ item.id }">Xóa khỏi giỏ hàng</a>
						</div>
					</td>
				</tr>
			</form>
			<c:set var="no" value="${ no + 1 }"></c:set>
		</c:forEach>
	</table>
	<div class="row">
		<div class="col-5 text-left">
			<c:if test="${ count != 0 }">
				<a class="btn btn-danger text-light fw-semibold" href="/su22b1_it16308_sof3021/cart/clean">Xóa tất cả</a>
			</c:if>
			<a class="btn btn-primary text-light fw-semibold" href="/su22b1_it16308_sof3021/home/index">Thêm sản phẩm</a>
		</div>
		<div class="col-7">
			<c:if test="${ count != 0 }">
				<a class="btn btn-primary text-light fs-5 mx-5" href="/su22b1_it16308_sof3021/cart/order">Đặt hàng</a>
			</c:if>
		</div>
	</div>
	
</div>
