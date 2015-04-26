package mybookstore;

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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class register extends HttpServlet {
	
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

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String address = request.getParameter("address");
		
		if (username.equals("") || password.equals("") || 
				first_name.equals("") || last_name.equals("") ||
				address.equals("")) {

			out.println("Please enter all data");
			//send user to registration page 
			RequestDispatcher rd = 
					request.getRequestDispatcher("/register.html");
			rd.include(request, response);
		}

		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");  
			//connect to DB 
			dbConnection connect = dbConnection.getInstance();
			conn=connect.getConnection();

			//check if user already exists 
			String check = "SELECT * FROM " + db_table + " WHERE USERNAME = ?";
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(check); 
			ps.setString(1, username);

			ResultSet rs = ps.executeQuery(); 

			if (rs.next()) {
				//user already exists 
				out.println("User already exists");
				//send user to login page 
				RequestDispatcher rd = request.getRequestDispatcher("/login.html");
				rd.include(request, response);
			}
			else { 
				//add new user to DB 
				PreparedStatement pstmt; 
				String query = "INSERT INTO " + db_table + " VALUES (?, ?, ?, ?, ?)";
				pstmt = (PreparedStatement) conn.prepareStatement(query);
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				pstmt.setString(3, first_name);
				pstmt.setString(4, last_name);
				pstmt.setString(5, address);
				int i = pstmt.executeUpdate(); 

				if(i>0) {
					out.println("You have sucessfully registered");
					//send user to login page
					RequestDispatcher rd = request.getRequestDispatcher("/login.html");
					rd.include(request, response);
				}
				else{
					out.println("You have failed to register");
				}
			}
		}
		catch(SQLException se) {
			//handle mySQL errors 
			se.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			out.close();
			try {
				if(stmt != null || conn != null) {
					conn.close();
				}
			}
			catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
}

