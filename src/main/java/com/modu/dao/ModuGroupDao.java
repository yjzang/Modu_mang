package com.modu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.ModuGroupVo;


@Repository
public class ModuGroupDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int plusGroup(ModuGroupVo groupvo) {
		System.out.println(groupvo.toString());
	    
	    return sqlSession.insert("group.insert",groupvo);
	}
	
	public List<ModuGroupVo> selectGroup() {
		return sqlSession.selectList("group.selectGroupList");
	}

}
