<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="p-5 m-5">
	<form:form method="POST"
		action="/su22b1_it16308_sof3021/categories/update"
		modelAttribute="category">
		<div class="mx-5">
			<div class="mx-5">
				<div class="mx-5">
					<div class="mx-5 bg-info">
						<div class="mx-5 my-4 py-5 pb-2">
							<div class="row mx-5 my-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>ID:</label>
								</div>
								<div class="col-8">
									<form:input class="form-control" path="id" type="number" placeholder="Category ID" value="${ category.id }"/>
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Tên danh mục:</label>
								</div>
								<div class="col-8">
									<form:input class="form-control" path="name" type="text" placeholder="Category name" value="${ category.name }"/>
								</div>
							</div>
							<div class="text-center pt-4">
								<button class="btn btn-light text-primary fw-semibold fs-5 px-5">Lưu</button>
							</div>
							<div class="text-center pt-4 pb-1">
								<a class="text-light fs-5"
									href="/su22b1_it16308_sof3021/categories/index">Đến quản
									lý>></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</div>