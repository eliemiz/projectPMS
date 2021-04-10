package pms.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a02_service.A00_AccountService;
import pms.a02_service.A16_RiskService;
import pms.z01_vo.Account;
import pms.z01_vo.Risk;

@Controller
@RequestMapping("risk.do")
public class A16_RiskController {
	@Autowired(required = false)
	private A16_RiskService service;
	@Autowired(required = false)
	private A00_AccountService service2;
	
	// http://localhost:6080/projectPMS/risk.do?method=list
	// http://localhost:7080/projectPMS/risk.do?method=list
	@RequestMapping(params="method=list")
	public String RiskList(@ModelAttribute("sch") Risk sch, Model d) {
		d.addAttribute("riskList", service.getRiskList(sch));
		return "a16_risk\\a01_risk";
	}
	
	// http://localhost:6080/projectPMS/risk.do?method=detail
	// http://localhost:7080/projectPMS/risk.do?method=detail
	@RequestMapping(params="method=detail")
	public String RiskDetail(@RequestParam("id") int id, Model d) {
		System.out.println("id 확인:"+id);
		d.addAttribute("risk", service.getRisk(id));
		
		return "a16_risk\\a01_riskDetail";
	}
	// http://localhost:6080/projectPMS/risk.do?method=insForm
	// http://localhost:7080/projectPMS/risk.do?method=insForm
	@RequestMapping(params = "method=insForm")
	public String insForm(@ModelAttribute("risk") Risk risk) {
		return "a16_risk\\a01_riskInsert";
	}
	
	// http://localhost:6080/projectPMS/risk.do?method=insert
	// http://localhost:7080/projectPMS/risk.do?method=insert
	@RequestMapping(params="method=insert")
	public String insertRisk(Risk ins, Model d) {
		System.out.println("등록:" + ins.getSubject());
		System.out.println("등록:" + ins.getAccount_id());
		System.out.println("등록:" + ins.getId());
		System.out.println("등록:" + ins.getDescription());
		System.out.println("등록:" + ins.getStatus());
		System.out.println("등록:" + ins.getCategory());
		System.out.println("등록:" + ins.getCreated_on());
		System.out.println("등록:" + ins.getUpdated_on());
		System.out.println("등록:" + ins.getStart_date());
		System.out.println("등록:" + ins.getEnd_date());
		System.out.println("등록:" + ins.getProbability());
		System.out.println("등록:" + ins.getProbability());
		System.out.println("등록:" + ins.getImpact());
		System.out.println("등록:" + ins.getStrategy());
		System.out.println("등록:" + ins.getTreatment());
		service.insertRisk(ins);
		d.addAttribute("proc", "ins");
		return "a16_risk\\a01_riskInsert";
	}
	
	// http://localhost:6080/projectPMS/risk.do?method=update
	// http://localhost:7080/projectPMS/risk.do?method=update
	@GetMapping(params="method=update")
	public String RiskUpdate() {
		return "a16_risk\\a01_riskUpdate";			
	}
	
	@ModelAttribute("accounts")
	public ArrayList<Account> getAccountList(){
		return service2.getAccountList();
	}
}
