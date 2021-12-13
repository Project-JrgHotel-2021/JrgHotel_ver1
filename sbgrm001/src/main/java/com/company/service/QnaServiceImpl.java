package com.company.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.QnaDto;
import com.company.mapper.QnaMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaMapper qm;
		
	@Override
	public List<QnaDto> list(QnaDto dto) {	
		return qm.list(dto);
	}

	
	
	
}
