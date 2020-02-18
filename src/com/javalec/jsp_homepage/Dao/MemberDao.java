package com.javalec.jsp_homepage.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.jsp_homepage.Dto.MemberDto;



public class MemberDao {
	
	public static final int MEMBER_NONEXISTENT=0;
	public static final int MEMBER_EXISTENT=1;
	public static final int MEMBER_JOIN_FAIL=0;
	public static final int MEMBER_JOIN_SUCCESS=1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD=0;
	public static final int MEMBER_LOGIN_SUCCESS=1;
	public static final int MEMBER_LOGIN_IS_NOT=-1;
	
	DataSource dataSource;
	
	public MemberDao() {
		// MemberDao Auto-generated constructor stub
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void JoinOK(String id, String pw, String pw_check, String name, String eMail, Timestamp time, String address) {
		// TODO Auto-generated method stub
		
		if(confirmId(id) == 1) {
			
		}
		int ri = dao.insertMember(dto);
		
		
		
	}
	
	
	public int insertMember(MemberDto dto) {
		int ri=0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into members values(?, ?, ?, ?, ?, ?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.geteMail());
			pstmt.setTimestamp(5, dto.getrDate());
			pstmt.setString(6, dto.getAddress());
			pstmt.executeUpdate();
			ri = MemberDao.MEMBER_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public int confirmId(String id) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where id = ?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			if(set.next()) {
				ri = MemberDao.MEMBER_EXISTENT;
			} else {
				ri = MemberDao.MEMBER_NONEXISTENT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public int userCheck(String id, String pw) {
		int ri = 0;
		String dbPw;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pw from members where id = ?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dbPw = set.getString("pw");
				if(dbPw.equals(pw)) {
					ri = MemberDao.MEMBER_LOGIN_SUCCESS;
				} else {
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD;
				}
			} else {
				ri = MemberDao.MEMBER_LOGIN_IS_NOT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			} 
		}
		return ri;
	}
	
	public MemberDto getMember(String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from members where id = ?";
		MemberDto dto = null;
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto = new MemberDto();
				dto.setId(set.getString("id"));
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.seteMail(set.getString("eMail"));
				dto.setrDate(set.getTimestamp("rDate"));
				dto.setAddress(set.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return dto;
	}
	
	public int updateMember(MemberDto dto) {
		int ri=0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "update members set pw=?, eMail=?, address=? where id=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.geteMail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			ri = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
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
}

