package db;

import java.sql.*;
public class DbConnection {

	private Connection connection = null;
	
	public DbConnection() {
		
	   }

	public Connection initializeJdbc() {
	         
	        try {
	            if(connection == null){
	            Class.forName("com.mysql.jdbc.Driver");
	            connection = DriverManager.getConnection
	            ("jdbc:mysql://localhost/todo","danny","123");
	            }
	            else 
	            {
	                 return connection;
	            }
	            
	        }
	        catch (Exception ex) {
	            System.out.println(ex);
	        }

	        return connection;

	    }
       
    public ResultSet getTodosByUsername(String username) throws SQLException {

        // Assuming you have a connection initialized and stored in the "cn" variable

        String query = "SELECT * FROM todos WHERE username = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, username);
          

        return statement.executeQuery();
    }

	}
