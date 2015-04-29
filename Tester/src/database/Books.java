package database;

public class Books{
//A book class to store information related to the book. Used for Inserting into table
	protected String author;
	protected String price;
	protected String title;
	protected String img; //for lookup in wherever we store it
	
	public Books(String Title, String Price, String Author, String img){
		author = Author;
		price = Price;
		title = Title;
	}
}