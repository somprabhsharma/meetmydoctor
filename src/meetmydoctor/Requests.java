package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Requests extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String docid = session.getAttribute("userid").toString();
		ArrayList<String[]> app = new ArrayList<String[]>(); 
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from appointment where doctor_id ='"+docid+"'");
			int i=0;
			while(rs.next()){
				String data[] = new String[5];
				data[i+4]=rs.getString(1);
				String patid = rs.getString(2);
				Statement stmt1 = conn.createStatement();
				String name=null;
				ResultSet rsp = stmt1.executeQuery("select * from patient where patient_id ='"+patid+"'");
				if(rsp.next()){
					name=rsp.getString(2);
				}
				data[i]=name;
				data[i+1] = rs.getString(4);
				data[i+2] = rs.getString(5);
				data[i+3] = rs.getString(6);
				app.add(data);
			}
			session.setAttribute("requests", app);
			request.getRequestDispatcher("doctor_home.jsp?page=request").forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
