<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<div class="m-4 p-4">
	<form>
		<div class="text-center text-light fs-1 shadow-lg fw-semibold">CHI TIẾT ĐƠN HÀNG</div>
		<div>
			<div class="py-2 text-light fw-semibold fs-5">Mã đơn hàng: ${ order.id }</div>
			<div class="py-2 text-light fw-semibold fs-5">Người đặt: ${ order.user.fullname }</div>
			<div class="py-2 text-light fw-semibold fs-5">Địa chỉ: ${ order.address }</div>
			<div class="py-2 text-light fw-semibold fs-5 row">
				<div class="col-1">Trạng thái:</div>
				<div class="col-11">
					<c:if test="${ order.status == 1 }">Đơn đã duyệt</c:if>
					<c:if test="${ order.status == 0 }">Đơn chưa duyệt</c:if>
					<c:if test="${ order.status == 2 }">Đơn đã hủy</c:if>
				</div>
			</div>
			<div class="py-2 text-light fw-semibold fs-5">Ghi chú:</div>
			<div>
				<textarea  class="text-light fw-semibold fs-5" rows="5" cols="50" value="${ order.notes }" name="notes"></textarea>
			</div>
			<div class="py-2">
				<c:if test="${ order.status == 0 }">
					<a class="mx-2 btn btn-danger text-light fw-semibold fs-5"
						href="/su22b1_it16308_sof3021/orderDetail/update3/${ order.id }">Hủy đơn</a>
				</c:if>
			</div>
		</div>
		<div>
			<table class="table table-bordered border-light">
				<thead>
					<tr>
						<th class="text-center text-light fw-bolder fs-4">Tên sản
							phẩm</th>
						<th class="text-center text-light fw-bolder fs-4">Giá</th>
						<th class="text-center text-light fw-bolder fs-4">Số lượng</th>
						<th class="text-center text-light fw-bolder fs-4">Thành tiền</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${ list }">
						<tr>
							<td class="text-light fw-semibold fs-5">${ item.product.name }</td>
							<td class="text-center text-light fw-semibold fs-5"><c:if
									test="${ item.price >= 10000000 }">${ item.price/1000000 }00.000</c:if>
								<c:if test="${ item.price < 10000000 && item.price >= 1000000 }">${ item.price/1000000 }00.000</c:if>
								<c:if test="${ item.price < 1000000 }">${ item.price/1000 }00</c:if>
								VND</td>
							<td class="text-center text-light fw-semibold fs-5">${ item.quantity }</td>
							<td class="text-center text-light fw-semibold fs-5"><c:if
									test="${ item.price * item.quantity >= 10000000 }">${ item.price * item.quantity/1000000 }00.000</c:if>
								<c:if
									test="${ item.price * item.quantity < 10000000 && item.price * item.quantity >= 1000000 }">${ item.price * item.quantity/1000000 }00.000</c:if>
								<c:if test="${ item.price * item.quantity < 1000000 }">${ item.price * item.quantity/1000 }00</c:if>
								VND</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td class="text-center text-light fw-semibold fs-5" colspan="3">Tổng
							tiền:</td>
						<td class="text-center text-light fw-semibold fs-5"><c:if
								test="${ all_price >= 10000000 }">${ all_price/1000000 }00.000</c:if>
							<c:if test="${ all_price < 10000000 && all_price >= 1000000 }">${ all_price/1000000 }00.000</c:if>
							<c:if test="${ all_price < 1000000 }">${ all_price/1000 }00</c:if>
							VND</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form>
</div>