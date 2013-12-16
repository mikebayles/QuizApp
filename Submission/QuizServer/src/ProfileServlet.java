

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.MySQLHelper;
import com.google.gson.Gson;
import com.model.Profile;

/**
 * Servlet implementation class ProfileServlet
 */
public class ProfileServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}


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
			prof.getAuth().setUsername(session.getAttribute("username").toString());
			writer.println(mySQLHelper.setProfile(prof));
		}
		else
			writer.print(gson.toJson(mySQLHelper.getProfile(session.getAttribute("username").toString()),Profile.class));
	}

}
