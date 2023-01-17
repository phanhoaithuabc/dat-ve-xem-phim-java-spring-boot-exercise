package com.qnu.controller.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.qnu.dto.FilmDTO;
import com.qnu.dto.ScheduleDTO;
import com.qnu.service.IFilmService;
import com.qnu.service.IScheduleService;

@Controller(value = "scheduleControllerOfWeb")
public class ScheduleController {

    @Autowired
	private IScheduleService scheduleService;
    @Autowired
    private IFilmService filmService;
    
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public ModelAndView showList(HttpServletRequest request, @RequestParam(value = "date") String date) throws ParseException {
		List<FilmDTO> lsFilm = new ArrayList<>();
		
		ModelAndView mav = new ModelAndView("web/schedules");
		Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		//Tìm lịch chiếu theo ngày được submit
		List<ScheduleDTO> lsSchedule = scheduleService.findAllByDate(date1);
		
		for(ScheduleDTO item : lsSchedule) {
			lsFilm.add(filmService.findById(item.getIdFilm()));
		}
		
		for (int i = 0; i < lsFilm.size(); i++) {
			for (int j = i + 1; j < lsFilm.size(); j++) {
				if (lsFilm.get(i).getId() == lsFilm.get(j).getId()) {
					lsFilm.remove(j);
				}
			}
		}
		
        mav.addObject("lsFilm", lsFilm);
		mav.addObject("lsSchedule", lsSchedule);
		return mav;
	}
}