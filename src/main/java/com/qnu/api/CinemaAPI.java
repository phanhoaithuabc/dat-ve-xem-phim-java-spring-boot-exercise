package com.qnu.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.qnu.dto.CinemaDTO;
import com.qnu.service.ICinemaService;

@RestController(value = "cinemaAPIOfAdmin")
public class CinemaAPI {
	
	@Autowired
	private ICinemaService cinemaService;
	
	@PostMapping("/api-cinema")
	public CinemaDTO createSchedule(@RequestBody CinemaDTO cinemaDTO) {
		return cinemaService.save(cinemaDTO);
	}
	
	@PutMapping("/api-cinema")
	public CinemaDTO updateSchedule(@RequestBody CinemaDTO updateCinema) {
		return cinemaService.save(updateCinema);
	}
	
	@DeleteMapping("/api-cinema")
	public void deleteCinema(@RequestBody long[] ids) {
		cinemaService.delete(ids);
	}
}
