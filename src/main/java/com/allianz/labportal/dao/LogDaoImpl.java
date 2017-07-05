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

import com.allianz.labportal.model.HeadTokenInfo;
import com.allianz.labportal.model.Log;

@Repository
public class LogDaoImpl implements LogDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void addRecode(int tokenId, String comment) {

		Session session = null;
		Transaction tx = null;  
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			Log log = new Log();
			log.setTokenId(tokenId);
			log.setComment(comment);
			log.setDate(new Date());
			session.save(log);	
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Log> getLogs(int tokenId) {
		Session session = null;
		Transaction tx = null;  
		List<Log> tokenList = new ArrayList<Log>();
		try{
			
			 session = this.sessionFactory.openSession();
			 tx = session.beginTransaction();
			
			
			tokenList = session.createQuery("from Log where tokenId='"+tokenId+"'").list();
			
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
		
		return tokenList;
	}

}
