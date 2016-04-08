package sarte.user.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import satre.command.CmdHandler;
import sarte.user.model.*;

public class IdCheckAction implements CmdHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id=req.getParameter("id");
		
		UserDAO dao=new UserDAO();
		
		boolean res=dao.checkId(id);
		
		StringBuffer msg=new StringBuffer();
		
	
		
		if(res)
		{
			msg.append("중복된 아이디입니다.");
		}
		else
		{
			msg.append("사용 가능한 아이디입니다.");
		}
		
	
		
		req.setAttribute("msg", msg);
		req.setAttribute("id", id);
		
		return "user/join.jsp";
	}

}
