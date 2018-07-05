package com.modu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.AccountbookCategoryVo;
import com.modu.vo.AccountbookVo;

@Repository
public class ModuAccountbookDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<AccountbookVo> getAccountList(Map map) {
		//가계부 리스팅 - 날짜 검색 포함
		return sqlSession.selectList("accountbook.getaccountlist",map);
	}
	
	public List<AccountbookCategoryVo> getCategoryList(String groupNo) {
		//가계부 카테고리 리스팅
		return sqlSession.selectList("accountbook.getcategorylist",groupNo);
	}
	
	public List<AccountbookVo> searchAccountListByTag(Map map) {
		//태그 검색
		return sqlSession.selectList("accountbook.searchAccountListByTag",map);
	}
	
	public List<AccountbookVo> searchAccountListByUsage(Map map) {
		//사용내역 검색
		return sqlSession.selectList("accountbook.searchAccountListByUsage",map);
	}
	
	

}
