package com.company.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.OptionDto;
import com.company.dto.RePageDto;
import com.company.mapper.RePageMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RePageServiceImpl implements RePageService{

	@Autowired
	private RePageMapper rpm;
	
	@Override
	public List<RePageDto> reList(HashMap<String, Object> map) {
		return rpm.reList(map);
	}

	@Override
	public List<OptionDto> total_price(HashMap<String, Integer> map) {
		return rpm.total_price(map);
	}

	@Override
	public List<RePageDto> reListHigh(HashMap<String, Object> map) {		
		return rpm.reListHigh(map);
	}

	@Override
	public List<RePageDto> reListLow(HashMap<String, Object> map) {
		return rpm.reListLow(map);
	}
	
	
}
