package sarte.controller;

import javax.servlet.*;
import javax.servlet.http.*;

import satre.command.CmdHandler;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;

public class SarteController extends HttpServlet
{
	private Map commandMap;
	
	public SarteController() {
		commandMap=new HashMap<String, Object>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String path=config.getServletContext().getRealPath("/WEB-INF/sarteCommand.properties");
		
		Properties prop=null;
		
		
		try {
			FileInputStream fis=new FileInputStream(path);
		
		prop=new Properties();
		
			prop.load(fis);
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		Iterator keys=prop.keySet().iterator();
		while(keys.hasNext())
		{
			String key=(String)keys.next();
			String classPath=prop.getProperty(key);
			
			
			try {
				Class obj_class = Class.forName(classPath);
				Object obj = obj_class.newInstance();
				commandMap.put(key, obj);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (InstantiationException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		userprocess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userprocess(req, resp);
		
	}
	
	
	protected void userprocess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type=null;
		String userUrl=req.getRequestURI();
		if(userUrl.indexOf(req.getContextPath())==0)
		{
			type=userUrl.substring(req.getContextPath().length());
		}
		
		CmdHandler cmd=(CmdHandler)commandMap.get(type);
		
		String goPage=null;
		
		goPage=cmd.process(req, resp);
		
		
		RequestDispatcher dis=req.getRequestDispatcher(goPage);
		dis.forward(req, resp);
	}
	
}
