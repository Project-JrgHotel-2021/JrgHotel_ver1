package com.company.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.dto.RoomDto;

@Service
public interface HotelService {
	
	public List<RoomDto> list();
	
}
