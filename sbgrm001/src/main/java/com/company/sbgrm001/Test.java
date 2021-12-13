package com.company.sbgrm001;

import java.util.ArrayList;
import java.util.Calendar;

public class Test {
	public static void main(String[] args) {
		Calendar  today = Calendar.getInstance();
		Calendar start = Calendar.getInstance();
		
		start.set(Calendar.DATE, 1);
		int month = today.get(Calendar.MONTH)+1;
		int startyoil = start.get(Calendar.DAY_OF_WEEK);
		
		
		
		int lastday = today.getActualMaximum(Calendar.DATE);  //30 (마지막일수)
		
		//3. getActualMaximum : 이 달력의 시간 값이 주어지면 지정된 달력 필드가 가질 수있는 최대 값을 반환
		start.set(Calendar.DATE, lastday);
		//			  날짜필드설정, 30일로
		int lastyoil = start.get(Calendar.DAY_OF_WEEK);
		

		
		String[] cal = new String[startyoil+lastday+1];
		
		ArrayList<String> list = new ArrayList<>();
		
		for(int i=1; i<startyoil+lastday; i++) {
			//						i<5       ****    5-4 , 6-4,,,, 
			list.add((i<startyoil)? "*" : (i-(startyoil-1))+"") ;
			//(i%7==0) {System.out.println();}
			
		}
		
		System.out.println(list);
		
		
		
		
		Calendar next = Calendar.getInstance();
		next.set(Calendar.MONTH, month );
		next.set(Calendar.DATE, 1);
		int nextmonth =  next.get(Calendar.MONTH)+1;
		int nextstartyoil = next.get(Calendar.DAY_OF_WEEK);
		int nextlastday = next.getActualMaximum(Calendar.DATE); 
		next.set(Calendar.DATE, nextlastday);
		//			  날짜필드설정, 30일로
		

		
		int nextlastyoil = next.get(Calendar.DAY_OF_WEEK);
		
		System.out.println(next.get(Calendar.MONTH)+1 );
		System.out.println(today.get(Calendar.DAY_OF_WEEK));
		System.out.println(startyoil);
		System.out.println(lastyoil);
		System.out.println(nextstartyoil);
		System.out.println(nextmonth);
		System.out.println(nextlastday);
		System.out.println(nextlastyoil);

		String[] nextcal = new String[nextstartyoil+nextlastday+1];
		
		ArrayList<String> nextlist = new ArrayList<>();
		
		for(int i=1; i<nextstartyoil+nextlastday; i++) {
			//						i<5       ****    5-4 , 6-4,,,, 
			nextlist.add((i<nextstartyoil)? " " : (i-(nextstartyoil-1))+"") ;
			//(i%7==0) {System.out.println();}
			
		}
		System.out.println(today.get(Calendar.DAY_OF_WEEK));
		today.set(Calendar.YEAR, 2022);
		today.set(Calendar.MONTH, 1);
		System.out.println(nextlist);
		System.out.println(Calendar.YEAR);
		System.out.println(today.get(Calendar.YEAR)  + "/" + (today.get(Calendar.MONTH)+1) + "/" + today.get(Calendar.DATE) + "/" + today.get(Calendar.DAY_OF_WEEK ));
	}
	
	
}
