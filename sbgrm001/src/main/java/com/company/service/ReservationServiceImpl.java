package com.company.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.dto.ReDoneDto;
import com.company.dto.ReservationDto;
import com.company.dto.ReservationResultDto;
import com.company.dto.UserDto;
import com.company.mapper.ReservationMapper;
import com.company.dto.OptionDto;
import com.company.dto.RoomTypeDto;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationMapper reservationMapper;
	
	

	@Override
	public String reservationUname(UserDto dto) {
		// TODO Auto-generated method stub
		return reservationMapper.reservationUname(dto);
	}



	@Override
	public List<ReservationDto> reservationList(UserDto dto) {
		// TODO Auto-generated method stub
		return reservationMapper.reservationList(dto);
	}



	@Override
	public ReservationResultDto reservationDetail(int rno) {
		// TODO Auto-generated method stub
		return reservationMapper.reservationDetail(rno);
	}



	@Override
	public int reserve(ReservationDto dto) {
		// TODO Auto-generated method stub
		return reservationMapper.reserve(dto);
	}



	@Override
	public ReDoneDto reservation_done(UserDto dto) {
		// TODO Auto-generated method stub
		return reservationMapper.reservation_done(dto);
	}
	
	@Override
	public RoomTypeDto reservationRoomtype(int rno) {
		// TODO Auto-generated method stub
		return reservationMapper.reservationRoomtype(rno);
	}



	@Override
	public List<OptionDto> reservationAddOption() {
		// TODO Auto-generated method stub
		return reservationMapper.reservationAddOption();
	}



	@Override
	public int reservationDelete(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return reservationMapper.reservationDelete(map);
	}
	
}
