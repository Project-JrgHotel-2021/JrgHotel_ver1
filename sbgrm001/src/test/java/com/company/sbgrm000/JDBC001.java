package com.company.sbgrm000;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBC001 {
	
	@Test
	public void testConnection() throws Exception{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false","root","daegoo0852");
			if(conn != null) { System.out.println("...................1 : " + conn);  }
		}catch(Exception e) {e.printStackTrace(); }
	}
}
