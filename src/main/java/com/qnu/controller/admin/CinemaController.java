package com.qnu.controller.admin;

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

import com.qnu.dto.CinemaDTO;
import com.qnu.service.ICinemaService;
import com.qnu.util.MessageUtil;

@Controller(value = "cinemaControllerOfAdmin")
public class CinemaController {

    @Autowired
	private ICinemaService cinemaService;

    @Autowired
	private MessageUtil messageUtil;
    
	@RequestMapping(value = "/admin-cinema-list", method = RequestMethod.GET)
	public ModelAndView showListCinema(@RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request) {
		CinemaDTO model = new CinemaDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/cinema/list");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(cinemaService.findAll(pageable));
		model.setTotalItem(cinemaService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/admin-cinema-edit", method = RequestMethod.GET)
	public ModelAndView editCinema(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("admin/cinema/edit");
		CinemaDTO model = new CinemaDTO();
		if (id != null) {
			model = cinemaService.findById(id);
		}
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
}