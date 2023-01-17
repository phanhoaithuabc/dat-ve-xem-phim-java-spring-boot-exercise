<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <!-- for-mobile-apps -->
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

  <title>Đặt vé</title>

  <!-- Font Awesome Icons -->
  <link href="<c:url value='/template/web/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet'>

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="<c:url value='/template/web/css/booking.css'/>" rel="stylesheet">
  
  <!-- Booking theme -->
  <link href="<c:url value='/template/web/css/style.css'/>" rel="stylesheet" type="text/css"/>
  <script src="<c:url value='/template/web/js/jquery-1.11.0.min.js'/>"></script>
  <script src="<c:url value='/template/web/js/jquery.seat-charts.js'/>"></script>
  
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
	.customlistb {
		font-weight: 600;
		color: #D88A04;
	}
	.customlistli {
		margin-bottom: 5px;
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
  
</body>

</html>
