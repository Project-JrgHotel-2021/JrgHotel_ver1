package com.company.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class ExceptionAdvice {
	
	// 500에러
	@ExceptionHandler(Exception.class)
	public String except(Exception ex , Model model) {
		log.error("Exception........." + ex.getMessage() );
		model.addAttribute("exception" , ex);
		log.error(model);
		return "project/error/error_page500";
	}
	
	// 404에러
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String except2(NoHandlerFoundException ex )  {
		return "project/error/error_page404";
	}
} 
