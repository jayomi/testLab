package com.allianz.labportal.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.MedicalReports;
import com.allianz.labportal.model.SpecialMedicalReports;

@Repository
public class MedicalReportDaoImpl implements MedicalReportDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MedicalReports> getMedicalReportList() {
		Session session = null;
		Transaction tx = null;  
		
		List<MedicalReports> medicalReportList = new ArrayList<MedicalReports>();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    medicalReportList = session.createQuery("from MedicalReports").list();
			    tx.commit();
			    
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return medicalReportList;
	}

	@Override
	public List<SpecialMedicalReports> getSpecialMedicalReports() {
		Session session = null;
		Transaction tx = null;  
		
		List<SpecialMedicalReports> medicalReportList = new ArrayList<SpecialMedicalReports>();
		try{
			
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			
			    medicalReportList = session.createQuery("from SpecialMedicalReports").list();
			    tx.commit();
			
		}catch(Exception e){e.printStackTrace();
		
			tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return medicalReportList;
	}
	
	
}
