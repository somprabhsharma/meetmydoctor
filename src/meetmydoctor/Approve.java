package meetmydoctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Approve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String app_id = request.getParameter("appid");
		try{
			int status = AppStatus.approve(app_id);
			if(status==1){
				request.setAttribute("approved", 1);
				request.setAttribute("appid", app_id);
				request.getRequestDispatcher("doctor_home.jsp?page=request").forward(request,response);
			}
		}
		catch(Exception e){
			request.setAttribute("exception", 1);
        	request.setAttribute("message", e.getMessage());
        	request.getRequestDispatcher("doctor_home.jsp?page=exception").forward(request, response);
		}
	}
}
