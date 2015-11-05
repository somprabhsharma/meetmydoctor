package meetmydoctor;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GenerateReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startdate = request.getParameter("sdate");
		String enddate = request.getParameter("edate");
		String report = request.getParameter("report");
		if(report.equals("1")){
			ArrayList<String[]> appList = Generate.appReport(startdate, enddate);
			request.setAttribute("return", 1);
			request.setAttribute("appList", appList);
			request.getRequestDispatcher("admin_home.jsp?page=gen_report").forward(request, response);
		}
		else if(report.equals("2")){
			ArrayList<String[]> scheduleList = Generate.scheduleReport(startdate, enddate);
			request.setAttribute("scheduleList", scheduleList);
			request.setAttribute("return", 2);
			request.getRequestDispatcher("admin_home.jsp?page=gen_report").forward(request, response);
		}
		else{
			request.setAttribute("return", 0);
			request.getRequestDispatcher("admin_home.jsp?page=gen_report").forward(request, response);
		}
	}
}
