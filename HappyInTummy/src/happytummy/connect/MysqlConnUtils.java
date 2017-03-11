package happytummy.connect;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class MysqlConnUtils {
	 
	public static Connection getMySQLConnection()
	        throws ClassNotFoundException, SQLException {
	  
	    // Note: Change the connection parameters accordingly.
	    String hostName = "localhost";
	    String dbName = "mysql";
	    String userName = "root";
	    String password = "root";
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