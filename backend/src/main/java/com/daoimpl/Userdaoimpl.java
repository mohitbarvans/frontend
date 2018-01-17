package com.daoimpl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dao.userdao;
import com.model.User;

public class Userdaoimpl implements userdao{

@Autowired
SessionFactory sessionFactory;

@Autowired
public Userdaoimpl(SessionFactory sessionFactory)
{
	super();
	this.sessionFactory=sessionFactory;
}
@Transactional
public void insertUser(User user)
{
	Session session=sessionFactory.openSession();
	session.beginTransaction();
	session.persist(user);
	session.getTransaction().commit();
	
	
}
}
