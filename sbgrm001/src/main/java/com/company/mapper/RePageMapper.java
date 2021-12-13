package com.company.mapper;

import java.util.HashMap;
import java.util.List;

import com.company.dto.OptionDto;
import com.company.dto.RePageDto;

public interface RePageMapper {
	public List<RePageDto> reList(HashMap<String, Object> map);
	
	public List<RePageDto> reListHigh(HashMap<String, Object> map);
	public List<RePageDto> reListLow(HashMap<String, Object> map);
	
	public List<OptionDto> total_price(HashMap<String, Integer> map);
}
