<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="filmAPI" value="/api-film"/>
<c:url var="filmURL" value="/admin-film-list"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Danh sách phim</title>
</head>
<body id="page-top">
	<div id="content-wrapper">
		<form action="<c:url value='/admin-film-list'/>" id="formSubmit" method="get">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
			  		${message}
				</div>
			</c:if>
			<div class="container-fluid">
				<!-- Bảng danh sách phim -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh sách phim
						<div class="dt-buttons btn-overlap btn-group">
							
							<c:url var="createFilmURL" value="/admin-film-edit" />
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm phim' href='${createFilmURL}'>
								<span><i class="fa fa-plus-circle bigger-110 purple"></i>   </span>
							</a>
							&nbsp;
							<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
								class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Xóa phim'>
								<span><i class="far fa-trash-alt"></i></span>
							</button>
						</div>
					</div>

					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th><input type="checkbox" id="checkAll"></th>
										<th scope="col">Tên phim</th>
										<th scope="col">Poster</th>
										<th scope="col">Thể loại</th>
										<th scope="col">Thời gian</th>
										<th scope="col">Ngày ra mắt</th>
										<th scope="col">Đạo diễn</th>
										<th scope="col">Diễn viên</th>
										<th scope="col">Cập nhật</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${model.listResult}">
										<tr>
											<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
											<td>${item.title}</td>
											<td>${item.thumbnail}</td>
											<td>${item.genre}</td>
											<td>${item.runningTime}</td>
											<td>${item.releaseDate}</td>
											<td>${item.director}</td>
											<td>${item.cast}</td>
											<td>
												<c:url var="updateFilmURL" value="/admin-film-edit">
													<c:param name="id" value="${item.id}"/>															
												</c:url>																
												<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
													title="Cập nhật phim" href='${updateFilmURL}'>
												<i class="far fa-edit"></i>
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<ul class="pagination" id="pagination"></ul>
							<input type="hidden" id="page" name="page" />
							<input type="hidden" id="limit" name="limit" />
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
		
		function warningBeforeDelete() {
			swal({
			  title: "Xác nhận xóa",
			  text: "Bạn có chắc chắn muốn xóa hay không",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-success",
			  cancelButtonClass: "btn-danger",
			  confirmButtonText: "Xác nhận",
			  cancelButtonText: "Hủy bỏ",
			  closeOnCancel: true
			}).then(function(isConfirm) {
			  if (isConfirm) {
					var ids = $('tbody input[type=checkbox]:checked').map(function () {
			            return $(this).val();
			        }).get();
					deleteNew(ids);
			  }
			});
	} 
	function deleteNew(data) {
        $.ajax({
            url: '${filmAPI}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${filmURL}?page=1&limit=8&message=delete_success";
            },
            error: function (error) {
            	window.location.href = "${filmURL}?page=1&limit=8&message=error_system";
            }
        });
    }
	</script>
</body>
</html>