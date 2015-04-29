package database;

public class ParsedTotal implements StrategyInterface{
	 //Strategy design pattern 
	public static double parseString(String price){
	  //is of the type 10.95/11.60/
	   double x;
	   double a = 0;
	  String[] answer = price.split("/");
	  for (int i = 0; i < answer.length; i++){
	    x = Double.parseDouble(answer[i]);
	    a = a + x;
	  }
	  return a;
	}
	
	public double doOperation(double num1, double num2){
		return num1 * num2;

	}

}
