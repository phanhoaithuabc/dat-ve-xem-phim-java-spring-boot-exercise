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

import com.qnu.dto.BillDTO;
import com.qnu.service.IBillService;
import com.qnu.util.MessageUtil;

@Controller(value = "billControllerOfAdmin")
public class BillController {

	@Autowired
	private IBillService billService;
	
	@Autowired
	private MessageUtil messageUtil;
	
	@RequestMapping(value = "/admin-bill-list", method = RequestMethod.GET)
	public ModelAndView bookingTicket(HttpServletRequest request, 
			@RequestParam("page") int page, @RequestParam("limit") int limit) {
		
		ModelAndView mav = new ModelAndView("admin/bill/list");
		BillDTO model = new BillDTO();
		model.setPage(page);
		model.setLimit(limit);
		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(billService.findAll(pageable));
		model.setTotalItem(billService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/admin-bill-edit", method = RequestMethod.GET)
	public ModelAndView editBill(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("admin/bill/edit");
		BillDTO model = new BillDTO();
		if (id != null) {
			model = billService.findById(id);
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