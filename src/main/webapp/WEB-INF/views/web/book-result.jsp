<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="content">
	<h1>Chọn ghế ngồi</h1>
	<div class="main">
		<h2>Kết quả đặt vé</h2>
		<div class="demo" style="margin-left: 15px;">
			<ul style="font-size: large;">
				<li class="customlistli"><b class="customlistb">Khách hàng: </b> ${customerName}</li>
				<li class="customlistli"><b class="customlistb">Phim: </b> ${bill.filmName}</li>
				<c:set var="timeParts" value="${fn:split(bill.timeStart, ':')}" />
				<li class="customlistli"><b class="customlistb">Thời gian: </b> 
					${timeParts[0]}:${timeParts[1]}
				</li>
				<li class="customlistli"><b class="customlistb">Tổng tiền: </b> <b>${bill.price}<i>đ</i></b></li>
				<li class="customlistli"><b class="customlistb">Chỗ ngồi: </b>${bill.seat}</li>
			</ul>	
		</div>
			
		<c:if test="${not empty message}">
			<div class="alert alert-${alert}">
		  		${message} ${bill.id}
			</div>
		</c:if>
	    </div>
	</div>
</body>
</html>
