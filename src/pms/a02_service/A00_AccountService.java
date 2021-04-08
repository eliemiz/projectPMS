package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A00_AccountDao;
import pms.z01_vo.Account;
import pms.z01_vo.AccountTask;

@Service
public class A00_AccountService {
	
	@Autowired(required = false)
	private A00_AccountDao dao;

	public ArrayList<Account> getAccountList() {
		return dao.getAccountList();
	}

	public Account Login(String user_id, String password) {

		return dao.Login(user_id, password);
	}

	public ArrayList<AccountTask> getAccountTaskList() {

		return dao.getAccountTaskList();
	}
}
