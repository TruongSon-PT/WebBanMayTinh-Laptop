<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="m-2 p-2">
	<div>
		<form class="pb-3">
			<div class="text-center fs-1 fw-bolder bg-secondary text-light shadow-lg">Danh sách khách hàng</div>
		</form>
	</div>
	<div>
		<table class="table table-bordered border-light">
			<thead>
				<tr>
					<th class="text-center text-light fw-bolder fs-4">ID</th>
					<th class="text-center text-light fw-bolder fs-4">Họ và tên</th>
					<th class="text-center text-light fw-bolder fs-4">Tên đang nhập</th>
					<th class="text-center text-light fw-bolder fs-4">Email</th>
					<th class="text-center text-light fw-bolder fs-4">Ảnh</th>
					<th class="text-center text-light fw-bolder fs-4">Chức vụ</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ data.content }" var="acc">
					<tr>
						<td class="text-center text-light fw-semibold fs-5">${ acc.id }</td>
						<td class="text-light fw-semibold fs-5">${ acc.fullname }</td>
						<td class="text-light fw-semibold fs-5">${ acc.username }</td>
						<td class="text-light fw-semibold fs-5">${ acc.email }</td>
						<td class="text-light fw-semibold fs-5">${ acc.photo }</td>
						<td class="text-light fw-semibold fs-5"><c:if
								test="${ acc.admin==0 }">Nhân viên</c:if> <c:if
								test="${ acc.admin==1 }">Quản trị viên</c:if>
								<c:if
								test="${ acc.admin==2 }">Khách hàng</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="text-light fw-semibold fs-4 col-1">Trang:</div>
			<div class="col-11">
				<div class="row ">
					<div class="pagination">
						<c:if test="${ data.number != 0 }">
							<div class="page-item">
								<a class="btn btn-secondary text-light p-1 fw-semibold fs-4"
									href="/su22b1_it16308_sof3021/admin/account/index">0</a>
							</div>
						</c:if>
						<c:if test="${ data.number > 1 }">
							<div class="page-item">
								<a class="btn btn-secondary text-light p-1 fw-semibold fs-4"
									href="/su22b1_it16308_sof3021/admin/account/index?page=${ data.number - 1 }">${ data.number - 1 }</a>
							</div>
						</c:if>
						<div class="page-item">
							<a class="btn btn-secondary text-light p-1 fw-semibold fs-4"
								href="#"> ${ data.number } </a>
						</div>
						<c:if test="${ data.number < data.totalPages - 3 }">
							<div class="page-item">
								<a class="btn btn-secondary text-light p-1 fw-semibold fs-4"
									href="/su22b1_it16308_sof3021/admin/account/index?page=${ data.number + 1 }">${ data.number + 1 }</a>
							</div>
						</c:if>
						<c:if test="${ data.number < data.totalPages - 2 }">
							<div class="page-item">
								<a class="btn btn-secondary text-light p-1 fw-semibold fs-4"
									href="/su22b1_it16308_sof3021/admin/account/index?page=${ data.totalPages - 1 }">${ data.totalPages - 1 }</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

