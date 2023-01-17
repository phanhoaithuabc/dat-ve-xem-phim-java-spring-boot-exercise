<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="y" value="${now}" pattern="yyyy" />
<fmt:formatDate var="m" value="${now}" pattern="MM" />
<fmt:formatDate var="d" value="${now}" pattern="dd" />
  
<!DOCTYPE html>

<html>
<head>
<title>Trang chủ</title>
</head>
<body>
	<div class="container">

		<!-- Portfolio Item Heading -->
		<h1 class="my-4">
			Page Heading <small>Secondary Text</small>
		</h1>

		<!-- Portfolio Item Row -->
		<div class="row">
			<div class="col-md-1"></div>
			
			<div class="col-md-3">
				<img class="img-fluid" src="<c:url value="/template/upload/thumbnail/${model.thumbnail}"/>" alt="">
			</div>

			<div class="col-md-7">
				<h3 class="my-3">${model.title}</h3>
				<ul>
					<li><b>Đạo diễn: </b>${model.director}</li>
					<li><b>Diễn viên: </b>${model.cast}</li>
					<li><b>Thể loại: </b>${model.genre}</li>
					<li><b>Khởi chiếu: </b>${model.releaseDate}</li>
					<li><b>Thời lượng: </b>${model.runningTime}</li>
					<li><b>Ngôn ngữ: </b>${model.language}</li>
					<li><b>Đối tượng: </b>${model.rated}</li>
				</ul>
				
				<c:url var="dateParam" value='/schedule'>
  					<c:param name="date" value="${y}-${m}-${d}"/>
  				</c:url>
				<a href="${dateParam}">
					<button type="button" id="btn" class="btn btn-primary">Đặt vé</button>
				</a>
				<a href="${model.trailer}" target="_blank">
					<button type="button" id="btn" class="btn btn-secondary">Trailer</button>
				</a>
			</div>
			<div class="col-md-1"></div>
			
		</div>
		
		<div class="row" style="margin-top : 30px;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<p align="justify">${model.description}</p>
			</div>
			<div class="col-md-1"></div>
		</div>
		<!-- /.row -->

		<!-- Related Projects Row -->
		<h3 class="my-4">Các phim đang chiếu khác</h3>

		<div class="row">

			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"
					src="http://placehold.it/500x300" alt="">
				</a>
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"
					src="http://placehold.it/500x300" alt="">
				</a>
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"
					src="http://placehold.it/500x300" alt="">
				</a>
			</div>

			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"
					src="http://placehold.it/500x300" alt="">
				</a>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

</body>

</html>