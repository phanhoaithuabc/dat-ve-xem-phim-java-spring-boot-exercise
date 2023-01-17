package com.qnu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qnu.converter.CinemaConverter;
import com.qnu.dto.CinemaDTO;
import com.qnu.entity.CinemaEntity;
import com.qnu.repository.CinemaRepository;
import com.qnu.service.ICinemaService;

@Service
public class CinemaService implements ICinemaService{

	@Autowired
	private CinemaRepository cinemaRepository;
	
	@Autowired
	private CinemaConverter cinemaConverter;
	
	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<CinemaEntity> entities = cinemaRepository.findAll();
		for (CinemaEntity item: entities) {
			result.put(item.getId().toString(), item.getName());
		}
		return result;
	}

	@Override
	public List<CinemaDTO> findAll(Pageable pageable) {
		List<CinemaDTO> models = new ArrayList<>();
		List<CinemaEntity> entities = cinemaRepository.findAll(pageable).getContent();
		for (CinemaEntity item : entities) {
			CinemaDTO cinemaDTO = cinemaConverter.toDto(item);
			models.add(cinemaDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) cinemaRepository.count();
	}

	@Override
	public CinemaDTO findById(long id) {
		CinemaEntity entity = cinemaRepository.findOne(id);
		return cinemaConverter.toDto(entity);
	}

	@Override
	@Transactional
	public CinemaDTO save(CinemaDTO dto) {
		CinemaEntity cinemaEntity = new CinemaEntity();
		if (dto.getId() != null) {
			CinemaEntity oldNew = cinemaRepository.findOne(dto.getId());
			cinemaEntity = cinemaConverter.toEntity(oldNew, dto);
		} else {
			cinemaEntity = cinemaConverter.toEntity(dto);
		}
		return cinemaConverter.toDto(cinemaRepository.save(cinemaEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (long id: ids) {
			cinemaRepository.delete(id);
		}
	}

}
