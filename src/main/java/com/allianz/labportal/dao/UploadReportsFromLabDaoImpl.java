package com.allianz.labportal.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allianz.labportal.main.MySqlDirectCall;
import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.UploadReportsFromLab;

@Repository
public class UploadReportsFromLabDaoImpl implements UploadReportsFromLabDao {
	

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}	

	@Override
	public UploadReportsFromLab addReports(UploadReportsFromLab reportsFromLab) {
		
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			session.save(reportsFromLab);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally {
			session.close();
		}
		return reportsFromLab;
	}

	@Override
	public String getUploadedReportsByTokenId(int id) {

		Session session = null;
		Transaction tx = null;  
		
		String uploadReports = "";
		
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			//tokenInfo = session.createQuery("from TokenTokenInfo").list();			
			uploadReports =  (String) session.createQuery("SELECT report from UploadReportsFromLab where token_id ='"+id+"'").uniqueResult();
			tx.commit();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}		
		}		
		return uploadReports;
	}

	@Override
	public String getNotUploadedReportsByTokenId(int id,String requestReoports,String uploadReports) {
		
		
			
		String pendingReports = "not pending reports";		
	
		try{			
			
			    
		
			//tokenInfo = session.createQuery("from TokenTokenInfo").list();
			//String reportList = (String) session.createQuery("SELECT medicalReports from HeadTokenInfo where id ='"+id+"'").uniqueResult();
			String allList[] = requestReoports.split(",");
			
			//String uploadedReports =  (String) session.createQuery("SELECT report from UploadReportsFromLab where token_id ='"+id+"'").uniqueResult();
			//String uploadedReports = directCall.getUploadedReportsByTokenId(id);
		
			
			List<String> notUploadList = new ArrayList<String>();
		
			if(uploadReports!=null){
				
				String uploadedList[] = uploadReports.split(",");
				for (String str : allList) {
					str = str.trim();
					Boolean status = true;
					for(String s : uploadedList){
						s = s.trim();
						if(s.equals(str)){
							status = false;
							break;
						}
					}
					if(status){
						notUploadList.add(str);
					}
				}	
				
				
			}	
			
			
			if(uploadReports==null ||uploadReports.isEmpty() ){
				pendingReports = requestReoports;				
			}
		
			if(notUploadList.size()>0){				
				pendingReports = notUploadList.toString();
				
			}			
			if(uploadReports !=null && notUploadList.size()==0){
				
				pendingReports = "not pending reports";
			}
			
			
		}catch(Exception e){
		
			pendingReports = "not pending reports";
			e.printStackTrace();
			
		}		
	
		return pendingReports;
	}

	@Override
	public UploadReportsFromLab getReportByTokenId(int id) {
		
		Session session = null;
		Transaction tx = null;  
		
		UploadReportsFromLab uploadReport = new UploadReportsFromLab();
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    		
			
			uploadReport =  (UploadReportsFromLab) session.createQuery("from UploadReportsFromLab where tokenId ='"+id+"'").uniqueResult();
			//System.out.println("Upload FilePAth: >>>>>>>>>>>>>><<<<<<<<<<<"+uploadReport.getFilepath());
				tx.commit();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}		
		}		
		return uploadReport;
		
	}

	@Override
	public void updateReportsByTokenId(int id, String reports) {
		Session session = null;
		Transaction tx = null;  
		
		UploadReportsFromLab uploadReport = new UploadReportsFromLab();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    
			uploadReport = (UploadReportsFromLab) session.createQuery("from UploadReportsFromLab where tokenId='"+id+"'").uniqueResult();
			uploadReport.setReport(reports);						
			session.save(uploadReport);	
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally {
			session.close();
		}
		
		
	}

	
	@Override
	public void updateReport_CountsByTokenId(int id, int uploadCount, int pendingCount) {
		Session session = null;
		Transaction tx = null;  
		
		UploadReportsFromLab uploadReport = new UploadReportsFromLab();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    		
			uploadReport = (UploadReportsFromLab) session.createQuery("from UploadReportsFromLab where tokenId='"+id+"'").uniqueResult();
			
			uploadReport.setUploadReportCount(uploadCount);
			uploadReport.setPendingReportCount(pendingCount);			
			session.save(uploadReport);	
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally {
			session.close();
		}
		
		
	}

	@Override
	public void updateLabCompleteStatus(int tokenId, String status) {
		
		Session session = null;
		Transaction tx = null;  
		
		UploadReportsFromLab uploadReport = new UploadReportsFromLab();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    
			uploadReport = (UploadReportsFromLab) session.createQuery("from UploadReportsFromLab where tokenId='"+tokenId+"'").uniqueResult();
			
			uploadReport.setUploadStatus(status);						
			session.save(uploadReport);	
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally {
			session.close();
		}
		
	}
	
	

}
