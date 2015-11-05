package meetmydoctor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DocDet {
	public static String[] getDetails(String docid){
		String[] details = new String[5];
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from doctor where doctor_id ='"+docid+"'");
			int i =0;
			while(rs.next()){
				details[i]=rs.getString(2);
				details[i+1]=rs.getString(3);
				details[i+2]=rs.getString(6);
				details[i+3]=""+rs.getString(7)+", "+rs.getString(8)+", "+rs.getString(9);
			}
		}
		catch(Exception e){
			
		}
		return details;
	}
	public static String getDate(String docid){
		String enddate = null;
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select end_date from availability where doctor_id ='"+docid+"'");
			if(rs.next()){
				enddate = rs.getString(1);
			}
		}
		catch(Exception e){
			
		}
		return enddate;
	}
	public static String getStartDate(String docid){
		String startdate = null;
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select start_date from availability where doctor_id ='"+docid+"'");
			if(rs.next()){
				startdate = rs.getString(1);
			}
		}
		catch(Exception e){
			
		}
		return startdate;
	}
	public static String[] getTime(String docid){
		String[] time = new String[3];
		time[0]=null;
		time[1]=null;
		time[2]=null;
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select mor_slot, noon_slot, eve_slot from availability where doctor_id ='"+docid+"'");
			if(rs.next()){
				if(!rs.getString(1).equals("0-0")){
					time[0]=rs.getString(1);
				}
				if(!rs.getString(2).equals("0-0")){
					time[1]=rs.getString(2);
				}
				if(!rs.getString(3).equals("0-0")){
					time[2]=rs.getString(3);
				}
			}
		}
		catch(Exception e){
			
		}
		return time;
	}
	public static ArrayList<String[]> getAllDoctors(String city, String field, String state){
		ArrayList<String[]> list1 = new ArrayList<String[]>();
		Connection conn = Connectivity.getConnection();
		try{
			Statement stmt1 = conn.createStatement();
			ResultSet rsn = null;
			if(city.equals("1")&&field.equals("1")){
				rsn=stmt1.executeQuery("select * from doctor where state ='"+state+"'");
			}
			else if(city.equals("1")){
				rsn=stmt1.executeQuery("select * from doctor where field_name = '"+field+"' and state ='"+state+"'");
			}
			else if(field.equals("1")){
				rsn=stmt1.executeQuery("select * from doctor where city = '"+city+"'");
			}
			else{
				rsn=stmt1.executeQuery("select * from doctor where city = '"+city+"' and field_name = '"+field+"'");
			}	
			int i =0;
			while(rsn.next()){
				String[] doc = new String[8];
				doc[i]=rsn.getString(2);
				doc[i+1]=rsn.getString(3);
				doc[i+2]=rsn.getString(6);
				doc[i+3]=rsn.getString(7);
				doc[i+4]=rsn.getString(8);
				doc[i+5]=rsn.getString(9);
				doc[i+6]="4";
				doc[i+7]=rsn.getString(1);
				list1.add(doc);
			}
			
		}
		catch(Exception e){
			
		}
		return list1;
	}
	public static ArrayList<String[]> getAvailDoctors(String city, String field, String state){
		ArrayList<String[]> list1 = new ArrayList<String[]>();
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt1 = conn.createStatement();
			ResultSet rsn = null;
			if(city.equals("1")&&field.equals("1")){
				rsn=stmt1.executeQuery("select d.* from doctor d, availability a where d.doctor_id = a.doctor_id and d.state ='"+state+"'");
			}
			else if(city.equals("1")){
				rsn=stmt1.executeQuery("select d.* from doctor d, availability a where d.field_name = '"+field+"' and d.state ='"+state+"' and d.doctor_id = a.doctor_id");
			}
			else if(field.equals("1")){
				rsn=stmt1.executeQuery("select d.* from doctor d, availability a where d.city = '"+city+"' and d.doctor_id = a.doctor_id");
			}
			else{
				rsn=stmt1.executeQuery("select d.* from doctor d, availability a where d.city = '"+city+"' and d.field_name = '"+field+"' and d.doctor_id = a.doctor_id");
			}	
			int i =0;
			while(rsn.next()){
				String[] doc = new String[8];
				doc[i]=rsn.getString(2);
				doc[i+1]=rsn.getString(3);
				doc[i+2]=rsn.getString(6);
				doc[i+3]=rsn.getString(7);
				doc[i+4]=rsn.getString(8);
				doc[i+5]=rsn.getString(9);
				doc[i+6]="4";
				doc[i+7]=rsn.getString(1);
				list1.add(doc);
			}
			
		}
		catch(Exception e){
			
		}
		return list1;
	}
	public static ArrayList<String> getVisitedDoctors(String patid){
		ArrayList<String> list1 = new ArrayList<String>();
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt1 = conn.createStatement();
			ResultSet rsn = stmt1.executeQuery("select doctor_id from appointment where patient_id ='"+patid+"'");
			while(rsn.next()){
				list1.add(rsn.getString(1));
			}
			
		}
		catch(Exception e){
			
		}
		return list1;
	}
	
}
