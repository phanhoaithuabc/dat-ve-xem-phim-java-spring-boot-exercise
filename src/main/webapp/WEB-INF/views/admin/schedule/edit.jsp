<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="editScheduleURL" value="/admin-schedule-edit"/>
<c:url var="scheduleAPI" value="/api-schedule"/>
<c:url var="scheduleURL" value="/admin-schedule-list"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch chiếu</title>

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
							<label for="idFilm">Tên phim</label> 
							<form:select path="idFilm" id="idFilm" cssClass="form-control">
							  	 <form:option value="" label="-- Chọn Phim --"/>
							  	 <form:options items="${film}"/>
							</form:select>
						</div>

						<div class="form-group">
							<label for="idCinema">Rạp</label> 
						    <form:select path="idCinema" id="idCinema" cssClass="form-control">
							  	 <form:option value="" label="-- Chọn Rạp --"/>
							  	 <form:options items="${cinema}"/>
							</form:select>
						</div>
						
						<div class="form-group">
							<label for="timeStart">Ngày chiếu (giờ tự động +7)</label>
							<form:input type="datetime" path="timeStart" cssClass="form-control"/>
						</div>

						<form:hidden path="id" id="scheduleId"/>
						<fieldset class="form-group" style="margin: 0, auto;">
							<c:if test="${not empty model.id}">
								<button type="button" id="btnAddOrUpdateSchedule"
									class="btn btn-primary">Cập nhật</button>
							</c:if>
							
							<c:if test="${empty model.id}">
							<button type="button" id="btnAddOrUpdateSchedule"
								class="btn btn-primary">Thêm mới</button>
							</c:if>
							<a href="<c:url value='/admin-schedule-list?page=1&limit=8'/>">
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
		$('#btnAddOrUpdateSchedule').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
					data["" + v.name + ""] = v.value;	
			});
			// nếu tồn tại id trong form thì gọi update ngược lại thì gọi add
	        var id = $('#scheduleId').val();
	    	if (id == "") {
	    		addSchedule(data);
	    	} else {
	    		updateSchedule(data);
	    	}
		});
		
		function addSchedule(data) {
			$.ajax({
	            url: '${scheduleAPI}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${scheduleURL}?page=1&limit=8&message=insert_success";
	            },
	            error: function (error) {
	            	window.location.href = "${scheduleURL}?page=1&limit=8&message=error_system";
	            }
	        });
		}
		
		function updateSchedule(data) {
			// ajax là một kỹ thuật để làm việc với RESTFUL(JSON) API mà không cần quan tâm 
			// đến phần front-end, có nhiệm vụ chuyển đổi data thành 1 định dạng chung là JSON
			$.ajax({
	            url: '${scheduleAPI}',  // Dẫn đến API sửa phim
	            type: 'PUT', 		// Cho biết hàm API nào thực hiện "PUT là sửa"
	            contentType: 'application/json', // Dữ liệu gửi từ client về server là json
	            data: JSON.stringify(data), 	// chuyển đổi data nhận được thành JSON
	            dataType: 'json',				// định nghĩa kiểu trả về cho client là json
	            success: function (result) {
	            	window.location.href = "${scheduleURL}?page=1&limit=8&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${scheduleURL}?page=1&limit=8&message=error_system";
	            }
	        });
		}
	</script>
</body>
</html>