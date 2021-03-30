package pms.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.a03_dao.A12_TaskDao;

@Service
public class A12_TaskService {
	@Autowired(required = false)
	private A12_TaskDao dao;
}

