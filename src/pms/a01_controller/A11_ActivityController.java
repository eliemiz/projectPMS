package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A11_ActivityService;


@Controller
public class A11_ActivityController {

	@Autowired(required = false)
	private A11_ActivityService service;
	
	// http://localhost:7080/projectPMS/activity.do
	@RequestMapping("activity.do")
	public String Activity() {
		
		return "a11_activity\\activity";
	}
}
