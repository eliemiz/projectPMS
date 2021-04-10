package pms.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import pms.z01_vo.Temp;

@Repository
public interface A99_CommonDao {

	public ArrayList<Temp> getTempList();
}
