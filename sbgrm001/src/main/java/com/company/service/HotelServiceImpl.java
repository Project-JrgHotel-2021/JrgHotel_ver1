package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.RoomDto;
import com.company.mapper.HotelMapper;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelMapper hotelmapper;

	@Override
	public List<RoomDto> list() {
		return hotelmapper.list();
	}
	
}
