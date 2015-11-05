package meetmydoctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Answer_entry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qid=request.getParameter("qid");
		HttpSession session = request.getSession();
		String docid = session.getAttribute("userid").toString();
		String ans = request.getParameter("ans");
		try{
			int i = Question.addAnswer(ans, qid, docid);
			if(i>0){
				request.setAttribute("done", 1);
				request.setAttribute("qqid", qid);
				request.getRequestDispatcher("doctor_home.jsp?page=answer").forward(request,response);
			}
			else{
				request.setAttribute("done",0);
				request.setAttribute("qqid", qid);
				request.getRequestDispatcher("doctor_home.jsp?page=answer").forward(request,response);
			}
		}
		catch(Exception e){
			request.setAttribute("exception", 1);
        	request.setAttribute("message", e.getMessage());
        	request.getRequestDispatcher("patient_home.jsp?page=exception").forward(request, response);
		}
	}
}
