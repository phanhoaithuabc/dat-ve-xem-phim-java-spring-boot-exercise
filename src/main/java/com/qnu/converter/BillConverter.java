package com.qnu.converter;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.qnu.dto.BillDTO;
import com.qnu.entity.BillEntity;
import com.qnu.repository.UserRepository;

@Component
public class BillConverter {

	@Autowired
	private UserRepository userRepository;
	
	public BillDTO toDto(BillEntity entity) {
		BillDTO result = new BillDTO();
		result.setId(entity.getId());
		result.setIdCustomer(entity.getUser().getId());
		result.setIdSchedule(entity.getSchedules().getId());
		result.setSeat(entity.getSeat());
		result.setPrice(entity.getPrice());
		result.setStatus(entity.getStatus());
		result.setFilmName(entity.getSchedules().getFilm().getTitle());
		result.setCinemaName(entity.getSchedules().getCinema().getName());
		result.setTimeStart((Timestamp) entity.getSchedules().getTimeStart());
		result.setCustomerName(userRepository.findOneById(entity.getUser().getId()).getFullName());
		return result;
	}
	
	public BillEntity toEntity(BillDTO dto) {
		BillEntity result = new BillEntity();
		result.setSeat(dto.getSeat());
		result.setPrice(dto.getPrice());
		result.setStatus(dto.getStatus());
		return result;
	}
	
	public BillEntity toEntity(BillEntity result, BillDTO dto) {
		result.setSeat(dto.getSeat());
		result.setPrice(dto.getPrice());
		result.setStatus(dto.getStatus());
		return result;
	}
}
