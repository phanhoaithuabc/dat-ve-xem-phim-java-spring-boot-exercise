<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="billAPI" value="/api-bill"/>
<c:url var="billURL" value="/admin-bill-list"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hóa đơn</title>

</head>
<body id="page-top">

	<div id="content-wrapper">
		<div class="container-fluid">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
  					${message}
				</div>
			</c:if>
			<form:form method="POST" role="form" id="formSubmit" modelAttribute="model">
				<div class="row">
					<div class="col-lg-3"></div>
					<div class="col-lg-6">
						<div class="form-group">
							<label for="id">Mã giao dịch</label> 
							<form:input path="id" cssClass="form-control" readonly="true"/>
						</div>
						
						<div class="form-group">
							<label for="customerName">Khách hàng</label> 
							<form:input path="customerName" cssClass="form-control" readonly="true"/>
						</div>
						
						<div class="form-group">
							<label for="filmName">Phim</label>
							<form:input path="filmName" cssClass="form-control" readonly="true"/>
						</div>

						<div class="form-group">
							<label for="timeStart">Thời gian chiếu</label>
							<form:input path="timeStart" cssClass="form-control" readonly="true"/>
						</div>

						<div class="form-group">
							<label for="seat">Ghế ngồi</label>
							<form:input path="seat" cssClass="form-control" readonly="true"/>	
						</div>

						<div class="form-group">
							<label for="price">Tổng tiền</label>
							<form:input path="price" cssClass="form-control" readonly="true"/>
						</div>

						<div class="form-group">
							<label for="status">Trạng thái đơn hàng</label>
							<form:input path="status" cssClass="form-control"/>
						</div>

						<fieldset class="form-group" style="margin: 0, auto;">
							<button type="button" id="btnUpdateBill" class="btn btn-primary">Cập nhật</button>
							<a href="<c:url value='/admin-bill-list?page=1&limit=8'/>">
								<button type="button" class="btn btn-secondary">Hủy</button>
							</a>
						</fieldset>
					</div>
					<div class="col-lg-3"></div>
				</div>
			</form:form>
		</div>
	</div>
	<script> 
		$('#btnUpdateBill').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			updateBill(data);
		});
		
		function updateBill(data) {
			// ajax là một kỹ thuật để làm việc với RESTFUL(JSON) API mà không cần quan tâm 
			// đến phần front-end, có nhiệm vụ chuyển đổi data thành 1 định dạng chung là JSON
			$.ajax({
	            url: '${billAPI}',  // Dẫn đến API sửa phim
	            type: 'PUT', 		// Cho biết hàm API nào thực hiện "PUT là sửa"
	            contentType: 'application/json', // Dữ liệu gửi từ client về server là json
	            data: JSON.stringify(data), 	// chuyển đổi data nhận được thành JSON
	            dataType: 'json',				// định nghĩa kiểu trả về cho client là json
	            success: function (result) {
	            	window.location.href = "${billURL}?page=1&limit=8&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${billURL}?page=1&limit=8&message=error_system";
	            }
	        });
		}
	</script>
</body>
</html>