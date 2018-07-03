package com.modu.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modu.dao.ModuAccountbookDao;
import com.modu.vo.AccountbookVo;

@Service
public class ModuAccountbookService {
	
	@Autowired
	private ModuAccountbookDao moduAccountbookDao;
	
	public List<AccountbookVo> getaccountlist(String groupNo,String month) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groupNo", groupNo);
		
		Calendar cal = Calendar.getInstance();
		int y = Integer.parseInt(month.substring(0, 4));
		int m = Integer.parseInt(month.substring(7, 9));
		cal.set(y, m, 1);
		cal.add(Calendar.DATE, -1);
		
		String startDate = month.replace(" ", "") + "/01";
		String endDate = month.replace(" ", "") + "/" + cal.get(Calendar.DATE);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		System.out.println("startDate " + startDate);
		System.out.println("endDate " + endDate);
		return moduAccountbookDao.getaccountlist(map);
	}

}
