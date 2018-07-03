package com.modu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.AccountbookVo;

@Repository
public class ModuAccountbookDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<AccountbookVo> getaccountlist(String groupNo) {
		
		return sqlSession.selectList("accountbook.getaccountlist",groupNo);
	}
	

}