package meetmydoctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Answer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qid =request.getParameter("qid");
		request.setAttribute("ans", 1);
		request.setAttribute("questionid", qid);
		request.getRequestDispatcher("patient_home.jsp?page=question").forward(request, response);
	}
}
