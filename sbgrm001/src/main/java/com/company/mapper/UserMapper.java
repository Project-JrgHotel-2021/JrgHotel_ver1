package com.company.mapper;

import java.util.List;

import com.company.dto.UserDto;

public interface UserMapper {
	
	public int user_create(UserDto dto);
	public int user_login(UserDto dto);
	public UserDto user_info(UserDto dto);
	public int user_update(UserDto dto);
	public int user_delete(UserDto dto);
	public UserDto user_uno(UserDto dto);
	public int doubleid(UserDto dto);
	
	public List<UserDto> searchid(UserDto dto);
	public int searchpass(UserDto dto);
	public int updatepass(UserDto dto);
}
