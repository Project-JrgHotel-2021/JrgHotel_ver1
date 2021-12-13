package com.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.HotelDescDto;
import com.company.mapper.HotelDescMapper;


@Service
public class HotelDescServiceImpl implements HotelDescService {

	@Autowired
	private HotelDescMapper hm;

	@Override
	public HotelDescDto list(HotelDescDto dto) {
		return hm.list(dto);
	}


	
	
	
}
