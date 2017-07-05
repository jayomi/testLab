package com.allianz.labportal.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allianz.labportal.model.AssignToDoctor;
import com.allianz.labportal.model.AssignTolab;

@Repository
public class AssignToDoctorDaoImpl implements AssignToDoctorDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public AssignToDoctor addReportAssignToDoctor(AssignToDoctor assignToDoctor) {
		Session session = null;
		Transaction tx = null;  
		try{
			
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(assignToDoctor);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return assignToDoctor;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AssignToDoctor> getDoctorList() {

		Session session = null;
		Transaction tx = null;  
		
		List<AssignToDoctor> assignToDoctorList = new ArrayList<AssignToDoctor>();
		try{		
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();			    
			
			assignToDoctorList = session.createQuery("from AssignToDoctor").list();
				tx.commit();
			
		}catch(Exception e){e.printStackTrace(); tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return assignToDoctorList;
	}

}
