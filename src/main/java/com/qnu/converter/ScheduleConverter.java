package com.qnu.converter;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.qnu.dto.ScheduleDTO;
import com.qnu.entity.ScheduleEntity;

@Component
public class ScheduleConverter {

	public ScheduleDTO toDto(ScheduleEntity entity) {
		ScheduleDTO result = new ScheduleDTO();
		result.setId(entity.getId());
		result.setIdFilm(entity.getFilm().getId());
		result.setIdCinema(entity.getCinema().getId());
		result.setTimeStart((Timestamp)entity.getTimeStart());
		result.setFilmName(entity.getFilm().getTitle());
		result.setCinemaName(entity.getCinema().getName());
		return result;
	}
	
	public ScheduleEntity toEntity(ScheduleDTO dto) {
		ScheduleEntity result = new ScheduleEntity();
		
		result.setTimeStart(dto.getTimeStart());
		return result;
	}
	
	public ScheduleEntity toEntity(ScheduleEntity result, ScheduleDTO dto) {
		result.setTimeStart(dto.getTimeStart());
		return result;
	}
}
