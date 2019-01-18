package com.impl;

import com.dao.IRegisterDao;
import com.core.DBUtil;
import com.model.User;


import java.sql.*;


public class RegisterDaoImpl implements  IRegisterDao{

	@Override
	public void addUser(User user) {
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="insert into user (username,password,name,school,status) values(?,?,?,?,?)";
		
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
			st.setString(1, user.getUsername());
			st.setString(2, user.getPassword());
			st.setString(3, user.getName());
			st.setString(4, user.getSchool());
			st.setString(5, user.getStatus());
			
			int num=st.executeUpdate();
			if (num>0) {
				System.out.println("����ɹ�");
			}else {
				System.out.println("����ʧ��");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		
	}
	
//	public static void main(String[] args) {
//		RegisterDaoImpl rgi=new RegisterDaoImpl();
//		User user =new User();
//		user.setUsername("�ƶ���");
//		user.setPassword("789123qQ.");
//		user.setSchool("���ɴ�ѧ");
//		user.setStatus("ѧ��");
//		user.setName("�ƴ���");
//		rgi.addUser(user);
//	}
	
}
