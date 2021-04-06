package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A10_DashboardController {

//	@Autowired(required=false)
//	private A00_TempService service
	
	// http://localhost:7080/projectPMS/dashboard.do
	// http://localhost:6080/projectPMS/dashboard.do
	@RequestMapping("dashboard.do")
	public String dashboard() {
		
		return "a10_dashboard\\dashboard";
	}
}
