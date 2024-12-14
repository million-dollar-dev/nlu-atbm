package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	private final String serverName = "localhost";
	private final String dbName = "LTW_DB";

	private final String portNumber = "1433";
	private final String userId = "sa";
	private final String password = "sa123";

	private Connection connection;
	private static DBContext instance;
	
	private DBContext() throws ClassNotFoundException, SQLException {
		String url = "jdbc:sqlserver://" + serverName + ":" 
				+ portNumber + ";databaseName=" + dbName 
				+ ";encrypt=true;trustServerCertificate=true;";
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		Class.forName(driver);
		connection = DriverManager.getConnection(url, userId, password);
	}
	
	public static synchronized DBContext getInstance() throws ClassNotFoundException, SQLException {
		 if (instance == null) {
	            instance = new DBContext();
	        }
	        return instance;
	}
	
	public Connection getConnection() {
        return connection;
    }
	
	public static void main(String[] args) {
		try {
			System.out.println(DBContext.getInstance().getConnection());
		} catch (Exception e) {
			System.out.println("faileed");
		}
	}
}
