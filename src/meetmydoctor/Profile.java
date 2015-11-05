package meetmydoctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session1 = request.getSession() ;
		Object obj = session1.getAttribute("type");
		if(obj!=null){
				String type = obj.toString();
				if(type.equals("patient")){
					request.getRequestDispatcher("patient_home.jsp?page=content").forward(request, response);
				}
				if(type.equals("doctor")){
					request.getRequestDispatcher("doctor_home.jsp?page=content").forward(request, response);
				}
				if(type.equals("admin")){
					request.getRequestDispatcher("admin_home.jsp?page=content").forward(request, response);
				}
			}
			else{
				request.setAttribute("error", 1);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Object obj = session.getAttribute("type");
		if(obj!=null){
			String type = session.getAttribute("type").toString();
			if(type.equals("patient")){
				request.getRequestDispatcher("patient_home.jsp?page=content").forward(request, response);
			}
			if(type.equals("doctor")){
				request.getRequestDispatcher("doctor_home.jsp?page=content").forward(request, response);
			}
			if(type.equals("admin")){
				request.getRequestDispatcher("admin_home.jsp?page=content").forward(request, response);
			}
		}
		else{
			request.setAttribute("error", 1);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}
