package com.qnu.api;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.qnu.dto.ScheduleDTO;
import com.qnu.service.IScheduleService;

@RestController(value = "scheduleAPIOfAdmin")
public class ScheduleAPI {
	
	@Autowired
	private IScheduleService scheduleService;
	
	@PostMapping("/api-schedule")
	public ScheduleDTO createSchedule(@RequestBody ScheduleDTO scheduleDTO) {
		
		Date time = scheduleDTO.getTimeStart();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		calendar.add(Calendar.HOUR, -7);
		time = calendar.getTime();
		Timestamp ts = new Timestamp(time.getTime());
		
		scheduleDTO.setTimeStart(ts);
		return scheduleService.save(scheduleDTO);
	}
	
	@PutMapping("/api-schedule")
	public ScheduleDTO updateSchedule(@RequestBody ScheduleDTO updateSchedule) {
		
		Date time = updateSchedule.getTimeStart();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(time);
		calendar.add(Calendar.HOUR, -7);
		time = calendar.getTime();
		Timestamp ts = new Timestamp(time.getTime());

		updateSchedule.setTimeStart(ts);
		return scheduleService.save(updateSchedule);
	}
	
	@DeleteMapping("/api-schedule")
	public void deleteSchedule(@RequestBody long[] ids) {
		scheduleService.delete(ids);
	}
}
