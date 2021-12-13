package com.company.service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.*;
import com.company.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	
	@Override
	   public int boardWriter(HashMap<String, Object> map) {
	      int result = -1;
	      	      
	      try {
	         map.put("bip", InetAddress.getLocalHost().getHostName());
	         
	         if(boardMapper.boardWriter(map) > 0) {
	            result = boardMapper.answerDefault((String)map.get("uid"));
	         }
	         
	      } catch (UnknownHostException e) { 
	         e.printStackTrace();
	      }
	      return result;
	   }
	
	
	
	

	@Override
	public List<BoardResultDto> boardList(UserDto dto) {
		// TODO Auto-generated method stub
		return boardMapper.boardList(dto);
	}

	@Override
	public int boardUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.boardUpdate(map);
	}

	@Override
	public int boardDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.boardDelete(map);
	}

}
