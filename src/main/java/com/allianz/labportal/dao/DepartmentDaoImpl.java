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
import com.allianz.labportal.model.Department;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSesstionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Department> getDepartmentList() {
		Session session = null;
		Transaction tx = null;  
		
		List<Department> departmentList = new ArrayList<Department>();
		try{		
							
			    session = this.sessionFactory.openSession();
			    tx = session.beginTransaction();
			departmentList = session.createQuery("from Department").list();
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
		return departmentList;
	}

}
