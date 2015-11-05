package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Availability_entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=Connectivity.getConnection();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sdate=request.getParameter("sdate");
		String edate=request.getParameter("edate");
		String mstart = request.getParameter("mstart");
		String mend = request.getParameter("mend");
		String nstart = request.getParameter("nstart");
		String nend = request.getParameter("nend");
		String estart = request.getParameter("estart");
		String eend = request.getParameter("eend");
		HttpSession s = request.getSession();
		String doc_id = s.getAttribute("userid").toString();
		String morn = ""+mstart+"-"+mend;
		String noon = ""+nstart+"-"+nend;
		String eve = ""+estart+"-"+eend;
		String id = "AVA_";
	    try {
	        String uid = GenerateId.generate(id,"availability");
	        Statement stmt=conn.createStatement();
			int i=stmt.executeUpdate("insert into availability values('"+uid+"','"+doc_id+"','"+sdate+"','"+edate+"','"+morn+"','"+noon+"','"+eve+"')");
			if(i>0)
			{
				request.setAttribute("avail", 1);
				request.getRequestDispatcher("doctor_home.jsp?page=availability").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("doctor_home.jsp?page=availability").forward(request, response);	
			}
			stmt.close();
	    } 
	    catch (Exception e) {
	    	request.setAttribute("exception", 1);
        	request.setAttribute("message", e.getMessage());
        	request.getRequestDispatcher("doctor_home.jsp?page=exception").forward(request, response);
	    }
	}

}
