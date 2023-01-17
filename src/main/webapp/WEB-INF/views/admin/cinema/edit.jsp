<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="editCinemaURL" value="/admin-cinema-edit"/>
<c:url var="cinemaAPI" value="/api-cinema"/>
<c:url var="cinemaURL" value="/admin-cinema-list"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rạp</title>

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
							<label for="name">Tên Rạp</label>
							<form:input path="name" cssClass="form-control" placeholder="Nhập tên rạp"/>
						</div>
						
						<div class="form-group">
							<label for="totalSeats">Tổng số ghế</label>
							<form:input path="totalSeats" cssClass="form-control" placeholder="Nhập tổng số ghế"/>
						</div>
						
						<div class="form-group">
							<label for="typeOfCinema">Loại rạp</label>
							<form:input path="typeOfCinema" cssClass="form-control" placeholder="Nhập Loại rạp"/>
						</div>
						
						<fieldset class="form-group">
							<label>Mô tả ngắn</label>
							<form:textarea path="description" rows="4" cssClass="form-control" id="description"/>
						</fieldset>
						
						<form:hidden path="id" id="cinemaId"/>
						<fieldset class="form-group" style="margin: 0, auto;">
							<c:if test="${not empty model.id}">
								<button type="button" id="btnAddOrUpdateCinema"
									class="btn btn-primary">Cập nhật</button>
							</c:if>
							
							<c:if test="${empty model.id}">
							<button type="button" id="btnAddOrUpdateCinema"
								class="btn btn-primary">Thêm mới</button>
							</c:if>
							<a href="<c:url value='/admin-cinema-list?page=1&limit=8'/>">
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
		$('#btnAddOrUpdateCinema').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			
			// nếu tồn tại id trong form thì gọi update ngược lại thì gọi add
	        var id = $('#cinemaId').val();
			if (id == "") {
				addCinema(data);
	    	} else {
	    		updateCinema(data);
	   		}
		});
		
		function addCinema(data) {
			$.ajax({
	            url: '${cinemaAPI}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${cinemaURL}?page=1&limit=8&message=insert_success";
	            },
	            error: function (error) {
	            	window.location.href = "${cinemaURL}?page=1&limit=8&message=error_system";
	            }
	        });
		}
		
		function updateCinema(data) {
			$.ajax({
	            url: '${cinemaAPI}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${cinemaURL}?page=1&limit=8&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${cinemaURL}?page=1&limit=8&message=error_system";
	            }
	        });
		}
	</script>
</body>
</html>