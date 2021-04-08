package pms.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A00_AccountService;
import pms.z01_vo.AccountTask;

@Controller
public class A10_DashboardController {

	@Autowired(required=false)
	private A00_AccountService serviceAccount;
	
	// http://localhost:7080/projectPMS/dashboard.do
	@RequestMapping("dashboard.do")
	public String dashboard(Model d) {
		
		ArrayList<AccountTask> accountList = serviceAccount.getAccountTaskList();
		d.addAttribute("accountList", accountList);
		
		return "a10_dashboard\\dashboard";
	}
}
