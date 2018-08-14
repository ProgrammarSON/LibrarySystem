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
		String sql = "";
		String condition = "";
		String total="";
		int cnt=0;
				
		
		try {
			conn = getConnection();
		
			condition = choice+" like '%"+keyword+"%'";
			
			sql = "SELECT count(*) AS total FROM books "
					  +"WHERE "+ condition;
				
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			if(rs.next()) {
				total = rs.getString("total");
			}
			
			if(total.equals("0")) {
				dto = new bookDTO();
				dto.setBname(" ");
				dto.setWriter(" ");
				dto.setLocation(" ");
				dto.setAmount(" ");
				dto.setComments(" ");
				dto.setPublisher(" ");
				list.add(dto);
				dto.setTotalpage(1);
				list.add(dto);
			}else {			
			
			sql= "SELECT * "+ 
					"FROM (SELECT rownum AS rank,bname, writer, location, amount, comments, publisher "+
					"FROM ("+"SELECT rownum, bname, writer, location, amount, comments, publisher "
							+"FROM books WHERE rownum <="+ Integer.toString(page) + " AND ";
		
				
			sql = sql + ( condition + ")) WHERE rank >= " + Integer.toString(page-9) );
			
			pstmt = conn.prepareStatement(sql);
						
			rs = pstmt.executeQuery();
			
									
			while (rs.next()) {
				dto = new bookDTO();
				String bname = rs.getString("bname");
				if(bname == null) bname = " ";
				String writer = rs.getString("writer");
				if(writer == null) writer = " ";
				String location = rs.getString("location");
				if(location == null) location = " ";
				String amount = rs.getString("amount");
				if(amount == null) amount = " ";
				String comments = rs.getString("comments");
				if(comments == null) comments=" ";
				String publisher = rs.getString("publisher");
				if(publisher == null) publisher = " ";
				dto.setBname(bname);
				dto.setWriter(writer);
				dto.setLocation(location);
				dto.setAmount(amount);
				dto.setComments(comments);
				dto.setPublisher(publisher);
				list.add(dto);
			}
			dto.setTotalpage(Integer.parseInt(total));
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
	
	public int returnBook(String id) {
		
		Connection conn = null;
		CallableStatement cstmt = null;
		int check=0;
		try {
			conn = getConnection();		
			cstmt = conn.prepareCall("{call return_proc(?,?)}");
			cstmt.setString(1, id);
			cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
			
			int cnt = cstmt.executeUpdate();
			check = cstmt.getInt(2);
			
			if(check == 0) System.out.println("No Data");
			else System.out.println("Success");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(cstmt != null) cstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return check;
	}
	
	public int rentalBook(String id) {
		
		Connection conn = null;
		CallableStatement cstmt=null;
		int check = 0;
		try {
			conn = getConnection();		
			cstmt = conn.prepareCall("{call rental_proc(?,?)}");
			cstmt.setString(1, id);
			cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
			
			int cnt = cstmt.executeUpdate();
			check = cstmt.getInt(2);
			
			if(check < 0) System.out.println("No Data");
			else System.out.println("Success");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(cstmt != null) cstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return check;
	}
	
	public int insertBook(bookDTO dto) {
		Connection conn = null;
		CallableStatement cstmt=null;
		int check = 1;
		try {
			conn = getConnection();
			cstmt = conn.prepareCall("{call insertbook_proc(?,?,?,?,?,?,?)");
			cstmt.setString(1, dto.getBname());
			cstmt.setString(2, dto.getWriter());
			cstmt.setString(3, dto.getLocation());
			cstmt.setString(4, dto.getAmount());
			cstmt.setString(5, dto.getComments());
			cstmt.setString(6, dto.getPublisher());
			cstmt.registerOutParameter(7,java.sql.Types.INTEGER);
			
			int cnt = cstmt.executeUpdate();
			check = cstmt.getInt(7);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
				try {
					if(conn != null) conn.close();
					if(cstmt != null) cstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return check;
	}
	
	   public List<bookDTO>getRecord(int page) {
		      List<bookDTO> list = new ArrayList<>();
		      bookDTO dto = null;
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      String total = "";
		      String sql = "SELECT count(*) AS total FROM record";
		      
		      try {
		         conn = getConnection();
		         pstmt = conn.prepareStatement(sql);
		         rs = pstmt.executeQuery();
		         
		         if(rs.next()) {
		            total = rs.getString("total");
		         }
		         
		         if(total.equals("0")) {
		            dto = new bookDTO();
		            dto.setBid(" ");
		            dto.setBname(" ");
		            dto.setWriter(" ");
		            dto.setPublisher(" ");
		            dto.setState(" ");
		            dto.setDate(" ");
		            list.add(dto);
		            dto.setTotalpage(1);
		            list.add(dto);
		         }else {
		            sql= "SELECT * "+ 
		                  "FROM (SELECT rownum AS rank,bid,bname, writer, publisher,state, bdate "+
		                  "FROM ("+"SELECT rownum, bid, bname, writer, publisher, state, bdate "
		                        +"FROM record WHERE rownum <="+ total + " ORDER BY bdate DESC)) "
		                  +"WHERE rank between " + Integer.toString(page-9) + " AND "+page;
		            System.out.println(sql);
		            pstmt = conn.prepareStatement(sql);
		            rs = pstmt.executeQuery();
		            
		            while(rs.next()) {
		               dto = new bookDTO();
		               dto.setBid(rs.getString("bid"));
		               dto.setBname(rs.getString("bname"));
		               dto.setWriter(rs.getString("writer"));
		               dto.setPublisher(rs.getString("publisher"));
		               dto.setState(rs.getString("state"));
		               dto.setDate(rs.getString("bdate"));
		               list.add(dto);
		            }
		            dto.setTotalpage(Integer.parseInt(total));
		            list.add(dto);
		         }
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }finally {
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
	   
	   public int deleteBook(String id) {
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   String sql = "DELETE FROM books WHERE bid=?";
		   int check = 0;
		   
		   try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			check = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	         try {
		            if(pstmt != null) pstmt.close();
		            if(conn != null) conn.close();
		         } catch (Exception e2) {
		            // TODO: handle exception
		            e2.printStackTrace();
		         }
		      }
		   return check;	   
		   
	   }
	
}
