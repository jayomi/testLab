package com.allianz.labportal.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import com.allianz.labportal.model.HeadTokenInfo;
import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;

public class MySqlDirectCall {
	
	public Connection setConnection(){
		
		//local configurations
			
	/*	final String dburl = "jdbc:mysql://localhost:3306/allianz_lab_portal";
		String dbname="allianz_lab_portal";
		final String user = "root";
		final String password = "root";
		Connection conn = null;
		Statement stmt = null;
		*/
	
		
		//server configurations
		final String dburl = "jdbc:mysql://192.168.128.36:3306/allianz_lab_portal";
		String dbname="allianz_lab_portal";
		final String user = "allianz_lab_portal";
		final String password = "labportal@123";
		Connection conn = null;
		Statement stmt = null;
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dburl, user, password);
			
			
		
		}catch(Exception e){
			e.printStackTrace();
		}
	
	return conn;
	}
	
	public void updatePendingReportsFromLab(int tokenid,int pendingReportCount) throws SQLException{
		
		Connection conn = setConnection();
		try{		
		
		String updateQuery = "update head_token_info set pending_report_count_from_lab='"+pendingReportCount+"' where id ='"+tokenid+"'";
		Statement updateStmt=conn.createStatement();
		updateStmt.executeUpdate(updateQuery);
		System.out.println("************** head token info db updated............");
		
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null){
				conn.close();
			}
		}
	}
	
	public void updateReport_CountsByTokenId(int tokenId,int uploadReport_Count,int pendingReport_Count){
		Connection conn = setConnection();
		try{
			
			String selectQuery = "select id from upload_reports_from_lab where token_id='"+tokenId+"'";
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(selectQuery);			
			while(rs.next()){
				
				int rowIndex = rs.getInt("id");
				String updateQuery = "update upload_reports_from_lab set upload_report_count = '"+uploadReport_Count+"',pending_report_count='"+pendingReport_Count+"' where id='"+rowIndex+"'";

				Statement updateStmt=conn.createStatement();
				updateStmt.executeUpdate(updateQuery);
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		}
	}
	
	public String getUploadedReportsByTokenId(int tokenId){
		Connection conn = setConnection();
		String uploadReports = "";
		try{
			
			String selectQuery = "select report from upload_reports_from_lab where token_id ='"+tokenId+"'";
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(selectQuery);			
			while(rs.next()){
				
				uploadReports = rs.getString("report");
				System.out.println(">>>>>>>Start: Mysql: "+uploadReports);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		}
		
		System.out.println(">>>>>>>End: Mysql ooooooooooo: "+uploadReports);
		return uploadReports;
		
	}
	
	/*@SuppressWarnings("finally")
	public HeadTokenInfo getheadTokenbyId(int id) throws SQLException{
	
			
			Connection conn = setConnection();
			HeadTokenInfo headtoken = new HeadTokenInfo();
			try{		
			
			String selectQuery = "select * from head_token_info where id='"+id+"'";
			Statement stmt=conn.createStatement();
			
			
			
			ResultSet rs=stmt.executeQuery(selectQuery);			
			while(rs.next()){							
				int tokenId = rs.getInt("id");
				String created_by = rs.getString("created_by");
				Date createdDate = rs.getDate("created_date");
				String branch = rs.getString("branch");
				String customerName = rs.getString("customer_name");
				String nic = rs.getString("nic");
				String proposalNo = rs.getString("proposal_no");
				String tokenStatus = rs.getString("token_status");
				String report_category = rs.getString("report_category");
				String medical_reports = rs.getString("medical_reports");
				String special_medical_reports = rs.getString("special_medical_reports");
				String other_medical_reports = rs.getString("other_medical_reports");
				int labId = rs.getInt("lab_id");
				String labName = rs.getString("lab_name");
				String priority = rs.getString("priority");
				String appointment_date = rs.getString("appointment_date");
				String appointment_time = rs.getString("appointment_time");
				String token_create_comment = rs.getString("token_create_comment");
				String special_instructions = rs.getString("special_instructions");
				String remarks = rs.getString("remarks");
				int pending_report_count_from_lab = rs.getInt("pending_report_count_from_lab");
				String complete_status_lab = rs.getString("complete_status_lab");
				String lab_comment = rs.getString("lab_comment");
				String doctor_name = rs.getString("doctor_name");
				String complete_status_doctor = rs.getString("complete_status_doctor");
				String doctor_comment = rs.getString("doctor_comment");
				String admin_comment = rs.getString("admin_comment");
				String username = rs.getString("username");
				
				headtoken = new HeadTokenInfo(created_by, createdDate, branch, customerName, nic, proposalNo, tokenStatus, report_category, medical_reports, special_medical_reports, other_medical_reports, labId, labName, priority, appointment_date, appointment_time, token_create_comment, special_instructions, remarks, pending_report_count_from_lab, complete_status_lab, lab_comment, doctor_name, complete_status_doctor, doctor_comment, admin_comment, username);
				
				//System.out.println(">>>>>>>Start: Mysql: "+uploadReports);
			}
			
			return headtoken;
			
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				if(conn!=null){
					conn.close();
				}
				return headtoken;
			}
			
		
	
	}*/

}
