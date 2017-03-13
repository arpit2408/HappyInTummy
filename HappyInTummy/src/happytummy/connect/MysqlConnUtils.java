package happytummy.connect;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class MysqlConnUtils {
	 
	public static Connection getMySQLConnection()
	        throws ClassNotFoundException, SQLException, IOException,FileNotFoundException {
	  
	    // Note: Change the connection parameters accordingly.
	 
		Properties prop = new Properties();
		prop.load(new FileInputStream("C:\\application.properties"));
		
		
		String userName=prop.getProperty("database.username");
		String password=prop.getProperty("database.password");
		String hostName=prop.getProperty("database.host");
		String dbName=prop.getProperty("database.db");
		
//		String hostName = "rds-team-6-is-deisgn-happy-tummy.csdwude2i6ns.us-east-1.rds.amazonaws.com";
//	    String dbName = "happytummy";
//	    String userName = "arpit2408";
//	    String password = "Oracle9760662966";
	    return getMySQLConnection(hostName, dbName, userName, password);
	  
	}
	 
	public static Connection getMySQLConnection(String hostName, String dbName,
	        String userName, String password) throws SQLException,
	        ClassNotFoundException {
	    
		//load library
	    Class.forName("com.mysql.jdbc.Driver");
	    String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
	 
	    Connection conn = DriverManager.getConnection(connectionURL, userName,
	            password);
	   
	    return conn;
	}
	}