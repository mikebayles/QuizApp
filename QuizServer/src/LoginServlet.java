

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
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
public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		MySQLHelper mysqlHelper = MySQLHelper.getInstance();
		Auth auth = gson.fromJson(request.getParameter("json"), Auth.class);
		
		String method = request.getParameter("method");
		if(method.equals("authorize"))
		{			
			if(mysqlHelper.authorize(auth))
			{
				writer.print("TRUE");
				HttpSession session = request.getSession(true);
				session.setAttribute("username", auth.getUsername());
			}
			else
				writer.print("FALSE");	
		}
		else if(method.equals("isTeacher"))
		{
			if(mysqlHelper.isTeacher(auth.getUsername()))
			{
				writer.print("TRUE");
			
			}
			else
				writer.print("FALSE");	
		}
	}
}
