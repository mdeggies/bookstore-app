package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Books;
import database.DBAccess;
import database.GetQuery;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Result")
public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static Connection conn;
	static Statement stmt = null;
	static BufferedReader reader = null;
	
	static String cat;
	static String title; 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
        //get user input
        String cat= request.getParameter("cat");
        String title = request.getParameter("title");
        
        try {
        	//connect to db
        	DBAccess connect = DBAccess.getInstance();
        	conn=connect.getConnection();
        	
    		
            HttpSession session = request.getSession(false); 
            if(session!=null){  
	            session.setAttribute("cat", cat);  
	            session.setAttribute("title", title);
	            session.setAttribute("cart", "");
            }
            
        	//Populate the page
            String book = GetQuery.getBook(title).get(0).title();
            request.setAttribute("result", book);
            getServletContext().getRequestDispatcher("result.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        	rd.forward(request, response);  
        	//user didn't enter all login info 
        	//won't ever get here because username & pass are required fields
        	//but it's here as a precaution 
        }
        catch(SQLException se) {
        	//handle jdbc errors
        	se.printStackTrace(); 
        }
        catch(Exception e) {
        	//handle Class.forName errors
        	e.printStackTrace();
        }
        finally {
        	//close resources
        	out.close();
        }
	}
}