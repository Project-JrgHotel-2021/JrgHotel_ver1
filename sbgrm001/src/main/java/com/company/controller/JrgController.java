package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.dto.HotelDescDto;
import com.company.dto.OptionDto;
import com.company.dto.QnaDto;
import com.company.dto.ReservationDto;
import com.company.dto.UserDto;
import com.company.sbgrm001.MJCalNext002;
import com.company.sbgrm001.MJCalc;
import com.company.sbgrm001.NextCalc;
import com.company.sbgrm001.PreCalc;
import com.company.service.CaroService;
import com.company.service.HotelDescService;
import com.company.service.HotelService;
import com.company.service.QnaService;
import com.company.service.RePageService;
import com.company.service.ReservationService;
import com.company.service.UserService;
import com.company.dto.ReservationResultDto;
import com.company.service.BoardService;
import com.company.service.ManagerService;
import com.company.dto.AnswerDto;
import com.company.dto.BoardResultDto;
import com.company.dto.RoomTypeDto;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.extern.log4j.Log4j;

@RequestMapping("/do/*")
@Controller
@Log4j
public class JrgController {
	
	@Autowired
	private CaroService caroservice;	// 캐로셀 
	
	@Autowired
	private HotelDescService hoteldescservice; 	//호텔 설명(위치,이름,설명 등등)
	
	@Autowired
	private HotelService hotelservice;	// (방 사진)
	
	@Autowired
	private RePageService repageservice;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(value="/main", method= {RequestMethod.GET})
	public String main_get(Model model) {
		
		HotelDescDto dto = new HotelDescDto();
		dto.setCno(4);
		model.addAttribute("list", caroservice.list());
		model.addAttribute("hotel", hoteldescservice.list(dto));
		
		ArrayList<QnaDto> qnalist = new ArrayList<>();
		
		QnaDto dto1 = new QnaDto();
		dto1.setQcno(1);
		qnalist.add( qnaService.list(dto1).get(0) );
		qnalist.add( qnaService.list(dto1).get(1) );
		dto1.setQcno(2);
		qnalist.add( qnaService.list(dto1).get(0) );
		qnalist.add( qnaService.list(dto1).get(1) );
		dto1.setQcno(3);
		qnalist.add( qnaService.list(dto1).get(0) );
		qnalist.add( qnaService.list(dto1).get(1) );
		
		model.addAttribute("qnalist", qnalist);
		
		///////////////////////////////////////////////////////////
		
		MJCalc cal = new MJCalc();
		Calendar  today = Calendar.getInstance(); 
		int month = today.get(Calendar.MONTH)+1;
		int year = today.get(Calendar.YEAR);
		
		model.addAttribute("myCal",cal.mycalendar());
		
		System.out.println("이거 현재달컨트롤러임.........................................." + cal.toString());
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		
		return "/project/main";
	}
	
	//회원가입 페이지 이동 
		@RequestMapping(value="/join_page", method= {RequestMethod.GET})
		public String join_get(){
				
			return "/project/join";
		}
	
		//로그인
		@RequestMapping(value="/login_page", method= {RequestMethod.GET})
		public String login_get() {
			return "/project/login";
		}
		
	@RequestMapping("/join")
	public void join(UserDto dto, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("zonecode") String addr1, @RequestParam("address") String addr2,
			@RequestParam("address2") String addr3, @RequestParam("birth_yy") String birth1, @RequestParam("birth_mm") String birth2,
			@RequestParam("birth_dd") String birth3) throws ServletException, IOException { 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		dto.setUaddress(addr1 +"/"+addr2 +"/"+addr3);
		dto.setUbirth(birth1+"/"+birth2+"/"+birth3);
		System.out.println("1.."+dto);
		int result = userService.user_create(dto);
		if(result > 0) {
			out.println("<script>alert('회원가입 성공!'); location.href='"+request.getContextPath()+"/do/main'; </script>");
			//http://localhost:8181/sb004/board/$%7BpageContext.request.contextPath%7D/board/list
		}else {
			out.println("<script>alert('회원가입 실패! \n관리자에게 문의하세요.'); location.href='"+request.getContextPath()+"/do/main'; </script>");
		} 
	}
	
	//로그인 기능
		 @RequestMapping(value="/login",method= {RequestMethod.POST}) 
		 public void login_post(UserDto dto, HttpServletRequest request, HttpServletResponse response,HttpSession session)throws IOException {
			 request.setCharacterEncoding("UTF-8");
			 response.setContentType("text/html; charset=UTF-8");
			 
			 PrintWriter out = response.getWriter();
			 
			 String remember = request.getParameter("remember");
			 String uid = request.getParameter("uid");
			
			 
			 if(userService.user_login(dto)>0) {
				 session.setAttribute("dto", userService.user_info(dto));
				 if(remember!=null && remember.equals("on")) {
					 //아이디저장 클릭시 
					 Cookie cookieId = new Cookie ("id",uid);
					 Cookie cookieRemem = new Cookie ("remember",remember);
					 response.addCookie(cookieId);
					 response.addCookie(cookieRemem);
				 }else {
					 String cookie = request.getHeader("Cookie");// 헤더에 쿠키가 존재하는 확인
					 if(cookie!=null) { // 쿠키가 존재한다면
						 Cookie[] cookies = request.getCookies(); //모든 쿠기 받아오기
						 for(int i=0; i<cookies.length; i++) {
							 if(cookies[i].getName().equals("remember")) {
								 cookies[i].setMaxAge(0); //쿠키 유효시간 0으로 수정 ==> 쿠키삭제
								 response.addCookie(cookies[i]); //헤더에 쿠키 추가  
								 
							 }
							 if(cookies[i].getName().equals("id")) {
								 cookies[i].setMaxAge(0);
								 response.addCookie(cookies[i]);
							 }
						 }
					 }
				 }
				 out.println("<script>location.href='"+request.getContextPath()+"/do/main';</script>");
			 }else {
				 out.println("<script>alert('아이디와 비밀번호를 확인해주세요.'); history.go(-1);</script>");
			 }
			 
		 }
		//로그아웃기능
		 @RequestMapping(value="/logout",method= {RequestMethod.GET})
		 public String logout_get(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
			 request.setCharacterEncoding("UTF-8");
			 response.setContentType("text/html; charset=UTF-8");

			 PrintWriter out = response.getWriter();
			 session = request.getSession();
			 
			 session.invalidate();
			 
	         out.println("<script>alert('로그아웃 되었습니다.'); location.href='"+request.getContextPath()+"/do/main'; </script>");
			 
			 
			 return "/project/main";
		 }
	
	
	//마이페이지
		@RequestMapping(value="/my_page",method= {RequestMethod.GET})
		public String mypage_get() {
			return "/project/mypage";
		}
		//마이페이지 회원정보 수정전 본인확인
		@RequestMapping(value="/my_check", method= {RequestMethod.GET})
		public String my_check_get() {
			return "/project/user_check";
		}
		//회원수정 - 본인확인 - 회원정보 수정 
		@RequestMapping(value="/user_check", method= {RequestMethod.POST})
		public String user_check_post(UserDto dto,HttpServletRequest request, HttpServletResponse response,Model model) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String uid = request.getParameter("uid");
			
			dto.setUid(uid);
			
			UserDto user = userService.user_info(dto);
			
			PrintWriter out = response.getWriter();
			
			
			int result = -1;  
			 
			 
			if(user!=null) {
				//본인확인을 통과한 경우 
				
				model.addAttribute("dto",user);
				
				result = 0;
				
				
				String[] addrlist = user.getUaddress().split("/");
				
				String[] birthlist = user.getUbirth().split("/");
				
				model.addAttribute("addrlist", addrlist);
				model.addAttribute("birthlist",birthlist);
				
			}
			
			model.addAttribute("result", result);
			
			
			return "/project/user_update";
		}
		//회원정보수정
		@RequestMapping(value="/user_update", method= {RequestMethod.POST})
		public void user_update_post(UserDto dto, HttpServletRequest request,HttpServletResponse response) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			//주소
			String address = request.getParameter("zonecode")+"/" + 
							request.getParameter("address") +"/"+
							request.getParameter("address2");
			
			//생년월일
			String birth = request.getParameter("birth_yy")+"/"+
							request.getParameter("birth_mm") +"/"+
							request.getParameter("birth_dd");
			
			dto.setUaddress(address);
			dto.setUbirth(birth);
			
			PrintWriter out = response.getWriter();
			
			
			if(userService.user_update(dto)>0) {
				out.println("<script>alert('회원정보가 수정되었습니다.'); location.href='"+request.getContextPath()+"/do/my_page';</script>");
			}else {
				out.println("<script>alert('관리자에게 문의바랍니다.'); history.go(-1);</script>");
			}
		}
		//회원탈퇴 - 본인확인페이지
		@RequestMapping(value="/my_check_delete", method= {RequestMethod.GET})
		public String user_check_delete() {
			return "/project/user_delete";
		}
		//회원탈퇴
		@RequestMapping(value="/user_delete", method= {RequestMethod.POST})
		public void user_delete(HttpServletRequest request, HttpServletResponse response, UserDto dto) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			//아이디 세션값에서 가져오기 
			HttpSession session = request.getSession();
			
			UserDto temp = (UserDto) session.getAttribute("dto");
			
			dto.setUid(temp.getUid());
			
			PrintWriter out = response.getWriter();
			
			if(userService.user_delete(dto)>0) {
				out.println("<script>alert('회원탈퇴가 정상적으로 완료되었습니다.'); location.href='"+request.getContextPath()+"/do/logout';</script>");
			}else {
				out.println("<script>alert('관리자에게 문의바랍니다.'); history.go(-1);</script>");
			}
			
		}
		//예약확인페이지
		@RequestMapping(value="/reservation",method= {RequestMethod.GET})
		public String reservation_get(HttpServletRequest request, HttpServletResponse response,UserDto dto,Model model) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession();
			
			UserDto temp = (UserDto)session.getAttribute("dto");
			
			
			dto.setUid(temp.getUid());                                                   
			
			
			
			  List<ReservationDto> list = reservationService.reservationList(dto); //예약날짜
			  //수정 yy-mm-dd 
			  Iterator<ReservationDto> iter = list.iterator();
			  
			  while(iter.hasNext()) {
			  
			  ReservationDto tempDto = iter.next();
			  
			  Date date = tempDto.getRdate();
			  
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  
			  tempDto.setRealdate(sdf.format(date));
			  
			  }
			 
			  //오늘날짜
				 Date today = new Date();
				 System.out.println("..............오늘날짜 : " + today);
				  
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				  
				 String today_check = sdf.format(today);
				  
				 System.out.println("...........22222 : " + today_check);
				 
				 
				 model.addAttribute("today_check", today_check);
			
			model.addAttribute("list", list);
			
			model.addAttribute("uname", reservationService.reservationUname(dto));
			return "/project/reservation";
		}
		//예약확인
		@RequestMapping(value="/reservation_check",method= {RequestMethod.GET})
		public String reservation_check_get(HttpServletRequest request,HttpServletResponse response, Model model) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			int rno = Integer.parseInt(request.getParameter("rno"));
			int result = -1;
			
			
			ReservationResultDto dto = reservationService.reservationDetail(rno);
			RoomTypeDto rtdto = reservationService.reservationRoomtype(rno);
			List<OptionDto> optiondto = reservationService.reservationAddOption();
			
			if(dto!=null) {
				result = 0;
				model.addAttribute("dto", dto);
				model.addAttribute("rtdto", rtdto);
				model.addAttribute("optiondto", optiondto);
			}
			
			model.addAttribute("result", result);
			return "/project/reservation_check";
		}
		//예약취소
		@RequestMapping(value="/reservation_delete",method= {RequestMethod.POST})
		public void reservation_delete_post(HttpServletRequest request, HttpServletResponse response,UserDto dto,@RequestParam int rno) throws IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			dto.setUid(request.getParameter("uid"));
			dto.setUname(request.getParameter("uname"));
			
			map.put("uid", dto.getUid());
			map.put("uname",dto.getUname());
			
			
			rno = Integer.parseInt(request.getParameter("rno"));
			map.put("rno", rno);
			
			System.out.println(rno);
			
			
			PrintWriter out = response.getWriter();
			
		
			if(reservationService.reservationDelete(map)>0) {
				out.println("<script>alert('예약취소가 정상적으로 완료되었습니다.'); location.href='"+request.getContextPath()+"/do/reservation';</script>");
				
			}else {
				out.println("<script>alert('예약자성함을 확인해주세요.'); history.go(-1);</script>");
			}
			
		}		
		
		//문의하기 페이지로 이동
		@RequestMapping(value="/myqna_write",method= {RequestMethod.GET})
		public String myqna_write_get(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession();
			UserDto temp = (UserDto)session.getAttribute("dto");
			
			
			
			if(reservationService.reservationUname(temp)!= null) {
				model.addAttribute("uname", temp.getUname());
			}
			
			return "/project/myqna_write";
		}
		
		//문의하기(글작성)
		@RequestMapping(value="/qna_write",method= {RequestMethod.POST})
		public void myqna_write_post(HttpServletRequest request, HttpServletResponse response,HashMap<String,Object> map) throws IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession();
			UserDto temp = (UserDto) session.getAttribute("dto");
			
			//btitle, bcontent, uname, uid, upass
			map.put("uid", temp.getUid());
			
			String upass = request.getParameter("upass");
			temp.setUpass(upass);
			
			String btitle = request.getParameter("btitle");
			String bcontent = request.getParameter("bcontent");
			
			map.put("btitle", btitle);
			map.put("bcontent", bcontent);
			
			
			PrintWriter out = response.getWriter();
			
			if(userService.user_login(temp)>0 && boardService.boardWriter(map)>0) {
				out.println("<script>alert('문의글이 정상적으로 등록되었습니다.'); location.href='"+request.getContextPath()+"/do/myqna_write';</script>");
			}else if(userService.user_login(temp)<0 && boardService.boardWriter(map)>0){
				out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>");
			}else {
				out.println("<script>alert('관리자에게 문의바랍니다.'); history.go(-1);</script>");
			}
			
		}
		
		
		//나의문의내역
		@RequestMapping(value="/myqna",method= {RequestMethod.GET})
		public void myqna_get(HttpServletRequest request, HttpServletResponse response, UserDto dto, Model model) throws IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			HttpSession session = request.getSession();
			UserDto temp = new UserDto();
			/* temp = (UserDto) session.getAttribute("dto"); */
			
			
			
			List<BoardResultDto> list = boardService.boardList(dto);
			System.out.println(".............List목록 : " + list.toString());
			if(list != null) {
				model.addAttribute("list", list);
			}
			
			//여기 고친 부분(고객문의 부분이 안넘어감)
			
			if(session.getAttribute("dto") == null) {
				out.println("<script>alert('로그인 후에 이용해주세요.');  location.href='"+request.getContextPath()+"/do/login_page'; </script>");
			
			}else {
				temp = (UserDto) session.getAttribute("dto"); 
				dto.setUid(temp.getUid());
				out.println("<script>location.href='"+request.getContextPath()+"/do/myqna_list';</script>");
			}
			
			/* return "/project/myqna_list"; */
		}
		
		@RequestMapping(value="/myqna_list",method= {RequestMethod.GET})
		public String myqnaList_get(HttpServletRequest request, HttpServletResponse response, UserDto dto, Model model) throws IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			
			HttpSession session = request.getSession();
			UserDto temp = (UserDto) session.getAttribute("dto");
			
			dto.setUid(temp.getUid());
			
			List<BoardResultDto> list = boardService.boardList(dto);
			System.out.println(".............List목록 : " + list.toString());
			if(list != null) {
				model.addAttribute("list", list);
			}
		
			return "/project/myqna_list";
		}
		
		
		
		//나의문의내역_original_1
		/*
		@RequestMapping(value="/myqna",method= {RequestMethod.GET})
		public String myqna_get(HttpServletRequest request, HttpServletResponse response, UserDto dto, Model model) throws IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			
			HttpSession session = request.getSession();
			UserDto temp = (UserDto) session.getAttribute("dto");
			
			dto.setUid(temp.getUid());
			
			List<BoardResultDto> list = boardService.boardList(dto);
			System.out.println(".............List목록 : " + list.toString());
			if(list != null) {
				model.addAttribute("list", list);
			}
		
			return "/project/myqna_list";
		}
		 */
		
		
		
		//나의문의내역 - 자세히보기
		/*
		 * @RequestMapping(value="/myqna_detail",method= {RequestMethod.POST}) public
		 * String myqna_detail_post() { return "/project/myqna_detail"; }
		 */
		
		
		//나의문의내역 - 수정하기
		@RequestMapping(value="/myqna_edit", method= {RequestMethod.POST})
		public void myqna_edit_post(HttpServletRequest request, HttpServletResponse response) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			

			HttpSession session = request.getSession();
			UserDto temp = (UserDto) session.getAttribute("dto");
			
			int bno = Integer.parseInt(request.getParameter("bno"));
			String uid = temp.getUid();
			String upass = request.getParameter("upass");
			
			String btitle = request.getParameter("btitle_edit");
			String bcontent = request.getParameter("bcontent_edit");
			
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			map.put("bno", bno);
			map.put("btitle", btitle);
			map.put("bcontent", bcontent);
			map.put("uid", uid);
			map.put("upass", upass);
			
			
			PrintWriter out = response.getWriter();
			
			if(boardService.boardUpdate(map)>0) {
				//문의글 수정 완료한 경우
				out.println("<script>alert('문의글 수정 완료하였습니다.'); location.href='"+request.getContextPath()+"/do/myqna';</script>");
			}else {
				out.println("<script>alert('비밀번호를 확인해주세요.'); location.href='"+request.getContextPath()+"/do/myqna';</script>");
			}
			
			//return "/project/myqna_list";
		}
		
		//나의문의내역 - 삭제
		@RequestMapping(value="/myqna_delete",method= {RequestMethod.POST})
		public void myqna_delete_post(HttpServletRequest request, HttpServletResponse response) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession();
			UserDto temp = (UserDto)session.getAttribute("dto");
			
			String uid = temp.getUid();
			String upass = request.getParameter("upass");
			int bno = Integer.parseInt(request.getParameter("bno"));
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			map.put("uid", uid);
			map.put("upass", upass);
			map.put("bno", bno);
			
			PrintWriter out = response.getWriter();
			
			if(boardService.boardDelete(map)>0) {
				out.println("<script>alert('문의글이 삭제되었습니다.'); location.href='"+request.getContextPath()+"/do/myqna'</script>");
			}else {
				out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>");
			}
			
		}
		
		//////////////////////////////////
		//관리자페이지

		//예약대기리스트 이동
		@RequestMapping(value="/manager_page", method= {RequestMethod.GET})
		public String manager_my_page_get(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			List<ReservationDto> list = managerService.reservationList_m();
			
			if(list != null) {
				model.addAttribute("list", list);
			}
			
			 //오늘날짜
			 Date today = new Date();
			 //System.out.println("..............오늘날짜 : " + today);
			  
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  
			 String today_check = sdf.format(today);
			  
			 //System.out.println("...........22222 : " + today_check);
			 
			 
			 model.addAttribute("today_check", today_check);
			
			return "/project/manager_mypage";
		}
	
		//예약리스트자세히보기
		@RequestMapping(value="/manager_reservation_detail",method= {RequestMethod.GET})
		public String manager_reservation_detail_get(HttpServletRequest request, HttpServletResponse response,Model model)throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			int rno = Integer.parseInt(request.getParameter("rno"));
			int result = -1;
			
			
			ReservationResultDto dto = reservationService.reservationDetail(rno);
			RoomTypeDto rtdto = reservationService.reservationRoomtype(rno);
			List<OptionDto> optiondto = reservationService.reservationAddOption();
			
			if(dto!=null) {
				result = 0;
				model.addAttribute("dto", dto);
				model.addAttribute("rtdto", rtdto);
				model.addAttribute("optiondto", optiondto);
			}
			
			model.addAttribute("result", result);
			return "/project/manager_reservation_detail";
		}
		
		//예약승인하기
		@RequestMapping(value="manager_reservation_check", method= {RequestMethod.GET})
		public void  manager_reservation_check_get(HttpServletRequest request, HttpServletResponse response) throws IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			int rno = Integer.parseInt(request.getParameter("rno"));
			
			int result = managerService.reservationCheck_m(rno);
			
			PrintWriter out = response.getWriter();
			
			
			if(result>0) {
				out.println("<script>alert('승인완료되었습니다.');location.href='"+request.getContextPath()+"/do/manager_page';</script>");
			}else {
				out.println("<script>alert('관리자에게 문의바랍니다.');location.href='"+request.getContextPath()+"/do/manager_page';</script>");
			}
			
		}
		
		//예약완료리스트 이동
		@RequestMapping(value="manager_reservation_com_page",method= {RequestMethod.GET})
		public String manager_reservation_com_page_get(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			List<ReservationDto> list = managerService.reservationComList_m();
			
			if(list != null) {
				model.addAttribute("list", list);
			}
			
			
			
			return "/project/manager_reservation_complete";
		}
		
		
		//답변대기리스트페이지
		@RequestMapping(value="manager_board_answer_page",method= {RequestMethod.GET})
		public String manager_board_answer_page_get(HttpServletRequest request, HttpServletResponse response , Model model) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			/*
			List<HashMap<String,Object>> list = managerService.boardList_m();
			
			System.out.println(".........list : "+list);
			
			List<UserDto> ulist = new ArrayList<UserDto>();
			List<BoardDto> blist = new ArrayList<BoardDto>();
			
			
			
			 * Iterator iter = list.iterator(); while(iter.hasNext()) { HashMap temp =
			 * (HashMap) iter.next(); int uno = Integer.parseInt((String) temp.get("uno"));
			 * String uname = (String) temp.get("uname");
			 * 
			 * 
			 * }
			 */
			List<BoardResultDto> list = managerService.boardList_m();
			
			//System.out.println(".......list : " + list);
			
			if(list!=null) {
				model.addAttribute("list", list);
			}
			
			return "/project/manager_answer_before";
		}
		
		//매니저-문의글 자세히보기
		@RequestMapping(value="manager_answer_detail",method= {RequestMethod.GET})
		public String manager_answer_detail_get(HttpServletRequest request, HttpServletResponse response,Model model,int bno) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			bno = Integer.parseInt(request.getParameter("bno"));
			
			BoardResultDto dto = managerService.boardDetail_m(bno);
			
			if(dto!=null) {
				model.addAttribute("dto", dto);
			}
			
			return "/project/manager_board_detail";
		}
		
		//답변달기
		@RequestMapping(value="/insert_answer",method= {RequestMethod.POST})
		public void insert_answer_post(HttpServletRequest request, HttpServletResponse response,AnswerDto dto) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String answer = request.getParameter("answer");
			
			int bno = Integer.parseInt(request.getParameter("bno"));
			
			dto.setAnswer(answer);
			dto.setBno(bno);
			
			
			PrintWriter out = response.getWriter();
			
			if(managerService.commentInsert(dto)>0) {
				out.println("<script>alert('답변등록이 완료되었습니다.'); location.href='"+request.getContextPath()+"/do/manager_board_answer_com_page';</script>");
			}else {
				out.println("<script>alert('관리자에게 문의바랍니다.'); history.go(-1);</script>");
			}
		
		}
		
		
		//답변완료리스트페이지
		@RequestMapping(value="manager_board_answer_com_page",method= {RequestMethod.GET})
		public String manager_board_answer_com_page_get(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			
			List<BoardResultDto> list = managerService.boardComList_m();
			
			//System.out.println(".......list : " + list);
			
			if(list!=null) {
				model.addAttribute("list", list);
			}
			
			
			return "/project/manager_answer_complete";
		}
		
		
		@RequestMapping("/rePage")
		public String rePage(@RequestParam("cno") int cno,Model model, 
				@RequestParam("rcheckin") String rcheckin,@RequestParam("rcheckout") String rcheckout,
			@RequestParam("adult") int adultnum, @RequestParam("kid") int kidnum) throws ParseException {
		
			HotelDescDto dto = new HotelDescDto();
			dto.setCno(cno);
				
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(rcheckin);
			Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(rcheckout);
			
			long diffDays = ((date2.getTime() - date1.getTime()) / 1000 )  / (24*60*60);  
			
			
			model.addAttribute("days", diffDays);
			model.addAttribute("hotel", hoteldescservice.list(dto));
			model.addAttribute("adultnum" , adultnum);
			model.addAttribute("kidnum" , kidnum);
			model.addAttribute("rcheckin" , rcheckin);
			model.addAttribute("rcheckout" , rcheckout);
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("rcheckin", rcheckin);
			map.put("rcheckout", rcheckout);
			
			if(cno == 4) {
				map.put("cno", "1,2,3");
			}else {
				map.put("cno", cno);
			}
			
			model.addAttribute("room", repageservice.reList(map));
			
			////////////  예약
			
			MJCalc cal = new MJCalc();
			Calendar  today = Calendar.getInstance(); 
			int month = today.get(Calendar.MONTH)+1;
			int year = today.get(Calendar.YEAR);
			
			model.addAttribute("myCal",cal.mycalendar());
			
			System.out.println("이거 현재달컨트롤러임.........................................." + cal.toString());
			model.addAttribute("month", month);
			model.addAttribute("year", year);
			
			return "/project/rePage"; 
		}
	
		@RequestMapping("hotel_lo")
		public void hotel_lo(@RequestParam("id") String id, HotelDescDto dto,
			HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			HotelDescDto dto1 = new HotelDescDto();
			
	
			if(id.equals("all_hotel")) {
				dto.setCno(4);
			}
			else if(id.equals("seoul_hotel")) {
				dto.setCno(1);
				
			}
			else if(id.equals("busan_hotel")) {
				dto.setCno(2);
				
			}
			else if(id.equals("jeju_hotel")) {
				dto.setCno(3);
				
			}
			JsonObject jsdto = new JsonObject();
			dto1 = hoteldescservice.list(dto);
			jsdto.addProperty("hname", dto1.getHname());
			jsdto.addProperty("hdesc", dto1.getHdesc());
			jsdto.addProperty("haddress", dto1.getHaddress());
			jsdto.addProperty("cimg", dto1.getCimg());
			jsdto.addProperty("cno", dto1.getCno());
			out.println(jsdto);
		}
		
		@RequestMapping("total_price")
		public void total_price(@RequestParam("num1") int num1,@RequestParam("opno1") int opno1,
				@RequestParam("num2") int num2,@RequestParam("opno2") int opno2,
				@RequestParam("num3") int num3,@RequestParam("opno3") int opno3,
				@RequestParam("num4") int num4,@RequestParam("opno4") int opno4,
				@RequestParam("opno5") int opno5,
			HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			System.out.println(num1);
			
			HashMap<String,Integer> map = new HashMap<>();
			map.put("num1", num1 );
			map.put("opno1", opno1);
			map.put("num2", num2 );
			map.put("opno2", opno2);
			map.put("num3", num3 );
			map.put("opno3", opno3);
			map.put("num4", num4 );
			map.put("opno4", opno4);
			map.put("opno5", opno5);
			System.out.println(map);
			out.println(repageservice.total_price(map));
		}
		
		//after		
		@RequestMapping("after")
		public void after(ReservationDto dto , Model model,
				HttpServletRequest request, HttpServletResponse response ) 
						throws ServletException, IOException{
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			HttpSession session = request.getSession();
			
			PrintWriter out = response.getWriter();
			System.out.println( dto.getRcheckin() + "////////" + dto.getRcheckout());
			
			
			UserDto dto1 = new UserDto();
			dto1 = (UserDto)session.getAttribute("dto");
					
			dto1 = userService.user_uno(dto1); 
			dto.setUno( dto1.getUno() );
			
			int result = reservationService.reserve(dto);
			if(result >0) {
				out.println("<script>alert('예약이 정상적으로 완료되었습니다.');  location.href='"+request.getContextPath()+"/do/reserveDone'; </script>" );
			}
			else {
				out.println("<script>alert('관리자에게 문의바랍니다.'); history.go(-1);</script>");
			}
		}
		
		@RequestMapping("reserveDone")
		public String after_re(Model model,
				HttpServletRequest request, HttpServletResponse response ) 
						throws ServletException, IOException{
			
			HttpSession session = request.getSession();
			
			UserDto dto = new UserDto();
			dto = (UserDto)session.getAttribute("dto");
			
			model.addAttribute("dto", reservationService.reservation_done(dto));
	
			return "/project/reDonePage";
		}
		
		@RequestMapping("sort")
		public String sort(@RequestParam("cno") int cno,Model model, @RequestParam("sort") String sort,
				@RequestParam("adult") int adultnum, @RequestParam("kid") int kidnum,
				@RequestParam("rcheckin") String rcheckin,@RequestParam("rcheckout") String rcheckout ) throws ParseException {
				
			HotelDescDto dto = new HotelDescDto();
			dto.setCno(cno);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(rcheckin);
			Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(rcheckout);
			
			long diffDays = ((date2.getTime() - date1.getTime()) / 1000 )  / (24*60*60);  
			
			
			model.addAttribute("days", diffDays);
			
					
			model.addAttribute("hotel", hoteldescservice.list(dto));
			model.addAttribute("adultnum" , adultnum);
			model.addAttribute("kidnum" , kidnum);
			model.addAttribute("sort" , sort);
			model.addAttribute("rcheckin" , rcheckin);
			model.addAttribute("rcheckout" , rcheckout);
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("rcheckin", rcheckin);
			map.put("rcheckout", rcheckout);
			
			if(cno == 4) {
				map.put("cno", "1,2,3");
			}else {
				map.put("cno", cno);
			}	
					
			if(sort.equals("region")){
				model.addAttribute("room", repageservice.reList(map));
			}
			else if(sort.equals("high")) {
				model.addAttribute("room", repageservice.reListHigh(map));
			}else if(sort.equals("low")) {
				model.addAttribute("room", repageservice.reListLow(map));
			}			
			/* model.addAttribute("list", hotelservice.list()); */		
			MJCalc cal = new MJCalc();
			Calendar  today = Calendar.getInstance(); 
			int month = today.get(Calendar.MONTH)+1;
			int year = today.get(Calendar.YEAR);
					
			model.addAttribute("myCal",cal.mycalendar());
			model.addAttribute("month", month);
			model.addAttribute("year", year);			
					
			return "/project/rePage";
		}
		
		@RequestMapping("nextMonth")
		public void nextMonth(@RequestParam("month") int month,@RequestParam("year") int year,
			HttpServletRequest request, HttpServletResponse response ) 
			throws ServletException, IOException{
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			
			NextCalc next = new NextCalc();
			JsonArray list1 = new JsonArray();
			ArrayList<String> list = new ArrayList<>();
			list =  next.nextcal(month,year);
			for(int i = 0; i<list.size(); i++) {
				JsonObject dto = new JsonObject();
				dto.addProperty("day", list.get(i));
				list1.add(dto);
			}
			out.println(list1);
			
		}
		
		@RequestMapping("preMonth")
		public void preMonth(@RequestParam("month") int month,@RequestParam("year") int year,
				HttpServletRequest request, HttpServletResponse response ) 
				throws ServletException, IOException{
						
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();
						
				PreCalc pre = new PreCalc();
				JsonArray list1 = new JsonArray();
				ArrayList<String> list = new ArrayList<>();
				list =  pre.precal(month,year);
				for(int i = 0; i<list.size(); i++) {
					JsonObject dto = new JsonObject();
					dto.addProperty("day", list.get(i));
					list1.add(dto);
				}
				out.println(list1);
		}
						
		//호텔 소개
	      @RequestMapping(value="hotel_info",method= {RequestMethod.GET})
	      public String hotel_info() {
	         
	         return "/project/hotel_info";
	      }
	      
	      @RequestMapping(value="hotel_info_mj",method= {RequestMethod.GET})
	      public String hotel_info_mj() {
	         
	         return "/project/hotel_info_mj";
	      }
	      
	      
	      @RequestMapping(value="hotel_info_dg",method= {RequestMethod.GET})
	      public String hotel_info_dg() {
	         
	         return "/project/hotel_info_dg";
	      }
	      
	      
	      @RequestMapping(value="hotel_info_yr",method= {RequestMethod.GET})
	      public String hotel_info_yr() {
	         
	         return "/project/hotel_info_yr";
	      }
	      
	    //아이디 중복확인
	      @RequestMapping("check_doubleid")
	      public void check_doubleid(@RequestParam("uid") String uid, UserDto dto, HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	         request.setCharacterEncoding("UTF-8");
	         response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         int result = 0;
	         
	         dto.setUid(uid);
	         result = userService.doubleid(dto);
	         
	         
	         if(result > 0) {
	            out.println("<span  style=\"color:red\">아이디가 존재합니다. 다시 입력해주세요</span>");  
	         }else {
	            out.println("아이디 사용가능합니다.");
	         }	            
	      }
	      
	      
	      //아이디 찾기 페이지로
	      @RequestMapping("searchid_page")
	      public String searchid_page() {
	           
	    	  return "/project/search_id";
	      }
   
	      //비밀번호 찾기 페이지로
	      @RequestMapping("searchpass_page")
	      public String searchpass_page() {
	           
	    	  return "/project/search_pass";
	      }
	      
	      
	      //아이디 찾기
	      @RequestMapping("searchid")
	      public String searchid(UserDto dto, Model model,HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	    	  request.setCharacterEncoding("UTF-8");
		      response.setContentType("text/html; charset=UTF-8");
		      PrintWriter out = response.getWriter();
	    	  
		      List<UserDto> list = new ArrayList<>(); 
		      list = userService.searchid(dto);
		      
		      model.addAttribute("list", list);
		      
		      return "/project/afterSearch_id";
	      }
	      
	      //비밀번호 찾기
	      @RequestMapping("searchpass")
	      public void searchpass(UserDto dto, Model model,HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	    	  request.setCharacterEncoding("UTF-8");
		      response.setContentType("text/html; charset=UTF-8");
		      PrintWriter out = response.getWriter();	      
		      
		      int result = userService.searchpass(dto);
		      
		      String uid = dto.getUid();
		      if(result >0) {
					out.println("<script>alert('비밀번호 변경페이지로 이동합니다.');  location.href='"+request.getContextPath()+"/do/afterSearch_pass?uid="+uid+"'; </script>" );
				}
				else {
					out.println("<script>alert('해당하는 정보가 없습니다.'); history.go(-1);</script>");
				}
		      
	      }
	      
	      //비밀번호 바꾸기 페이지로
	      @RequestMapping("afterSearch_pass")
	      public String afterSearch_pass(@RequestParam("uid") String uid,Model model) {
	    	  model.addAttribute("uid", uid);
		      return "/project/afterSearch_pass";
	      }
	      
	      //비밀번호 바꾸기 
	      @RequestMapping("updatepass")
	      public void updatepass(UserDto dto, Model model,HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	    	  request.setCharacterEncoding("UTF-8");
		      response.setContentType("text/html; charset=UTF-8");
		      PrintWriter out = response.getWriter();	      
		      
		      int result = userService.updatepass(dto);
		      if(result > 0) {
					out.println("<script>alert('비밀번호 변경이 성공적으로 완료되었습니다.');  location.href='"+request.getContextPath()+"/do/login_page'; </script>" );
				}
				else {
					out.println("<script>alert('관리자에게 문의바랍니다.');  location.href='"+request.getContextPath()+"/do/login_page'; </script>");
				}
		      
	      }
	      
	      
	      
	      
	      
	      
	      
	      
	      
}
