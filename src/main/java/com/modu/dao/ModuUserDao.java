package com.modu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

@Repository
public class ModuUserDao {

	@Autowired
	private SqlSession sqlSession;
	
	public ModuUserVo loginUser(int userNo) {
		return sqlSession.selectOne("user.loginUser",userNo);
	}
	
	public ModuGroupVo loginGroup(int userNo) {
		return sqlSession.selectOne("user.loginGroup",userNo);
	}
}
