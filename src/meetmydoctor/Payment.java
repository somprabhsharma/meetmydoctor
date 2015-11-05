package meetmydoctor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String result=request.getParameter("payment");
			RequestDispatcher rd;
			if(result.equals("netbanking"))
			{
				rd=request.getRequestDispatcher("netbanking.html");
			}
			else if(result.equals("debit card"))
			{
				rd=request.getRequestDispatcher("card.html");
			}
			else
			{
				rd=request.getRequestDispatcher("card.html");
			}
			rd.forward(request, response);
		}
		catch(Exception e){
			
		}
	}

}