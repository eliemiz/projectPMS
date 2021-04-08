package pms.a02_service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import pms.a03_dao.A00_AccountDao;
import pms.z01_vo.Account;

@Service
public class A00_AccountService {
	@Autowired(required = false)
	private A00_AccountDao dao;

	public ArrayList<Account> getAccountList(){
		return dao.getAccountList();
	}
	
	public Account Login(String user_id, String password) {

		return dao.Login(user_id, password);
	}
}
