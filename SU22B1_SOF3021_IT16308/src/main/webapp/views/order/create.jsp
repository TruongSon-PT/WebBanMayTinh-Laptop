<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<div class="m-2 p-2">
	<c:if test="${ success == null }">
		<div>
			<div
				class="text-center fs-1 fw-bolder bg-secondary text-light shadow-lg">Đặt
				hàng</div>
			<div class="pt-4">
				<table class="table table-bordered border-light">
					<thead>
						<tr>
							<th class="text-center text-light fw-bolder fs-4">ID</th>
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
								<th class="text-center text-light fw-semibold fs-5">${ item.id }</th>
								<th class="text-center text-light fw-semibold fs-5">${ item.name }</th>
								<th class="text-center text-light fw-semibold fs-5"><c:if
										test="${ item.price >= 10000000 }">${ item.price/1000000 }00.000</c:if>
									<c:if
										test="${ item.price < 10000000 && item.price >= 1000000 }">${ item.price/1000000 }00.000</c:if>
									<c:if test="${ item.price < 1000000 }">${ item.price/1000 }00</c:if>
									VND</th>
								<th class="text-center text-light fw-semibold fs-5">${ item.quantity }</th>
								<th class="text-center text-light fw-semibold fs-5"><c:set
										var="sum" value="${ item.price*item.quantity }"></c:set> <c:if
										test="${ sum >= 10000000 }">${ sum/1000000 }00.000</c:if> <c:if
										test="${ sum < 10000000 && sum >= 1000000 }">${ sum/1000000 }00.000</c:if>
									<c:if test="${ sum < 1000000 }">${ sum/1000 }00</c:if> VND</th>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" class="text-center text-light fw-semibold fs-5">Tổng
								tiền</td>
							<td class="text-center text-light fw-semibold fs-5"><c:if
									test="${ amount >= 10000000 }">${ amount/1000000 }00.000</c:if>
								<c:if test="${ amount < 10000000 && amount >= 1000000 }">${ amount/1000000 }00.000</c:if>
								<c:if test="${ amount < 1000000 }">${ amount/1000 }00</c:if> VND
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<form action="/su22b1_it16308_sof3021/cart/buy" method="GET">
				<div class="my-4 mb-0 py-2 pb-2 row">
					<div class="col-5">
						<div class="row my-4 py-3">
							<div class="col-3 text-light fw-semibold fs-4">
								<label>Người mua:</label>
							</div>
							<div class="col-3 text-light fw-semibold fs-4">${ account.fullname }</div>
						</div>
						<div class="row my-4 py-3">
							<div class="col-3 text-light fw-semibold fs-4">
								<label>Email:</label>
							</div>
							<div class="col-9 text-light fw-semibold fs-4">${ account.email }</div>
						</div>
						<div class="row my-4 py-3">
							<div class="text-light fw-semibold fs-4">
								<label>Số điện thoại:</label>
							</div>
							<div>
								<input class="form-control" name="phone" type="text"
									maxlength="11" value="${ phone }">
							</div>
							<c:if test="${ err1 != null }">
								<div class="text-warning fs-5 pt-2">${ err1 }</div>
							</c:if>
						</div>
					</div>
					<div class="col-2"></div>
					<div class="col-5">

						<div class="row my-4">
							<div class="text-light fw-semibold fs-4">
								<label>Địa chỉ:</label>
							</div>
							<div>
								<textarea name="address" class="form-control" rows="5" cols="30"
									maxlength="255">${ address }</textarea>
							</div>
							<c:if test="${ err2 != null }">
								<div class="text-warning fs-5 pt-2">${ err2 }</div>
							</c:if>
						</div>
						<div>
							<div class="text-warning">Lưu ý: Số điện thoại và địa chỉ
								không chính xác sẽ ảnh hưởng đến nhận hàng của bạn!</div>
						</div>
					</div>
				</div>
				<div class="text-center">
					<button class="btn btn-primary text-light fw-semibold fs-5 px-5">Thanh
						toán</button>
				</div>
			</form>
		</div>
	</c:if>
	<c:if test="${ success != null }">
		<div class="mx-5 px-5">
			<div class="m-5 p-5">
				<div class="mx-5 px-5">
					<div class="mx-5 px-5">
						<div class="mx-5 px-5 bg-light shadow-lg">
							<div class="text-center fs-4 text-primary row py-5">
								<div class="col-2"></div>
								<div class="bi bi-check-circle col-1 fs-3"></div>
								<div class="col-7 fs-3">Thanh toán thành công!</div>
								<div class="col-2"></div>
							</div>
							<div class="text-center pb-4">
								<a class="btn btn-primary text-light fs-4" href="/su22b1_it16308_sof3021/home/index">Quay lại</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</div>