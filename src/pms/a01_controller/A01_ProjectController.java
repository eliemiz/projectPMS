package pms.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A01_ProjectService;
import pms.z01_vo.Project;

@Controller
@RequestMapping("project.do")
public class A01_ProjectController {
	
	@Autowired(required = false)
	private A01_ProjectService service;
	
	// http://localhost:7080/projectPMS/project.do
	@RequestMapping
	public String projects(@ModelAttribute("sch") Project sch, Model d) {
		
		d.addAttribute("projectList", service.getProjectList(sch));
		
		return "a01_project\\a00_projects";
	}
	/*
	// http://localhost:7080/projectPMS/project.do?method=mgtList
	@RequestMapping(params = "method=mgtList")
	public String mgtList() {
		return "a01_project\\a01_mgtList";
	}
	*/
	// http://localhost:7080/projectPMS/project.do?method=list
	@RequestMapping(params = "method=list")
	public String projectList() {
		return "a01_project\\a02_projectList";
	}
	// http://localhost:7080/projectPMS/project.do?method=insert
	@RequestMapping(params = "method=insert")
	public String projectIns() {
		return "a01_project\\a03_projectIns";
	}
	// http://localhost:7080/projectPMS/project.do?method=delete
	@RequestMapping(params = "method=delete")
	public String projectDel() {
		return "a01_project\\a04_projectDel";
	}

	
}
