package com.company.service;

import java.util.HashMap;
import java.util.List;

import com.company.dto.ReDoneDto;
import com.company.dto.ReservationDto;
import com.company.dto.ReservationResultDto;
import com.company.dto.UserDto;
import com.company.dto.OptionDto;
import com.company.dto.RoomTypeDto;

public interface ReservationService {
	//해당회원 예약리스트 가져오기
	public List<ReservationDto> reservationList(UserDto dto);
	
	//예약자성함
	public String reservationUname(UserDto dto);
	
	//예약내역상세보기
	public ReservationResultDto reservationDetail(int rno);
	
	//예약하기
	public int reserve(ReservationDto dto);
	
	//예약결과
	public ReDoneDto reservation_done(UserDto dto);
	
	//예약내역상세보기 - 룸타입가져오기
	public RoomTypeDto reservationRoomtype(int rno);
		
	//추가옵션 가격가져오기
	public List<OptionDto> reservationAddOption();
		
	//예약취소하기
	public int reservationDelete(HashMap<String,Object> map);
		
}
