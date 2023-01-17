package com.qnu.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.qnu.dto.CinemaDTO;

public interface ICinemaService {
	Map<String, String> findAll();
	List<CinemaDTO> findAll(Pageable pageable);
	int getTotalItem();
	CinemaDTO findById(long id);
	CinemaDTO save(CinemaDTO dto);
	void delete(long[] ids);
}
