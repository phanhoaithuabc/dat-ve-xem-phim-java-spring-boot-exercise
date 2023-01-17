package com.qnu.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.qnu.dto.BillDTO;

public interface IBillService {
	List<BillDTO> findAll(Pageable pageable);
	int getTotalItem();
	BillDTO findById(long id);
	BillDTO save(BillDTO dto);
	void delete(long[] ids);
	List<BillDTO> findAllByIdSchedule(Long id);
}
