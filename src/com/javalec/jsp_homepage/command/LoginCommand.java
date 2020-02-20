package com.javalec.jsp_homepage.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		PrintWriter out;
		try {
			out = response.getWriter();
			if(ri == 1) {
				out.print("<script>alert('Login Success');"
						+ "</script>");
				out.print("<script>session.setAttribute(\'id\'," + id + ");"
						+ "</script>");
				out.print("<script>session.setAttribute(\'name\'," + name + ");"
						+ "</script>");
				out.print("<script>session.setAttribute(\'ValidMem\', \'yes\');"
						+ "</script>");
				out.print("<script>response.sendRedirect(\'main.jsp\');"
						+ "</script>");
			}
			else {
				out.print("<script>alert('Login Failure');"
						+ "</script>");
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
