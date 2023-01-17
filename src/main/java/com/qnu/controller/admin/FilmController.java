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

import com.qnu.dto.FilmDTO;
import com.qnu.service.IFilmService;
import com.qnu.util.MessageUtil;

@Controller(value = "filmControllerOfAdmin")
public class FilmController {

    @Autowired
	private IFilmService filmService;

    @Autowired
	private MessageUtil messageUtil;
    
	@RequestMapping(value = "/admin-film-list", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request) {
		FilmDTO model = new FilmDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/film/list");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(filmService.findAll(pageable));
		model.setTotalItem(filmService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/admin-film-edit", method = RequestMethod.GET)
	public ModelAndView editFilm(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		
		
		ModelAndView mav = new ModelAndView("admin/film/edit");
		FilmDTO model = new FilmDTO();
		if (id != null) {
			model = filmService.findById(id);
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