package database;

public class Books{
//A book class to store information related to the book. Used for Inserting into table
	protected String author;
	protected String price;
	protected String title;
	protected String img; //for lookup in wherever we store it
	
	//add img to constructor to take img
	public Books(String Title, String Price, String Author){
		author = Author;
		price = Price;
		title = Title;
	}
	public String title(){
		return title;
	}
	
	public String price(){
		return price;
	}
	
	public String author(){
		return author;
	}
	
	public String img(){
		return img;
	}
	
}