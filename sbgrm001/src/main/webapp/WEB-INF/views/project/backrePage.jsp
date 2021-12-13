<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>HTML BASIC</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 </head>
 <body>
	<div>
	<%
	
	
/* 	@RequestMapping("/rePage")
	public String rePage( @RequestParam("cno") int cno,Model model, 
		@RequestParam("adult") int adultnum, @RequestParam("kid") int kidnum) {
	
		HotelDescDto dto = new HotelDescDto();
		dto.setCno(cno);
		
		model.addAttribute("hotel", hoteldescservice.list(dto));
		model.addAttribute("adultnum" , adultnum);
		model.addAttribute("kidnum" , kidnum);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("rcheckin", "2021-10-24");
		map.put("rcheckout", "2021-10-31");
		
		if(cno == 4) {
			map.put("cno", "1,2,3");
		}else {
			map.put("cno", cno);
		}
		
		model.addAttribute("room", repageservice.reList(map));
		
		////////////  예약
		
		MJCalc cal = new MJCalc();
		MJCalNext002 nextCal = new MJCalNext002();
		Calendar  today = Calendar.getInstance(); 
		int month = today.get(Calendar.MONTH)+1;
		int year = today.get(Calendar.YEAR);
		
		model.addAttribute("myCal",cal.mycalendar());
		
		System.out.println("이거 현재달컨트롤러임.........................................." + cal.toString());
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		
		model.addAttribute("nextMonth", month+1);
		
		System.out.println("이거 컨트롤러임.........................................." + nextCal.toString());
		model.addAttribute("nextCal", nextCal.mycalendar());
		
		
		return "/project/rePage"; 
	} */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	%>
	</div>
 </body>
</html>
