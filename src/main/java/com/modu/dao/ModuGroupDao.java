package com.modu.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.ModuGroupVo;


@Repository
public class ModuGroupDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	public int plusGroup(ModuGroupVo groupvo) {
		return sqlSession.insert("group.insert",groupvo);
	}

}
