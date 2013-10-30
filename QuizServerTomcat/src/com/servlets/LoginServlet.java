package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.common.MySQLHelper;
import com.google.gson.Gson;
import com.model.Auth;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(description = "Servlet used to authenticate", urlPatterns = { "/LoginServlet" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		PrintWriter writer = response.getWriter();
		
		Gson gson = new Gson();
		Auth auth = gson.fromJson(request.getParameter("json"), Auth.class);
		MySQLHelper mysqlHelper = MySQLHelper.getInstance();
		if(mysqlHelper.authorize(auth))
		{
			writer.print("TRUE");
			HttpSession session = request.getSession(true);
			session.setAttribute("username", auth.getUsername());
		}
		else
			writer.print("FALSE");	
	}
}
