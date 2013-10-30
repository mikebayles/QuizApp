package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.Helper;
import com.common.MySQLHelper;
import com.google.gson.Gson;
import com.model.Profile;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		MySQLHelper mySQLHelper = MySQLHelper.getInstance();
		Gson gson = new Gson();
		
		String method = request.getParameter("method");
		if(method.equals("update"))
		{
			Profile prof = gson.fromJson(request.getParameter("json"), Profile.class);
			prof.setUsername(session.getAttribute("username").toString());
			writer.println(mySQLHelper.setProfile(prof));
		}
		else
			writer.print(gson.toJson(mySQLHelper.getProfile(session.getAttribute("username").toString()),Profile.class));
		// TODO Auto-generated method stub
	}

}
