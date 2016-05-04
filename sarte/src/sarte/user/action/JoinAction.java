package sarte.user.action;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import satre.command.CmdHandler;
import sarte.user.model.*;

public class JoinAction implements CmdHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id=req.getParameter("id");
		String pw=req.getParameter("pw");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phonenum=req.getParameter("phonenum");
		
		UserDTO dto=new UserDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPhonenum(phonenum);
		
		UserDAO dao=new UserDAO();
		
		int res=dao.joinUser(dto);
		
		boolean act=false;
		
		String msg="";
		
		if(res>0)
		{
			msg="회원 가입되었습니다.<br>환영합니다.";
			act=true;
		}
		else
		{
			msg="회원 가입에 실패하였습니다.<br>기입하신 정보를 확인 바랍니다.";
			act=false;
		}
		
		req.setAttribute("joinMsg", msg);
		req.setAttribute("act", act);
		req.setAttribute("dto", dto);
		req.setAttribute("res", res);
		
		return "/user/join.jsp";
	}

}
