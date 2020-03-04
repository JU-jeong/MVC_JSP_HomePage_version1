package com.javalec.jsp_homepage.Dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.javalec.jsp_homepage.Dao.MemberDao;
import com.javalec.jsp_homepage.Dto.MemberDto;

public class MemberDao {

	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	DataSource dataSource;

	private static MemberDao instance = new MemberDao();

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

	public static MemberDao getInstance() {
		return instance;
	}

	public int JoinOK(String PId, String PPw, String PName, String PEMail, Timestamp PTime, String PAddress) {
		// TODO Auto-generated method stub
		int Join_Result = 0;
		if (confirmId(PId) == 0) {
			MemberDto dto = new MemberDto(PId, PPw, PName, PEMail, PTime, PAddress);
			Join_Result = insertMember(dto);
		}

		return Join_Result;
	}

	public int LoginOK(String id, String pw) {
		// TODO Auto-generated method stub
		int Login_Result = 0;
		Login_Result = userCheck(id, pw);
		return Login_Result;
	}

	public int insertMember(MemberDto dto) {
		int result = 0;

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
			result = MemberDao.MEMBER_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	public int confirmId(String id) {
		int result = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where id = ?";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			if (set.next()) {
				result = MemberDao.MEMBER_EXISTENT;
			} else {
				result = MemberDao.MEMBER_NONEXISTENT;
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
		return result;
	}

	public int userCheck(String id, String pw) {
		int result = 0;
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

			if (set.next()) {
				dbPw = set.getString("pw");
				if (dbPw.equals(pw)) {
					result = MemberDao.MEMBER_LOGIN_SUCCESS;
				} else {
					result = MemberDao.MEMBER_LOGIN_PW_NO_GOOD;
				}
			} else {
				result = MemberDao.MEMBER_LOGIN_IS_NOT;
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
		return result;
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

			if (set.next()) {
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

	public int updateMember(String id, String pw, String eMail, String address) {
		int result = 0;

		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "update members set pw=?, eMail=?, address=? where id=?";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, pw);
			pstmt.setString(2, eMail);
			pstmt.setString(3, address);
			pstmt.setString(4, id);
			result = pstmt.executeUpdate();
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
		return result;
	}

	private Connection getConnection() {

		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;

		try {
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

}
