package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A01_ProjectService;

@Controller
@RequestMapping("project.do")
public class A01_ProjectController {
	@Autowired(required = false)
	private A01_ProjectService service;
	
	// http://localhost:7080/projectPMS/project.do?method=list
	@GetMapping(params = "method=list")
	public String ProjectList() {
		return "a01_project\\a00_project list";
	}
}
