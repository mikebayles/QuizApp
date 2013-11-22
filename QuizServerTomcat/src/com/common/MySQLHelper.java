package com.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Answer;
import com.model.Auth;
import com.model.Course;
import com.model.Profile;
import com.model.Question;
import com.model.Quiz;
import com.model.StudentAnswer;

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
				profile.getFirstname(),profile.getLastname(),profile.getEmail(), profile.getAuth().getUsername());
		if(profile.getAuth().getPassword().length() > 1)
			query = String.format("UPDATE q_users set first_name = '%s', last_name = '%s', email = '%s', password = '%s' where username = '%s'",
					profile.getFirstname(),profile.getLastname(),profile.getEmail(),profile.getAuth().getPassword(), profile.getAuth().getUsername());
		
		return executeNonQuery(query);
	}
	
	public List<Quiz> getQuizes(String username)
	{
		List<Quiz> ret = new ArrayList<Quiz>();
		
		String query = String.format("SELECT * "
				+ "FROM "
				+ 	"q_quiz join q_roster on q_roster.course = q_quiz.course join "
				+ 	"q_course on q_course.course_code = q_roster.course "
				+ 	"where student = '%s'", username);		
		try
		{
			ResultSet rs = executeSelect(query);
			while(rs.next())
			{
				Quiz quiz = new Quiz(rs.getInt("id"), rs.getString("description"), new Course(rs.getString("course_code"), rs.getString("course_description")));
				quiz.setQuestions(getQuestions(quiz.getId()));
				ret.add(quiz);
			}		
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	private List<Question> getQuestions(int id) throws SQLException
	{
		List<Question> ret = new ArrayList<Question>();
		
		String query = String.format("SELECT * FROM q_question where quiz = %s", id);
		ResultSet rs = executeSelect(query);
		while(rs.next())
		{
			Question question = new Question(rs.getInt("id"), rs.getString("text"));
			question.setAnswers(getAnswers(question.getId()));
			
			ret.add(question);
		}
		
		return ret;
	}

	private List<Answer> getAnswers(int id) throws SQLException
	{
		List<Answer> ret = new ArrayList<Answer>();
		
		String query = String.format("SELECT * FROM q_answer where question = %s", id);
		ResultSet rs = executeSelect(query);
		while(rs.next())
		{
			Answer answer = new Answer(rs.getInt("id"), rs.getString("text"), rs.getBoolean("is_correct"));
			ret.add(answer);
		}
		
		return ret;
	}
	
	public void insertStudentAnswer(StudentAnswer studentAnswer)
	{
		String sql = String.format("INSERT INTO q_student_answer values('%s',%s)", studentAnswer.getStudent(), studentAnswer.getAnswer());
		executeNonQuery(sql);
	}

	public boolean isTeacher(String username)
	{
		String query = String.format("SELECT * FROM q_users where username = '%s'",username);
		ResultSet rs = executeSelect(query);
		try
		{
			rs.next();
			return rs.getInt("is_teacher") == 1;
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
			return false;
		}
	}
}
