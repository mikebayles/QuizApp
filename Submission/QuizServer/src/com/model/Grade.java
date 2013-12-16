package com.model;

public class Grade
{
	String quizDescription;
	String student;
	String course;
	int pointsPossible;
	int pointsEarned;
	double percentage;
	String letterGrade;
	
	public Grade(String quizDescription, String student, String course,
			int pointsPossible, int pointsEarned, double percentage,
			String letterGrade)
	{
		this.quizDescription = quizDescription;
		this.student = student;
		this.course = course;
		this.pointsPossible = pointsPossible;
		this.pointsEarned = pointsEarned;
		this.percentage = percentage;
		this.letterGrade = letterGrade;
	}
	
	
	public String getQuizDescription()
	{
		return quizDescription;
	}
	public void setQuizDescription(String quizDescription)
	{
		this.quizDescription = quizDescription;
	}
	public String getStudent()
	{
		return student;
	}
	public void setStudent(String student)
	{
		this.student = student;
	}
	public String getCourse()
	{
		return course;
	}
	public void setCourse(String course)
	{
		this.course = course;
	}
	public int getPointsPossible()
	{
		return pointsPossible;
	}
	public void setPointsPossible(int pointsPossible)
	{
		this.pointsPossible = pointsPossible;
	}
	public int getPointsEarned()
	{
		return pointsEarned;
	}
	public void setPointsEarned(int pointsEarned)
	{
		this.pointsEarned = pointsEarned;
	}
	public double getPercentage()
	{
		return percentage;
	}
	public void setPercentage(double percentage)
	{
		this.percentage = percentage;
	}
	public String getLetterGrade()
	{
		return letterGrade;
	}
	public void setLetterGrade(String letterGrade)
	{
		this.letterGrade = letterGrade;
	}
	
	
	
}
