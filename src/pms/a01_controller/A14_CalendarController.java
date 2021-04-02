package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A14_CalendarService;

@Controller
@RequestMapping("calendar.do")
public class A14_CalendarController {
	@Autowired(required = false)
	private A14_CalendarService service;
	
	// http://localhost:7080/projectPMS/calendar.do?method=list
	@GetMapping(params = "method=list")
	public String CalendarList() {
		return "a14_calendar\\a00_calendar";
	}
}
