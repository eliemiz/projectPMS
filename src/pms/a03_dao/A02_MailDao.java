package pms.a03_dao;

import pms.z01_vo.Account;

public interface A02_MailDao {


	public Account update_pw(Account upt);
	
	public Account find_pw(Account find);
	
	public void signinIns(Account insert);
}
