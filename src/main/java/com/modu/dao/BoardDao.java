package com.modu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.modu.vo.BoardVo;
import com.modu.vo.FileVo;

@Repository
public class BoardDao {

	
	@Autowired
	SqlSession sqlsession;
	
	public String addPost(BoardVo vo) {
		
		System.out.println("다오 까지 왓수다"+vo.toString());
		int flag = sqlsession.insert("boardDB.insert",vo);
		System.out.println("잘들어갔을까?"+flag);
		String boardNo =vo.getBoardNo();  
		System.out.println(boardNo);
		return boardNo;
		
	}

	public List<BoardVo> getPostList() {
		
		System.out.println("다오 까지 왓수다");
		List<BoardVo> list = sqlsession.selectList("boardDB.getPostList");
		return list;
	}
	
	
	public void restore(FileVo vo){
		
		System.out.println("다오 "+ vo.toString());
		sqlsession.insert("boardDB.insertFile",vo);
		
	
	}
	
}
