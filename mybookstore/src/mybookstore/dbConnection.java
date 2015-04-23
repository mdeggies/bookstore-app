package mybookstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

//database name: Users
//database table: Information
//columns: username, password, first_name, last_name, address

//singleton database connection 
public class dbConnection {

	static String newLine = System.getProperty("line.separator");
		
	volatile static dbConnection s;
	
	final static String tableName = "Information";
	public static Connection conn; 
	public static Statement stmt = null;
		
	private dbConnection() throws SQLException {
		//create single instance of DB connection 
		Properties connectionProps = new Properties();
		connectionProps.put("user", "root");
		connectionProps.put("password", "jenydoby");
		//port & db name 
		conn = DriverManager.getConnection("jdbc:mysql://"
				+ "localhost" + ":" + "3306" + "/" + "Users",
				connectionProps);
	}
		
	public Connection getConnection() throws SQLException {
		return conn; 
	}
		
	//can also do Singleton.getConnection(); 
		
	public static dbConnection getInstance() throws SQLException {
			
		if (s == null) {
			synchronized(dbConnection.class) {
				if (s == null) {
					s = new dbConnection(); 
					System.out.print("First DB connection created." + newLine); 
			}
		}
	}
		return s; 
	}
}

