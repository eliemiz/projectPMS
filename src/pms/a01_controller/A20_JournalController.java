package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A20_JournalService;
import pms.z01_vo.Task;

@Controller
@RequestMapping("journal.do")
public class A20_JournalController {
	@Autowired(required = false)
	private A20_JournalService service;
	
	/*
	@RequestMapping(params = "method=list")
	public String journalList(@ModelAttribute("task") Task task, Model d) {
		System.out.println("id: "+task.getId());
		d.addAttribute("journal", service.journalList(task.getId()));
		
		return "a12_task\\a06_taskJournal";
	}
	*/
	// localhost:7080/
	@RequestMapping(params = "method=list")
	public String journalList(@ModelAttribute("task") Task task, Model d) {
		System.out.println("Journal get id: "+task.getId());
		d.addAttribute("journal", service.getJournalList(task.getId()));
		
		return "a12_task\\a06_taskJournal";
	}
	
}
