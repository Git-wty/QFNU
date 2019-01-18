package com.core;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;


public class DBUtil {
	 	private static String driver = null;
	    private static String url = null;
	    private static String username = null;
	    private static String password = null;
	    
	    static{
	        try{
	          
	            InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("db.properties");
	            Properties prop = new Properties();
	            prop.load(in);
	            
	            
	          
	            driver = prop.getProperty("driver");
	           
	            url = prop.getProperty("url");
	         
	            username = prop.getProperty("user");
	           
	            password = prop.getProperty("password");
	            
	         
	            Class.forName(driver);
	            
	        }catch (Exception e) {
	            throw new ExceptionInInitializerError(e);
	        }
	    }
	    
	    public static Connection getConnection() throws SQLException{
	    	System.out.println(DriverManager.getConnection(url,username,password));
	    	return DriverManager.getConnection(url,username,password);
	    	
	    }
	    
	    public static void release(Connection conn,Statement st,ResultSet rs){
	        if(rs!=null){
	            try{
	               
	                rs.close();
	            }catch (Exception e) {
	                e.printStackTrace();
	            }
	            rs = null;
	        }
	        if(st!=null){
	            try{
	               
	                st.close();
	            }catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        if(conn!=null){
	            try{
	               
	                conn.close();
	            }catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}

