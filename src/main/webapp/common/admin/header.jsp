<%@ page import="com.qnu.util.SecurityUtils" %>
<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="<c:url value='/admin-home'/>">Trang Quản Trị</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Tìm kiếm..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Thông báo mới</a>
          <a class="dropdown-item" href="#">Đánh dấu đã đọc</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Cài đặt thông báo</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Tin nhắn mới</a>
          <a class="dropdown-item" href="#">Đánh dấu đã đọc</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Cài đặt tin nhắn</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <security:authorize access="isAuthenticated()">
	          <a class="dropdown-item" href="#">Chào</a>
	          <a class="dropdown-item" href="#"><%=SecurityUtils.getPrincipal().getFullName()%></a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="<c:url value='/logout'/>" data-toggle="modal" data-target="#logoutModal">Đăng xuất</a>
	      </security:authorize>
        </div>
      </li>
    </ul>

  </nav>