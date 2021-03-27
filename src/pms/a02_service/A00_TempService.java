package pms.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A00_TempDao;

@Service
public class A00_TempService {

	@Autowired(required = false)
	private A00_TempDao daoTemp;
}
