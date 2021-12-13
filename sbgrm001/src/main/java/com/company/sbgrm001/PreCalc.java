package com.company.sbgrm001;

import java.util.ArrayList;
import java.util.Calendar;

public class PreCalc {
	public ArrayList<String> precal(int month,int year){
		ArrayList<String> list = new ArrayList<>();
		
		
		
		Calendar next = Calendar.getInstance();
		

		if( month == 1 ) {
			next.set(Calendar.YEAR, year-1);				// 년도를 이전년도로 설정
			next.set(Calendar.MONTH, 11 );					// 달을 12월(11번) 로 설정
		}	
		else {
			next.set(Calendar.YEAR, year);
			next.set(Calendar.MONTH, month-2 );				// 달을 이전달 번호로 설정 
		}
		next.set(Calendar.DATE, 1);							// 다음달을 1일로 설정
	
		int nextmonth =  next.get(Calendar.MONTH)+1;		// 이전달 가져오기
	
		int nextstartyoil = next.get(Calendar.DAY_OF_WEEK); // 이전달 시작요일 가져오기
		
		
		int nextlastday = next.getActualMaximum(Calendar.DATE); // 다음달 마지막 날짜 가져오기
		next.set(Calendar.DATE, nextlastday);					// 다음달을 마지막날로 설정
		int nextlastyoil = next.get(Calendar.DAY_OF_WEEK);		// 다음달 마지막 날의 요일을 가져오기
		
		for(int i=1; i<nextstartyoil+nextlastday; i++) {
			//						i<5       ****    5-4 , 6-4,,,, 
			list.add((i<nextstartyoil)? " " : (i-(nextstartyoil-1))+"") ;
			//(i%7==0) {System.out.println();}
			
		}
		
		return list;
	}
}
