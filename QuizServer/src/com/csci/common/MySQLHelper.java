package com.csci.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.csci.model.Auth;

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
			con = DriverManager.getConnection(connectionString, user, password);
		} 
		catch (SQLException e)
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
	
	public ResultSet executeSelect(String query)
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
	
	public int executeNonQuery(String sql)
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
				String.format("SELECT count(*) FROM Users where username = '%s' and password = '%s'", 
						auth.getUsername(),auth.getPassword());
		try
		{
			return executeSelect(query).getInt(0) >=1;
		} 
		catch (SQLException e)
		{			
			e.printStackTrace();
			return false;
		}
	}
}
