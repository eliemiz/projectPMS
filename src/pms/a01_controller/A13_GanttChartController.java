package pms.a01_controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

import pms.a02_service.A01_ProjectService;
import pms.a02_service.A12_TaskService;
import pms.z01_vo.Account;
import pms.z01_vo.GanttChart;
import pms.z01_vo.GanttSearch;
import pms.z01_vo.Project;
import pms.z01_vo.Task;
import pms.z02_util.SessionManager;
import pms.z02_util.TimeManager;

@Controller
@RequestMapping("gantt.do")
public class A13_GanttChartController {
	@Autowired(required = false)
	private A12_TaskService service;
	@Autowired(required = false) 
	private A01_ProjectService serviceProject;
	@Autowired(required = false)
	private LocaleResolver localeResolver;
	
	// http://localhost:7080/projectPMS/gantt.do?method=list
	@RequestMapping(params = "method=list")
	public String test(HttpServletRequest request, HttpServletResponse response) {
		
		/* Set Locale */
		if (request.getParameter("lang") != null) {
			SessionManager.setLang(request, response, localeResolver);
		}
		
		return "a13_ganttChart\\a01_gantt";
	}
	
	// http://localhost:7080/projectPMS/gantt.do?method=data
	@GetMapping(params = "method=data")
	public String data(HttpServletRequest request, HttpServletResponse response, Model d) {		
		/* Set Project Id : request에서 projectId가 넘어왔다면 자동으로 세선에 저장해준다. */
		HttpSession session = request.getSession();
		String projectIdReq = request.getParameter("projectId");
		if (projectIdReq != null) {
			session.setAttribute("projectId", projectIdReq);
		}

		/* Get Project Id : 세션에 값이 없다면, 즉 페이지 진입, 검색 등에 프로젝트 선택한 적이 없을 때 */
		Object projectIdObj = session.getAttribute("projectId");
		int projectId;
		if (projectIdObj == null) {
			ArrayList<Project> projectList = serviceProject.getProjectList();
			projectId = projectList.get(0).getId();
			session.setAttribute("projectId", projectId);
		} else {
			projectId = Integer.parseInt(projectIdObj.toString());
		}
		
		/* 다른 검색값 가져오기 */
		String taskName = request.getParameter("taskName");
		if (taskName == null || taskName.trim().equals("")) {
			taskName = "";
		}
		String status = request.getParameter("status");
		if(status == null || status.trim().equals("")) {
			status = "";
		}
		String name = request.getParameter("name");
		if(name == null || name.trim().equals("")) {
			name = "";
		}
		System.out.println(projectId + ", " + taskName + ", " + status + ", " + name);
		
		/* Get Model */
		// Project Info
		Project project = serviceProject.getProject(projectId);
		d.addAttribute("project", project);
		
		GanttSearch gs = new GanttSearch(projectId, taskName, status, name);
		d.addAttribute("list", service.ganttSch(gs));
		return "pageJsonReport";
	}
	
	@PostMapping(params = "method=update")
	public String update(GanttChart gantt, Model d) {		
		
		// 업무 정보 가져오기
		Task task = service.getTask(gantt.getId());
		
		// 날짜 수정하기
		task.setStart_date(TimeManager.getInstance().isoPlusDay(gantt.getStart_date()));
		task.setDue_date(TimeManager.getInstance().isoPlusDay(gantt.getStart_date(), gantt.getDuration()));
		task.setDone_ratio((int)Math.round(gantt.getProgress() * 100));
		
		// DB 갱신하기
		service.updateTask(task);
		
		// 결과 반환하기
		d.addAttribute("success", "Y");
		
		return "pageJsonReport";
	}
	
	@PostMapping(params = "method=check")
	public String check(HttpServletRequest request, GanttChart gantt, Model d) {		
		
		// 업무 정보 가져오기
		Task task = service.getTask(gantt.getId());
		
		// 유효성 체크 및 결과 반환
		// 1. 이미 완료
		if (task.getStatus().equals("완료")) {
			d.addAttribute("result", "alreadyFinished");
			return "pageJsonReport";
		} 
		
		Account account = SessionManager.getAccount(request);
		// 2. 로그인되어있지 않음
		if (account == null) {
			d.addAttribute("result", "notLogined");
			return "pageJsonReport";
		} 
		
		// 3. PM은 가능
		if (account.getAuth().equals("Manager")) {
			d.addAttribute("result", "success");
			return "pageJsonReport";
		}
		
		// 4. 담당자 체크
		if (account.getId() == task.getAccount_id()) {
			d.addAttribute("result", "success");
		} else {
			d.addAttribute("result", "notAuthor");
		}
		
		return "pageJsonReport";
	}
}
