package com.company.sbgrm000;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class JDBC003_mybatis {
	
		@Autowired
		private DataSource ds;
		
		@Autowired
		private SqlSessionFactory sqlFactory;
		
		@Test
		public void testSqlSessionFactory() throws Exception{
			SqlSession session = sqlFactory.openSession();
			Connection conn = ds.getConnection();
					
			System.out.println(".......................3-1. : " + sqlFactory);
			System.out.println(".......................3-2. : " + session);
			if(conn != null) {
				System.out.println(".......................3-3. : " + conn);
			}
		}
}
