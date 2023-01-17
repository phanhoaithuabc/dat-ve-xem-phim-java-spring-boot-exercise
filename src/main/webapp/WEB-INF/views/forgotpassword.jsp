<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset password</title>
</head>
<body class="bg-dark">
	<div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Lấy lại mật khẩu</div>
      <div class="card-body">
        <div class="text-center mb-4">
          <h4>Bạn đã quên mật khẩu?</h4>
          <p>Nhập địa chỉ email và chúng tôi sẽ gửi hướng dẫn để lấy lại mật khẩu.</p>
        </div>
        <form>
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" placeholder="Enter email address" required="required" autofocus="autofocus">
              <label for="inputEmail">Nhập địa chỉ email</label>
            </div>
          </div>
          <a class="btn btn-primary btn-block" href="#">Lấy lại mật khẩu</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="<c:url value='/registry'/>">Đăng ký tài khoản</a>
          <a class="d-block small" href="<c:url value='/login'/>">Đăng nhập</a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>