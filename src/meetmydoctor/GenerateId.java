package meetmydoctor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class GenerateId {
    public static String generate(String id, String table){
    	int max = 0;
    	try{
    		Connection conn = Connectivity.getConnection();
    		Statement stm = conn.createStatement();
    	    ResultSet res = stm.executeQuery("select count(*) from "+table);
    	    if (res.next()) {
    	        max = res.getInt(1);
    	    }
    	    if (max >= 0 && max < 10) {
    	        id = id + "000" + (max + 1);
    	    } else if (max >= 10 && max < 100) {
    	        id = id + "00" + (max + 1);
    	    } else if (max >= 100 && max < 1000) {
    	        id = id + "0" + (max + 1);
    	    } else if (max >= 1000 && max < 9999) {
    	        id = id + "" + (max + 1);
    	    }
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    	return id;
    }  
}
