package happytummy.connect;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import happytummy.connect.PropertyReader;

public class MysqlConnUtils {
	 
	public static Connection getMySQLConnection()
	        throws ClassNotFoundException, SQLException, IOException,FileNotFoundException {
	  
	   
		String userName=PropertyReader.getValue("database.username");
		String password=PropertyReader.getValue("database.password");
		String hostName=PropertyReader.getValue("database.host");
		String dbName=PropertyReader.getValue("database.db");
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