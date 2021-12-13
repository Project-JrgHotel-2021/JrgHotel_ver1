package com.company.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.AnswerDto;
import com.company.dto.BoardDto;
import com.company.dto.BoardResultDto;
import com.company.dto.ReservationDto;
import com.company.mapper.ManagerMapper;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerMapper managerMapper;
	
	@Override
	public List<ReservationDto> reservationList_m() {
		
		return managerMapper.reservationList_m();
	}

	@Override
	public int reservationCheck_m(int rno) {
		// TODO Auto-generated method stub
		return managerMapper.reservationCheck_m(rno);
	}

	@Override
	public List<ReservationDto> reservationComList_m() {
		// TODO Auto-generated method stub
		return managerMapper.reservationComList_m();
	}

	@Override
	public List<BoardResultDto> boardList_m() {
		// TODO Auto-generated method stub
		return managerMapper.boardList_m();
	}

	@Override
	public BoardResultDto boardDetail_m(int bno) {
		// TODO Auto-generated method stub
		return managerMapper.boardDetail_m(bno);
	}
	
	@Override
	public List<BoardResultDto> boardComList_m() {
		// TODO Auto-generated method stub
		return managerMapper.boardComList_m();
	}

	@Override
	public int commentDelete(AnswerDto dto) {
		// TODO Auto-generated method stub
		int result = -1;
		if(managerMapper.commentDelete(dto)>0 && managerMapper.boardCheck_N(dto)>0 && managerMapper.commentDelete_defaultInsert(dto)>0) {
			result = 1;
			
		}
		return result;
	}


	@Override
	public int commentInsert(AnswerDto dto) {
		
		int result = -1;
		
		if(managerMapper.commentInsert(dto)>0 && managerMapper.boardCheck_Y(dto)>0 && managerMapper.commentDelete_defaultDelete(dto)>0) {
		
			result = 1;
			
		}
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public int commentUpdate(AnswerDto dto) {
		// TODO Auto-generated method stub
		return managerMapper.commentUpdate(dto);
	}

	
	

	

}
