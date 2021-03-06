package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A00_AccountDao;
import pms.z01_vo.Account;
import pms.z01_vo.AccountTask;
import pms.z01_vo.ProjectUser;

@Service
public class A00_AccountService {
	
	@Autowired(required = false)
	private A00_AccountDao dao;

	public ArrayList<Account> getAccountList() {
		return dao.getAccountList();
	}

	public Account Login(Account log) {

		return dao.Login(log);
	}

	
	public void signinIns(Account insert) {
		
		dao.signinIns(insert);
	}
	public void find_pw(Account find) {
		
		dao.find_pw(find);
	}
	public void update_pw(Account upt) {
		
		dao.update_pw(upt);
	}
	public void update_info(Account upt) {
		dao.update_info(upt);
	}
	
	public Account getAccount(int accountId) {
		
		return dao.getAccount(accountId);
	}
	
	public void loginDate(Account log) {
		dao.loginDate(log);
	}
	/*
	 	public int schMember(String user_id) {
		return dao.schMember(user_id);
	}
	
	 */
	public int schMember(String mail) {
		return dao.schMember(mail);
	}

	/*
	public ArrayList<Task> getTask(int id) {
		
		return dao.getTask(id);
	} 
	 */
	
	public int taskCount1(int id) {
		return dao.taskCount1(id);
	}
	
	public int taskCount2(int id) {
		return dao.taskCount2(id);
	}
	
	/* for Dashboard */
	public ArrayList<AccountTask> getAccountTaskList(int projectId) {

		return dao.getAccountTaskList(projectId);
	}
	
	public ArrayList<AccountTask> getAccountTaskListForChart(int projectId){
		return dao.getAccountTaskListForChart(projectId);
	}
	
	public ArrayList<ProjectUser> getProjectUsers(int projectId){
		return dao.getProjectUsers(projectId);
	}
	
	public void deleteProjectUsers(int projectId) {
		dao.deleteProjectUsers(projectId);
	}
	
	public void insertProjectUser(ProjectUser pu) {
		dao.insertProjectUser(pu);
	}

}
