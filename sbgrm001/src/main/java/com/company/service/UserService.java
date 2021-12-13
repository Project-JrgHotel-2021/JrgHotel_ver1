package com.company.service;

import java.util.List;

import com.company.dto.UserDto;

public interface UserService {
	//회원가입
	public int user_create(UserDto dto);
	
	//회원정보
	public UserDto user_info(UserDto dto);
	
	//회원정보수정
	public int user_update(UserDto dto);
	
	//회원정보탈퇴
	public int user_delete(UserDto dto);
	
	//로그인
	public int user_login(UserDto dto);
	
	public UserDto user_uno(UserDto dto);
	public int doubleid(UserDto dto);
	
	
	public List<UserDto> searchid(UserDto dto);
	public int searchpass(UserDto dto);
	public int updatepass(UserDto dto);
}
