package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Patient_entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=Connectivity.getConnection();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("pname");
		String email=request.getParameter("pemail");
		String password=request.getParameter("ppassword");
		long mob=Long.parseLong(request.getParameter("pmob").toString());
		String id = "PAT_";
	    try {
	    	String uid = GenerateId.generate(id,"patient");
	        Statement stmt=conn.createStatement();
			int i=stmt.executeUpdate("insert into patient values('"+uid+"','"+name+"','"+email+"','"+password+"',"+mob+","+0+","+1+")");
			if(i>0)
			{
				request.setAttribute("uid", uid);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else
			{
					
			}
			stmt.close();
	        } 
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
