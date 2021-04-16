package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A01_ProjectService;
import pms.a02_service.A99_CommonService;
import pms.z01_vo.Project;
import pms.z01_vo.Temp;

@Controller
public class A99_CommonController {

	@Autowired(required = false)
	private A99_CommonService serviceCommon;

	@Autowired(required = false)
	private A01_ProjectService serviceProject;

	// http://localhost:7080/projectPMS/temp.do
	@RequestMapping("temp.do")
	public String temp(Model d) {

		ArrayList<Temp> tempList = serviceCommon.getTempList();
		
		d.addAttribute("tempList", tempList);

		return "a00_common\\temp";
	}
	
	@GetMapping("jsonProject.do")
	public String jsonProject(HttpServletRequest request, Model d) {
		
		ArrayList<Project> projectList = serviceProject.getProjectList();
		
		d.addAttribute("projectList", projectList);
		
		HttpSession session = request.getSession();
		Object project_id_s = session.getAttribute("projectId");
		int project_id;
		if (project_id_s == null) {
			project_id = projectList.get(0).getId();
		} else {
			project_id = Integer.parseInt(project_id_s.toString());
		}
		
		d.addAttribute("projectId", project_id);
		
		return "pageJsonReport";
	}
	
	@RequestMapping("chatting.do")
	public String chatting() {
		
		return "a00_common\\a03_chatting";
	}
}
