package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AppHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String patid = session.getAttribute("userid").toString();
		ArrayList<String[]> app = new ArrayList<String[]>(); 
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from appointment where patient_id ='"+patid+"'");
			int i=0;
			while(rs.next()){
				String data[] = new String[8];
				data[i+7]=rs.getString(1);
				String docid = rs.getString(3);
				Statement stmt1 = conn.createStatement();
				String name=null;
				String email=null;
				String field=null;
				String address=null;
				ResultSet rsp = stmt1.executeQuery("select * from doctor where doctor_id ='"+docid+"'");
				if(rsp.next()){
					name=rsp.getString(2);
					email=rsp.getString(3);
					field=rsp.getString(6);
					address=""+rsp.getString(7)+", "+rsp.getString(8)+", "+rsp.getString(9);
				}
				data[i]=name;
				data[i+1]=email;
				data[i+2]=field;
				data[i+3]=address;
				data[i+4] = rs.getString(4);
				Date date = new Date();
				String currentDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
				if(data[i+4].compareTo(currentDate)<0){
					AppStatus.updateAppStatus(data[i+7]);
				}
				data[i+5] = rs.getString(5);
				data[i+6] = rs.getString(6);
				app.add(data);
			}
			session.setAttribute("requests", app);
			request.getRequestDispatcher("patient_home.jsp?page=appHistory").forward(request, response);
		}
		catch(Exception e){
			request.setAttribute("exception", 1);
        	request.setAttribute("message", e.getMessage());
        	request.getRequestDispatcher("admin_home.jsp?page=exception").forward(request, response);
		}
	}
}
