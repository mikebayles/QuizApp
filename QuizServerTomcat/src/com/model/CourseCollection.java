package com.model;

import java.util.ArrayList;
import java.util.List;

public class CourseCollection
{
	private List<Course> courses = new ArrayList<Course>();

	public List<Course> getCourses()
	{
		return courses;
	}

	public void setCourses(List<Course> courses)
	{
		this.courses = courses;
	}

}
