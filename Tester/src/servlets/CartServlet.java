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
import database.DBAccess;
import database.GetQuery;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	final static String db_table = "Cart";
    final HashMap<String, Double> hm = Books.returnList();
	
	static Connection conn;
	static Statement stmt = null;
	static BufferedReader reader = null;
	
	static String username;
	static String password; 
	static String cart;
	static ArrayList<String> l = new ArrayList<String>();
	static ArrayList<Double> prices = new ArrayList<Double>();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");    
        PrintWriter out = response.getWriter();       
        //out.print("hi");
        try {
        	//connect to db
        	DBAccess connect = DBAccess.getInstance();
        	conn=connect.getConnection();
        	
        	HttpSession session = request.getSession(false);  
        	username = session.getAttribute("username").toString();
        	password = session.getAttribute("password").toString();
        	
        	String cart = session.getAttribute("cart").toString();
        	String price2 = session.getAttribute("price").toString();
        	//get user input
            String book = request.getParameter("book");
            String book2 = book.toLowerCase();
            book2 = book2.substring(0, book.length() - 1);
            Double price = GetQuery.getPrice(book2);
            request.setAttribute("price3", price);
            
            prices.add(price);
            session.setAttribute("prices3", prices);
            Double total = Books.addBooks(prices);
            session.setAttribute("total", total);
            System.out.println(price);
            System.out.println(price2);
            
            
            if (cart.equals("") || book.equals("")){
            	session.setAttribute("cart", book);
            	session.setAttribute("price", price + "/");
            	l.add(book);
            }
            else{
            	if (cart.toLowerCase().contains(book.toLowerCase())){
            		session.setAttribute("cart", cart);
            		session.setAttribute("price", price2);
            	}
            	else{
            		session.setAttribute("cart", cart + " " + book);
            		session.setAttribute("price", price2 + price.toString() + "/");
            		l.add(book);
            		
            	}
            	
            }
            	

			RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
			rd.forward(request, response);
			
        		
        	
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
	
	public static double getPrices(String book){
		double x = GetQuery.getPrice(book);
		return x;
		
		
	}
}
