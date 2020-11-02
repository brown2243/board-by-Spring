//jsp 최초 진입점

package com.lanhan20.bms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	// http://localhost:8089/
	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home() {
		return "home"; // home.jsp 표시
	}
}
