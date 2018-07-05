package com.modu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.ModuGroupVo;
import com.modu.vo.ModuUserVo;

import java.util.Map;

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

	public void joinUser(ModuUserVo userVo) {
		sqlSession.insert("user.joinUser",userVo);
	}

	public int emailCheckAjax(String email) {
		return sqlSession.selectOne("user.emailCheckAjax",email);
	}

	public ModuUserVo userLoginCheck(Map<String, Object> map) {
		System.out.println(map.toString());
		return sqlSession.selectOne("user.userLoginAvailableCheck",map);
	}

	public ModuUserVo kakaoLogin(Map<String,Object> map) {
		return sqlSession.selectOne("user.userLoginAvailableCheck",map);
	}
}
