package pms.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A02_AdminDao;

@Service
public class A02_AdminService {

	@Autowired(required = false)
	private A02_AdminDao dao;
}
