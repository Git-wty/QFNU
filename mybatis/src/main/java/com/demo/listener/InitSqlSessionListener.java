package com.demo.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.demo.utils.SqlSessionFactoryUtils;
@WebListener
public class InitSqlSessionListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("容器加载中。。。");
		//关闭SqlSession对象
		SqlSessionFactoryUtils.close();
	}

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("容器加载中。。。");
		//初始化我们的SQLSessionFactory对象
		SqlSessionFactoryUtils.initSqlSessionFactory();
	}

}
