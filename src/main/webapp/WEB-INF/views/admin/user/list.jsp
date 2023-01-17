<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách khách hàng</title>
</head>
<body id="page-top">
	<div id="content-wrapper">
		<form action="<c:url value='/admin-user-list'/>" id="formSubmit" method="get">
			<div class="container-fluid">
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh sách khách hàng
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Tên người dùng</th>
										<th scope="col">Họ tên</th>
										<th scope="col">Email</th>
										<th scope="col">Số điện thoại</th>
										<th scope="col">Loại người dùng</th>
										<th scope="col">Ngày tạo</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${model.listResult}">
										<tr>
											<td>${item.userName}</td>
											<td>${item.fullName}</td>
											<td>${item.email}</td>
											<td>${item.phone}</td>
											<td>${item.roleName}</td>
											<td>${item.createdDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<ul class="pagination" id="pagination"></ul>
							<input type="hidden" value="" id="page" name="page" /> 
							<input type="hidden" value="" id="limit" name="limit" />
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		$(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPages,
	            visiblePages: 10,
	            startPage: currentPage,
	            onPageClick: function (event, page) {
	            	if (currentPage != page) {
	            		$('#limit').val(4);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
	            }
	        });
	    });
	</script>
</body>
</html>