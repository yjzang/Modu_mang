package com.modu.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modu.dao.ModuUserDao;

@Service
public class ModuUserService {
	
	@Autowired
	private ModuUserDao moduUserDao;
	
	public Map<String,Object> login(int userNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user", moduUserDao.loginUser(userNo));
		map.put("group", moduUserDao.loginGroup(userNo));
		return map;
	}
	
}
