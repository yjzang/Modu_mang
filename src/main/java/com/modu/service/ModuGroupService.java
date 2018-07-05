package com.modu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modu.dao.ModuGroupDao;
import com.modu.vo.ModuGroupVo;

@Service
public class ModuGroupService {
	

	@Autowired
	private ModuGroupDao groupDao;
	
	public int plusGroup(ModuGroupVo groupvo) {
		
		return groupDao.plusGroup(groupvo);
	}

}
