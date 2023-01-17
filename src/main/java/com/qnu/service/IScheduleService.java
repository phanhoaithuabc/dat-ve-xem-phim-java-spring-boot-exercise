package com.qnu.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;

import com.qnu.dto.ScheduleDTO;

public interface IScheduleService {
	List<ScheduleDTO> findAll();
	List<ScheduleDTO> findAll(Pageable pageable);
	int getTotalItem();
	ScheduleDTO findById(long id);
	ScheduleDTO save(ScheduleDTO dto);
	void delete(long[] ids);
	List<ScheduleDTO> findAllByDate(Date time);
}
