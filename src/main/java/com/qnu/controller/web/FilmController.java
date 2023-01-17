package com.qnu.controller.web;

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

@Controller(value = "filmControllerOfWeb")
public class FilmController {

    @Autowired
	private IFilmService filmService;
    
	@RequestMapping(value = "/list-film", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request) {
		FilmDTO model = new FilmDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("web/list-film");
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(filmService.findAll(pageable));
		model.setTotalItem(filmService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/film-detail", method = RequestMethod.GET)
	public ModelAndView showFilmDetail(@RequestParam("id") int id, HttpServletRequest request) {
		FilmDTO model = filmService.findById(id);
		ModelAndView mav = new ModelAndView("web/film-detail");
		mav.addObject("model", model);
		return mav;
	}
}