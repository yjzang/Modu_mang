package com.modu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modu.dao.ModuAccountbookDao;
import com.modu.vo.AccountbookVo;

@Service
public class ModuAccountbookService {
	
	@Autowired
	private ModuAccountbookDao moduAccountbookDao;
	
	public List<AccountbookVo> getaccountlist(String groupNo) {
		return moduAccountbookDao.getaccountlist(groupNo);
	}

}
