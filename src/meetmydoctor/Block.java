package meetmydoctor;

import java.sql.Connection;
import java.sql.Statement;

public class Block {
	public static int blockAdmin(String u_id)throws Exception{
		int status = 0;
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			int i = stmt.executeUpdate("update admin set active_status = 0 where admin_id ='"+u_id+"'");
			if(i>0){
				status=1;
			}
		return status;
	}
	public static int blockDoctor(String u_id)throws Exception{
		int status = 0;
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			int i = stmt.executeUpdate("update doctor set active_status = 0 where doctor_id ='"+u_id+"'");
			if(i>0){
				status=1;
			}
		return status;
	}
	public static int blockPatient(String u_id)throws Exception{
		int status = 0;
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			int i = stmt.executeUpdate("update patient set active_status = 0 where patient_id ='"+u_id+"'");
			if(i>0){
				status=1;
			}
		return status;
	}
}
