package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Contact_entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cname = request.getParameter("cname");
		String cemail = request.getParameter("cemail");
		Long cmob = Long.parseLong(request.getParameter("cmob"));
		String cmessage = request.getParameter("cmessage");
		String conId="CON_";
		try{
			Connection conn=Connectivity.getConnection();
			Statement stmt=conn.createStatement();
			String id = GenerateId.generate(conId, "contact");
			int i=stmt.executeUpdate("insert into contact values('"+id+"','"+cname+"','"+cemail+"',"+cmob+",'"+cmessage+"')");
			if(i>0){
				request.setAttribute("success", 1);
				request.getRequestDispatcher("contact.jsp").forward(request, response);
			}
		}
		catch(Exception e){
			request.setAttribute("exception", 1);
        	request.setAttribute("message", e.getMessage());
        	request.getRequestDispatcher("component/exception.jsp").forward(request, response);
		}
	}
}
