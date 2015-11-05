package meetmydoctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
public class City extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String stateName = request.getParameter("state_n");
		try{ Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ddc","root","");
		 Statement st = conn.createStatement();
		ResultSet rsCity = st.executeQuery("select * from state where state = '"+stateName+"' and city is not null order by city asc");
		ArrayList<String> cityList = new ArrayList<String>();
		while(rsCity.next()){
			cityList.add(rsCity.getString(2));
		}
		String json = null;
		json = new Gson().toJson(cityList);
		response.setContentType("application/json");
		response.getWriter().write(json);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		}
}
