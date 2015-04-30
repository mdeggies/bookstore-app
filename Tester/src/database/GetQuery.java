package database;
import java.sql.*;
import java.util.*;


public class GetQuery{
	//Format will be of the following type: (Title, Author, Price, img)
	protected static String formattedRequest;
	private static DBAccess db;
	private static Connection conn;
	private static PreparedStatement stmt = null;
	private static ArrayList<Books> answer;
	private static ArrayList<String> tempBook;
	//The format for each string is as follows (<book name>)(<book name>)
	
	final static String db_table2 = "detail";
	
	public static ArrayList<Books> getCategory(String cat){
		cat = cat.toUpperCase();
		formattedRequest = "";
		tempBook = new ArrayList<String>();
		answer = new ArrayList<Books>();
		
		try{
			db = DBAccess.getInstance();
			conn = db.getConnection();
			stmt = conn.prepareStatement("SELECT " + cat + " FROM CATEGORY");
            ResultSet rs = stmt.executeQuery();
            
            String temp;
            while (rs.next()){
                temp = rs.getString(1);
                tempBook.add(temp);
            }
            ArrayList<Books> tempList = new ArrayList<Books>();
            //tempBook now has an ArrayList of all books in that category
            for (int i = 0; i < tempBook.size(); i++){
            	tempList = (GetQuery.getBook(tempBook.get(i)));
            	for (int j = 0; j < tempList.size(); j++){
            		answer.add(tempList.get(j));
            	}
            }
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return answer;
	}
		
	public static ArrayList<Books> allBooks(){
		ArrayList<Books> a = new ArrayList<Books>();
		String[] c = {"MYSTERY", "FICTION", "NONFICTION", "HORROR", "ADULT"};
		try{
			db = DBAccess.getInstance();
			conn = db.getConnection();
			String temp;
			for (int j = 0; j < c.length; j++){
				stmt = conn.prepareStatement("SELECT " + c[j] + " FROM CATEGORY");
				ResultSet rs = stmt.executeQuery();
            
				if (rs.next()){
					temp = rs.getString(1);
					for (int i = 0; i < getBook(temp).size(); i++){
						a.add(getBook(temp).get(i));
					}
				}
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return a;
	}
	
	public static ArrayList<Books> getAuthor(String author){
		//returns specific book(s)
		author = author.toLowerCase();
		ArrayList<Books> x = new ArrayList<Books>();
		try{
			db = DBAccess.getInstance();
			conn = db.getConnection();
			//db.getConnection();
			stmt = conn.prepareStatement("SELECT BOOKNAME FROM detail WHERE AUTHOR = '" + author + "'");
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
		}
		catch (Exception e){
			System.err.println("Got an exception!");
			System.err.println(e.getMessage());
		}
		return x;
	}
	
	public static ArrayList<Books> getBook(String book){
		ArrayList<Books> a = new ArrayList<Books>();
		try{
			db = DBAccess.getInstance();
			conn = db.getConnection();
			Books temp;
			stmt = conn.prepareStatement("SELECT * FROM detail WHERE BOOKNAME = '" + book + "'");
            ResultSet rs = stmt.executeQuery();
            formattedRequest = "";
            while (rs.next()){
            	temp = new Books(rs.getString(1), rs.getString(2), rs.getString(3));
            	a.add(temp);
            }
		}
		catch (Exception e){
			System.err.println("Got an exception!");
			System.err.println(e.getMessage());
		}
		return a;
	}
		
		public static double getPrice(String book){
			double val = 0;
			System.out.println(book);
			try{
				
				//create connection
				val = 1;
				DBAccess connect = DBAccess.getInstance();
		    	conn=connect.getConnection();
		    	String query = "SELECT * FROM " + db_table2 + " WHERE BOOKNAME = ?";
	    		PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(query); 
	    		pstmt.setString(1, book);
	    		ResultSet rs = pstmt.executeQuery(); 
	    		if (rs.next()){
	    			return rs.getDouble("PRICE");
	    		}
		
	        }
			catch (Exception e){
				System.err.println("Got an exception!");
				System.err.println(e.getMessage());
			}
			return val;
		}
		
	//Might not should go here-Parses formatted string into whatever html
	//that will display the results (in a grid of length 4). This works for title, author and category
	//public static String htmlParser(ArrayList<Books> q){
		//String title;
		//String author;
		//double price;
		//String img;
		
		//I don't know how to pass an image to html...but it's set up
		//Each element of q is a "Book" Extract this information and send it to server to display
		//for (int i = 0; i < q.size(); i++){
			//title = q.get(i).title;
			//author = q.get(i).author;
			//price = Double.parseDouble(q.get(i).price);
			//display these on web page (in center)
			//img = q.get(i).img;
		//}
		
	//}
	//end of functions
}
