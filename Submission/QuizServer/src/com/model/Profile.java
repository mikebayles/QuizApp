package com.model;

public class Profile
{
	private String firstname = "";
	private String lastname = "";
	private String email = "";
	private boolean isTeacher = false;
	private Auth auth = new Auth();

	public String getFirstname()
	{
		return firstname;
	}
	public void setFirstname(String firstname)
	{
		this.firstname = firstname;
	}
	public String getLastname()
	{
		return lastname;
	}
	public void setLastname(String lastname)
	{
		this.lastname = lastname;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public boolean isTeacher()
	{
		return isTeacher;
	}
	public void setTeacher(boolean isTeacher)
	{
		this.isTeacher = isTeacher;
	}
	public Auth getAuth()
	{
		return auth;
	}
	public void setAuth(Auth auth)
	{
		this.auth = auth;
	}
}
