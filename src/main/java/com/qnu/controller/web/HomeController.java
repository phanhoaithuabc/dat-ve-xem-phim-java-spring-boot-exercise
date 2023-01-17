package com.qnu.controller.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.qnu.dto.UserDTO;
import com.qnu.util.MessageUtil;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private MessageUtil messageUtil;
	
   @RequestMapping(value = "/home", method = RequestMethod.GET)
   public ModelAndView homePage() {
      ModelAndView mav = new ModelAndView("web/home");
      return mav;
   }
   
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public ModelAndView loginPage() {
      ModelAndView mav = new ModelAndView("login");
      return mav;
   }
   
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/home");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}
	
	@RequestMapping(value = "/registry", method = RequestMethod.GET)
	public ModelAndView registry(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("registry");
		UserDTO model = new UserDTO();
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public ModelAndView forgotpasswordPage() {
	    ModelAndView mav = new ModelAndView("forgotpassword");
	    return mav;
	}
}