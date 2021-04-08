package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A17_SettingsService;

@Controller
@RequestMapping("settings.do")
public class A17_SettingsController {

	@Autowired(required = false)
	private A17_SettingsService service;
	
	// http://localhost:7080/projectPMS/settings.do?method=project
	@RequestMapping( params = "method=project")
	public String Project() {
		return "a17_settings\\a00_project";
	}
	// http://localhost:7080/projectPMS/settings.do?method=update
	@RequestMapping( params = "method=update")
	public String update() {
		return "a17_settings\\a01_update";
	}
	
	
}
