package com.csci.common;

import java.io.FileInputStream;
import java.util.Properties;

public class PropertiesLoader
{
	private static PropertiesLoader instance;
	private Properties properties;
	private PropertiesLoader()
	{
		properties = new Properties();
		try
		{
			properties.load(new FileInputStream("config.properties"));
		} 
		catch (Exception e)
		{		
			e.printStackTrace();
		} 
	}
	
	public static synchronized PropertiesLoader getInstance()
	{
		if(instance == null)
			return new PropertiesLoader();
		
		return instance;
	}
	
	public String getValue(String property)
	{
		return properties.getProperty(property);
	}
}
