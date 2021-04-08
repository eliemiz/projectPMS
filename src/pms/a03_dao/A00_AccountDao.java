package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Account;
import pms.z01_vo.AccountTask;

@Repository
public interface A00_AccountDao {

	public ArrayList<Account> getAccountList();

	public Account Login(String user_id, String password);
	
	public ArrayList<AccountTask> getAccountTaskList();
}
