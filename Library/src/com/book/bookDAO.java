package com.book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class bookDAO {

	private static bookDAO instance = new bookDAO();
	private bookDAO() {
		
	}
	
	public static bookDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() {
		
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public List<bookDTO> getbook(String choice, String w) {
		List<bookDTO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		bookDTO dto = null;
		String sql="SELECT bname, writer, location, amount, comments, publisher "
					+"FROM books WHERE ";
		String condition = "";
		if(choice.equals("1")) condition = "bname like '%"+w+"%'";
		else if(choice.equals("2")) condition = "writer like '%"+w+"%'";
		else if(choice.equals("3")) condition = "publisher like '%" +w+"%'";
		
		sql = sql + condition;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
						
			while (rs.next()) {
				dto = new bookDTO();
				dto.setBname(rs.getString("bname"));
				dto.setWriter(rs.getString("writer"));
				dto.setLocation(rs.getString("location"));
				dto.setAmount(rs.getString("amount"));
				dto.setComments(rs.getString("comments"));
				dto.setPublisher(rs.getString("publisher"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return list;
	}
	
}
