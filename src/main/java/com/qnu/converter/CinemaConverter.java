package com.qnu.converter;

import org.springframework.stereotype.Component;

import com.qnu.dto.CinemaDTO;
import com.qnu.entity.CinemaEntity;

@Component
public class CinemaConverter {

	public CinemaDTO toDto(CinemaEntity entity) {
		CinemaDTO result = new CinemaDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setDescription(entity.getDescription());
		result.setTotalSeats(entity.getTotalSeats());
		result.setTypeOfCinema(entity.getTypeOfCinema());
		return result;
	}
	
	public CinemaEntity toEntity(CinemaDTO dto) {
		CinemaEntity result = new CinemaEntity();
		result.setName(dto.getName());
		result.setDescription(dto.getDescription());
		result.setTotalSeats(dto.getTotalSeats());
		result.setTypeOfCinema(dto.getTypeOfCinema());
		return result;
	}
	
	public CinemaEntity toEntity(CinemaEntity result, CinemaDTO dto) {
		result.setName(dto.getName());
		result.setDescription(dto.getDescription());
		result.setTotalSeats(dto.getTotalSeats());
		result.setTypeOfCinema(dto.getTypeOfCinema());
		return result;
	}
}
