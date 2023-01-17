<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Đăng nhập</div>
			<div class="card-body">
				<form action="j_spring_security_check" id="formLogin" method="post">
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" id="userName" class="form-control"
								placeholder="Tên đăng nhập" required="required"
								autofocus="autofocus" name="j_username"> <label
								for="inputEmail">Tên đăng nhập</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" id="password" class="form-control"
								placeholder="Mật khẩu" required="required" name="j_password">
							<label for="inputPassword">Mật khẩu</label>
						</div>
					</div>
					<div class="form-group"></div>
					<button type="submit" class="btn btn-primary btn-block" >Đăng nhập</button>
				</form>
				<div class="text-center">
					<a class="d-block small mt-3" href="<c:url value='/registry'/>">Đăng ký tài khoản</a> <a
						class="d-block small" href="<c:url value='/forgotpassword'/>">Quên mật
						Khẩu?</a>
				</div>
			</div>
			<c:if test="${param.incorrectAccount != null}">
				<div class="alert alert-danger">Tên đăng nhập hoặc mật khẩu không đúng
				</div>
			</c:if>
			<c:if test="${param.accessDenied != null}">
				<div class="alert alert-danger">Không có quyền truy cập!</div>
			</c:if>
		</div>
	</div>
</body>
</html>