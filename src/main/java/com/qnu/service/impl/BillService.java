package com.qnu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qnu.converter.BillConverter;
import com.qnu.dto.BillDTO;
import com.qnu.entity.BillEntity;
import com.qnu.entity.ScheduleEntity;
import com.qnu.entity.UserEntity;
import com.qnu.repository.BillRepository;
import com.qnu.repository.ScheduleRepository;
import com.qnu.repository.UserRepository;
import com.qnu.service.IBillService;

@Service
public class BillService implements IBillService {

	@Autowired
	private BillRepository billRepository;

	@Autowired
	private BillConverter billConverter;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ScheduleRepository scheduleRepository;
	
	@Override
	public int getTotalItem() {
		return (int) billRepository.count();
	}
	
	@Override
	public BillDTO findById(long id) {
		BillEntity entity = billRepository.findOne(id);
		return billConverter.toDto(entity);
	}

	@Override
	@Transactional
	public BillDTO save(BillDTO dto) {
		UserEntity user = userRepository.findOneById(dto.getIdCustomer());
		ScheduleEntity schedule = scheduleRepository.findOneById(dto.getIdSchedule());
		BillEntity billEntity = new BillEntity();
		if (dto.getId() != null) {
			BillEntity oldBill = billRepository.findOne(dto.getId());
			oldBill.setUser(user);
			oldBill.setSchedules(schedule);
			billEntity = billConverter.toEntity(oldBill, dto);
		} else {
			billEntity = billConverter.toEntity(dto);
			billEntity.setUser(user);
			billEntity.setSchedules(schedule);
		}
		return billConverter.toDto(billRepository.save(billEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (long id: ids) {
			billRepository.delete(id);
		}
	}

	@Override
	public List<BillDTO> findAll(Pageable pageable) {
		List<BillDTO> models = new ArrayList<>();
		List<BillEntity> entities = billRepository.findAll(pageable).getContent();
		for (BillEntity item : entities) {
			BillDTO billDTO = billConverter.toDto(item);
			models.add(billDTO);
		}
		return models;
	}

	@Override
	public List<BillDTO> findAllByIdSchedule(Long id) {
		List<BillDTO> models = new ArrayList<>();
		List<BillEntity> billEntities = billRepository.findAll();
		for(BillEntity item : billEntities) {
			if (item.getSchedules().getId() == id) {
				models.add(billConverter.toDto(item));
			}
		}
		return models;
	}
	
}
