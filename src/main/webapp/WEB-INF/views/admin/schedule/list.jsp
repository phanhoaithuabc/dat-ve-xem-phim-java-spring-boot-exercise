<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="scheduleAPI" value="/api-schedule"/>
<c:url var="scheduleURL" value="/admin-schedule-list"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Danh sách suất chiếu</title>
</head>
<body id="page-top">
	<div id="content-wrapper">
		<form action="<c:url value='/admin-schedule-list'/>" id="formSubmit" method="get">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
			  		${message}
				</div>
			</c:if>
			<div class="container-fluid">
				<!-- Bảng danh sách phim -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh sách suất chiếu
						<div class="dt-buttons btn-overlap btn-group">
							
							<c:url var="createScheduleURL" value="/admin-schedule-edit" />
							<a flag="info"
								class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
								data-toggle="tooltip" title='Thêm phim' href='${createScheduleURL}'>
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
										<th scope="col">Rạp</th>
										<th scope="col">Thời gian chiếu</th>
										<th scope="col">Chỉnh sửa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${model.listResult}">
										<tr>
											<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
											<td>${item.filmName}</td>
											<td>${item.cinemaName}</td>
											<td>${item.timeStart}</td>
											<td>
												<c:url var="updateScheduleURL" value="/admin-schedule-edit">
													<c:param name="id" value="${item.id}"/>															
												</c:url>																
												<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
													title="Cập nhật phim" href='${updateScheduleURL}'>
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
            url: '${scheduleAPI}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${scheduleURL}?page=1&limit=8&message=delete_success";
            },
            error: function (error) {
            	window.location.href = "${scheduleURL}?page=1&limit=8&message=error_system";
            }
        });
    }
	</script>
</body>
</html>