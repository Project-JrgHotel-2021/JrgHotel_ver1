package com.company.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationDto {

	private int rno, rspa, rswim, rbreakfast,rbar,bedno,radult,rkid,uno,mno,hno,rtotalprice;
	private String raddbed,rnote,rcheckin,rcheckout, checkreservation,realdate,uname,uid;
	private Timestamp rdate;
}
