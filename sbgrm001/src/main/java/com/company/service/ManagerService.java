package com.company.service;

import java.util.List;

import com.company.dto.AnswerDto;
import com.company.dto.BoardResultDto;
import com.company.dto.ReservationDto;

public interface ManagerService {

	//예약대기 리스트 가져오기
	public List<ReservationDto> reservationList_m();
	
	//예약완료 리스트 가져오기
	public List<ReservationDto> reservationComList_m();
	
	//예약승인하기
	public int reservationCheck_m(int rno);
	
	//답변대기 리스트 가져오기
	public List<BoardResultDto> boardList_m();
	
	//답변완료 리스트 가져오기
	public List<BoardResultDto> boardComList_m();
	
	//답변 문의글 자세히 보기
	public BoardResultDto boardDetail_m(int bno);
	
	//답변쓰기
	public int commentInsert(AnswerDto dto);
		
	//답변 쓰면 '답변 전 입니다 default 없애기'
		
		
	//답변 삭제하기
	public int commentDelete(AnswerDto dto);
		
	//답변 수정하기
	public int commentUpdate(AnswerDto dto);
}
