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
	
	public List<bookDTO> getbook(int page,String choice, String keyword) {
		List<bookDTO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		bookDTO dto = null;
		
		String sql= "SELECT * "+ 
					"FROM (SELECT rownum AS rank,bname, writer, location, amount, comments, publisher "+
					"FROM ("+"SELECT rownum, bname, writer, location, amount, comments, publisher "
							+"FROM books WHERE rownum <="+ Integer.toString(page) + " AND ";
		
		
		String condition = "";
		
		condition = choice+" like '%"+keyword+"%'";
				
		sql = sql + ( condition + ")) WHERE rank >= " + Integer.toString(page-9) );
		
		System.out.println(sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			//pstmt.setString(1, Integer.toString(page));
			//pstmt.setString(2, choice);
			//pstmt.setString(3, keyword);
			//page = page -9;
			//pstmt.setString(4, Integer.toString(page));
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
			
			sql = "SELECT count(*) AS total FROM books "
				  +"WHERE "+ condition;
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setTotalpage(rs.getInt("total"));
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
	
	public void returnBook(int id) {
		
		Connection conn = null;
		
		try {
			conn = getConnection();		
			CallableStatement cstmt = conn.prepareCall("{call state_proc(?,?)}");
			cstmt.setInt(1, id);
			cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
			
			int cnt = cstmt.executeUpdate();
			int check = cstmt.getInt(2);
			
			if(check < 0) System.out.println("No Data");
			else System.out.println("Success");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
