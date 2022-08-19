<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<div class="m-2 p-2">
	<table class="table table-bordered border-light">
		<thead>
			<tr>
				<th class="text-center text-light fw-bolder fs-4">ID</th>
				<th class="text-center text-light fw-bolder fs-4">Tên sản phẩm</th>
				<th class="text-center text-light fw-bolder fs-4">Ảnh</th>
				<th class="text-center text-light fw-bolder fs-4">Giá</th>
				<th class="text-center text-light fw-bolder fs-4">Số lượng</th>
				<th class="text-center text-light fw-bolder fs-4">Loại sản phẩm</th>
				<th class="text-center text-light fw-bolder fs-4" colspan="2">Hành
					động</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data.content }" var="pro">
				<tr>
					<td class="text-center text-light fw-semibold fs-5">${ pro.id }</td>
					<td class="text-light fw-semibold  fs-5">${ pro.name }</td>
					<th class="text-light fw-semibold  fs-5">${ pro.image }</th>
					<th class="text-light fw-semibold text-right  fs-5">
						<c:if test="${ pro.price >=10000000 }">${ pro.price/1000000 }00.000 VND</c:if>
						<c:if test="${ pro.price<10000000 && pro.price>=1000000 }">${ pro.price/1000000 }00.000 VND</c:if>
						<c:if test="${ pro.price <1000000 }">${ pro.price/1000 }00 VND</c:if>
					</th>
					<th class="text-light fw-semibold text-center fs-5">${ pro.available }</th>
					<th class="text-center text-light fw-semibold fs-5">${ pro.category.name }</th>
					<td class="text-center"><a
						class="btn btn-primary text-light fs-5"
						href="/su22b1_it16308_sof3021/product/edit/${ pro.id }">Sửa</a></td>
					<td class="text-center"><a
						class="btn btn-danger text-light fs-5"
						href="/su22b1_it16308_sof3021/product/delete/${ pro.id }">Xóa</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="row">
		<div class="col-5">
			<div class="pagination row">
				<div class="page-item col-1">
					<a class="btn btn-primary text-light p-1 fw-semibold"
						href="/su22b1_it16308_sof3021/product/index">|<</a>
				</div>
				<div class="page-item col-1">
					<a class="btn btn-primary text-light p-1 fw-semibold"
						href="/su22b1_it16308_sof3021/product/index?page=${ data.number - 1 }"><<</a>
				</div>
				<div class="page-item col-1 text-center">
					<a class="p-1 text-light fw-bolder fs-5" href="#"> ${ data.number }
					</a>
				</div>
				<div class="page-item col-1">
					<a class="btn btn-primary text-light p-1 fw-semibold"
						href="/su22b1_it16308_sof3021/product/index?page=${ data.number + 1 }">>></a>
				</div>
				<div class="page-item col-1">
					<a class="btn btn-primary text-light p-1 fw-semibold"
						href="/su22b1_it16308_sof3021/product/index?page=${ data.totalPages - 1 }">>|</a>
				</div>
			</div>
		</div>
		<div class="col-7">
			<button class="text-primary fw-semibold btn btn-light fs-5"
				href="/su22b1_it16308_sof3021/product/create" data-bs-toggle="modal"
				data-bs-target="#exampleModal">Thêm mới</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Quản lý sản
							phẩm</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<jsp:include page="/views/product/create.jsp"></jsp:include>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>