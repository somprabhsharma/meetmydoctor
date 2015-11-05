package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Question_entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String question1 =  request.getParameter("question1");
			HttpSession session = request.getSession();
			String patid = session.getAttribute("userid").toString();
			Connection conn = Connectivity.getConnection();			
		    try {
		        Statement stmt=conn.createStatement();
				int i = Question.addQuestion(question1, patid);
				if(i>0)
				{
					request.setAttribute("submit", 1);
					request.getRequestDispatcher("patient_home.jsp?page=question").forward(request, response);
				}
				else
				{
					request.setAttribute("submit", 0);
					request.getRequestDispatcher("patient_home.jsp?page=question").forward(request, response);	
				}
				stmt.close();
		        } 
		        catch (Exception e) {
		            e.printStackTrace();
		        }
	}

}
