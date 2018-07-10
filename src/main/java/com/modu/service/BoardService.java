package com.modu.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.modu.dao.BoardDao;
import com.modu.vo.BoardVo;
import com.modu.vo.FileVo;

@Service
public class BoardService {

	
	@Autowired
	private BoardDao dao;
	
	
	@Transactional
	public void addPost(BoardVo boardVo, HashMap<String, Object> map) {
		
		System.out.println("서비스 까지 왓수다");
		String boardNo = dao.addPost(boardVo);
		

		MultipartFile[] files = (MultipartFile[])map.get("files");
		
		System.out.println("######################"+files[0].getSize());
	
		
		/*파일 아이템 Null 체크 -- 파일item은 null이 없기때문에  파일 사이즈나 파일 이름으로 한다.*/
		if(files[0].getSize()!=0) { 
			FileVo fileVo =(FileVo)map.get("fileVo");
			String saveDir = "D:\\modu\\upload";
			for(MultipartFile file: files) {
				
				//오리지날 파일명
				String orgName = file.getOriginalFilename();
				System.out.println("orgName: "+ orgName);
						
				// 확장자
				String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				System.out.println("exName: "+ exName);
						
				// 저장파일명
				String saveName = System.currentTimeMillis() + UUID.randomUUID().toString()+exName;
				System.out.println("saveName: " + saveName);
				
				// 파일패스
				String filePath = saveDir+"\\"+saveName;
				System.out.println("filePath: " + filePath);
				
			
				// 파일사이즈
				long fileSize = file.getSize();
				System.out.println("fileSize: "+fileSize);
				
				fileVo.setBoardNo(boardNo);
				fileVo.setBoardImgPath(filePath);
				fileVo.setImgSize(fileSize);
				fileVo.setOriginalName(orgName);
				fileVo.setSaveName(saveName);
				System.out.println("서비스: " + fileVo.toString());
				dao.restore(fileVo);
								
				//파일 서버로 복사
				
				try {
					byte[] fileData = file.getBytes();               //메모리에 있는 파일을 서버로 내보낸다. --> outStream
					OutputStream out = new FileOutputStream(filePath);
					BufferedOutputStream bout = new BufferedOutputStream(out);
					
					bout.write(fileData);
					
					if(bout != null) {
						bout.close();
					}
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		    }
		}
		
				
	}
	
	public List<BoardVo> getPostList() {
		
		
		List<BoardVo> postList= (List<BoardVo>)dao.getPostList();
		for(BoardVo vo : postList) {
			
			String boardNo = vo.getBoardNo();
			List<FileVo> imgList = dao.getPostImgs(boardNo);
		    vo.setImgList(imgList);
			
		}
		return postList;
	}
	
	
	@Transactional
	public int deletePost(String boardNo) {
		
		System.out.println("서비스에서 받은 no == "+boardNo);
		int flagImg = dao.deleteImg(boardNo);
		int flagPost = dao.deletePost(boardNo);
		System.out.println("이미지 삭제:"+flagImg+"글 삭제:"+flagPost);
		int flag=0;
		flag= flagImg+flagPost;
		return flag;
	}
	
	
	
	

}
