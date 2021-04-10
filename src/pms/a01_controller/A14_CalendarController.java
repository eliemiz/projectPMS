package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A12_TaskService;

@Controller
@RequestMapping("calendar.do")
public class A14_CalendarController {
	@Autowired(required = false)
	private A12_TaskService service;
	
	// http://localhost:7080/projectPMS/calendar.do?method=list
	@GetMapping(params = "method=list")
	public String CalendarList() {
		return "a14_calendar\\a00_calendar";
	}
	
	// http://localhost:7080/projectPMS/calendar.do?method=data
	@GetMapping(params = "method=data")
	public String data(Model d) {
		d.addAttribute("list", service.calenList());
		return "pageJsonReport";
	}
}
