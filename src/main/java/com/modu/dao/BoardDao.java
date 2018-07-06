package com.modu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.BoardVo;

@Repository
public class BoardDao {

	
	@Autowired
	SqlSession sqlsession;
	
	public void addPost(BoardVo vo) {
		
		System.out.println("다오 까지 왓수다");
		int flag = sqlsession.insert("boardDB.insert",vo);
		System.out.println("잘들어갔을까?"+flag);
	}

	public List<BoardVo> getPostList() {
		
		System.out.println("다오 까지 왓수다");
		List<BoardVo> list = sqlsession.selectList("boardDB.getPostList");
		return list;
	}
}
