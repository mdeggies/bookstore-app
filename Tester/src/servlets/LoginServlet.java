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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	final static String db_table = "Information";
	
	static Connection conn;
	static Statement stmt = null;
	static BufferedReader reader = null;
	
	static String username;
	static String password; 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();    
          
        //get user input
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
        	//connect to db
        	DBAccess connect = DBAccess.getInstance();
        	conn=connect.getConnection();
        	
        	
    		//for testing////////////
    		//Double x = GetQuery.getPrice("into the wild");
    		//System.out.println(x);
    		//ArrayList<Books> y = new ArrayList<Books>();
    		//y = GetQuery.getAuthor("robert kirkman");
    		//if (y.size() > 0){
    		//System.out.println(y.get(0).title());
    		//}
    		//y = new ArrayList<Books>();
    		//y = GetQuery.getCategory("Mystery");
    		//System.out.println(y.get(0).title());
    		//y = new ArrayList<Books>();
    		//System.out.println(GetQuery.allBooks().size());
    		//end testing////////////////////
    		
    		
            HttpSession session = request.getSession(false); 
            if(session!=null){  
	            session.setAttribute("username", username);  
	            session.setAttribute("password", password);
	            session.setAttribute("cart", "");
	            session.setAttribute("price", "");
            }
        	if (username != null && password!=null) {
        		//see if user exists in DB 
        		String query = "SELECT * FROM " + db_table + " WHERE username = ? AND PASSWORD = ?";
        		PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(query); 
        		pstmt.setString(1, username);
        		pstmt.setString(2, password);
        		ResultSet rs = pstmt.executeQuery(); 

        		//if user exists
        		if (rs.next()) {
        			//send user to welcome page 
        			
        			String user = rs.getString("username");
     				String pass = rs.getString("password");
     				String fnam = rs.getString("first_name");
     				String lnam = rs.getString("last_name");
     				String addr = rs.getString("address");
     				String cred = rs.getString("credit_card_info");
     				String stcr = rs.getString("store_credit");
     				String acc = user + "/" + pass + "/" + fnam + "/" + lnam + "/" + addr + "/" + cred + "/" + stcr;
     				
     				session.setAttribute("account", acc); 
        			
        			RequestDispatcher rd = 
        					request.getRequestDispatcher("welcome.jsp");
        			rd.forward(request, response);
        		}
        		else {    
        			//print error msg 
        			out.print("<p style=\"color:red\">Username or password error</p>");  
        			//send user back to login page 
        			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
        			rd.include(request,response);    
        		}    
        	}
        	//user didn't enter all login info 
        	//won't ever get here because username & pass are required fields
        	//but it's here as a precaution 
        	else {    
        		//print error msg telling user to enter all login info
        		out.print("<p style=\"color:red\">Please enter username and password</p>");  
        		//send user back to login page 
        		RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
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
