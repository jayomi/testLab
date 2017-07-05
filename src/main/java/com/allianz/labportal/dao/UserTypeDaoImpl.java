package com.allianz.labportal.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allianz.labportal.model.User;
import com.allianz.labportal.model.UserType;

@Repository
public class UserTypeDaoImpl implements UserTypeDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public UserType getUserTypeById(int id) {
		Session session = null ; 
		Transaction tx = null; 
		
		UserType userType = new UserType();
		try{
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			
			
			userType = (UserType) session.load(UserType.class, new Integer(id));
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
		return userType;
		
	}

}
