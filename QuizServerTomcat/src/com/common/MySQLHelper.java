package com.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Auth;
import com.model.Profile;

public class MySQLHelper
{
	private static MySQLHelper instance;	
	private Connection con = null;
	
	private MySQLHelper()
	{
		PropertiesLoader prop = PropertiesLoader.getInstance();
		
		String url = prop.getValue("dbURL");
		String user = prop.getValue("dbUser");
		String password = prop.getValue("dbPassword");		
		String connectionString = String.format("jdbc:mysql://%s:3306/%s", url,user);
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(connectionString, user, password);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
				
	}
	
	public static synchronized MySQLHelper getInstance()
	{
		if(instance == null)
			return new MySQLHelper();
		
		return instance;
	}
	
	private ResultSet executeSelect(String query)
	{
		try
		{
			return con.createStatement().executeQuery(query);
		} 
		catch (SQLException e)
		{			
			e.printStackTrace();
		}
		
		return null;
	}
	
	private int executeNonQuery(String sql)
	{
		try
		{
			return con.createStatement().executeUpdate(sql);
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public boolean authorize(Auth auth) 
	{
		String query = 
				String.format("SELECT count(*) as 'Count' FROM q_users where username = '%s' and password = '%s'", 
						auth.getUsername(),auth.getPassword());		
		try
		{
			ResultSet rs = executeSelect(query);
			rs.next();
			return rs.getInt("Count") == 1;
		} 
		catch (SQLException e)
		{			
			e.printStackTrace();
			return false;
		}
	}
	
	public Profile getProfile(String username)
	{
		String query = String.format("SELECT * FROM q_users where username = '%s'", username);
		try
		{
			ResultSet rs = executeSelect(query);
			rs.next();
			Profile prof = new Profile();
			prof.setFirstname(rs.getString("first_name"));
			prof.setLastname(rs.getString("last_name"));
			prof.setEmail(rs.getString("email"));
			return prof;
		} 
		catch (SQLException e)
		{			
			e.printStackTrace();
			return null;
		}
	}
	
	public int setProfile(Profile profile)
	{
		String query = String.format("UPDATE q_users set first_name = '%s', last_name = '%s', email = '%s' where username = '%s'",
				profile.getFirstname(),profile.getLastname(),profile.getEmail(), profile.getUsername());
		
		return executeNonQuery(query);
	}
}
