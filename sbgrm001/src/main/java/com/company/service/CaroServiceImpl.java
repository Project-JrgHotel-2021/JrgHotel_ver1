package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.CaroDto;
import com.company.mapper.CaroMapper;


@Service
public class CaroServiceImpl implements CaroService {

	@Autowired
	private CaroMapper cm;

	@Override
	public List<CaroDto> list() {
		return cm.list();
	}
	
}
