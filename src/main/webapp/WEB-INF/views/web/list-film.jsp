<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head> <title>Phim đang chiếu</title> 
	</head>
<body>
	<!-- Page Content -->
    <div class="container">
	  <form action="<c:url value='/list-film'/>" id="formSubmit" method="get">
      <!-- Page Heading -->
      <h1 class="my-4">Phim
        <small></small>
      </h1>

      <div class="row">
      	<c:forEach var="item" items="${model.listResult}">
	        <div class="col-lg-4 col-sm-6 portfolio-item">
	          <div class="card h-100">
	            <c:url var="detailFilm" value="/film-detail">
					<c:param name="id" value="${item.id}"/>															
				</c:url>
	            <a href="${detailFilm}"><img class="card-img-top" src="<c:url value="/template/upload/thumbnail/${item.thumbnail}"/>" alt="${item.title}"/></a>
	            <div class="card-body">			
	              <h4 class="card-title">
	                <a href="${detailFilm}">${item.title}</a>
	              </h4>
	              <p class="card-text"><b>Thể loại: </b>${item.genre}</p>
	              <p class="card-text"><b>Thời lượng: </b>${item.runningTime}</p>
	              <p class="card-text"><b>Khởi chiếu: </b>${item.releaseDate}</p>
	            </div>
	          </div>
	        </div>
        </c:forEach>
      </div>
      <!-- /.row -->
	 <ul class="pagination" id="pagination"></ul>
	 <input type="hidden" value="" id="page" name="page" /> 
	 <input	type="hidden" value="" id="limit" name="limit" />
	 </form>
    </div>
    <!-- /.container -->

<script type="text/javascript">
	var totalPages = ${model.totalPage};
	var currentPage = ${model.page};
	$(function() {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages : totalPages,
			visiblePages : 10,
			startPage : currentPage,
			onPageClick : function(event, page) {
				if (currentPage != page) {
					$('#limit').val(9);
					$('#page').val(page);
					$('#formSubmit').submit();
				}
			}
		});
	});
</script>
</body>

</html>