package com.qnu.controller.admin;

import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.qnu.dto.ScheduleDTO;
import com.qnu.service.ICinemaService;
import com.qnu.service.IFilmService;
import com.qnu.service.IScheduleService;
import com.qnu.util.MessageUtil;

@Controller(value = "scheduleControllerOfAdmin")
public class ScheduleController {

    @Autowired
	private IScheduleService scheduleService;

    @Autowired
    private IFilmService filmService;
    
    @Autowired
    private ICinemaService cinemaService;
    
    @Autowired
	private MessageUtil messageUtil;
    
	@RequestMapping(value = "/admin-schedule-list", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request) throws ParseException {
		ScheduleDTO model = new ScheduleDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/schedule/list");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(scheduleService.findAll(pageable));
		model.setTotalItem(scheduleService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/admin-schedule-edit", method = RequestMethod.GET)
	public ModelAndView editFilm(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) throws ParseException {
		ModelAndView mav = new ModelAndView("admin/schedule/edit");
		ScheduleDTO model = new ScheduleDTO();
		if (id != null) {
			model = scheduleService.findById(id);
		}
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		mav.addObject("film", filmService.findAll());
		mav.addObject("cinema", cinemaService.findAll());
		return mav;
	}
	
}