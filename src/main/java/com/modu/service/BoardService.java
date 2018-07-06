package com.modu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modu.dao.BoardDao;
import com.modu.vo.BoardVo;

@Service
public class BoardService {

	
	@Autowired
	private BoardDao dao;
	
	public void addPost(BoardVo vo) {
		
		System.out.println("서비스 까지 왓수다");
		dao.addPost(vo);
				
	}
	
	public List<BoardVo> getPostList() {
		
		
		List<BoardVo> list= (List<BoardVo>)dao.getPostList();
		return list;
	}
	
}
