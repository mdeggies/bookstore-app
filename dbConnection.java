import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

//singleton database connection 
public class dbConnection {

	static String newLine = System.getProperty("line.separator");
		
	volatile static dbConnection s;
	
	final static String tableName = "tableName";
	public static Connection conn; 
	public static Statement stmt = null;
		
	private dbConnection() throws SQLException {
		//create single instance of DB connection 
		Properties connectionProps = new Properties();
		connectionProps.put("user", "root");
		connectionProps.put("password", "PASSWORD");
		//port & db name 
		conn = DriverManager.getConnection("jdbc:mysql://"
				+ "localhost" + ":" + "3306" + "/" + "DBNAME",
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

