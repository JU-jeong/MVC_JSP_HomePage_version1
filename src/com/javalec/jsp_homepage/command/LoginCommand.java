package com.javalec.jsp_homepage.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.jsp_homepage.Dao.MemberDao;
import com.javalec.jsp_homepage.Dto.MemberDto;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDao dao = new MemberDao();
		int Login_Result = dao.LoginOK(id, pw);
		HttpSession session = request.getSession();
		
		if(Login_Result == 1) {
			session.setAttribute("id", id);
			MemberDto dto = dao.getMember(id);
			String name = dto.getName();
			session.setAttribute("name", name);
			session.setAttribute("Login_Result", Login_Result);
			session.setAttribute("ValidMem", "yes");
		}
	}

}
