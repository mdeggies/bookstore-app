package Display;
import java.sql.*;
import java.util.*;

import javax.swing.text.html.HTML;

public class GetQuery {
	//Format will be of the following type: (Title, Author, Price, img)
	protected static String formattedRequest;
	private static DBAccess conn = DBAccess.getInstance();
	private static PreparedStatement stmt = null;
	private static ArrayList<Books> answer;
	private static ArrayList<String> tempBook;
	
	//The format for each string is as follows (<book name>)(<book name>)
	public static ArrayList<Books> getCategory(String cat){
		cat = cat.toUpperCase();
		formattedRequest = "";
		tempBook = new ArrayList<String>();
		answer = new ArrayList<Books>();
		
		try{
			conn.getConnection();
			stmt = conn.prepareStatement("SELECT " + cat + " FROM CATEGORY");
            ResultSet rs = stmt.executeQuery();
            
            String temp;
            while (rs.next()){
                temp = rs.getString(1);
                tempBook.add(temp);
            }
            String parse;
            ArrayList<Books> tempList = new ArrayList<Books>();
            //tempBook now has an ArrayList of all books in that category
            for (int i = 0; i < tempBook.size(); i++){
            	tempList = (GetQuery.getBook(tempBook.get(i)));
            	for (int j = 0; j < tempList.size(); j++){
            		answer.add(tempList.get(j));
            	}
            }
            conn.close();
            return answer;
			
		}
        catch (Exception e) { 
            System.err.println("Got an exception! "); 
            System.err.println(e.getMessage()); 
            conn.close();
        }
	}
		
	
	public static ArrayList<Books> getAuthor(String author){
		//returns specific book(s)
		try{
			conn.getConnection();
			ArrayList<Books> x = new ArrayList<Books>();
			stmt = conn.prepareStatement("SELECT BOOKNAME FROM DETAIL WHERE AUTHOR = '" + author + "'");
			ResultSet rs = stmt.executeQuery();
			ArrayList<String> temp = new ArrayList<String>();
			ArrayList<Books> temp2 = new ArrayList<Books>();
        
			while (rs.next()){
				temp.add(rs.getString(1));
			}
			for (int i = 0; i < temp.size(); i++){
				temp2 = GetQuery.getBook(temp.get(i));
				for (int j = 0; j < temp2.size(); j++){
					x.add(temp2.get(j));
				}
			}
			conn.close();
			return x;
		}
		catch (Exception e){
			System.err.println("Got an exception!");
			System.err.println(e.getMessage());
			conn.close();
		}
	}
	
	public static ArrayList<Books> getBook(String book){
		try{
			Books temp;
			ArrayList<Books> a = new ArrayList<Books>();
			conn.getConnection();
			stmt = conn.prepareStatement("SELECT * FROM DETAIL WHERE BOOKNAME = '" + book + "'");
            ResultSet rs = stmt.executeQuery();
            formattedRequest = "";
            while (rs.next()){
            	temp = new Books(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            	//temp = "(" + rs.getString(1) + "," + rs.getString(2) + "," + rs.getString(3) + ")";
                //formattedRequest = formattedRequest + temp;
            	a.add(temp);
            }
            return a;
		}
		catch (Exception e){
			System.err.println("Got an exception!");
			System.err.println(e.getMessage());
			conn.close();
		}
	}
		
		public static double getPrice(String book){
			try{
				String temp;
				book = book.toLowerCase();
				conn.getConnection();
				stmt = conn.prepareStatement("SELECT PRICE FROM DETAIL WHERE BOOKNAME = '" + book + "'");
	            ResultSet rs = stmt.executeQuery();
	            temp = rs.getString(1);
	            }
			catch (Exception e){
				System.err.println("Got an exception!");
				System.err.println(e.getMessage());
				conn.close();
			}
		}
		
		
	//Might not should go here-Parses formatted string into whatever html
	//that will display the results (in a grid of length 4). This works for title, author and category
	public static String htmlParser(ArrayList<Books> q){
		String title;
		String author;
		double price;
		String img;
		
		//I don't know how to pass an image to html...but it's set up
		//Each element of q is a "Book" Extract this information and send it to server to display
		for (int i = 0; i < q.size(); i++){
			title = q.get(i).title;
			author = q.get(i).author;
			price = Double.parseDouble(q.get(i).price);
			//display these on web page (in center)
			img = q.get(i).img;
		}
		
	}
	//end of functions
}
