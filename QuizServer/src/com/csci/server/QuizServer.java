package com.csci.server;

import java.io.IOException;
import java.net.ServerSocket;

public class QuizServer {

	public static void main(String[] args) throws IOException 
	{
		System.out.println("The proxy server is running.");        
        ServerSocket listener = new ServerSocket(9898);        
        try 
        {
        	
            while (true) 
            {
                new QuizThread(listener.accept()).start();
                
            }
        } 
        finally 
        {
            listener.close();
        }
	}

}
