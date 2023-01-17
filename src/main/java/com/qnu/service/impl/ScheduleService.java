package com.qnu.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qnu.converter.ScheduleConverter;
import com.qnu.dto.ScheduleDTO;
import com.qnu.entity.CinemaEntity;
import com.qnu.entity.FilmEntity;
import com.qnu.entity.ScheduleEntity;
import com.qnu.repository.CinemaRepository;
import com.qnu.repository.FilmRepository;
import com.qnu.repository.ScheduleRepository;
import com.qnu.service.IScheduleService;

@Service
public class ScheduleService implements IScheduleService {

	@Autowired
	private ScheduleRepository scheduleRepository;

	@Autowired
	private ScheduleConverter scheduleConverter;
	
	@Autowired
	private FilmRepository filmRepository;
	
	@Autowired
	private CinemaRepository cinemaRepository;
	
	@Override
	public List<ScheduleDTO> findAll() {
		List<ScheduleDTO> models = new ArrayList<>();
		List<ScheduleEntity> entities = scheduleRepository.findAll();
		for (ScheduleEntity item : entities) {
			ScheduleDTO scheduleDTO = scheduleConverter.toDto(item);
			models.add(scheduleDTO);
		}
		return models;
	}
	
	@Override
	public List<ScheduleDTO> findAllByDate(Date date) {
		List<ScheduleDTO> models = new ArrayList<>();
		List<ScheduleEntity> entities = scheduleRepository.findAll();
		Calendar calendar = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();
		
		for (ScheduleEntity item : entities) {
			
			//Timestamp itemTime = new Timestamp(item.getTimeStart().getTime());
			//Date itemDate = new Date(itemTime.getTime());
			//calendar.setTime(itemDate);
			calendar.setTime(item.getTimeStart());
			calendar2.setTime(date);
			
			if (calendar.get(Calendar.DATE) == calendar2.get(Calendar.DATE) && 
				calendar.get(Calendar.MONTH) == calendar2.get(Calendar.MONTH) &&
				calendar.get(Calendar.YEAR) == calendar2.get(Calendar.YEAR)) {
					ScheduleDTO scheduleDTO = scheduleConverter.toDto(item);
					models.add(scheduleDTO);
			}
		}
		return models;
	}
	
	@Override
	public int getTotalItem() {
		return (int) scheduleRepository.count();
	}
	
	@Override
	public ScheduleDTO findById(long id) {
		ScheduleEntity entity = scheduleRepository.findOne(id);
		return scheduleConverter.toDto(entity);
	}

	@Override
	@Transactional
	public ScheduleDTO save(ScheduleDTO dto) {
		FilmEntity film = filmRepository.findOneById(dto.getIdFilm());
		CinemaEntity cinema = cinemaRepository.findOneById(dto.getIdCinema());
		ScheduleEntity scheduleEntity = new ScheduleEntity();
		if (dto.getId() != null) {
			ScheduleEntity oldSchedule = scheduleRepository.findOne(dto.getId());
			oldSchedule.setFilm(film);
			oldSchedule.setCinema(cinema);
			scheduleEntity = scheduleConverter.toEntity(oldSchedule, dto);
		} else {
			scheduleEntity = scheduleConverter.toEntity(dto);
			scheduleEntity.setFilm(film);
			scheduleEntity.setCinema(cinema);
		}
		return scheduleConverter.toDto(scheduleRepository.save(scheduleEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (long id: ids) {
			scheduleRepository.delete(id);
		}
	}

	@Override
	public List<ScheduleDTO> findAll(Pageable pageable) {
		List<ScheduleDTO> models = new ArrayList<>();
		List<ScheduleEntity> entities = scheduleRepository.findAll(pageable).getContent();
		for (ScheduleEntity item : entities) {
			ScheduleDTO scheduleDTO = scheduleConverter.toDto(item);
			models.add(scheduleDTO);
		}
		return models;
	}
}
