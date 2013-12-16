package com.model;

import java.util.ArrayList;
import java.util.List;

public class QuizCollection
{
	private List<Quiz> quizes = new ArrayList<Quiz>();

	public List<Quiz> getQuizes()
	{
		return quizes;
	}

	public void setQuizes(List<Quiz> quizes)
	{
		this.quizes = quizes;
	}
}
