package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Account;
import pms.z01_vo.AccountTask;

@Repository
public interface A00_AccountDao {

	public ArrayList<Account> getAccountList();

	public Account Login(Account log);
	
	public ArrayList<AccountTask> getAccountTaskList();
}
