package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=Connectivity.getConnection();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
	        try {
	            Statement stmt=conn.createStatement();
	            ResultSet rsp = stmt.executeQuery("select * from patient where patient_id = '"+userid+"' and password = '"+password+"' and active_status=1");
	            Statement stmt1=conn.createStatement();
	            ResultSet rsd = stmt1.executeQuery("select * from doctor where doctor_id = '"+userid+"' and password = '"+password+"'  and active_status=1");
	            Statement stmt2=conn.createStatement();
	            ResultSet rsa = stmt2.executeQuery("select * from admin where admin_id = '"+userid+"' and admin_password = '"+password+"'  and active_status=1");
				if(rsp.next())
				{
					HttpSession session=request.getSession(true);
					session.setAttribute("userid",userid);
					session.setAttribute("type", "patient");
					request.getRequestDispatcher("Profile").forward(request, response);
				}
				else
				{ 
					if(rsd.next()){
						HttpSession session=request.getSession(true);
						session.setAttribute("userid",userid);
						session.setAttribute("type", "doctor");
						request.getRequestDispatcher("Profile").forward(request, response);
					}
					else{
						if(rsa.next()){
							HttpSession session=request.getSession(true);
							session.setAttribute("userid",userid);
							session.setAttribute("type", "admin");
							request.getRequestDispatcher("Profile").forward(request, response);
						}
						else{
						request.setAttribute("err", 1);
						request.getRequestDispatcher("index.jsp").forward(request, response);
						}
					}
				}
				stmt.close();	
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}


}
