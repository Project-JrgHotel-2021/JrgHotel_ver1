package com.company.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint; 
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect; 
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {
  @Around(    "execution(* com.company.controller.*Controller.*(..))"
		 +" or execution(* com.company.service.*Impl.*(..))" 
		 +" or execution(* com.company.sbgrm001.*Controller.*(..))"
		 +" or execution(* com.company.mapper.*Mapper.*(..))")
  public Object logTime2(ProceedingJoinPoint pjp) {
	log.info("..................................................... @Around multi-setting : 호출이전이후 START");
    long start = System.currentTimeMillis();
    
    log.info("Target: " + pjp.getTarget());
    log.info("Param: " + Arrays.toString(pjp.getArgs()));

    Object result = null;    
    try { result = pjp.proceed(); }
    catch (Throwable e) {  e.printStackTrace(); }
    
    long end = System.currentTimeMillis();
    
    log.info("TIME: "  + (end - start));
	log.info(".................................................... @Around multi-setting : 호출이전이후 END");
    return result;
  }
}
