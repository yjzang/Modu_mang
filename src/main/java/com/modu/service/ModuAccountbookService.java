package com.modu.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modu.dao.ModuAccountbookDao;
import com.modu.vo.AccountbookCategoryVo;
import com.modu.vo.AccountbookVo;

@Service
public class ModuAccountbookService {
	
	@Autowired
	private ModuAccountbookDao moduAccountbookDao;
	
	public Map<String,Object> getAccountList(String groupNo,String month) {
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
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<AccountbookVo> accountList = moduAccountbookDao.getAccountList(map);
		returnMap.put("accountList", accountList);
		
		List<AccountbookCategoryVo> categoryList = moduAccountbookDao.getCategoryList(groupNo);
		returnMap.put("categoryList", categoryList);

		return returnMap;
	}
	
	public Map<String,Object> searchaccountlistbydate(String groupNo,String search_date1,String search_date2) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groupNo", groupNo);
		String sy = search_date1.substring(0, 4);
		String sm = search_date1.substring(6, 8);
		String sd = search_date1.substring(10, 12);
		
		String ey = search_date2.substring(0, 4);
		String em = search_date2.substring(6, 8);
		String ed = search_date2.substring(10, 12);

		search_date1 = sy+"/"+sm+"/"+sd;
		search_date2 = ey+"/"+em+"/"+ed;
		map.put("startDate", search_date1);
		map.put("endDate", search_date2);
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<AccountbookVo> accountList = moduAccountbookDao.getAccountList(map);
		returnMap.put("accountList", accountList);
		
		List<AccountbookCategoryVo> categoryList = moduAccountbookDao.getCategoryList(groupNo);
		returnMap.put("categoryList", categoryList);

		return returnMap;
	}
	
	public Map<String,Object> searchaccountlist(String groupNo,String mode,String search_text) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("groupNo", groupNo);
		map.put("data", "%"+search_text+"%");
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		if(mode.equals("2")) {
			List<AccountbookVo> accountList = moduAccountbookDao.searchAccountListByTag(map);
			returnMap.put("accountList", accountList);
		}else if (mode.equals("3")) {
			List<AccountbookVo> accountList = moduAccountbookDao.searchAccountListByUsage(map);
			returnMap.put("accountList", accountList);
		}
		
		List<AccountbookCategoryVo> categoryList = moduAccountbookDao.getCategoryList(groupNo);
		returnMap.put("categoryList", categoryList);

		return returnMap;
	}
	
	

}
