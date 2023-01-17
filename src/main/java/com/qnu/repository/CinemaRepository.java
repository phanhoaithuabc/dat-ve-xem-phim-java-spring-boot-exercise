package com.qnu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qnu.entity.CinemaEntity;

public interface CinemaRepository extends JpaRepository<CinemaEntity, Long>{

	CinemaEntity findOneById(Long idCinema);

}
