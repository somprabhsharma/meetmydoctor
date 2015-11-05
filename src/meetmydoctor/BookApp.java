package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BookApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String appDate = request.getParameter("sdate").toString();
		String appTime = request.getParameter("time").toString();
		String symptoms = request.getParameter("symptoms").toString();
		HttpSession session = request.getSession();
		String docid = session.getAttribute("docid").toString();
		String patid = session.getAttribute("userid").toString();
		Connection conn = Connectivity.getConnection();
		Date date = new Date();
		String currentDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
		String pattern = "APP_";
		try{
			String appid = GenerateId.generate(pattern,"appointment");
	        Statement stmt=conn.createStatement();
			int i=stmt.executeUpdate("insert into appointment values('"+appid+"','"+patid+"','"+docid+"','"+appDate+"','"+appTime+"','"+symptoms+"','"+currentDate+"',"+0+","+0+")");
			if(i>0)
			{
				request.setAttribute("status",1);
				request.setAttribute("appDate", appDate);
				request.setAttribute("appTime", appTime);
				request.setAttribute("symptoms", symptoms);
				request.setAttribute("currentDate", currentDate);
				request.getRequestDispatcher("patient_home.jsp?page=booksuccess").forward(request, response);
			}
			stmt.close();
		}
		catch(Exception e){
			request.setAttribute("exception", 1);
        	request.setAttribute("message", e.getMessage());
        	request.getRequestDispatcher("patient_home.jsp?page=exception").forward(request, response);
		}
	}
}
