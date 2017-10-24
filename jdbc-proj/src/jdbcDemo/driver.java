package jdbcDemo;
import java.sql.*;

public class driver {

	public static void main(String[] args) {
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			//1.get a connection to database
			Connection myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","gaurav610"); 
			//2.create a statement
			Statement myStmt = myConn.createStatement();
			//3.execute sql query
			ResultSet myRs = myStmt.executeQuery("select * from pet");
			
			//4.process the result set
			while (myRs.next()){
				System.out.println(myRs.getString("name"));
			}
		}
		catch(Exception exc){
			exc.printStackTrace();
		}

	}

}
