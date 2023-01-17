package com.qnu.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.qnu.dto.FilmDTO;

public interface IFilmService {
	FilmDTO findById(long id);
	FilmDTO save(FilmDTO dto);
	List<FilmDTO> findAll(Pageable pageable);
	Integer getTotalItem();
	List<FilmDTO> findAlll();
	void delete(long[] ids);
	Map<String, String> findAll();
}
