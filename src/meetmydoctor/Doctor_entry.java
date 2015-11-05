package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Doctor_entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=Connectivity.getConnection();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("dname");
		String email=request.getParameter("demail");
		String password=request.getParameter("dpassword");
		long mob=Long.parseLong(request.getParameter("dmob").toString());
		String speciality=request.getParameter("dspeciality");
		String address=request.getParameter("daddress");
		String state=request.getParameter("state1");
		String city=request.getParameter("cityname");
		String id = "DOC_";
	    try {
	        String uid = GenerateId.generate(id,"doctor");
	        Statement stmt=conn.createStatement();
			int i=stmt.executeUpdate("insert into doctor values('"+uid+"','"+name+"','"+email+"','"+password+"',"+mob+",'"+speciality+"','"+address+"','"+state+"','"+city+"',"+1+")");
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
