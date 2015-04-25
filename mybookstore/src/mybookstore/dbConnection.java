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
		
	//volatile static dbConnection s;
	
	volatile static dbConnection s;
	volatile static Connection conn = null;
    static final String JDBC_Driver = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/users";
    static final String USER = "root";
    static final String PASS = "";
	
	final static String tableName = "Information";
	//public static Connection conn; 
	public static Statement stmt = null;
		
	private dbConnection() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		//Old DB Connection
		/*
		//create single instance of DB connection 
		Properties connectionProps = new Properties();
		connectionProps.put("user", "root");
		connectionProps.put("password", "jenydoby");
		//port & db name 
		conn = DriverManager.getConnection("jdbc:mysql://"
				+ "localhost" + "/" + "Users",
				connectionProps);
		*/
		
		//New DB Connection
		Class.forName(JDBC_Driver).newInstance();
	    System.out.println("Connecting to database...");
	    conn = DriverManager.getConnection(DB_URL,USER,PASS);
	      
	}
		
	public Connection getConnection() throws SQLException {
		return conn; 
	}
		
	//can also do Singleton.getConnection(); 
		
	public static dbConnection getInstance() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
			
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

