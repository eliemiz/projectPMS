package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Account;
import pms.z01_vo.AccountTask;
import pms.z01_vo.Email;

@Repository
public interface A00_AccountDao {

	public ArrayList<Account> getAccountList();

	public Account Login(Account log);
	
	public ArrayList<AccountTask> getAccountTaskList(int projectId);
	
	public Account signinIns(Account insert);

	public void update_pw(Account upt);

	public Account find_pw(Account find);
	
	public Account getAccount(int accountId);
	
	

}
