package com.allianz.labportal.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




import com.allianz.labportal.model.User;
import com.allianz.labportal.model.UserType;

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
		Transaction tx = null;  
		
		List<User> userList = new ArrayList<User>();
		try{
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			userList = session.createQuery("from User").list();  
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
		return userList;		
	}


	@Override
	public void updateUser(User user) {
		
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			 session = this.sessionFactory.openSession();
			 tx = session.beginTransaction(); 
			
			user.setPasswordModifyDate(new Date());
			user.setCreatedDate(new Date());
			session.update(user);		
			session.flush();
			tx.commit();
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>> updated.....");
			  
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


	@Override	
	public void deleteUser(int id) {
		Session session = null ; 
		Transaction tx = null;  
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    User u = (User) session.load(User.class, new Integer(id));
			if (null != u) {
				
				session.delete(u);	
				tx.commit();
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.flush();
			session.close();
		}
	}


	@Override
	public User addUser(User user) {
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    		
			session.save(user);
			tx.commit();
			//session.getTransaction().commit();
			session.flush();
			
		}catch(Exception e){
			e.printStackTrace();tx.rollback();
			}finally {
				session.close();
			
			}
		return user;
	}


	@Override
	public User checkUserByUserName(String userName) {
		Session session = null;
		Transaction tx = null;  
		
		User loginUser = new User();
		try{
			
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			loginUser = (User) session.createQuery("from User where username='"+userName+"'").uniqueResult();			
			tx.commit();
			
			  
		}catch(Exception e){e.printStackTrace();
		tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		return loginUser;	
	}


	@Override
	public User checkNonADUser(String userName, String password) {
		Session session = null;
		Transaction tx = null;  
		
		User loginUser = new User();
		try{
			
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			loginUser = (User) session.createQuery("from User where username='"+userName+"' and password='"+password+"'").uniqueResult();			
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
		return loginUser;	
		
	}


	@Override
	public String getUserType(String userName,String password) {
		Session session = null;
		Transaction tx = null;  
		
		String loginUserType="";
		try{
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			//select user_type_id from User where username='shashika' and password='shashika';			
			 UserType userType =  (UserType) session.createQuery("select userType from User where username='"+userName+"' and password='"+password+"'").uniqueResult();
			 loginUserType = userType.getType();
			 tx.commit();
			  
		}catch(Exception e){e.printStackTrace();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
		}
		
		return loginUserType;
	}


	@Override
	public String getUserType(String userName) {
		Session session = null;
		Transaction tx = null;  
		
		String loginUserType="";
		try{
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			//select user_type_id from User where username='shashika' and password='shashika';			
			 UserType userType =  (UserType) session.createQuery("select userType from User where username='"+userName+"'").uniqueResult();
			 loginUserType = userType.getType();
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
		
		return loginUserType;
	}

	@SuppressWarnings("unchecked")
	@Override
	public User getUserById(int id) {
		
		Session session = null;
		Transaction tx = null;  
		
		User user = new User();
		try{
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			user = (User) session.createQuery("from User where id='"+id+"'").uniqueResult(); //(User) session.load(User.class, new Integer(id)); 
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
		return user;	
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUserListByUserType(int usertypeId) {
			
			Session session = null;
			Transaction tx = null;  
			
			List<User> userList = new ArrayList<User>();
			try{
				session = this.sessionFactory.openSession(); 
				tx = session.beginTransaction();
				userList = session.createQuery("from User where user_type_id='"+usertypeId+"'").list();  
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
			return userList;		
		}


	@Override
	public Date getLastModifyDate(int id) {
		Date lastModifyDate=null;
		Session session = null;
		Transaction tx = null;  
		
		User user = new User();
		try{
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction(); 
			user = (User) session.createQuery("from User where id='"+id+"'").uniqueResult();  
			lastModifyDate = user.getPasswordModifyDate();
			 tx.commit();
		}catch(Exception e){e.printStackTrace(); tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
		}			
		return lastModifyDate;
	}

	@Override
	public Boolean getFirstLoginStatus(int id) {
		Boolean firstLoginStstus = false;
		Session session = null;
		Transaction tx = null; 	
		
		User user = new User();
		try{
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction(); 
			user = (User) session.createQuery("from User where id='"+id+"'").uniqueResult();  
			firstLoginStstus = user.isFirstLoginStatus();
			 tx.commit();
		}catch(Exception e){e.printStackTrace(); tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
		}			
		return firstLoginStstus;
	}


	@Override
	public User checkUserByUserNameAndUserType(String userName, int userTypeId) {
		Session session = null;
		Transaction tx = null;  
		
		User loginUser = new User();
		try{
			
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			loginUser = (User) session.createQuery("from User where username='"+userName+"' and userTypeId ='"+userTypeId+"' ").uniqueResult();			
			tx.commit();
			
			  
		}catch(Exception e){e.printStackTrace();
		tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		return loginUser;	
	}

	
}
