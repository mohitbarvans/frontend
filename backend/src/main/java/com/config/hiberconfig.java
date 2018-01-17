package com.config;

import java.util.Properties;


import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.daoimpl.Categorydaoimpl;
import com.daoimpl.Supplierdaoimpl;
import com.daoimpl.Userdaoimpl;
import com.model.Category;
import com.model.Supplier;
import com.model.User;
@Configuration
@ComponentScan("com")
@EnableTransactionManagement
public class hiberconfig {
	
	@Autowired
	@Bean(name="datasource")
	public DataSource geth2Data()
	{
		DriverManagerDataSource dsource=new DriverManagerDataSource();
		dsource.setDriverClassName("org.h2.Driver");
		dsource.setUrl("jdbc:h2:tcp://localhost/~/front");
		dsource.setUsername("sa");
		dsource.setPassword("");
		System.out.println("h2 config");
		return dsource;
	}
	

	
	private Properties getHiber(){
		Properties p=new Properties();
		p.put("hibernate.dialect","org.hibernate.dialect.H2Dialect");
		p.put("hibernate.hbm2ddl.auto","update");
		p.put("hibernate.show_sql","true");
		
	
	System.out.println("tables created");
	return p;
	}
	
	@Autowired
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFac(DataSource datasource)
	{
		LocalSessionFactoryBuilder lsfb=new LocalSessionFactoryBuilder(datasource); 
		lsfb.addProperties(getHiber());
		lsfb.addAnnotatedClass(User.class);
		lsfb.addAnnotatedClass(Supplier.class);
		lsfb.addAnnotatedClass(Category.class);
		
		return lsfb.buildSessionFactory();
	
	}
	
	@Autowired
	@Bean(name="Userdaoimpl")
	public Userdaoimpl saveUserData(SessionFactory sf)
	{
		return new Userdaoimpl(sf);
	}
	
	@Autowired
	@Bean(name="Supplierdaoimpl")
	public Supplierdaoimpl saveSuppData(SessionFactory sf)
	{
		return new Supplierdaoimpl(sf);
	}

	@Autowired
	@Bean(name="Categorydaoimpl")
	public Categorydaoimpl saveCatData(SessionFactory sf)
	{

		return new Categorydaoimpl(sf);
	}

	
	
	
	
	
	@Autowired
	@Bean(name="transactionManager")
   public HibernateTransactionManager gettrans(SessionFactory sf)
   {
		HibernateTransactionManager tm=new HibernateTransactionManager(sf);
		return tm;
   }

}


