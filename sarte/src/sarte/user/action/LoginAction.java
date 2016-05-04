package sarte.user.action;

import java.io.IOException;
import sarte.user.model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import satre.command.CmdHandler;

public class LoginAction implements CmdHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId=req.getParameter("id");
		String userPw=req.getParameter("pw");
		String msg=null;
		String url="";
		
		UserDAO dao=new UserDAO();
		
		int result=dao.loginCheck(userId, userPw);
		
		UserDTO dto=dao.getUserInfo(userId);
		
		HttpSession session=req.getSession();
		
		boolean act=true;
		
		if(result==dao.LOGIN_OK)
		{
			session.setAttribute("dto", dto);
			msg="로그인 성공<br>"+userId+"님 환영합니다.";
			url="/index.jsp";
		}
		else if(result==dao.ID_INCORRECT)
		{
			msg="없는 아이디입니다.<br>"+"아이디를 확인해주세요.";
			url="loginForm.sarte";
		}
		else if(result==dao.PW_INCORRECT)
		{
			msg="비밀번호가 일치하지 않습니다.<br>비밀번호를 확인해주세요.";
			url="loginForm.sarte";
		}
		else if(result==dao.ERROR)
		{
			msg="알수 없는 에러가 발생했습니다.<br>고객센터로 문의해주세요.";
			url="loginForm.sarte";
		}
		
		req.setAttribute("msg", msg);
		req.setAttribute("id", userId);
		req.setAttribute("pw", userPw);
		req.setAttribute("act", act);
		req.setAttribute("url", url);
		
		return "loginForm.sarte";
	}

}
