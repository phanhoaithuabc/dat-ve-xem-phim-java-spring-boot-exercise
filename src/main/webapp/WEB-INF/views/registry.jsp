

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="userAPI" value="/api-user"/>
<c:url var="registryURL" value="/registry"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
</head>
<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
    	<c:if test="${not empty message}">
			<div class="alert alert-${alert}">
  				${message}
			</div>
		</c:if>
      <div class="card-header">Đăng ký tài khoản</div>
      <div class="card-body">
        <form:form role="form" id="formSubmit" modelAttribute="model">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input path="userName" cssClass="form-control" placeholder="Tên người dùng" required="required" autofocus="autofocus"/>
                  <label for="userName">Tên người dùng</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input path="fullName" cssClass="form-control" placeholder="Họ tên"  required="required"/>
                  <label for="fullName">Họ tên</label>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-label-group">
              <form:input path="email" cssClass="form-control" placeholder="Email"  required="required"/>
              <label for="email">Địa chỉ email</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <form:input path="phone" cssClass="form-control" placeholder="Số điện thoại"  required="required"/>
              <label for="phone">Số điện thoại</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input type="password" path="passWord" cssClass="form-control" placeholder="Mật khẩu"  required="required"/>
                  <label for="password">Mật khẩu</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <form:input type="password" path="passWord" cssClass="form-control" placeholder="Xác nhận mật khẩu"  required="required"/>
                  <label for="password">Xác nhận mật khẩu</label>
                </div>
              </div>
            </div>
          </div>
          <button type="submit" id="btnRegistry" class="btn btn-primary btn-block">Đăng ký</button>
        </form:form>
        <div class="text-center">
          <a class="d-block small mt-3" href="<c:url value='/login'/>">Đăng nhập</a>
          <a class="d-block small" href="<c:url value='/forgotpassword'/>">Quên mật khẩu?</a>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
  	$('#btnRegistry').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		addAccount(data);
	});
	
	function addAccount(data) {
		$.ajax({
        	url: '${userAPI}',
        	type: 'POST',
        	contentType: 'application/json',
        	data: JSON.stringify(data),
        	dataType: 'json',
        	success: function (result) {
        		window.location.href = "${registryURL}?message=insert_success";
        	},
        	error: function (error) {
        		window.location.href = "${registryURL}?message=error_system";
        	}
    	});
	}
  </script>
</body>
</html>