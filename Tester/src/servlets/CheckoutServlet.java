package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Books;
import database.Context;
import database.DBAccess;
import database.GetQuery;
import database.IncludeTax;
import database.ParsedTotal;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	final static String db_table = "information";

	static Connection conn;
	static Statement stmt = null;
	static BufferedReader reader = null;

	static String username;
	static String password;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");    
		PrintWriter out = response.getWriter(); 

		String option = request.getParameter("option");
		String cardNumber = request.getParameter("checkOut");

		try {
			//connect to db
			DBAccess connect = DBAccess.getInstance();
			conn=connect.getConnection();

			HttpSession session = request.getSession(false);  
			username = session.getAttribute("username").toString();
			password = session.getAttribute("password").toString();
			String cart = session.getAttribute("cart").toString();
			getTotal(cart);
			double total1 = getTotal(cart);
			System.out.println(total1);
			Context context = new Context(new ParsedTotal());
			double tax = context.executeStrategy(total1, .09);//tax is .15
			context = new Context(new IncludeTax());
			double totalPrice2 = context.executeStrategy(total1, tax);
			System.out.print(totalPrice2);
			request.setAttribute("totalPrice2", totalPrice2);

			if (option.equals("credit")){

				String query = "SELECT * FROM " + db_table + " WHERE username = ? AND PASSWORD = ?";
				PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(query); 
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()){
					try {
						double credit = Double.parseDouble(rs.getString("store_credit"));
						if (credit > totalPrice2){
							RequestDispatcher rd = request.getRequestDispatcher("congrats.jsp");
							rd.forward(request, response);
							/*
        				query = "UPDATE store_credit SET store_credit = " + (credit - getTotal(cart)) + " FROM " + db_table + " WHERE username = ?";
        				pstmt = (PreparedStatement) conn.prepareStatement(query); 
        				pstmt.setString(1, username);
        				pstmt.executeQuery();
							 */
						}
						else {
							//print error msg 
							out.print("<p style=\"color:red\">You didn't have enough store credit for the purchase. Please login again for security purposes.</p>");  
							//send user back to welcome page 
							RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
							rd.include(request,response);    
						}
					}
					catch (Exception e){
						e.printStackTrace();
					}
				}
			}
			else{

				String query = "SELECT * FROM " + db_table + " WHERE username = ? AND PASSWORD = ?";
				PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(query); 
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()){
					String credit = rs.getString("credit_card_info");
					if (cardNumber.equals(credit)){
						RequestDispatcher rd = request.getRequestDispatcher("congrats.jsp");
						rd.forward(request, response);
						/*
        				query = "UPDATE store_credit SET store_credit = " + (credit - getTotal(cart)) + " FROM " + db_table + " WHERE username = ?";
        				pstmt = (PreparedStatement) conn.prepareStatement(query); 
        				pstmt.setString(1, username);
        				pstmt.executeQuery();
						 */
					}
					else {
						//print error msg 
						out.print("<p style=\"color:red\">There was a problem authenticating your credit card. Please login again for security purposes.</p>");  
						//send user back to welcome page 
						RequestDispatcher rd=request.getRequestDispatcher("login.jsp");    
						rd.include(request,response);   
					}
				}
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

	public static double getTotal(String book){
		String[] x = book.split("/");
		double total = 0;
		for (String z : x){
			total = total + GetQuery.getPrice(z);
		}
		System.out.println(total);
		return total;


	}
}
