package com.demo.utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryUtils {
	private static String RESOURCE="mybatis-config.xml";
	private static SqlSessionFactory sqlSessionFactory;
	private static ThreadLocal<SqlSession> threadLocal=new ThreadLocal<SqlSession>();
	
	// ����һ����ʼ��SQLSessionFactory�ķ���
	public static void initSqlSessionFactory() {
		try {
			InputStream iStream=Resources.getResourceAsStream(RESOURCE);
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(iStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//��ȡ��������ķ���
	public static SqlSessionFactory getSqlSessionFactory() {
		System.out.println("���ڻ�ûỰ��������");

		if (sqlSessionFactory==null) {
			System.out.println("�ö���Ϊ��");
		}
		return sqlSessionFactory;
	}
	
	//�ر�SQLSession�ķ���
	public static void close() {
		SqlSession session=threadLocal.get();
		if (session!=null) {
			session.close();
			threadLocal.set(null);
		}
	}
}
