package pms.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A00_TempService;

@Controller
public class A00_TempController {

	@Autowired(required = false)
	private A00_TempService service;
	
	// http://localhost:7080/projectPMS/temp.do
	@RequestMapping("temp.do")
	public String temp() {
		
		return "a00_common\\temp";
	}
}
