package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A16_RiskService;

@Controller
@RequestMapping("risk.do")
public class A16_RiskController {
	@Autowired(required = false)
	private A16_RiskService service;
	
	// http://localhost:6080/projectPMS/risk.do?method=list
	// http://localhost:7080/projectPMS/risk.do?method=list
	@GetMapping(params="method=list")
	public String RiskList() {
		return "a16_risk\\a01_risk";
		
	}
}
