package pms.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A00_AccountDao;
import pms.z01_vo.Account;

@Service
public class A00_AccountService {
	@Autowired(required = false)
	private A00_AccountDao daoAccount;

	public ArrayList<Account> getAccountList(){
		return daoAccount.getAccountList();
	}
}
