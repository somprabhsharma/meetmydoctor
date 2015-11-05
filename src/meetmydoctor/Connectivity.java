package meetmydoctor;
import java.sql.Connection;
import java.sql.DriverManager;
public  class Connectivity 
{
	public static Connection getConnection()
	{
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ddc","root","");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}		
}

