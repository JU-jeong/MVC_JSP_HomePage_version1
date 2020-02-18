package com.javalec.jsp_homepage.command;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.jsp_homepage.Dao.MemberDao;
import com.javalec.jsp_homepage.Dto.MemberDto;

public class JoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String eMail = request.getParameter("eMail");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		String address = request.getParameter("address");
		
		MemberDao dao = new MemberDao();
		dao.JoinOK(id, pw, name, eMail, time, address);
		
	}

}
