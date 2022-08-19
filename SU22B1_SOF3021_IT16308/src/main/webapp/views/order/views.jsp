<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<div>
	<div class="text-light text-center fs-2 pt-4 pb-4 shadow-lg fw-semibold">Danh sách đơn hàng</div>
	<div>
		<table class="table table-bordered border-light">
			<thead>
				<tr>
					<th class="text-center text-light fw-bolder fs-4">ID</th>
					<th class="text-center text-light fw-bolder fs-4">Người đặt
						hàng</th>
					<th class="text-center text-light fw-bolder fs-4">Địa chỉ</th>
					<th class="text-center text-light fw-bolder fs-4">Trạng thái</th>
					<th class="text-center text-light fw-bolder fs-4">Hành động</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${ list }">
					<c:if test="${ item.user.username == user.username }">
						<tr>
							<td class="text-center text-light fw-semibold fs-5">${ item.id }</td>
							<td class="text-light fw-semibold fs-5">${ item.user.fullname }</td>
							<td class="text-light fw-semibold fs-5">${ item.address }</td>
							<td class="text-center text-light fw-semibold fs-5"><c:if
									test="${ item.status==0 }">Chưa duyệt</c:if> <c:if
									test="${ item.status==1 }">Đã duyệt</c:if> <c:if
									test="${ item.status==2 }">Đã hủy</c:if></td>
							<td class="text-center"><a
								class="btn btn-primary text-light fs-5"
								href="/su22b1_it16308_sof3021/orderDetail/edit1/${ item.id }">Xem
									chi tiết</a></td>
						</tr>
					</c:if>
					
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>