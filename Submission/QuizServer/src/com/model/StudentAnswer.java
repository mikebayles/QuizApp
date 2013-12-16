package com.model;

public class StudentAnswer
{
	private String student;
	private int answer;
	
	public StudentAnswer(String student, int answer)
	{
		this.student = student;
		this.answer = answer;
	}
	
	public StudentAnswer()
	{
		
	}
	
	public String getStudent()
	{
		return student;
	}
	public void setStudent(String student)
	{
		this.student = student;
	}
	public int getAnswer()
	{
		return answer;
	}
	public void setAnswer(int answer)
	{
		this.answer = answer;
	}
	
	@Override
	public boolean equals(Object other)
	{
		if (other == null) return false;
	    if (other == this) return true;
	    if (!(other instanceof StudentAnswer))return false;
	    StudentAnswer otherStudentAnswer = (StudentAnswer)other;
	    return otherStudentAnswer.answer == answer && otherStudentAnswer.student == student;
	}

	@Override
	public String toString()
	{
		return String.format("Student = %s\nAnswer = %s", student, answer);
	}
}
