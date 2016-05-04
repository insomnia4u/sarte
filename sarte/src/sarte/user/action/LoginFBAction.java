package sarte.user.action;

import java.io.IOException;
import sarte.user.model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import satre.command.CmdHandler;

public class LoginFBAction implements CmdHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id=req.getParameter("fid");
		String pw=req.getParameter("fid");
		String name=req.getParameter("name");
		String imgpath=req.getParameter("imgpath");
		String email=req.getParameter("email");
		
		UserDAO dao=new UserDAO();
		UserDTO dto=new UserDTO();
		
		String msg="";
		String url="";
		
	
		int res=dao.loginCheck(id, pw);
		
		HttpSession session=req.getSession();
		
		boolean act=true;
		
		if(res==dao.LOGIN_OK)
		{
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setImgpath(imgpath);
			dto.setEmail(email);
			
			session.setAttribute("dto", dto);
			msg="로그인 성공<br>"+name+"님 환영합니다.";
			url="index.jsp";
			
		}
		else if(res==dao.ID_INCORRECT)
		{
			
			msg="없는 아이디입니다.<br>"+"새로 가입처리 되었습니다.";
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.setImgpath(imgpath);
			dto.setEmail(email);
			int result=dao.joinUser(dto);
			url="loginForm.sarte";
		}
		else if(res==dao.ERROR)
		{
			msg="알수 없는 에러가 발생했습니다.<br>고객센터로 문의해주세요.";
			url="loginForm.sarte";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("id", id);
		req.setAttribute("pw", pw);
		req.setAttribute("act", act);
		req.setAttribute("url", url);
		req.setAttribute("res", res);
		
		return url;
		
	}

}
