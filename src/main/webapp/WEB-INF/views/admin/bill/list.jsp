<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="billAPI" value="/api-bill"/>
<c:url var="billURL" value="/admin-bill-list"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Danh sách hóa đơn</title>
</head>
<body id="page-top">
	<div id="content-wrapper">
		<form action="<c:url value='/admin-bill-list'/>" id="formSubmit" method="get">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
			  		${message}
				</div>
			</c:if>
			<div class="container-fluid">
				<!-- Bảng danh sách phim -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh sách hóa đơn
						<div class="dt-buttons btn-overlap btn-group">
							
						</div>
					</div>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Mã hóa đơn</th>
										<th scope="col">Khách hàng</th>
										<th scope="col">Phim</th>
										<th scope="col">Rạp</th>
										<th scope="col">Giờ chiếu</th>
										<th scope="col">Ghế</th>
										<th scope="col">Tổng tiền</th>
										<th scope="col">Trạng thái</th>
										<td scope="col">Chỉnh sửa</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${model.listResult}">
										<tr>
											<td>${item.id}</td>
											<td>${item.customerName}</td>
											<td>${item.filmName}</td>
											<td>${item.cinemaName}</td>
											<td>${item.timeStart}</td>
											<td>${item.seat}</td>
											<td>${item.price}</td>
											<td>${item.status}</td>
											<td>
												<c:url var="updateBillURL" value="/admin-bill-edit">
													<c:param name="id" value="${item.id}"/>															
												</c:url>																
												<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
													title="Cập nhật đơn hàng" href='${updateBillURL}'>
												<i class="far fa-edit"></i>
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<ul class="pagination" id="pagination"></ul>
							<input type="hidden" value="" id="page" name="page" /> <input
								type="hidden" value="" id="limit" name="limit" />
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
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
						$('#limit').val(8);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});
	</script>
</body>
</html>