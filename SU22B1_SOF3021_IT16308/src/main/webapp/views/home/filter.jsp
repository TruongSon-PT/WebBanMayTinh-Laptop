<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<div class="row p-2 pe-4 ps-3">
	<div class="col-9">
		<div class="row">
			<div class="col-10">
				<div class="text-light fs-4 ps-5">Filter</div>
			</div>
		</div>
		<div class="row py-3">
			<c:forEach var="item" items="${ listFilter }">
				<div class="col-3 my-3 mx-5">
					<div class="card" style="width: 18rem;">
						<img src="/su22b1_it16308_sof3021/views/image/${ item.image }"
							class="card-img-top" alt="...">
						<div class="card-body">
							<div class="card-title text-center fs-4 fw-semibold my-2">${ item.name }</div>
							<div
								class="card-title text-danger fs-5 fw-bolder my-1 text-center">
								<c:if test="${ item.price >= 10000000 }">${ item.price/1000000 }00.000</c:if>
								<c:if test="${ item.price < 10000000 && item.price >= 1000000 }">${ item.price/1000000 }00.000</c:if>
								<c:if test="${ item.price < 1000000 }">${ item.price/1000 }00</c:if>
								VND
							</div>
							<div class="text-center mt-4 mb-1">
								<a href="/su22b1_it16308_sof3021/cart/add/${ item.id }" class="btn btn-primary fs-5">Thêm vào giỏ hàng</a>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="col-3 bg-dark">
		<div class="border border-light p-2 mt-3 mx-2 text-center">
			<a class="bi bi-cart3 text-light fs-4" href="/su22b1_it16308_sof3021/cart/list">Giỏ hàng >></a>
		</div>
		<div class="accordion mt-3 mx-2" id="accordionExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button fs-5 fw-semibold" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">Máy tính</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<button
							class="form-control fs-5 bg-secondary text-light my-4 mt-2">Laptop</button>
						<button class="form-control fs-5 bg-secondary text-light my-2">Máy
							tính để bàn</button>
						<button
							class="form-control fs-5 bg-secondary text-light my-2 mt-4">Máy
							tính bảng</button>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed fs-5 fw-semibold"
						type="button" data-bs-toggle="collapse"
						data-bs-target="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo">Phụ kiện</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<button
							class="form-control fs-5 bg-secondary text-light my-4 mt-2">Tai
							nghe</button>
						<button class="form-control fs-5 bg-secondary text-light my-4">Bàn
							phím</button>
						<button class="form-control fs-5 bg-secondary text-light my-4">Màn
							hình</button>
						<button
							class="form-control fs-5 bg-secondary text-light my-2 mt-4">Chuột
							máy tính</button>
					</div>
				</div>
			</div>
		</div>
		<div class="border border-light p-4 mt-3 mx-2">
			<form>
				<div class="my-3">
					<input class="form-check-input mt-2" type="radio" name="filterPrice" value="0">
					<label class="fs-4 text-light">Tất cả</label>
				</div>
				<div class="my-3">
					<input class="form-check-input mt-2" type="radio" name="filterPrice" value="5">
					<label class="fs-4 text-light">Trên 20 triệu VND</label>
				</div>
				<div class="my-3">
					<input class="form-check-input mt-2" type="radio" name="filterPrice" value="4">
					<label class="fs-4 text-light">Từ 10 - 20 triệu VND</label>
				</div>
				<div class="my-3">
					<input class="form-check-input mt-2" type="radio" name="filterPrice" value="3">
					<label class="fs-4 text-light">Từ 5 - 10 triệu VND</label>
				</div>
				<div class="my-3">
					<input class="form-check-input mt-2" type="radio" name="filterPrice" value="2">
					<label class="fs-4 text-light">Từ 1 - 5 triệu VND</label>
				</div>
				<div class="my-3">
					<input class="form-check-input mt-2" type="radio" name="filterPrice" value="1">
					<label class="fs-4 text-light">Dưới 1 triệu VND</label>
				</div>
				<div class="mt-4 text-center">
					<button class="btn btn-light text-primary px-4 fs-5 fw-semibold" formaction="/su22b1_it16308_sof3021/home/filter" formmethod="get">Lọc</button>
				</div>
			</form>
		</div>
	</div>
</div>
