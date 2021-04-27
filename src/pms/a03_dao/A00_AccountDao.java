package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Account;
import pms.z01_vo.AccountTask;
import pms.z01_vo.ProjectUser;

@Repository
public interface A00_AccountDao {

	public ArrayList<Account> getAccountList();

	public Account Login(Account log);

	public void signinIns(Account insert);

	public void update_pw(Account upt);

	public Account find_pw(Account find);
	
	public Account find_id(Account find);

	public Account getAccount(int accountId);

	public void loginDate(Account log);

	// public int schMember(String user_id);

	public int schMember(String mail);

	public void updatePw(Account update);
	
	// 다음 시퀀스값 불러오기
	public int sequence();

	// public ArrayList<Task> getTask(int id);

	public int taskCount1(int id);

	public int taskCount2(int id);

	/* for Dashboard */
	public ArrayList<AccountTask> getAccountTaskList(int projectId);

	public ArrayList<AccountTask> getAccountTaskListForChart(int projectId);

	public ArrayList<ProjectUser> getProjectUsers(int projectId);

	public void deleteProjectUsers(int projectId);

	public void insertProjectUser(ProjectUser pu);

}
