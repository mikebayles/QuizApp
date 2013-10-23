package com.csci.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;

import com.csci.common.MySQLHelper;
import com.csci.model.Auth;
import com.google.gson.Gson;

public class QuizThread extends Thread
{
	private Socket clientSocket;
	
	public QuizThread(Socket socket)
	{
		clientSocket = socket;
	}
	
	@Override
	public void run()
	{		        
        try 
        {
        	BufferedReader clientIn = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));	      
            String json = "";
            String method = "";
        	
            method = clientIn.readLine();
            json = clientIn.readLine();
        	
        	Gson gson = new Gson();
        	MySQLHelper mySQLHelper = MySQLHelper.getInstance();
        	
        	if(method.equals("authorize"))
        	{
        		Auth auth = gson.fromJson(json, Auth.class);
        		mySQLHelper.authorize(auth);
        	}   			
		} 
        catch (IOException e)
        {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
	}
}
