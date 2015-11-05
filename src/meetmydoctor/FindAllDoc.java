package meetmydoctor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindAllDoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String speciality = request.getParameter("speciality");
		String city  = request.getParameter("cityname");
		String state = request.getParameter("state1");
		ArrayList<String[]> list1 = DocDet.getAllDoctors(city, speciality, state);
		if(!list1.isEmpty()){
			request.setAttribute("docdet",list1);
			request.setAttribute("result", 1);
			request.getRequestDispatcher("docdir.jsp").forward(request, response);
		}
		else{
			request.setAttribute("docdet",list1);
			request.setAttribute("result", 0);
			request.getRequestDispatcher("docdir.jsp").forward(request, response);
		}
	}
}
