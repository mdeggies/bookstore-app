package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DBAccess;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	final static String db_table = "Information";

	static Connection conn;
	static Statement stmt = null;
	static BufferedReader reader = null;

	static String username;
	static String password; 
	static String first_name; 
	static String last_name; 	
	static String address; 
	static String store_credit;
	static String credit_card_info;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");    
		PrintWriter out = response.getWriter();    

		//get user input
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String address = request.getParameter("address");
		String store_credit = request.getParameter("store_credit");
		String credit_card_info = request.getParameter("credit_card_info");

		try {
			//connect to db 
			DBAccess connect = DBAccess.getInstance();
			conn=connect.getConnection();

			HttpSession session = request.getSession(false);  
			if(session!=null)  
				session.setAttribute("username", username);  
				session.setAttribute("password", password);


			if (username!=null && password!=null && first_name!=null && last_name!=null
					&& address!=null && store_credit!=null && credit_card_info!=null) {
				try {
					//check if user already exists 
					String check = "SELECT * FROM " + db_table + " WHERE USERNAME = ?";
					PreparedStatement ps = (PreparedStatement) conn.prepareStatement(check); 
					ps.setString(1, username);

					ResultSet rs = ps.executeQuery(); 

					//if user already exists 
					if (rs.next()) {
						//print error msg, send back to register page 
						out.print("<p style=\"color:red\">User already exists- please choose another username</p>");    
						RequestDispatcher rd=request.getRequestDispatcher("register.jsp");    
						rd.include(request,response);    
					}
					else {
						//add new user to DB 
						PreparedStatement pstmt; 
						String query = "INSERT INTO " + db_table + " VALUES (?, ?, ?, ?, ?, ?, ?)";
						pstmt = (PreparedStatement) conn.prepareStatement(query);
						pstmt.setString(1, username);
						pstmt.setString(2, password);
						pstmt.setString(3, first_name);
						pstmt.setString(4, last_name);
						pstmt.setString(5, address);
						pstmt.setString(6, credit_card_info);
						pstmt.setString(7, store_credit);
						pstmt.executeUpdate(); 
						
						

						//print successful registration msg 
						out.print("<p style=\"color:red\">Registration successful! Please login</p>");    
						//have the user login
						RequestDispatcher rd = 
								request.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
					}
				}
		        catch(SQLException se) {
		        	//handle jdbc errors
		        	se.printStackTrace(); 
		        }
		        catch(Exception e) {
		        	//handle Class.forName errors
		        	e.printStackTrace();
		        }
			}
			//user didn't enter all registration info 
        	//won't ever get here because all fields are required fields 
        	//but it's here as a precaution 
			else {
        		//print error msg telling user to enter all info 
        		out.print("<p style=\"color:red\">Please enter all required information</p>"); 
        		//send user back to registration page 
        		RequestDispatcher rd=request.getRequestDispatcher("register.jsp");    
        		rd.include(request,response);    
			}
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
