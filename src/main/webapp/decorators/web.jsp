<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <!-- for-mobile-apps -->
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

  <title>Trang chủ</title>

  <!-- Font Awesome Icons -->
  <link href="<c:url value='/template/web/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="<c:url value='/template/web/vendor/magnific-popup/magnific-popup.css'/>" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="<c:url value='/template/admin/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
  <link href="<c:url value='/template/web/css/creative.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/template/web/css/custom.css'/>" rel="stylesheet">
  
  <script src="<c:url value='/template/admin/vendor/jquery/jquery.min.js'/>"></script>
  <script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
  
  <style type="text/css">
	#mainNav {
    	box-shadow: none;
    	background-color: black;
	}
	.bg-light {
    	background-color: #000000!important;
	}
	#contact{
		background-color: #E3E3E3;
	}
	.portfolio-item {
    	margin-bottom: 35px;
	}
	.card-img-top {
    	filter: drop-shadow(2px 4px 6px blue);
    	height: 300px;
    	object-fit: contain;
    	background: aliceblue;
    }
  </style>
</head>

<body id="page-top">

	<%@ include file="/common/web/header.jsp" %>
	
	<dec:body/>

 	<%@ include file="/common/web/footer.jsp" %>
  
  <!-- Booking JavaScript -->
  <script src="<c:url value='/template/web/js/jquery.nicescroll.js'/>"></script>
  <script src="<c:url value='/template/web/js/scripts.js'/>"></script>
  
  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value='/template/admin/vendor/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
  <script src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

  <!-- Plugin JavaScript -->
  <script src="<c:url value='/template/web/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
  <script src="<c:url value='/template/web/vendor/magnific-popup/jquery.magnific-popup.min.js'/>"></script>
  
  <!-- Custom scripts for this template -->
  <script src="<c:url value='/template/web/js/creative.min.js'/>"></script>

</body>

</html>
