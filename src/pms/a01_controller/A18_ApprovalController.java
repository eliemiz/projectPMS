package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A12_TaskService;

@Controller
public class A18_ApprovalController {
	@Autowired(required = false)
	private A12_TaskService serviceTask;
	
	@RequestMapping("approval.do")
	public String approvalList() {
		return "a18_approval\\a01_approvalMain";
	}
}
