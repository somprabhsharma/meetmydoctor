package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Admin_entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=Connectivity.getConnection();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("aname");
		String email=request.getParameter("aemail");
		String password=request.getParameter("apassword");
		long mob=Long.parseLong(request.getParameter("amob").toString());
		String id = "ADM_";
	    try {
	    	String uid = GenerateId.generate(id,"admin");
	        Statement stmt=conn.createStatement();
			int i=stmt.executeUpdate("insert into admin values('"+uid+"','"+name+"','"+password+"','"+email+"',"+mob+","+1+")");
			if(i>0)
			{
				request.setAttribute("uid", uid);
				request.getRequestDispatcher("admin_home.jsp?page=add_admin").forward(request, response);
			}
			else
			{
				request.setAttribute("uid", 0);	
				request.getRequestDispatcher("admin_home.jsp?page=add_admin").forward(request, response);
			}
			stmt.close();
	        } 
	        catch (Exception e) {
	        	request.setAttribute("exception", 1);
	        	request.setAttribute("message", e.getMessage());
	        	request.getRequestDispatcher("patient_home.jsp?page=exception").forward(request, response);
	            
	        }
	}

}
