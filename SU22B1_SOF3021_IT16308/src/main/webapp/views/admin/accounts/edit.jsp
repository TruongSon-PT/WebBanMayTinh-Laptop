<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="p-5 m-5">
	<form:form method="POST"
		action="/su22b1_it16308_sof3021/admin/accounts/update"
		modelAttribute="account">
		<div class="mx-5">
			<div class="mx-5">
				<div class="mx-5">
					<div class="mx-5 bg-info">
						<div class="mx-5 my-4 py-5 pb-2">
							<div class="row mx-5 my-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>ID*:</label>
								</div>
								<div class="col-8">
									<form:input class="form-control fs-5" path="id" type="number"
										value="${ account.id }" />
								</div>
							</div>
							<div class="row mx-5 pt-2">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Họ và tên*:</label>
								</div>
								<div class="col-8">
									<form:input class="form-control fs-5" path="fullname" type="text"
										value="${ account.fullname }" />
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Email*:</label>
								</div>
								<div class="col-8">
									<form:input class="form-control fs-5" path="email" type="email"
										value="${ account.email }" />
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Tên người dùng*:</label>
								</div>
								<div class="col-8">
									<form:input class="form-control fs-5" path="username" type="text"
										value="${ account.username }" />
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Mật khẩu*:</label>
								</div>
								<div class="col-8">
									<form:input class="form-control fs-5" type="password"
										path="password" value="${ account.password }" />
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Ảnh:</label>
								</div>
								<div class="col-8">
									<form:input class="form-control fs-5" path="photo" type="file"
										value="${ account.photo }" />
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Trạng thái:</label>
								</div>
								<div class="col-8 row">
									<div class="col-6 fs-5 text-light">
										<form:radiobutton class="" path="activated" value="1" checked="1" />Đang hoạt động
									</div>
									<div class="col-6 fs-5 text-light">
										<form:radiobutton class="" path="activated" value="0" checked="" />Ngừng hoạt động
									</div>
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4 text-primary">
									<label>Chức vụ:</label>
								</div>
								<div class="col-8">
									<form:select class="px-5 py-2 fs-5" path="admin">
										<c:if test="${ account.admin==0 }">
											<form:option class="fs-5 text-primary" value="0">Nhân viên</form:option>
											<form:option class="fs-5 text-primary" value="1">Quản trị viên</form:option>
										</c:if>
										<c:if test="${ account.admin==1 }">
											<form:option class="fs-5 text-primary" value="1">Quản trị viên</form:option>
											<form:option class="fs-5 text-primary" value="0">Nhân viên</form:option>
										</c:if>
									</form:select>
								</div>
							</div>
							<div class="text-center pt-4">
								<button class="btn btn-light text-primary fw-semibold fs-5 px-5">Lưu</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</div>