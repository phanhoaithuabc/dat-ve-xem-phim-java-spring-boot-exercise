package com.qnu.controller.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.qnu.dto.BillDTO;
import com.qnu.dto.FilmDTO;
import com.qnu.dto.ScheduleDTO;
import com.qnu.service.IBillService;
import com.qnu.service.IFilmService;
import com.qnu.service.IScheduleService;
import com.qnu.service.IUserService;
import com.qnu.util.MessageUtil;

@Controller(value = "billControllerOfWeb")
public class BillController {

	@Autowired
	private IFilmService filmService;
	
	@Autowired 
	private IScheduleService scheduleService;
	
	@Autowired
	private IBillService billService;
	
	@Autowired
	private MessageUtil messageUtil;
	
	@Autowired
	private IUserService userService;
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/bill", method = RequestMethod.GET)
	public ModelAndView bookingTicket(HttpServletRequest request, @RequestParam(value = "id", required = false) Long id) {
		
		List<String> seats = new ArrayList<>();
		//String seats = "";
		ModelAndView mav = new ModelAndView("web/book");
		
		//Tìm suất chiếu theo id để lấy phim và giờ bắt đầu
		ScheduleDTO scheduleDTO = scheduleService.findById(id);  
		
		//Tìm phim sau khi đã tìm ra suất chiếu đó
		FilmDTO filmDTO = filmService.findById(scheduleDTO.getIdFilm());
		
		//Tìm tất cả các bill có trong suất chiếu có id là id để load lên ghế ngồi
		List<BillDTO> bills = billService.findAllByIdSchedule(id);
		for (int i = 0; i < bills.size(); i++) {
			
			if (!bills.get(i).getSeat().toString().equals("")) {
				String s = "";
				// kiểm tra trong 1 hóa đơn có nhiều ghế hay không,
				// mỗi ghế cách nhau bằng dấu ","
				if (bills.get(i).getSeat().toString().contains(",")) {
					Long price = bills.get(i).getPrice();
					for (int j = 0; j < price/55000; j++) {
						s = "\'" + bills.get(i).getSeat().toString().split(",")[j] + "\'";
						seats.add(s);
					}
				} else {
					s = "\'" + bills.get(i).getSeat().toString() + "\'";
					seats.add(s);
				}
			}
			
		}
		//gửi message
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		
		String userName = com.qnu.util.SecurityUtils.getPrincipal().getUsername();
		Long idDTO = userService.findUserByUserName(userName);
		
		//Gửi dữ liệu về client
		mav.addObject("id", idDTO);
		mav.addObject("seats", seats);
		mav.addObject("bills", bills);
		mav.addObject("filmDTO", filmDTO);
		mav.addObject("scheduleDTO", scheduleDTO);
		return mav;
	}
	
	@RequestMapping(value = "/bill-result", method = RequestMethod.GET)
	public ModelAndView bookingResult(HttpServletRequest request, @RequestParam(value = "id") Long id) {
		
		ModelAndView mav = new ModelAndView("web/book-result");
		
		BillDTO bill = billService.findById(id);
		String customerName = userService.findById(bill.getIdCustomer()).getFullName();
		//gửi message
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		
		//Gửi dữ liệu về client
		mav.addObject("customerName", customerName);
		mav.addObject("bill", bill);
		return mav;
	}
}