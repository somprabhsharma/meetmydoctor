package meetmydoctor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Generate {
	public static ArrayList<String[]> appReport(String startdate, String enddate){
		ArrayList<String[]> appList = new ArrayList<String[]>();
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from appointment where schedule_date between '"+startdate+"' and '"+enddate+"'");
			int k = 0;
			while(rs.next()){
				String[] quest = new String[9];
				quest[k]=rs.getString(1);
				quest[k+1]=rs.getString(2);
				Statement stmt1 = conn.createStatement();
				ResultSet rsp = stmt1.executeQuery("select * from patient where patient_id ='"+quest[k+1]+"'");
				String pname =null;
				if(rsp.next()){
					pname=rsp.getString(2);
				}
				quest[k+2]=pname;
				quest[k+3]=rs.getString(3);
				Statement stmt2 = conn.createStatement();
				ResultSet rsd = stmt2.executeQuery("select * from doctor where doctor_id ='"+quest[k+3]+"'");
				String dname =null;
				if(rsd.next()){
					dname=rsd.getString(2);
				}
				quest[k+4]=dname;
				quest[k+5]=rs.getString(4);
				quest[k+6]=rs.getString(5);
				Date date = new Date();
				String currentDate= new SimpleDateFormat("yyyy-MM-dd").format(date);
				if(quest[k+5].compareTo(currentDate)<0){
					AppStatus.updateAppStatus(quest[k]);
				}
				quest[k+7]=rs.getString(6);
				quest[k+8]=rs.getString(7);
				appList.add(quest);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return appList;
	}
	public static ArrayList<String[]> scheduleReport(String startdate, String enddate){
		ArrayList<String[]> scheduleList = new ArrayList<String[]>();
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from availability where start_date >= '"+startdate+"' and end_date <= '"+enddate+"'");
			int k = 0;
			while(rs.next()){
				String[] quest = new String[8];
				quest[k]=rs.getString(1);
				quest[k+1]=rs.getString(2);
				quest[k+2]=rs.getString(3);
				Statement stmt2 = conn.createStatement();
				ResultSet rsd = stmt2.executeQuery("select * from doctor where doctor_id ='"+quest[k+1]+"'");
				String dname =null;
				if(rsd.next()){
					dname=rsd.getString(2);
				}
				quest[k+3]=dname;
				quest[k+4]=rs.getString(4);
				quest[k+5]=rs.getString(5);
				quest[k+6]=rs.getString(6);
				quest[k+7]=rs.getString(7);
				scheduleList.add(quest);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return scheduleList;
	}
}
