<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul class="sidebar navbar-nav">
	<li class="nav-item active"><a class="nav-link" href="<c:url value='/admin-schedule-list?page=1&limit=8'/>">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Lịch chiếu</span>
	</a></li>
	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
		href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
		aria-haspopup="true" aria-expanded="false"> <i
			class="fas fa-fw fa-folder"></i> <span>Quản lý</span>
	</a>
		<div class="dropdown-menu" aria-labelledby="pagesDropdown">
			<h6 class="dropdown-header">Quản lý:</h6>
			<a class="dropdown-item" href="<c:url value='/admin-cinema-list?page=1&limit=8'/>">Rạp</a>
			<a class="dropdown-item" href="<c:url value='/admin-film-list?page=1&limit=8'/>">Phim</a> 
			<a class="dropdown-item" href="<c:url value='/admin-user-list?page=1&limit=8'/>">Khách hàng</a>
			<div class="dropdown-divider"></div>
			<h6 class="dropdown-header">Tài khoản quản trị:</h6>
			<a class="dropdown-item" href="#">Đổi mật khẩu</a>
		</div></li>
	<li class="nav-item"><a class="nav-link" href="<c:url value='/admin-bill-list?page=1&limit=8'/>"> <i
			class="fas fa-fw fa-table"></i> <span>Danh sách hóa đơn</span></a></li>
</ul>
