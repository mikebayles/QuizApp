

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.MySQLHelper;
import com.google.gson.Gson;
import com.model.CourseCollection;
import com.model.Quiz;

/**
 * Servlet implementation class CreateServlet
 */
public class CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		MySQLHelper mySQLHelper = MySQLHelper.getInstance();
		Gson gson = new Gson();
		
		String method = request.getParameter("method");
		if(method.equals("getCourses"))
		{
			CourseCollection courses = new CourseCollection();
			courses.setCourses(mySQLHelper.getCourses());
			writer.print(gson.toJson(courses,CourseCollection.class));
		}
		else if(method.equals("createQuiz"))
		{
			Quiz quiz = gson.fromJson(request.getParameter("json"), Quiz.class);			
			writer.print(mySQLHelper.createQuiz(quiz));
		}
	}

}
