package com.allianz.labportal.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allianz.labportal.model.UploadReportsFromLab;
import com.allianz.labportal.model.Uploadreportsfromdoctor;

@Repository
public class UploadReportsFormDoctorDaoImpl implements UploadReportsFormDoctorDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}	
	
	@Override
	public Uploadreportsfromdoctor addReports(Uploadreportsfromdoctor reportsFromDoctor) {
		Session session = null;
		Transaction tx = null; 
		try{
			
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(reportsFromDoctor);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return reportsFromDoctor;
	}

	@Override
	public Uploadreportsfromdoctor getReportByTokenId(int id) {
		Session session = null;
		Transaction tx = null; 
		
		Uploadreportsfromdoctor uploadReport = new Uploadreportsfromdoctor();
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			
			uploadReport =  (Uploadreportsfromdoctor) session.createQuery("from Uploadreportsfromdoctor where tokenId ='"+id+"'").uniqueResult();
			//System.out.println("Upload FilePAth: >>>>>>>>>>>>>><<<<<<<<<<<"+uploadReport.getFilepath());
			tx.commit();
			
		}catch(Exception e){e.printStackTrace(); tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}		
		}		
		return uploadReport;
		
	}

}
