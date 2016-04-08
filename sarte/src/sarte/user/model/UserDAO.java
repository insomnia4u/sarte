package sarte.user.model;

import java.sql.*;
import sarte.user.model.*;

public class UserDAO
{
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int PW_INCORRECT=2;
	public static final int LOGIN_OK=1;
	public static final int ID_INCORRECT=3;
	public static final int ERROR=-1;
	
	public UserDAO(){}
	
	public boolean checkId(String userId)
	{
		try
		{
			conn=sarte.db.SarteDB.getConn();
			
			String sql="select id from sarte_user where id=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, userId);
			
			rs=ps.executeQuery();
			
			return rs.next();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		finally
		{
			try
			{
				
			}
			catch(Exception e2)
			{
				
			}
		}
	}
	
	public int joinUser(UserDTO dto)
	{
		try
		{
			conn=sarte.db.SarteDB.getConn();
			
			String sql="insert into sarte_user values(sarte_user_idx.nextval,?,?,?,?,?,?,?)";
			
			ps=conn.prepareStatement(sql);
			
		
			
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getPhonenum());
			ps.setString(6, dto.getName()+"입니다.");
			ps.setString(7, "noImg");
			
			int count=ps.executeUpdate();
			
			return count;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -1;
		}
		finally
		{
			try
			{
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			}
			catch(Exception e2)
			{
				
			}
		}
	}
	
	public int loginCheck(String userId, String userPw)
	{
		
		try
		{
			conn=sarte.db.SarteDB.getConn();
			
			String sql="select id,pw from sarte_user where id=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, userId);
		
			rs=ps.executeQuery();
			
			if(rs.next())
			{
				if(rs.getString(2).equals(userPw))
				{
					return LOGIN_OK;
				}
				else
				{
					return PW_INCORRECT;
				}
			}
			else
			{
				return ID_INCORRECT;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return ERROR;
		}
		finally
		{
			try
			{
				
			}
			catch(Exception e2)
			{
				
			}
		}
	}
	
	public UserDTO getUserInfo(String userId)
	{
		try
		{
			conn=sarte.db.SarteDB.getConn();
			
			String sql="select * from sarte_user where id=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, userId);
			
			rs=ps.executeQuery();
			
			rs.next();
			
			int idx=rs.getInt(1);
			String id=rs.getString(2);
			String pw=rs.getString(3);
			String name=rs.getString(4);
			String email=rs.getString(5);
			String phonenum=rs.getString(6);
			String profile=rs.getString(7);
			String imgpath=rs.getString(8);
					
			UserDTO dto=new UserDTO(idx, id, pw, name, email, phonenum, profile, imgpath);
			
			return dto;

		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}
			catch(Exception e2)
			{
				
			}
		}
	}
}
