package com.javalec.jsp_homepage.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.jsp_homepage.Dao.MemberDao;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		MemberDao dao = new MemberDao();
		int ri = dao.LoginOK(id, pw);
		
		HttpSession session = request.getSession();
		if(ri == 1) {
			session.setAttribute("ValidMem", "yes");
		}
	}

}
