package com.company.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.company.dto.AnswerDto;
import com.company.service.ManagerService;

@RequestMapping("/co/*")
@RestController
public class CommentController {

	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(value="/comment_delete",produces="application/json; charset=UTF-8" )
	@ResponseBody
	public String comment_delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		//답변삭제 후 -> bcheck='N'으로
		//답변 전 입니다 default값 넣기 
		AnswerDto dto = new AnswerDto();
		dto.setAno(ano);
		dto.setBno(bno);
		
		
		String	result = ""+managerService.commentDelete(dto);
		
		
		return result;
	}
	
	@RequestMapping(value="/comment_update",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String comment_update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		String answer = request.getParameter("answer");
		
		AnswerDto dto = new AnswerDto();
		dto.setAno(ano);
		dto.setAnswer(answer);
		
		String result = "-1";
		
		if(managerService.commentUpdate(dto)>0) {
			result = "1";
		}
		
		return result;
	}
}
