package com.common;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;

public class Helper
{
	public static void printSessionAttributes(HttpSession session)
	{
		System.out.println("yes");
		Enumeration<String> atts = session.getAttributeNames();
		while(atts.hasMoreElements())
		{
			String att = atts.nextElement();
			System.out.println(att + " : " + session.getAttribute(att));
		}
	}
}
