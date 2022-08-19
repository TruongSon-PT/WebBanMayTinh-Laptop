<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div>
	<form:form method="POST" action="/su22b1_it16308_sof3021/product/store"
		modelAttribute="product">
		<div class="row pt-2">
			<label class="col-3 fs-5">ID:</label>
			<div class="col-5">
				<form:input path="id" type="number" placeholder="ID sản phẩm"
					disabled="${ create }" />
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row pt-2">
			<label class="col-3 fs-5">Tên sản phẩm*:</label>
			<div class="col-5">
				<form:input path="name" type="text" placeholder="Tên sản phẩm"/>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row pt-2">
			<label class="col-3 fs-5">Ảnh:</label>
			<div class="col-5">
				<form:input path="image" type="file" />
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row pt-2">
			<label class="col-3 fs-5">Giá sản phẩm*:</label>
			<div class="col-5">
				<form:input path="price" type="number" placeholder="Giá sản phẩm" />
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row pt-2">
			<label class="col-3 fs-5">Số lượng*:</label>
			<div class="col-5">
				<form:input path="available" type="number" placeholder="Số lượng" />
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row pt-2">
			<label class="col-3 fs-5">Loại sản phẩm*:</label>
			<div class="col-5">
				<form:select path="category">
					<c:forEach var="item" items="${ listCategory }">
						<form:option value="${ item.id }">${ item.name }</form:option>
					</c:forEach>
				</form:select>
			</div>
			<div class="col-4"></div>
		</div>
		<div class="text-center">
			<button type="button" class="btn btn-secondary"
				data-bs-dismiss="modal">Đóng</button>
			<button class="btn btn-primary">Lưu</button>
		</div>
	</form:form>
</div>
