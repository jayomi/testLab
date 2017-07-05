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
import com.allianz.labportal.model.User;


@Repository
public class HeadTokenDaoImpl implements HeadTokenDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenList() {
		
		Session session = null;
		Transaction tx = null;
		
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction(); 
			    tokenList = session.createQuery("from HeadTokenInfo").list();
			    tx.commit();  
		
		}catch(Exception e){
			e.printStackTrace();
			tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return tokenList;
	}

	@Override
	public HeadTokenInfo getHeadTokenById(int id) {
		
		Session session = null;
		Transaction tx = null;
		HeadTokenInfo tokenInfo = new HeadTokenInfo();
		try{
				session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();			    
				tokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+id+"'").uniqueResult();			
				tx.commit();  			
			
			
		}catch(Exception e){
			e.printStackTrace();
			tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}		
		return tokenInfo;
	}

	@Override
	public HeadTokenInfo addToken(HeadTokenInfo token) {
		Session session = null;
		Transaction tx = null; 
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    session.save(token);
			    tx.commit();
			    session.flush();
			
		}catch(Exception e){
			e.printStackTrace();
			tx.rollback(); 
		}finally{
			session.close();
		}
		return token;
	}

	@Override
	public HeadTokenInfo updateHeadToken(HeadTokenInfo headToken,String labName,int pendingReportCount) {
		
		Session session = null;
		Transaction tx = null;  
		
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction(); 
			    headTokenInfo = (HeadTokenInfo) session.get(HeadTokenInfo.class,headToken.getId());			
				headTokenInfo.setTokenStatus("toLab");
				headTokenInfo.setLabName(labName);
				headTokenInfo.setPendingReportCountFromLab(pendingReportCount);
				session.save(headTokenInfo);	
				tx.commit();
				session.flush();
			
		}catch(Exception e){
			e.printStackTrace();
			tx.rollback();
		}finally {
			session.close();			
		}
		return headTokenInfo;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenListByUser(String UserName,String tokenStatus) {
		Session session = null;
		Transaction tx = null; 
		
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			
			  session = this.sessionFactory.openSession();
			  tx = session.beginTransaction();  
			
			/*tokenList = session.createQuery("from HeadTokenInfo where assignType='"+assignType+"'").list();*/
			tokenList = session.createQuery("from HeadTokenInfo where createdBy='"+UserName+"' and tokenStatus='"+tokenStatus+"'").list();
			tx.commit();
			
		}catch(Exception e){
			e.printStackTrace();
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

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenListByEmail(String email) {
		Session session = null;
		Transaction tx = null;  
		
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{			
			//session = this.sessionFactory.openSession();			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();			
			
			/*tokenList = session.createQuery("from HeadTokenInfo where assignType='"+assignType+"'").list();*/
			tokenList = session.createQuery("from HeadTokenInfo where userEmail='"+email+"'").list();
				tx.commit();
			
		}catch(Exception e){
			e.printStackTrace();
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



	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenListByBranch(String branch) {

		Session session = null;
		Transaction tx = null;  
		
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			
			  session = this.sessionFactory.openSession();
			  tx = session.beginTransaction();
			
			/*tokenList = session.createQuery("from HeadTokenInfo where assignType='"+assignType+"'").list();*/
			tokenList = session.createQuery("from HeadTokenInfo where branch='"+branch+"'").list();
			tx.commit();
			
		}catch(Exception e){
			e.printStackTrace();
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
	
	@Override
	public HeadTokenInfo updateTokenDoctorAssignType(HeadTokenInfo headToken, String assignToDoctorReport,User doctor,String tokenStatus,String comment) {
		
		Session session = null;
		Transaction tx = null;  
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    
			    
			    
			//headTokenInfo = (HeadTokenInfo) session.get(HeadTokenInfo.class,headToken.getId());	
			headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+headToken.getId()+"'").uniqueResult();
			headTokenInfo.setTokenStatus(tokenStatus); //"toDoctor"			
			String doctorName = doctor.getLabName()+","+doctor.getFullName();
			headTokenInfo.setDoctorId(doctor.getId());
			headTokenInfo.setDoctorName(doctorName);
			headTokenInfo.setAssignToDoctorReport(assignToDoctorReport);
			headTokenInfo.setLastMessage(comment);
			headTokenInfo.setLastResponse(new Date());
			
			session.save(headTokenInfo);
			tx.commit();
			session.flush();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return headTokenInfo;
	}

	@Override
	public int countTokensbyStatus(String status) {
		Session session = null;
		Transaction tx = null;  
		Long rowCount;
		int count=0;
		try{
			
			   session = this.sessionFactory.openSession();
			   tx = session.beginTransaction();
			
			rowCount = (Long) session.createQuery("select count(*) from HeadTokenInfo where tokenStatus='"+status+"'").uniqueResult();
			count =(int) (long) rowCount;
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenListByTokenStatus(String tokenStatus) {
		Session session = null;
		Transaction tx = null;  
		
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{			
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();			
			    tokenList = session.createQuery("from HeadTokenInfo where tokenStatus='"+tokenStatus+"'").list();
				tx.commit();
				
		}catch(Exception e){e.printStackTrace();
		tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return tokenList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenListByTokenStatusAndBranch(String tokenStatus, String branch) {
		Session session = null;
		Transaction tx = null;  
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			/*tokenList = session.createQuery("from HeadTokenInfo where assignType='"+assignType+"'").list();*/
			tokenList = session.createQuery("from HeadTokenInfo where tokenStatus='"+tokenStatus+"' and branch='"+branch+"'").list();
			tx.commit();
			
			
		}catch(Exception e){e.printStackTrace();
		tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return tokenList;
	}

	@Override
	public void updatePendingReportsFormLab(int headTokenId,int count) {	

		Session session = null;
		Transaction tx = null;  
		
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    //headTokenInfo = (HeadTokenInfo) session.get(HeadTokenInfo.class,headToken.getId());
			    headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+headTokenId+"'").uniqueResult(); 
			    headTokenInfo.setPendingReportCountFromLab(count);
			    if(count!=0){//pending reports available
			    	headTokenInfo.setCompleteStatusLab("pending");
			    }
			    if(count==0){//pending reports not available
			    	headTokenInfo.setCompleteStatusLab("compleate");
			    }
			
			session.save(headTokenInfo);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
		
		tx.rollback();}finally{
			session.close();
		}
		
		
		
	}

	@Override
	public void updateTokenStstus(int id, String status) {
		
		Session session = null;
		Transaction tx = null;  
		
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+id+"'").uniqueResult();
			//headTokenInfo.setCompleteStatusLab(status);
			headTokenInfo.setTokenStatus(status);//"fromLab"
			session.save(headTokenInfo);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
		tx.rollback();
		}finally{
			session.close();
		}
		
	}

	@Override
	public HeadTokenInfo updateHeadTokenWithDoctorStatus(int id, String comment, String doctorStatus) {
		Session session = null;
		Transaction tx = null;  
		
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			  session = this.sessionFactory.openSession();
			   tx = session.beginTransaction();
			headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+id+"'").uniqueResult();
			headTokenInfo.setDoctorComment(comment);			
			headTokenInfo.setCompleteStatusDoctor(doctorStatus);//compleate
			headTokenInfo.setTokenStatus("fromDoctor");
			headTokenInfo.setLastMessage(comment);
			headTokenInfo.setLastResponse(new Date());
			
			session.save(headTokenInfo);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
		 tx.rollback();}finally{
			 session.close();
		 }
		return headTokenInfo;
	}

	@Override
	public HeadTokenInfo updateHeadTokenWithAdminStatus(int id, String comment, String tokenStatus) {
		Session session = null;
		Transaction tx = null;  
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction();
			headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+id+"'").uniqueResult();
			headTokenInfo.setAdminComment(comment);			
			headTokenInfo.setTokenStatus(tokenStatus);
			session.save(headTokenInfo);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
			tx.rollback();}finally {
			session.close();
		}
		return headTokenInfo;
	}

	@Override
	public int getMaxRecorde() {
		Session session = null;
		Transaction tx = null;  
		
		int maxId=0;
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    maxId =  (int) session.createQuery("SELECT MAX(id) FROM HeadTokenInfo").uniqueResult();
			    tx.commit();
			    
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
			
		}
		
		return maxId;
	}

	@Override
	public void updateToken(int tokenId,HeadTokenInfo headToken) {

		Session session = null;
		Transaction tx = null;  
		
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			 session = this.sessionFactory.openSession();
			 tx= session.beginTransaction();
			
			//headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+tokenId+"'").uniqueResult();	
						
			session.update(headToken);	
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

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLab(String tokenStatus, int labId) {
		Session session = null;
		Transaction tx = null;  
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			/*tokenList = session.createQuery("from HeadTokenInfo where assignType='"+assignType+"'").list();*/
			tokenList = session.createQuery("from HeadTokenInfo where tokenStatus='"+tokenStatus+"' and labId='"+labId+"'").list();
			tx.commit();
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
		}
		return tokenList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLabUploadStatus(String tokenStatus, int labId,
			String uploadStatus) {
		
		Session session = null;
		Transaction tx = null;  
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();			
			tokenList = session.createQuery("from HeadTokenInfo where tokenStatus !='"+tokenStatus+"' and labId='"+labId+"' and completeStatusLab='"+uploadStatus+"'").list();
			tx.commit();
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
		}
		return tokenList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getTokenListByTokenStatusAndLabUploadStatus(String tokenStatus, String uploadStatus) {
		Session session = null;
		Transaction tx = null;  
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();			
			tokenList = session.createQuery("from HeadTokenInfo where tokenStatus='"+tokenStatus+"' and completeStatusLab "+uploadStatus).list();
			tx.commit();
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
		}
		return tokenList;
	}


	@Override
	public void updateTokenStstus(int id, String status, String comment) {

		Session session = null;
		Transaction tx = null;  
		
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction();
			headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+id+"'").uniqueResult();
			//headTokenInfo.setCompleteStatusLab(status);
			headTokenInfo.setTokenStatus(status);//"fromLab"
			headTokenInfo.setLastMessage(comment);
			headTokenInfo.setLastResponse(new Date());
			session.save(headTokenInfo);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
		tx.rollback();
		}finally{
			session.close();
		}
		
		
	}

	@Override
	public HeadTokenInfo updateTokenSRPAssignType(HeadTokenInfo headToken, String assignToSrpReport, User srp,
			String tokenStatus, String comment) {

		Session session = null;
		Transaction tx = null;  
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    
			headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+headToken.getId()+"'").uniqueResult();
			headTokenInfo.setTokenStatus(tokenStatus); //"toDoctor"			
			String srpName = srp.getLabName()+","+srp.getFullName();
			
			headTokenInfo.setSrpId(srp.getId());
			headTokenInfo.setSrpName(srpName);
			headTokenInfo.setAssignToSrpReport(assignToSrpReport);		
			headTokenInfo.setLastMessage(comment);
			headTokenInfo.setLastResponse(new Date());
			
			session.save(headTokenInfo);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			session.close();
		}
		return headTokenInfo;
		
	}

	@Override
	public HeadTokenInfo updateHeadTokenWithSRPStatus(int id, String comment, String tokenStatus) {
		
		Session session = null;
		Transaction tx = null;  
		
		HeadTokenInfo headTokenInfo = new HeadTokenInfo();
		try{
			
			  session = this.sessionFactory.openSession();
			   tx = session.beginTransaction();
			headTokenInfo = (HeadTokenInfo) session.createQuery("from HeadTokenInfo where id='"+id+"'").uniqueResult();
			
			headTokenInfo.setSrpComment(comment);		
			headTokenInfo.setTokenStatus(tokenStatus);
			headTokenInfo.setCompleteStatusSrp("compleate");
			headTokenInfo.setLastMessage(comment);
			headTokenInfo.setLastResponse(new Date());
			
			session.save(headTokenInfo);
			tx.commit();
			session.flush();
			
		}catch(Exception e){e.printStackTrace();
		 tx.rollback();}finally{
			 session.close();
		 }
		return headTokenInfo;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getCompleateTokenListBySRP(int srpId, String tokenStatus, String compleateStatus) {
		
		Session session = null;
		Transaction tx = null;  
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();			
			tokenList = session.createQuery("from HeadTokenInfo where tokenStatus !='"+tokenStatus+"' and completeStatusSrp='"+compleateStatus+"' and srpId='"+srpId+"'").list();
			tx.commit();
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
		}
		return tokenList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HeadTokenInfo> getCompleateTokenListByDoctor(int doctorId, String tokenStatus, String compleateStatus) {
		Session session = null;
		Transaction tx = null;  
		List<HeadTokenInfo> tokenList = new ArrayList<HeadTokenInfo>();
		try{
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();			
			tokenList = session.createQuery("from HeadTokenInfo where tokenStatus !='"+tokenStatus+"' and completeStatusDoctor='"+compleateStatus+"' and doctorId='"+doctorId+"'").list();
			tx.commit();
		}catch(Exception e){e.printStackTrace();tx.rollback();}
		finally{
			if(session!=null){
				session.close();
				session=null;
			}			
		}
		return tokenList;
	}


}
