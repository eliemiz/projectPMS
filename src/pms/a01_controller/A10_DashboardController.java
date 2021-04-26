package pms.a01_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A01_ProjectService;
import pms.a02_service.A12_TaskService;
import pms.a02_service.A16_RiskService;
import pms.z01_vo.AccountTask;
import pms.z01_vo.Project;
import pms.z01_vo.ProjectUser;
import pms.z01_vo.Risk;
import pms.z01_vo.TaskResult;
import pms.z02_util.SessionManager;

@Controller
public class A10_DashboardController {

	@Autowired(required = false)
	private A00_AccountService serviceAccount;
	
	@Autowired(required = false) 
	private A01_ProjectService serviceProject;
	
	@Autowired(required = false)
	private A12_TaskService serviceTask;
	
	@Autowired(required = false)
	private A16_RiskService serviceRisk;

	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	// http://localhost:7080/projectPMS/dashboard.do
	@RequestMapping("dashboard.do")
	public String dashboard(HttpServletRequest request, HttpServletResponse response, Model d) {

		/* Set Project Id */
		HttpSession session = request.getSession();
		String projectIdReq = request.getParameter("projectId");
		if (projectIdReq != null) {
			session.setAttribute("projectId", projectIdReq);
		}

		/* Get Project Id */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceProject.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}

		/* Get Model */
		// Project Info
		Project project = serviceProject.getProject(projectId);
		d.addAttribute("project", project);
		
		// Account List
		ArrayList<AccountTask> accountList = serviceAccount.getAccountTaskListForChart(projectId);
		d.addAttribute("accountList", accountList);
		
		int incompleteAll = 0;
		int completeAll = 0;
		for (AccountTask at : accountList) {
			incompleteAll += at.getIncompleted();
			completeAll += at.getCompleted();
			d.addAttribute("incompleteUser", at.getIncompleted());
			d.addAttribute("completeUser", at.getCompleted());
		}
		
		d.addAttribute("incompleteAll", incompleteAll);
		d.addAttribute("completeAll", completeAll);
		
		// TaskResult List
		ArrayList<TaskResult> taskList = serviceTask.getTaskResult(projectId);
		d.addAttribute("taskList", taskList);
		
		// Risk List
		ArrayList<Risk> riskList = serviceRisk.getRecentRiskListByProject(projectId);
		d.addAttribute("riskList", riskList);

		return "a10_dashboard\\dashboard";
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
	
	@GetMapping("jsonLineChartList.do")
	public String jsonLineChartList(HttpServletRequest request, Model d) {
		
		HttpSession session = request.getSession();

		/* Get Project Id */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceProject.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		
		ArrayList<String> labels = new ArrayList<String>();
		ArrayList<Double> data1 = new ArrayList<Double>();
		ArrayList<Double> data2 = new ArrayList<Double>();
		serviceTask.getLineChartList(projectId, labels, data1, data2);

		d.addAttribute("labels", labels);
		d.addAttribute("data1", data1);
		d.addAttribute("data2", data2);
		
		return "pageJsonReport";
	}
	
	// http://localhost:7080/projectPMS/jsonProjectUsers.do
	@GetMapping("jsonProjectUsers.do")
	public String jsonProjectUsers(HttpServletRequest request, Model d) {
		
		HttpSession session = request.getSession();
		
		/* Get Project Id */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceProject.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		
		ArrayList<ProjectUser> userList = serviceAccount.getProjectUsers(projectId);
		d.addAttribute("userList", userList);
		
		return "pageJsonReport";
	}
	
	@GetMapping("updateProjectUsers.do")
	public String updateProjectUsers(HttpServletRequest request, Model d) {

		ObjectMapper mapper = new ObjectMapper();
		String list = request.getParameter("list");
		try {
			ProjectUser[] pus = mapper.readValue(list, ProjectUser[].class);
			
			// 초기화 처리
			int projectId = SessionManager.getProjectId(request); 
			serviceAccount.deleteProjectUsers(projectId);
			
			for (ProjectUser pu : pus) {
				
				// 갱신 처리
				if (pu.isMember()) {
					pu.setProject_id(projectId);
					serviceAccount.insertProjectUser(pu);
					System.out.println(pu);
				}
			}
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("완료");
		
		return "pageJsonReport";
	}
	
	@GetMapping("jsonProjectMembers.do")
	public String jsonProjectMembers(HttpServletRequest request, Model d) {
		
		HttpSession session = request.getSession(); 
		
		/* Get Project Id */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceProject.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		
		/* memberList 로드 */
		ArrayList<AccountTask> memberList = serviceAccount.getAccountTaskList(projectId);
		d.addAttribute("memberList", memberList);
		
		return "pageJsonReport";
	}
}
