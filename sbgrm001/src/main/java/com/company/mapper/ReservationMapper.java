package com.company.mapper;

import java.util.HashMap;
import java.util.List;

import com.company.dto.ReDoneDto;
import com.company.dto.ReservationDto;
import com.company.dto.ReservationResultDto;
import com.company.dto.UserDto;
import com.company.dto.OptionDto;
import com.company.dto.RoomTypeDto;

public interface ReservationMapper {
	public List<ReservationDto> reservationList(UserDto dto);
	public String reservationUname(UserDto dto);
	public ReservationResultDto reservationDetail(int rno);

	public int reserve(ReservationDto dto);
	public ReDoneDto reservation_done(UserDto dto);
	
	public RoomTypeDto reservationRoomtype(int rno);
	public List<OptionDto> reservationAddOption();
	public int reservationDelete(HashMap<String,Object> map);
}
