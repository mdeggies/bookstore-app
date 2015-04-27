package database;

import java.sql.*;

public class DBAccess {
	
	static String newLine = System.getProperty("line.separator");
	
	volatile static DBAccess s;
	
	final static String tableName = "Information";
	public static Connection conn = null; 
	public static Statement stmt = null;

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/Users";

	//database credentials
	static final String USER = "root";
	static final String PASS = "";

	private DBAccess() {
		try {
			//super();
			//register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");
			//create single instance of DB connection
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
		}
    	catch (SQLException se) {
    		se.printStackTrace();     
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
	public Connection getConnection() throws SQLException {
		return conn; 
	}
	
	public static DBAccess getInstance() throws SQLException {
		
		if (s == null) {
			synchronized(DBAccess.class) {
				if (s == null) {
					s = new DBAccess(); 
					//System.out.print("First DB connection created." + newLine); 
			}
		}
	}
		return s; 
	}
}