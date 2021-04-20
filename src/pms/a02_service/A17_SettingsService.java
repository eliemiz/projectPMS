package pms.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A01_ProjectDao;
import pms.z01_vo.Project;

@Service
public class A17_SettingsService {

	@Autowired(required = false)
	private A01_ProjectDao dao;
	
	public void projectUpt(Project upt) {
		 dao.projectUpt(upt);
	}
	public void projectDel(int id) {
		dao.deleteTask(id);
		dao.deleteTfile(id);
		dao.deleteRisk(id);
		dao.deleteRfile(id);
		dao.projectDel(id);
	}
}
