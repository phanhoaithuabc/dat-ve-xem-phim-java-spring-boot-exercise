<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="filmURL" value="/admin-film-list"/>
<c:url var="editFilmURL" value="/admin-film-edit"/>
<c:url var="filmAPI" value="/api-film"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phim</title>

</head>
<body id="page-top">

	<div id="content-wrapper">
		<div class="container-fluid">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
  					${message}
				</div>
			</c:if>
			<form:form role="form" id="formSubmit" modelAttribute="model">
				<div class="row">
					<div class="col-lg-3"></div>
					<div class="col-lg-6">
						<div class="form-group">
							<label for="title">Tên phim</label> 
							<form:input path="title" cssClass="form-control" placeholder="Nhập tên phim"/>
						</div>

						<div class="form-group">
							<label for="title">Poster</label>
							<div class="custom-file">
						    	<input type="file" class="custom-file-input" id="customFile">
						    	<label class="custom-file-label" for="customFile">Chọn ảnh</label>
						 	</div>
						</div>
						
						<div class="form-group">
							<label for="cast">Diễn viên</label>
							<form:input path="cast" cssClass="form-control" placeholder="Nhập diễn viên"/>
						</div>

						<div class="form-group">
							<label for="director">Đạo diễn</label>
							<form:input path="director" cssClass="form-control" placeholder="Nhập đạo diễn"/>
						</div>

						<div class="form-group">
							<label for="genre">Thể loại</label>
							<form:input path="genre" cssClass="form-control" placeholder="Nhập thể loại"/>	
						</div>

						<div class="form-group">
							<label for="rated">Giới hạn tuổi</label>
							<form:input path="rated" cssClass="form-control" placeholder="Cấm khán giả dưới..."/>
						</div>

						<div class="form-group">
							<label for="runningTime">Độ dài</label>
							<form:input path="runningTime" cssClass="form-control" placeholder="Độ dài của phim"/>
						</div>

						<div class="form-group">
							<label for="trailer">Trailer</label>
							<form:input path="trailer" cssClass="form-control" placeholder="Link trailer..."/>
						</div>

						<div class="form-group">
							<label for="releaseDate">Ngày ra mắt</label>
							<form:input path="releaseDate" cssClass="form-control" placeholder="Ngày ra mắt..."/>
						</div>

						<div class="form-group"></div>

						<fieldset class="form-group">
							<label>Mô tả ngắn</label>
							<form:textarea path="description" rows="4" cssClass="form-control" id="description"/>
						</fieldset>
						<form:hidden path="id" id="filmId"/>
						<fieldset class="form-group" style="margin: 0, auto;">
							<c:if test="${not empty model.id}">
								<button type="button" id="btnAddOrUpdateFilm"
									class="btn btn-primary">Cập nhật</button>
							</c:if>
							
							<c:if test="${empty model.id}">
							<button type="button" id="btnAddOrUpdateFilm"
								class="btn btn-primary">Thêm mới</button>
							</c:if>
							<a href="<c:url value='/admin-film-list?page=1&limit=8'/>">
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
		$('#btnAddOrUpdateFilm').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			
			var files = $("#thumbnail")[0].files[0];
		    if (files != undefined) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                data["thumbnailBase64"] = e.target.result;
	                data["thumbnail"] = files.name;
	             	// nếu tồn tại id trong form thì gọi update ngược lại thì gọi add
	    			var id = $('#filmId').val();
	    			if (id == "") {
	    				addFilm(data);
	    			} else {
	    				updateFilm(data);
	    			}
	            };
	            reader.readAsDataURL(files);
			}
		});
		
		function addFilm(data) {
			$.ajax({
	            url: '${filmAPI}',
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${editFilmURL}?id="+result.id+"&message=insert_success";
	            },
	            error: function (error) {
	            	window.location.href = "${filmURL}?page=1&limit=8&message=error_system";
	            }
	        });
		}
		
		function updateFilm(data) {
			// ajax là một kỹ thuật để làm việc với RESTFUL(JSON) API mà không cần quan tâm 
			// đến phần front-end, có nhiệm vụ chuyển đổi data thành 1 định dạng chung là JSON
			$.ajax({
	            url: '${filmAPI}',  // Dẫn đến API sửa phim
	            type: 'PUT', 		// Cho biết hàm API nào thực hiện "PUT là sửa"
	            contentType: 'application/json', // Dữ liệu gửi từ client về server là json
	            data: JSON.stringify(data), 	// chuyển đổi data nhận được thành JSON
	            dataType: 'json',				// định nghĩa kiểu trả về cho client là json
	            success: function (result) {
	            	window.location.href = "${editFilmURL}?id="+result.id+"&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${filmURL}?page=1&limit=8&message=error_system";
	            }
	        });
		}
	</script>
</body>
</html>