package com.company.service;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.UserDto;
import com.company.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	@Override
	public int user_create(UserDto dto)  {
		int result = -1;
		
		try {
		dto.setUip(InetAddress.getLocalHost().getHostName());
		
			result = userMapper.user_create(dto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public UserDto user_info(UserDto dto) {
		// TODO Auto-generated method stub
		return userMapper.user_info(dto);
	}

	@Override
	public int user_update(UserDto dto) {
		// TODO Auto-generated method stub
		return userMapper.user_update(dto);
	}

	@Override
	public int user_delete(UserDto dto) {
		// TODO Auto-generated method stub
		return userMapper.user_delete(dto);
	}

	@Override
	public int user_login(UserDto dto) {
		// TODO Auto-generated method stub
		return userMapper.user_login(dto);
	}

	@Override
	public UserDto user_uno(UserDto dto) {
		// TODO Auto-generated method stub
		return userMapper.user_uno(dto);
	}
	
	@Override
	public int doubleid(UserDto dto) {
		return userMapper.doubleid(dto);
	}

	@Override
	public List<UserDto> searchid(UserDto dto) {
		// TODO Auto-generated method stub
		return userMapper.searchid(dto);
	}

	@Override
	public int searchpass(UserDto dto) {
		// TODO Auto-generated method stub
		return userMapper.searchpass(dto);
	}

	@Override
	public int updatepass(UserDto dto) {
		// TODO Auto-generated method stub
		return userMapper.updatepass(dto);
	}
	
}
