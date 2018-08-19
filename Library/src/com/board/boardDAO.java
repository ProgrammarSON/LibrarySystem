package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDAO {
	private static boardDAO instance = new boardDAO();
	private boardDAO() {
		
	}	
	public static boardDAO getInstance() {
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
	
	public int insertBoard(boardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		int check = 0;
		sql.append("INSERT INTO boards ");
		sql.append("VALUES(bod_seq.nextval,?,?,sysdate,1,?)");
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getComments());
			check = pstmt.executeUpdate();
			
			if(check == 1) System.out.println("Success");
			else System.out.println("fail");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return check;
	}
	
	public List<boardDTO> getBoardList(int page){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boardDTO dto = null;
		List<boardDTO> list = new ArrayList<>();
		String total = "";		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT count(*) AS total FROM boards");
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getString("total");
				pstmt.close();
				rs.close();
			}
			
			if(total.equals("0")) {
				dto = new boardDTO();
				dto.setComments(" ");
				dto.setHits(" ");
				dto.setId(" ");
				dto.setPdate(" ");
				dto.setTitle(" ");
				dto.setWriter(" ");
				list.add(dto);
			}else {
				sql.delete(0, sql.length());
				sql.append("SELECT * ");
				sql.append("FROM (SELECT rownum rank, id, title, writer, pdate, hits ");
				sql.append("FROM (SELECT rownum, id, title, writer, pdate, hits ");
				sql.append("FROM boards WHERE rownum <= ?)) ");
				sql.append("WHERE rank between ? AND ?");
				
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, total);
				pstmt.setInt(2, page-9);
				pstmt.setInt(3, page);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					dto = new boardDTO();
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setWriter(rs.getString("writer"));
					dto.setPdate(rs.getString("pdate"));
					dto.setHits(rs.getString("hits"));
					list.add(dto);
				}
				dto.setTotalpage(Integer.parseInt(total));
				list.add(dto);
			}
		} catch (Exception e) {
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

	public boardDTO getBoard(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String hit="";
		boardDTO dto = null;
		StringBuffer sql = new StringBuffer();
		int check=0;
		sql.append("SELECT id, title, writer, pdate, hits, comments ");
		sql.append("FROM boards ");
		sql.append("WHERE id = ?");
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new boardDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setPdate(rs.getString("pdate"));
				hit = rs.getString("hits");
				dto.setHits(hit);
				dto.setComments(rs.getString("comments"));
				
				pstmt.close();
				sql.delete(0, sql.length());
				
				sql.append("UPDATE boards ");
				sql.append("SET hits=? ");
				sql.append("WHERE id=?");
				
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, Integer.parseInt(hit)+1);
				pstmt.setString(2, id);
				check = pstmt.executeUpdate(); 
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
		return dto;
	}
}
