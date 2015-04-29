package database;

public class Context {
	private StrategyInterface strategy;
	
	public Context(StrategyInterface strategy){
		this.strategy = strategy;
	}
	
	public double executeStrategy(double num1, double num2){
		return strategy.doOperation(num1, num2);
	}
}
