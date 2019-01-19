package com.demo.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.demo.utils.SqlSessionFactoryUtils;
@WebListener
public class InitSqlSessionListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("���������С�����");
		//�ر�SqlSession����
		SqlSessionFactoryUtils.close();
	}

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("���������С�����");
		//��ʼ�����ǵ�SQLSessionFactory����
		SqlSessionFactoryUtils.initSqlSessionFactory();
	}

}
