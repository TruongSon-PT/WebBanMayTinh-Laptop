<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<nav class="navbar navbar-expand-lg bg-dark">
	<div class="row container-fluid pe-4">
		<div class="col-7 collapse navbar-collapse"
			id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a
					class="nav-link text-white active fs-4 bi bi-house-door"
					aria-current="page" href="/su22b1_it16308_sof3021/home/index">Trang
						chủ</a></li>
				<li class="nav-item"><a
					class="nav-link text-white fs-4 bi bi-laptop" href="#">Laptop</a></li>
				<li class="nav-item"><a
					class="nav-link text-white fs-4 bi bi-pc-display-horizontal"
					href="#">Desktop</a></li>
				<li class="nav-item"><a
					class="nav-link text-white fs-4 bi bi-tablet-landscape" href="#">iPad</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-white fs-4 bi bi-speaker"
					href="#" role="button" data-bs-toggle="dropdown"
					aria-expanded="false">Phụ kiện</a>
					<ul class="dropdown-menu bg-light">
						<li><a
							class="dropdown-item fs-5 text-secondary bi bi-earbuds" href="#">Tai
								nghe</a></li>
						<li><a
							class="dropdown-item fs-5 text-secondary bi bi-keyboard" href="#">Bàn
								phím</a></li>
						<li><a class="dropdown-item fs-5 text-secondary bi bi-tv"
							href="#">Màn hình</a></li>
						<li><a class="dropdown-item fs-5 text-secondary bi bi-mouse2"
							href="#">Chuột</a></li>
					</ul></li>
				<c:if test="${ admin != 2 }">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white fs-4 bi bi-gear"
						href="#" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> Quản lý </a>
						<ul class="dropdown-menu bg-light">
							<li><a
								class="dropdown-item fs-5 text-secondary bi bi-people"
								href="/su22b1_it16308_sof3021/admin/accounts/index/0">Quản
									lý nhân viên</a></li>
							<li><a
								class="dropdown-item fs-5 text-secondary bi bi-people"
								href="/su22b1_it16308_sof3021/admin/accounts/index1">Danh
									sách khách hàng</a></li>
							<li><a
								class="dropdown-item fs-5 text-secondary bi bi-journal-text"
								href="/su22b1_it16308_sof3021/categories/index">Quản lý danh
									mục</a></li>
							<li><a
								class="dropdown-item fs-5 text-secondary bi bi-inboxes"
								href="/su22b1_it16308_sof3021/product/index">Quản lý sản
									phẩm</a></li>
							<li><a
								class="dropdown-item fs-5 text-secondary bi bi-card-checklist"
								href="/su22b1_it16308_sof3021/order/index">Quản lý đơn hàng</a></li>
						</ul></li>
				</c:if>

			</ul>
			<div class="col-4">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-10">
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search"
								placeholder="Nhập từ khóa cần tìm..." aria-label="Search">
							<button class="btn btn-outline-info bi bi-search" type="submit"></button>
						</form>
					</div>
					<div class="col-1"></div>
				</div>

			</div>

			<div class="col-1">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class=" nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white fs-4 bi bi-person-circle"
						href="#" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> <c:if test="${ user != null }">${ user.username }</c:if>
							<c:if test="${ user == null }">Tài khoản</c:if>
					</a>
						<ul class="dropdown-menu bg-light">
							<c:if test="${ user == null }">
								<li><a class="dropdown-item fs-5 text-secondary"
									href="/su22b1_it16308_sof3021/admin/open">Đăng nhập</a></li>
								<li><a class="dropdown-item fs-5 text-secondary"
									href="/su22b1_it16308_sof3021/admin/accounts/create1">Đăng
										ký</a></li>
							</c:if>
							<c:if test="${ user != null }">
								<li><a class="dropdown-item fs-5 text-secondary"
									href="/su22b1_it16308_sof3021/order/views">Lịch sử mua</a></li>
							</c:if>
							<c:if test="${ user != null }">
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item fs-5 text-secondary" href="#">Quản
										lý tài khoản</a></li>
								<li><a class="dropdown-item fs-5 text-secondary" href="#">Đổi
										mật khẩu</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item fs-5 text-secondary"
									href="/su22b1_it16308_sof3021/admin/logout">Đăng xuất</a></li>
							</c:if>
						</ul></li>
				</ul>
			</div>

		</div>
	</div>
</nav>