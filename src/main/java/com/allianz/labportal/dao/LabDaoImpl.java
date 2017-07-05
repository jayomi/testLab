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
import com.allianz.labportal.model.Lab;
import com.allianz.labportal.model.User;

@Repository
public class LabDaoImpl implements LabDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public void addLab(Lab lab) {
		
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(lab);	
			tx.commit();
			session.flush();
			
		}catch(Exception e){
			e.printStackTrace();tx.rollback();
			}finally {
				session.close();
			}
		
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Lab> getLabList() {
		
		Session session = null;
		Transaction tx = null;  
		
		List<Lab> labList = new ArrayList<Lab>();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    labList = session.createQuery("from Lab order by labName asc").list();
			    tx.commit();
			
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return labList;
	}


	@Override
	public Lab getLabById(int id) {
		
		Session session = null;
		Transaction tx = null;  
		
		Lab lab = new Lab();
		try{
			
			
				
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    		
			//tokenInfo = session.createQuery("from TokenTokenInfo").list();
			lab = (Lab) session.createQuery("from Lab where id='"+id+"'").uniqueResult();
			//select * from allianz_lab_portal.token_token_info where id_token_user_info='1';
			tx.commit();
			
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return lab;
	}


	@Override
	public void updateLab(Lab lab) {
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    
			    //headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+tokenId+"'").uniqueResult();	
						
			session.update(lab);
			tx.commit();
			session.flush();
			//session.getTransaction().commit();
			
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
	}


	@Override
	public void deleteLab(int id) {
			
		Session session = null; 
		Transaction tx = null;  
		
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    		
			
			Lab lab = (Lab) session.load(Lab.class, new Integer(id));
			if (null != lab) {
				session.delete(lab);
				tx.commit();
			}
		}catch(Exception e){
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.flush();
			session.close();
		}
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Lab> getLabListByCategory(int labCategory) {
		Session session = null;
		Transaction tx = null;  
		
		List<Lab> labList = new ArrayList<Lab>();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			//System.out.println(">>>>>>>>>>>>from Lab labCategory = '"+labCategory+"'");
			labList = session.createQuery("from Lab where labCategory = '"+labCategory+"' order by labName asc").list();
				tx.commit();
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return labList;
	}


	@Override
	public int getLabCategoryByLabId(int labId) {
		Session session = null;
		Transaction tx = null;  
		
		int labCategary=0;
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			labCategary = (int) session.createQuery("select labCategory from Lab where id='"+labId+"'").uniqueResult();
			tx.commit();
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		return labCategary;
	}

}
