<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="p-5 m-5">
	<form:form method="POST"
		action="/su22b1_it16308_sof3021/admin/accounts/store1"
		modelAttribute="account">
		<div class="mx-5">
			<div class="mx-5">
				<div class="mx-5">
					<div class="mx-5 bg-info">
						<div class="mx-5 my-4 py-5 pb-2">
							<div class="row mx-5 my-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Họ và tên*:</label>
								</div>
								<div class="col-8">
									<input class="form-control" name="fullname" type="text">
								</div>
							</div>
							<div class="row mx-5 pt-2">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Email*:</label>
								</div>
								<div class="col-8">
									<input class="form-control" name="email" type="email"
										placeholder="abc@gmail.com">
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Tên người dùng*:</label>
								</div>
								<div class="col-8">
									<input class="form-control" name="username" type="text"
										placeholder="Tên đăng nhập">
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Mật khẩu*:</label>
								</div>
								<div class="col-8">
									<input class="form-control" name="password" type="password">
								</div>
							</div>
							<div class="row mx-5 pt-4">
								<div class="col-4 text-light fw-semibold fs-4">
									<label>Ảnh:</label>
								</div>
								<div class="col-8">
									<input class="form-control" name="photo" type="file">
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