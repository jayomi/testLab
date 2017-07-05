package com.allianz.labportal.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allianz.labportal.model.Register;
import com.allianz.labportal.model.RegisterUser;
import com.allianz.labportal.model.User;

@Repository
public class RegisterDaoImpl implements RegisterDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Register addUser(Register user) {
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction();  
			session.save(user);	
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return user;
	}

	@Override
	public RegisterUser checkUserByUserName(String userName) {
		
		Session session = null;
		Transaction tx = null;  
		
		RegisterUser registerUser = new RegisterUser();
		try{
			
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			registerUser = (RegisterUser) session.createQuery("from RegisterUser where username='"+userName+"'").uniqueResult();			
			tx.commit();
			
			  
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		return registerUser;	
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Register> getRequestUserList(byte accessType, String userType) {
		
		Session session = null;
		Transaction tx = null;  
		
		List<Register> requestingList = new ArrayList<Register>();
		try{
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			requestingList = session.createQuery("from Register where accessType='"+accessType+"' and userType='"+userType+"'").list();  
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
		return requestingList;	
	}

	@Override
	public void acceptUser(int id) {
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction(); 
			 
			Register regUser = (Register) session.createQuery("from Register where id='"+id+"'").uniqueResult();
			regUser.setAccessType((byte)1);
			session.update(regUser);		
			session.flush();
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
	
	}

}
