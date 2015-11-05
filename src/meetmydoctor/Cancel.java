package meetmydoctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String app_id = request.getParameter("appid");
		int status = AppStatus.cancel(app_id);
		if(status==1){
			request.setAttribute("cancelled", 1);
			request.setAttribute("appid", app_id);
			request.getRequestDispatcher("doctor_home.jsp?page=request").forward(request,response);
		}
	}
}
