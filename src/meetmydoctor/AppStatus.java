package meetmydoctor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class AppStatus {
	public static int approve(String app_id) throws Exception{
		int status = 0;
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			int i = stmt.executeUpdate("update appointment set approval_status = 1 where app_id ='"+app_id+"'");
			if(i>0){
				status=1;
			}
		return status;
	}
	public static int cancel(String app_id){
		int status2 = 0;
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			int i = stmt.executeUpdate("update appointment set approval_status = 2 where app_id ='"+app_id+"'");
			if(i>0){
				status2=1;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status2;
	}
	public static int approvalStatus(String app_id){
		int status3 = 0;
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select approval_status from appointment where app_id ='"+app_id+"'");
			if(rs.next()){
				status3 = rs.getInt(1);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status3;
	}
	public static int appointmentStatus(String app_id){
		int status4 = 0;
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select app_status from appointment where app_id ='"+app_id+"'");
			if(rs.next()){
				status4 = rs.getInt(1);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status4;
	}
	public static void updateAppStatus(String app_id){
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			int i = stmt.executeUpdate("update appointment set app_status = 1 where app_id ='"+app_id+"'");
			if(i>0){
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
