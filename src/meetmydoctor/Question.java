package meetmydoctor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Question {
	public static int addQuestion(String quest, String patid){
		int q =0;
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			String id = "QUE_";
			String uid = GenerateId.generate(id,"question");
			int  i = stmt.executeUpdate("insert into question values('"+uid+"','"+patid+"','"+quest+"')");
			if(i>0){
				q = 1;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return q;
	}
	public static int addAnswer(String ans, String qid, String docid) throws Exception{
		int q =0;
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			String id = "ANS_";
			String uid = GenerateId.generate(id,"answer");
			int  i = stmt.executeUpdate("insert into answer values('"+uid+"','"+qid+"','"+docid+"','"+ans+"')");
			if(i>0){
				q = 1;
			}
		return q;
	}
	public static ArrayList<String[]> allQuestions(){
		ArrayList<String[]> questList = new ArrayList<String[]>();
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from question");
			int k = 0;
			while(rs.next()){
				String[] quest = new String[3];
				quest[k]=rs.getString(1);
				quest[k+1]=rs.getString(2);
				quest[k+2]=rs.getString(3);
				questList.add(quest);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return questList;
	}
	public static ArrayList<String[]> patQuestions(String patid){
		ArrayList<String[]> patQuestList = new ArrayList<String[]>();
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from question where patient_id ='"+patid+"'");
			int k = 0;
			while(rs.next()){
				String[] quest = new String[3];
				quest[k]=rs.getString(1);
				quest[k+1]=rs.getString(2);
				quest[k+2]=rs.getString(3);
				patQuestList.add(quest);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return patQuestList;
	}
	public static ArrayList<String[]> allAnswers(String questid){
		ArrayList<String[]> ansList = new ArrayList<String[]>();
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from answer where ques_id ='"+questid+"'");
			int k = 0;
			while(rs.next()){
				String[] quest = new String[4];
				quest[k]=rs.getString(1);
				quest[k+1]=rs.getString(2);
				quest[k+2]=rs.getString(3);
				quest[k+3]=rs.getString(4);
				ansList.add(quest);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return ansList;
	}
	public static int checkAnsStatus(String docid, String qid){
		int q =0;
		try{
			Connection conn = Connectivity.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select doctor_id from answer where doctor_id ='"+docid+"' and ques_id ='"+qid+"'");
			if(rs.next()){
				q = 1;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return q;
	}
}
