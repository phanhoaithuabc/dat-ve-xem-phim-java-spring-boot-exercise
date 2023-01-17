package com.qnu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qnu.entity.ScheduleEntity;

public interface ScheduleRepository extends JpaRepository<ScheduleEntity, Long>{

	ScheduleEntity findOneById(Long idSchedule);
}
