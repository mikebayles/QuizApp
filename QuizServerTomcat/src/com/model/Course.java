package com.model;

public class Course
{
	private String id;
	private String description;
	private String teacher;
	
	public Course(String id, String description, String teacher)
	{
		this.id = id;
		this.description = description;
		this.teacher = teacher;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getDescription()
	{
		return description;
	}
	public void setDescription(String description)
	{
		this.description = description;
	}
	public String getTeacher()
	{
		return teacher;
	}
	public void setTeacher(String teacher)
	{
		this.teacher = teacher;
	}
	
}
