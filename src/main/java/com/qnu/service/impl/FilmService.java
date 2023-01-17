package com.qnu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.qnu.converter.FilmConverter;
import com.qnu.dto.FilmDTO;
import com.qnu.entity.FilmEntity;
import com.qnu.repository.FilmRepository;
import com.qnu.service.IFilmService;

@Service
public class FilmService implements IFilmService {

	@Autowired
	private FilmRepository filmRepository;

	@Autowired
	private FilmConverter filmConverter;
	
	@Override
	public List<FilmDTO> findAll(Pageable pageable) {
		List<FilmDTO> models = new ArrayList<>();
		List<FilmEntity> entities = filmRepository.findAll(pageable).getContent();
		for (FilmEntity item : entities) {
			FilmDTO filmDTO = filmConverter.toDto(item);
			models.add(filmDTO);
		}
		return models;
	}

	@Override
	public List<FilmDTO> findAlll() {
		List<FilmDTO> models = new ArrayList<>();
		List<FilmEntity> entities = filmRepository.findAll();
		for (FilmEntity item : entities) {
			FilmDTO filmDTO = filmConverter.toDto(item);
			models.add(filmDTO);
		}
		return models;
	}
	
	@Override
	public Integer getTotalItem() {
		return (int) filmRepository.count();
	}
	
	@Override
	public FilmDTO findById(long id) {
		FilmEntity entity = filmRepository.findOne(id);
		return filmConverter.toDto(entity);
	}

	@Override
	@Transactional
	public FilmDTO save(FilmDTO dto) {
		FilmEntity filmEntity = new FilmEntity();
		if (dto.getId() != null) {
			FilmEntity oldNew = filmRepository.findOne(dto.getId());
			filmEntity = filmConverter.toEntity(oldNew, dto);
		} else {
			filmEntity = filmConverter.toEntity(dto);
		}
		return filmConverter.toDto(filmRepository.save(filmEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (long id: ids) {
			filmRepository.delete(id);
		}
	}

	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<FilmEntity> entities = filmRepository.findAll();
		for (FilmEntity item: entities) {
			result.put(item.getId().toString(), item.getTitle());
		}
		return result;
	}
}
