package com.allianz.labportal.dao;

import java.util.ArrayList;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




import com.allianz.labportal.model.User;

@Repository

public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override	
	public List<User> getUsersList() {
		
		Session session = null;
		List<User> userList = new ArrayList<User>();
		try{
			
			session = this.sessionFactory.openSession(); 
			userList = session.createQuery("from User").list();  
			 
			  
		}catch(Exception e){e.printStackTrace();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		return userList;		
	}


	@Override
	public void updateUser(User user) {
		
		Session session = null;		
		try{
			
			session = this.sessionFactory.openSession(); 
			//session.update(user);
			 System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA...................");
			  
		}catch(Exception e){e.printStackTrace();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
	
	}


	@Override
	
	public void deleteUser(int id) {
		
		Session session = null ; 
		try{
			
			try {
			    session = this.sessionFactory.getCurrentSession();
			} catch (HibernateException e) {
			    session = sessionFactory.openSession();
			}
			
			
			User u = (User) session.load(User.class, new Integer(id));
			if (null != u) {
				System.out.println("user name: "+u.getUsername());
				session.delete(u);			
				
				System.out.println("delete user .........id ="+id+" ");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.flush();
		}
		
		
	}


	@Override
	public User addUser(User user) {
		Session session = null;
		try{
			try {
			    session = this.sessionFactory.getCurrentSession();
			} catch (HibernateException e) {
			    session = sessionFactory.openSession();
			}
			System.out.println("add user name:<<<<<< >>>> "+user.getUsername());
			
			session.save(user);
			//session.getTransaction().commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();}
		return user;
	}
}
