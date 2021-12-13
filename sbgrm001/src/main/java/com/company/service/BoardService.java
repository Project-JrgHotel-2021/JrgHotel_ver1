package com.company.service;

import java.util.HashMap;
import java.util.List;

import com.company.dto.*;

public interface BoardService {
	//문의글 작성 
	public int boardWriter(HashMap<String,Object> map);
	
	//나의문의리스트
	public List<BoardResultDto> boardList(UserDto dto);
	
	//문의글 수정
	public int boardUpdate(HashMap<String,Object> map);
	
	//문의글 삭제
	public int boardDelete(HashMap<String,Object> map);
	
}
