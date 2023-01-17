package com.qnu.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "cinema")
public class CinemaEntity extends BaseEntity{
	
	@Column(name = "name")
	private String name;

	@Column(name = "total_seats")
	private Long totalSeats;
	
	@Column(name = "type_of_cinema")
	private String typeOfCinema;
	
	@Column(name = "description", columnDefinition = "TEXT")
	private String description;
	
	@OneToMany(mappedBy = "cinema")
	private List<ScheduleEntity> schedules = new ArrayList<>();
	
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

	public List<ScheduleEntity> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<ScheduleEntity> schedules) {
		this.schedules = schedules;
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
