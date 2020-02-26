package com.javalec.jsp_homepage.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.jsp_homepage.Dao.BDao;
import com.javalec.jsp_homepage.Dto.BDto;
import com.javalec.jsp_homepage.Dto.MemberDto;

public class BModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		BDao  dao = new BDao();
		int Modify_Result = dao.modify(bId, bName, bTitle, bContent);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("Modify_Result", Modify_Result);
		
	}

}
