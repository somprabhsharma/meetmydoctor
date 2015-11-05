package meetmydoctor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class BlockUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String utype = request.getParameter("utype");
		String u_id = request.getParameter("uid");
		if(utype.equals("admin")){
			try{
				int status = Block.blockAdmin(u_id);
				if(status==1){
					request.setAttribute("status", 1);
					request.getRequestDispatcher("admin_home.jsp?page=block").forward(request, response);
				}
				else{
					request.setAttribute("status", 0);
					request.getRequestDispatcher("admin_home.jsp?page=block").forward(request, response);
				}
			}
			catch(Exception e){
				request.setAttribute("exception", 1);
	        	request.setAttribute("message", e.getMessage());
	        	request.getRequestDispatcher("admin_home.jsp?page=exception").forward(request, response);
			}
		}
		else if(utype.equals("doctor")){
			try{
				int status = Block.blockDoctor(u_id);
				if(status==1){
					request.setAttribute("status", 1);
					request.getRequestDispatcher("admin_home.jsp?page=block").forward(request, response);
				}
				else{
					request.setAttribute("status",0);
					request.getRequestDispatcher("admin_home.jsp?page=block").forward(request, response);
				}
			}
			catch(Exception e){
				request.setAttribute("exception", 1);
	        	request.setAttribute("message", e.getMessage());
	        	request.getRequestDispatcher("admin_home.jsp?page=exception").forward(request, response);
			}
		}
		else if(utype.equals("patient")){
			try{
				int status = Block.blockPatient(u_id);
				if(status==1){
					request.setAttribute("status", 1);
					request.getRequestDispatcher("admin_home.jsp?page=block").forward(request, response);
				}
				else{
					request.setAttribute("status", 0);
					request.getRequestDispatcher("admin_home.jsp?page=block").forward(request, response);
				}
			}
			catch(Exception e){
				request.setAttribute("exception", 1);
	        	request.setAttribute("message", e.getMessage());
	        	request.getRequestDispatcher("admin_home.jsp?page=exception").forward(request, response);
			}
		}
		else{
			request.setAttribute("select", 0);
			request.getRequestDispatcher("admin_home.jsp?page=block").forward(request, response);
		}
	}
}
