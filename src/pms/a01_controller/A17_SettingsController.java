package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a02_service.A01_ProjectService;
import pms.a02_service.A17_SettingsService;
import pms.z01_vo.Project;

@Controller
@RequestMapping("settings.do")
public class A17_SettingsController {

	@Autowired(required = false)
	private A17_SettingsService service;
	@Autowired(required = false)
	private A01_ProjectService pservice;
	
	// http://localhost:7080/projectPMS/settings.do?method=project
	@RequestMapping( params = "method=project")
	public String Project(@ModelAttribute("sch")Project sch, Model d) {
		d.addAttribute("projectList", pservice.projectList(sch));
		return "a17_settings\\a00_project";
	}
	// http://localhost:7080/projectPMS/settings.do?method=detail
	@RequestMapping(params = "method=detail")
	public String detail(@RequestParam("id") int id, Model d) {
		//System.out.println("id:"+id);
		d.addAttribute("project", pservice.getProject(id));
		
		return "a17_settings\\a01_update";
	}
	// http://localhost:7080/projectPMS/settings.do?method=update
	@RequestMapping( params = "method=update")
	public String update() {
		return "";
	}
	
	
}
