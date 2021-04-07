package pms.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a02_service.A01_ProjectService;
import pms.z01_vo.Project;

@Controller
@RequestMapping("project.do")
public class A01_ProjectController {
	
	@Autowired(required = false)
	private A01_ProjectService service;
	
	// http://localhost:7080/projectPMS/project.do
	@GetMapping
	public String projects(Model d) {
		ArrayList<Project> projectList = service.getProjectList();
		d.addAttribute("projectList", projectList);
		
		return "a01_project\\a00_projects";
	}

	// http://localhost:7080/projectPMS/project.do?method=insert
	@RequestMapping(params = "method=insert")
	public String projectIns(Project insert, Model d) {
		service.projectIns(insert);
		
		d.addAttribute("proc", "insert");
		
		return "a01_project\\a03_projectIns";
	}
	// http://localhost:7080/projectPMS/project.do?method=delete
	@RequestMapping(params = "method=delete")
	public String projectDel(@RequestParam("id") int id) {
		service.projectDel(id);
		return "a01_project\\a04_projectDel";
	}

	
}
