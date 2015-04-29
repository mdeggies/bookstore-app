package database;
import java.util.ArrayList;
import java.util.*;

public class Books{
//A book class to store information related to the book. Used for Inserting into table
	protected String author;
	protected String price;
	protected String title;
	protected String img; //for lookup in wherever we store it
	protected ArrayList<Books> bookList = new ArrayList<Books>();
	protected static HashMap<String, Double> hm;
	protected String bl[] = {"into the wild", "the walking dead", "fifty shades of grey", "the girl with the dragon tattoo",
			"matterhorn", "to kill a mokingbird", "the devil in the white city", "quiet", "the exorcist", "the shining", "the rule of four"};
	
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
	
	public static HashMap<String, Double> returnList(){
		hm = new HashMap<String, Double>();
		hm.put("into the wild", 9.50);
		hm.put("to kill a mockingbird", 6.99);
		hm.put("the walking dead", 4.99);
		hm.put("fifty shades of grey", 5.60);
		hm.put("the girl with the dragon tattoo", 16.50);
		hm.put("matterhorn", 12.50);
		hm.put("the devil in the white city", 10.00);
		hm.put("quiet", 11.00);
		hm.put("the shining", 2.99);
		hm.put("the rule of four", 6.75);
		hm.put("the exorcist", 14.20);
		
		return hm;
	}
	
	public static Double addBooks(ArrayList<Double> bookPrices){
		Double answer = 0.0;
		for (int i = 0; i < bookPrices.size(); i++){
			answer+= bookPrices.get(i);
		}
		return answer;
	}
	
	
}