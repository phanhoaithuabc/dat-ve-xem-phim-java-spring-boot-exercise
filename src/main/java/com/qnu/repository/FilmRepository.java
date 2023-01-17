package com.qnu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.qnu.entity.FilmEntity;

public interface FilmRepository extends JpaRepository<FilmEntity, Long>{
	FilmEntity findOneById(Long id);
}