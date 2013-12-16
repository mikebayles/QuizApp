package com.model;

import java.util.List;

public class Quiz
{
	private int id;
	private List<Question> questions;
	private String description;
	private Course course;
	
	public Quiz(int id, String description, Course course)
	{		
		this.id = id;
		this.description = description;
		this.course = course;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public List<Question> getQuestions()
	{
		return questions;
	}
	public void setQuestions(List<Question> questions)
	{
		this.questions = questions;
	}
	public String getDescription()
	{
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	public Course getCourse()
	{
		return course;
	}
	public void setCourse(Course course)
	{
		this.course = course;
	}	
}