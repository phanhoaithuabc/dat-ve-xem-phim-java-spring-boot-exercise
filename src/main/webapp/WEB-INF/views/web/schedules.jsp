<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>

<html>

<head> <title>Trang chủ</title> </head>

<body>
  <div class="container">

  <h1 class="my-4">Page Heading
    <small>Secondary Text</small>
  </h1>
  
  <jsp:useBean id="now" class="java.util.Date" />
  <fmt:formatDate var="y" value="${now}" pattern="yyyy" />
  <fmt:formatDate var="m" value="${now}" pattern="MM" />
  <fmt:formatDate var="d" value="${now}" pattern="dd" />
  
  <div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<h2 class="my-4">Lịch chiếu phim
			<form action="<c:url value='/schedule'/>" id="formSubmit" method="get" style="display: inline;">
		  	
		  		<c:url var="dateParam" value='/schedule'>
		  			<c:param name="date" value="${y}-${m}-${d}"/>
		  		</c:url>
			    <a href="${dateParam }">
			      	<input type="button" id="date" class="btn btn-secondary" value="${d}-${m}">
			    </a>
			    
			    <c:url var="dateParam1" value='/schedule'>
		  			<c:param name="date" value="${y}-${m}-${d+1}"/>
		  		</c:url>
			    <a href="${dateParam1 }">
			      	<input type="button" id="date" class="btn btn-secondary" value="${d+1}-${m}">
			    </a>
			    
			    <c:url var="dateParam2" value='/schedule'>
		  			<c:param name="date" value="${y}-${m}-${d+2}"/>
		  		</c:url>
			    <a href="${dateParam2 }">
			      	<input type="button" id="date" class="btn btn-secondary" value="${d+2}-${m}">
			    </a>
		    </form>
  		</h2>
	</div>
	<div class="col-md-1"></div>
  </div>
  	
  	<div class="row" style="margin-bottom: 35px;">
		<div class="col-md-1"></div>
	    <div class="col-md-10">
	    	<c:if test="${empty lsFilm}"><b>Chưa có lịch chiếu...</b></c:if>  
	    </div>
	    <div class="col-md-1"></div>
	</div>
  	
	<c:forEach var="item" items="${lsFilm}">
	   	<div class="row" style="margin-bottom: 35px;">
		<div class="col-md-1"></div>
	    <div class="col-md-2">
	      <img class="img-fluid" src="<c:url value="/template/upload/thumbnail/${item.thumbnail}"/>" alt="">
	    </div>
	
	    <div class="col-md-5">
	      <h3 class="my-3">${item.title}</h3>
	      <ul>
	        <li><b>Đạo diễn: </b>${item.director}</li>
			<li><b>Diễn viên: </b>${item.cast}</li>
			<li><b>Thể loại: </b>${item.genre}</li>
			<li><b>Thời lượng: </b>${item.runningTime}</li>
	      </ul>
	    </div>
	    
	    <div class="col-md-3">
	    	<div class="row"><b style="margin: 0 auto; margin-bottom: 15px;">Giờ chiếu</b></div>
	    	<div class="row">
		    	<c:forEach var="schedule" items="${lsSchedule}">
		    		<c:if test="${item.id eq schedule.idFilm}">
		    			<c:url var="booking" value='/login'/>
		    			<security:authorize access="isAuthenticated()">
				    		<c:url var="booking" value='/bill'>
					  			<c:param name="id" value="${schedule.id}"/>
					  		</c:url>
					 	</security:authorize>
			    		<a href="${booking}">
			    			<c:set var="timeParts" value="${fn:split(schedule.timeStart, ' ')}" />
			      			<button type="button" id="btn" class="btn btn-secondary" style="margin-right: 10px;">
			      				${fn:split(timeParts[1], ':')[0]}:${fn:split(timeParts[1], ':')[1]}
			      			</button>
			      		</a>
		      		</c:if>
		      	</c:forEach>
		     </div>
	    </div>
	    
	    <div class="col-md-1"></div>
	    </div>
    </c:forEach>
  </div>

</body>

</html>