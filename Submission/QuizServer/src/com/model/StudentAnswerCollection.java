package com.model;

import java.util.ArrayList;
import java.util.List;

public class StudentAnswerCollection
{
	private List<StudentAnswer> studentAnswers = new ArrayList<StudentAnswer>();

	public List<StudentAnswer> getStudentAnswers()
	{
		return studentAnswers;
	}

	public void setStudentAnswers(List<StudentAnswer> studentAnswers)
	{
		this.studentAnswers = studentAnswers;
	}

}
