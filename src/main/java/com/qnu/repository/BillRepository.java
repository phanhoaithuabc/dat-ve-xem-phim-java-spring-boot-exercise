package com.qnu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qnu.entity.BillEntity;

public interface BillRepository extends JpaRepository<BillEntity, Long>{

}
