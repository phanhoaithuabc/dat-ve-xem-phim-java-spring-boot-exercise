<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<c:url var="billAPI" value="/api-bill"/>
<c:url var="bookResult" value="/bill-result"/>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<div class="content">
	<h1>Chọn ghế ngồi</h1>
	<div class="main">
		<h2>Sơ Đồ Ghế Ngồi</h2>
		<div class="demo">
			<div id="seat-map">
				<div class="front">MÀN HÌNH</div>
			</div>
			<div class="booking-details">
				<ul style="font-size: large;">
					<li class="customlistli"><b class="customlistb">Phim: </b> ${filmDTO.title}</li>
					<c:set var="timeParts" value="${fn:split(scheduleDTO.timeStart, ':')}" />
					<li class="customlistli"><b class="customlistb">Thời gian: </b> 
						${timeParts[0]}:${timeParts[1]}
					</li>
					<li class="customlistli"><b class="customlistb">Số vé: </b> <span id="counter">0</span></li>
					<li class="customlistli"><b class="customlistb">Tổng tiền: </b> <b><span id="total">0</span><i> đ</i></b></li>
					<li class="customlistli"><b class="customlistb">Chỗ ngồi: </b></li>
				</ul>
				<div class="clear"></div>
				
				<form:form method="POST" role="form" id="formSubmit" modelAttribute="bills">
					<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
					<button class="checkout-button" id="btnAddBill">Đặt Vé Và Thanh Toán</button>
				</form:form>
				
				<div id="legend"></div>
			</div>
			<div style="clear:both"></div>
			
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
			  		${message} ${message}
				</div>
			</c:if>
	    </div>

			<script type="text/javascript">
				var price = 55000; //giá tiền
				
				$(document).ready(function() {
					var $cart = $('#selected-seats'), //Khu vực ghế ngồi
					$counter = $('#counter'), //Số ghế được chọn
					$total = $('#total'); //Tổng tiền
					
					var sc = $('#seat-map').seatCharts({
						map: [  //Định nghĩa sơ đồ chỗ ngồi
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__________',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__aaaaaa__'
						],
						naming : {
							top : false,
							getLabel : function (character, row, column) {
								return column;
							}
						},
						legend : { //Khu vực chú thích
							node : $('#legend'),
							items : [
								[ 'a', 'available',   'Còn Trống' ],
								[ 'a', 'unavailable', 'Đã Bán'],
								[ 'a', 'selected', 'Đã Được Chọn']
							]					
						},
						click: function () {
							if (this.status() == 'available') {
								$('<li>Hàng '+(this.settings.row+1)+' Ghế '+this.settings.label+'</li>')
									.attr('id', 'cart-item-'+this.settings.id)
									.data('seatId', this.settings.id)
									.appendTo($cart);

								$counter.text(sc.find('selected').length+1);
								$total.text(recalculateTotal(sc)+price);
											
								return 'selected';
							} else if (this.status() == 'selected') { //Được chọn
									//Cập nhật tổng số ghế đã chọn
									$counter.text(sc.find('selected').length-1);
									//Cập nhật tổng số tiền
									$total.text(recalculateTotal(sc)-price);
									//Bỏ chọn
									$('#cart-item-'+this.settings.id).remove();

									return 'available';
							} else if (this.status() == 'unavailable') { //đã bán
								return 'unavailable';
							} else {
								return this.style();
							}
						}
					});
					//Ghế đã bán
					var seat = ${seats};
					
					sc.get(seat).status('unavailable');
				});
				//Tổng số tiền
				function recalculateTotal(sc) {
					var total = 0;
					sc.find('selected').each(function () {
						total += price;
					});
					return total;
				}
				
				
				$('#btnAddBill').click(function(e) {
					e.preventDefault();
					
					// lấy ra ghế đã chọn
					var seat = "";
				    $('#selected-seats li').each(function(){
				    	var string = ($(this).attr('id')).split("-")[2];
				    	seat = seat + string + ",";
				    });
				    seat = seat.substring(0, seat.length - 1);		
					
					var data = {};
					data["idCustomer"] = ${id};
					data["idSchedule"] = ${scheduleDTO.id};
					data["seat"] = seat;
					data["price"] = $('#total').text().split(" ")[0];
					data["status"] = "Chưa lấy vé";
					addBill(data);
				});
				
				function addBill(data) {
					$.ajax({
			            url: '${billAPI}',
			            type: 'POST',
			            contentType: 'application/json',
			            data: JSON.stringify(data),
			            dataType: 'json',
			            success: function (result) {
			            	window.location.href = "${bookResult}?id="+result.id+"&message=buy_success";
			            },
			            error: function (error) {
			            	window.location.href = "${bookResult}?id="+result.id+"&message=error_system";
			            }
			        });
				}
			</script>
	</div>
</div>
</body>
</html>
