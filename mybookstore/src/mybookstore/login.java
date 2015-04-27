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

public class login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	final static String db_table = "Information";
	
	static Connection conn;
	static Statement stmt = null;
	static BufferedReader reader = null;
	
	static String username;
	static String password; 

	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
	
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try{
            //connect to DB 
    		dbConnection connect = dbConnection.getInstance();
    		conn=connect.getConnection();
    		
			if (username != null && password!=null) {
				//see if user exists in DB
				String query = "SELECT * FROM " + db_table + " WHERE username = ? AND PASSWORD = ?";
				PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(query);
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				ResultSet rs = pstmt.executeQuery();
			    
			    if (rs.next()) {
			    	//out.println("User logged in");
		            //String user=request.getParameter("username");
		            //out.println("<h2> Welcome "+user+"</h2>");
		            //send user to bookstore page 
					RequestDispatcher rd = 
							request.getRequestDispatcher("/bookstore.html");
					rd.include(request, response);
			    }
			    else {
			    	out.println("User not logged in");
			    	//send user to login page 
					RequestDispatcher rd = 
							request.getRequestDispatcher("/login.html");
					rd.include(request, response);
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
