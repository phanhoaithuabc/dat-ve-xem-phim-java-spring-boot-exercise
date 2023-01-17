package com.qnu.dto;

import java.sql.Timestamp;

public class BillDTO extends AbstractDTO<BillDTO>{
	
	private Long idCustomer;
	private Long idSchedule;
	private String seat;
	private Long price;
	private String status;
	
	private String customerName;
	private String filmName;
	private Timestamp timeStart;
	private String cinemaName;
	
	public Long getIdCustomer() {
		return idCustomer;
	}
	public void setIdCustomer(Long idCustomer) {
		this.idCustomer = idCustomer;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getIdSchedule() {
		return idSchedule;
	}
	public void setIdSchedule(Long idSchedule) {
		this.idSchedule = idSchedule;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public Timestamp getTimeStart() {
		return timeStart;
	}
	public void setTimeStart(Timestamp date) {
		this.timeStart = date;
	}
	public String getFilmName() {
		return filmName;
	}
	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}
}
