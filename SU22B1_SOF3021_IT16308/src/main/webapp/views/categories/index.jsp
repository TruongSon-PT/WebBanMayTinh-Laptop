<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<div class="m-2 p-2">
	<table class="table table-bordered border-light">
		<thead>
			<tr>
				<th class="text-center text-light fw-bolder fs-4">ID</th>
				<th class="text-center text-light fw-bolder fs-4">Tên danh mục</th>
				<th class="text-center text-light fw-bolder fs-4" colspan="2">Hành
					động</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data.content }" var="cate">
				<tr>
					<td class="text-light fw-semibold  fs-5 text-center">${ cate.id }</td>
					<td class="text-light fw-semibold  fs-5 text-center">${ cate.name }</td>
					<td class="text-center"><a
						class="btn btn-primary text-light fs-5"
						href="/su22b1_it16308_sof3021/categories/edit/${ cate.id }">Sửa</a>
					</td>
					<td class="text-center"><a
						class="btn btn-danger text-light fs-5"
						href="/su22b1_it16308_sof3021/categories/delete/${ cate.id }">Xóa</a>
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
						href="/su22b1_it16308_sof3021/categories/index">|<</a>
				</div>
				<div class="page-item col-1">
					<a class="btn btn-primary text-light p-1 fw-semibold"
						href="/su22b1_it16308_sof3021/categories/index?page=${ data.number - 1 }"><<</a>
				</div>
				<div class="page-item col-1">
					<a class="btn btn-primary text-light p-1 fw-semibold" href="#">
						${ data.number } </a>
				</div>
				<div class="page-item col-1">
					<a class="btn btn-primary text-light p-1 fw-semibold"
						href="/su22b1_it16308_sof3021/categories/index?page=${ data.number + 1 }">>></a>
				</div>
				<div class="page-item col-1">
					<a class="btn btn-primary text-light p-1 fw-semibold"
						href="/su22b1_it16308_sof3021/categories/index?page=${ data.totalPages - 1 }">>|</a>
				</div>
			</div>
		</div>

		<div class="col-6">
			<a class="text-primary fw-semibold btn btn-light fs-5" href="/su22b1_it16308_sof3021/categories/create">Thêm mới</a>
		</div>
	</div>
</div>

