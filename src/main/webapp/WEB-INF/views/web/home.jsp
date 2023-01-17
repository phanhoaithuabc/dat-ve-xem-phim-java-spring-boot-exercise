<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="y" value="${now}" pattern="yyyy" />
<fmt:formatDate var="m" value="${now}" pattern="MM" />
<fmt:formatDate var="d" value="${now}" pattern="dd" />

<html>

<head> <title>Trang chủ</title> </head>

<body>
	<!-- Masthead -->
	<header class="masthead">
		<div class="container h-100">
			<div
				class="row h-100 align-items-center justify-content-center text-center">
				<div class="col-lg-10 align-self-end">
					<h1 class="text-uppercase text-white font-weight-bold">Báo cáo cuối kỳ học phần 
					Công nghệ Java</h1>
					<hr class="divider my-4">
				</div>
				<div class="col-lg-8 align-self-baseline">
					<p class="text-white-75 font-weight-light mb-5">Qnu Cinema là website đặt quản lý rạp 
						chiếu phim đơn giản sử dụng Spring MVC + Spring Security + 
						Spring Data JPA (Hibernate implementation)</p>
						
					<c:url var="dateParam" value='/schedule'>
  						<c:param name="date" value="${y}-${m}-${d}"/>
  					</c:url>
					<a class="btn btn-primary btn-xl js-scroll-trigger" href="${dateParam}">Xem lịch chiếu phim</a>
				</div>
			</div>
		</div>
	</header>

	<!-- Film Section -->
	<section class="page-section bg-primary" id="about">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center">
					<h2 class="text-white mt-0">Xem các phim đang chiếu</h2>
					<hr class="divider light my-4">
					<a class="btn btn-light btn-xl js-scroll-trigger" href="<c:url value='/list-film?page=1&limit=9'/>">Xem tại đây</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Services Section -->
	<section class="page-section" id="services">
		<div class="container">
			<h2 class="text-center mt-0">Các hoạt động khuyến mãi của chúng tôi!</h2>
			<hr class="divider my-4">
			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<i class="fas fa-4x fa-gem text-primary mb-4"></i>
						<h3 class="h4 mb-2">Sturdy Themes</h3>
						<p class="text-muted mb-0">Our themes are updated regularly to
							keep them bug free!</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<i class="fas fa-4x fa-laptop-code text-primary mb-4"></i>
						<h3 class="h4 mb-2">Up to Date</h3>
						<p class="text-muted mb-0">All dependencies are kept current
							to keep things fresh.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<i class="fas fa-4x fa-globe text-primary mb-4"></i>
						<h3 class="h4 mb-2">Ready to Publish</h3>
						<p class="text-muted mb-0">You can use this design as is, or
							you can make changes!</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<i class="fas fa-4x fa-heart text-primary mb-4"></i>
						<h3 class="h4 mb-2">Made with Love</h3>
						<p class="text-muted mb-0">Is it really open source if it's
							not made with love?</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Call to Action Section -->
	<section class="page-section bg-dark text-white">
		<div class="container text-center">
			<h2 class="mb-4">Xem các phim sắp chiếu!</h2>
			<a class="btn btn-light btn-xl" href="#">Ngay tại đây</a>
		</div>
	</section>

</body>

</html>