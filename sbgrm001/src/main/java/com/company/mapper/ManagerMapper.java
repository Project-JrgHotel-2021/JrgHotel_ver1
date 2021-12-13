package com.company.mapper;

import java.util.List;

import com.company.dto.AnswerDto;
import com.company.dto.BoardResultDto;
import com.company.dto.ReservationDto;

public interface ManagerMapper {
	public List<ReservationDto> reservationList_m ();
	public List<ReservationDto> reservationComList_m();
	public int reservationCheck_m(int rno);
	public List<BoardResultDto> boardList_m();
	public BoardResultDto boardDetail_m(int bno);
	
	public List<BoardResultDto> boardComList_m();
	public int commentInsert(AnswerDto dto);
	public int commentDelete_defaultDelete(AnswerDto dto);
	public int commentDelete_defaultInsert(AnswerDto dto);
	public int commentDelete(AnswerDto dto);
	public int boardCheck_N(AnswerDto dto);
	public int boardCheck_Y(AnswerDto dto);
	public int commentUpdate(AnswerDto dto);
	
}
