package com.allianz.labportal.dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allianz.labportal.model.Branch;
import com.allianz.labportal.model.Lab;
import com.allianz.labportal.model.User;


@Repository
public class BranchDaoImpl implements BranchDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Branch> getBranchList() {
		
		Session session = null;
		Transaction tx = null;  
		
		List<Branch> branchList = new ArrayList<Branch>();
		try{
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
		
			//FROM table_name
			//ORDER BY column_name ASC|
			branchList = session.createQuery("from Branch order by branchName asc").list();
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
		
		return branchList;
	}

	@Override
	public void addBranch(Branch branch) {
		
		Session session = null;
		Transaction tx = null;  
		
		try{
			
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(branch);	
			tx.commit();
			session.flush();
			
		}catch(Exception e){
			e.printStackTrace();tx.rollback();
			}finally {
				session.close();
			}
		
		
	}

	@Override
	public void deleteBranch(int id) {
		Session session = null; 
		Transaction tx = null;  
		try{
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			
			Branch branch = (Branch) session.load(Branch.class, new Integer(id));
			if (null != branch) {
				session.delete(branch);
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

	@Override
	public Branch getBranchbyId(int id) {
		
		/*Session session = null ;
		Transaction tx = null;  
		
		Branch branch = new Branch();
		try{
			
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			    branch = (Branch) session.load(Branch.class, new Integer(id));
				tx.commit();
				
		}catch(Exception e){
			e.printStackTrace();
			tx.rollback();
		}finally{
			
			session.clear();
		}
		return branch;*/
		
		Session session = null;
		Transaction tx = null;  
		
		Branch branch = new Branch();
		try{
			session = this.sessionFactory.openSession(); 
			tx = session.beginTransaction();
			branch = (Branch) session.createQuery("from Branch where id='"+id+"'").uniqueResult(); //(User) session.load(User.class, new Integer(id));			
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
		return branch;	
		
	}

}
