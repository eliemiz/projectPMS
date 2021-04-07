package pms.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pms.a02_service.A00_TempService;
import pms.z01_vo.Temp;

@Controller
public class A00_TempController {

	@Autowired(required = false)
	private A00_TempService service;

	// http://localhost:7080/projectPMS/temp.do
	@RequestMapping("temp.do")
	public String temp(Model d) {

		ArrayList<Temp> tempList = service.getTempList();
		
		d.addAttribute("tempList", tempList);

		return "a00_common\\temp";
	}
}
