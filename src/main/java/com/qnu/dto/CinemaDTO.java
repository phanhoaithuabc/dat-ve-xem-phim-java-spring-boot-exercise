package com.qnu.dto;

public class CinemaDTO extends AbstractDTO<CinemaDTO>{
	private String name;
	private String description;
	private Long totalSeats;
	private String typeOfCinema;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Long getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(Long totalSeats) {
		this.totalSeats = totalSeats;
	}

	public String getTypeOfCinema() {
		return typeOfCinema;
	}

	public void setTypeOfCinema(String typeOfCinema) {
		this.typeOfCinema = typeOfCinema;
	}
}
