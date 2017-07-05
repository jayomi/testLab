package com.allianz.labportal.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.allianz.labportal.model.AssignTolab;


@Repository
public class TokenAssignToLabDaoImpl implements TokenAssignToLabDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<AssignTolab> getLabList() {
		Session session = null;
		Transaction tx = null;  
		
		List<AssignTolab> assignToLabList = new ArrayList<AssignTolab>();
		try{			
							
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    assignToLabList = session.createQuery("from AssignTolab").list();
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
		
		return assignToLabList;
	}


	@Override
	public AssignTolab addTokenAssignToLab(AssignTolab assignToLab) {
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			System.out.println("Token Assign To lab:<<<<<< >>>> "+assignToLab.getLabName());
			
			session.save(assignToLab);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally {
			session.close();
		}
		return assignToLab;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<AssignTolab> getLabListByEmail(String email) {
		Session session = null;
		Transaction tx = null;  
		
		List<AssignTolab> assignToLabList = new ArrayList<AssignTolab>();
		try{			
							
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    assignToLabList = session.createQuery("from AssignTolab where userEmail='"+email+"'").list();
			//assignToLabList = session.createQuery("select lab,head from AssignTolab lab,HeadTokenInfo head where head.userEmail='"+email+"' and").list();
			    tx.commit();
		}catch(Exception e){e.printStackTrace(); tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return assignToLabList;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<AssignTolab> getLabListByBranch(String branch) {
		
		Session session = null;
		Transaction tx = null;  
		
		List<AssignTolab> assignToLabList = new ArrayList<AssignTolab>();
		try{			
							
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			assignToLabList = session.createQuery("from AssignTolab where branch='"+branch+"'").list();
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
		
		return assignToLabList;
	}


	
}
