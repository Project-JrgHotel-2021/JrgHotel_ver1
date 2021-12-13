package com.company.mapper;

import java.util.HashMap;
import java.util.List;

import com.company.dto.BoardResultDto;
import com.company.dto.UserDto;

public interface BoardMapper {
	public int boardWriter(HashMap<String,Object> map);
	public int answerDefault(String uid);
	public List<BoardResultDto> boardList(UserDto dto);
	public int boardUpdate(HashMap<String,Object> map);
	public int boardDelete(HashMap<String,Object> map);
	
}
