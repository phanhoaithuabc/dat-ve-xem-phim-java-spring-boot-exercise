package com.qnu.converter;

import com.qnu.dto.FilmDTO;
import com.qnu.entity.FilmEntity;

public class FilmConverter {
	public FilmDTO toDto(FilmEntity entity) {
		FilmDTO result = new FilmDTO();
		result.setId(entity.getId());
		
		return result;
	}
	
	public FilmEntity toEntity(FilmDTO dto) {
		FilmEntity result = new FilmEntity();
		result.setTitle(dto.getTitle());
		
		return result;
	}
	
	public FilmEntity toEntity(FilmEntity result, FilmDTO dto) {
		result.setTitle(dto.getTitle());
		
		return result;
	}
}
