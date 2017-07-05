package com.allianz.labportal.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TabAgentImpl {


	//arena db conection
			public Connection getArenaConnection(){
				
				final String dburl = "jdbc:mysql://10.10.10.20:3306/aznew";
				String dbname="aznew";
				final String user = "arena_ql";
				final String password = "arena@log312#";
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
			
			//check Agent from Arina DB.....
			public int checkAgent(String agentCode) throws SQLException{
				
				int id=0;
				Connection conn = getArenaConnection();
				
				try{
					
					String AD_Agent_Query = "SELECT Agent_Id FROM agent_register where AgentCode='"+agentCode+"'";
					
					Statement stmt1=conn.createStatement();
					ResultSet rs=stmt1.executeQuery(AD_Agent_Query);
					
					while(rs.next()){	
						id=rs.getInt("Agent_Id");
					}
					if(id == 0){
						
						String Not_AD_Agent_Query = "SELECT id FROM tbl_users where username='"+agentCode+"'";
						
						Statement stmt2=conn.createStatement();
						ResultSet result=stmt2.executeQuery(Not_AD_Agent_Query);
						while(result.next()){
							id=rs.getInt("Agent_Id");
						}
					}					
					
					
				}catch(Exception e){
					e.printStackTrace();
				}
				finally{
					conn.close();
				}
				return id;//if not exist agent code return 0
			}


	}
