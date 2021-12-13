package com.company.sbgrm001;

import java.util.ArrayList;
import java.util.Calendar;

public class MJCalNext002 {
	public ArrayList<String>  mycalendar() {
		
		Calendar today = Calendar.getInstance(); 
		Calendar start = Calendar.getInstance();
		//1. set		날짜필드설정, 1일로
		start.set(Calendar.DATE, 1); // void java.util.Calendar.set(필드, 설정값)
		
		int month = today.get(Calendar.MONTH)+1;// 현재달
		int startyoil = start.get(Calendar.DAY_OF_WEEK);   // 5: Thursday. 
		
		//2. Calendar.DAY_OF_WEEK : 특정날짜가무슨요일인지리턴★카운트일자가다르므로 주의!
		//★SUNDAY(1),MONDAY(2),TUESDAY(3),WEDNESDAY(4),THURSDAY(5),FRIDAY(6),SATURDAY(7)
		int lastday = today.getActualMaximum(Calendar.DATE);  //30 (마지막일수)
		
		//3. getActualMaximum : 이 달력의 시간 값이 주어지면 지정된 달력 필드가 가질 수있는 최대 값을 반환
		start.set(Calendar.DATE, lastday);
		
		
		//			  날짜필드설정, 30일로
		int lastyoil = start.get(Calendar.DAY_OF_WEEK);  // 6 : indicatingFriday. 
		////// 분석이 끝났다면 위의   startyoil , lastday 이용해서 달력출력하기
		//						  * * * *     1~30
		System.out.println("::::::::::" + (startyoil) + "\t" + lastday);  //5 : 30
		
		
		String[] cal = new String[startyoil+lastday+1];
		//////////////////////////////////
		ArrayList<String> list = new ArrayList<>();
		
		for(int i=1; i<startyoil+lastday; i++) {
			//						i<5       ****    5-4 , 6-4,,,, 
			list.add((i<startyoil)? " " : (	i-(startyoil-1))+""	) ;
			//(i%7==0) {System.out.println();}
			
		}
		System.out.println("........................................이건 현재달 클래스" + list.toString());
		
		
		

		///////////////////////////////////
		///////////////////////////////////
		//start.set(Calendar.DATE, 1);  해주면 안됨 (그대로 현재달이 나옴)
		
		today.add( today.get(Calendar.MONTH)+1, 1);
		
		
		//System.out.println("......................................다음달"+ Calendar.MONTH);
		int startyoil2 = startyoil + (lastday%7) <= 7 ? startyoil+(lastday%7) : (startyoil+(lastday%7))%7; // 5: Thursday. //12월은 4가 되어야함
				
		
		//2. Calendar.DAY_OF_WEEK : 특정날짜가무슨요일인지리턴★카운트일자가다르므로 주의!
		//★SUNDAY(1),MONDAY(2),TUESDAY(3),WEDNESDAY(4),THURSDAY(5),FRIDAY(6),SATURDAY(7)
		int lastday2 = today.getActualMaximum(Calendar.DATE);  //30 (마지막일수) //12월은 31일
		
		
		//3. getActualMaximum : 이 달력의 시간 값이 주어지면 지정된 달력 필드가 가질 수있는 최대 값을 반환
		start.set(Calendar.DATE, lastday2);
		//			  날짜필드설정, 30일로
		
		
		int lastyoil2 = start.get(Calendar.DAY_OF_WEEK);  // 6 : indicatingFriday. 
		////// 분석이 끝났다면 위의   startyoil , lastday 이용해서 달력출력하기
		//						  * * * *     1~30
		
		System.out.println(":::::::::: startyoil " + (startyoil2) + "\t lastday  " + lastday2);  //5 : 30
		
		
		String[] cal2 = new String[startyoil2+lastday2+1];
		
		ArrayList<String> nextlist = new ArrayList<>();
		
		for(int i=1; i<startyoil2+lastday2; i++) {
			//						i<5       ****    5-4 , 6-4,,,, 
			nextlist.add((i<startyoil2)? " " : (	i-(startyoil2-1))+""	) ;
			//(i%7==0) {System.out.println();}
			
		}
		System.out.println("이건 Next Calendar class..............................."+nextlist.toString());
		
		
		return nextlist;
		
		
	}

}	//end class
