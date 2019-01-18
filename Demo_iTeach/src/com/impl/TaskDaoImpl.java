package com.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.DBUtil;
import com.dao.TaskDao;
import com.model.Task;

public class TaskDaoImpl implements TaskDao {

	@Override
	public void createTask(Task task) {
		// TODO Auto-generated method stub
		Connection conn=null;
		PreparedStatement st=null;
		ResultSet rs=null;
		String sql="insert into task(class_id,task_require,task_date)values(?,?,?);";
		try {
			conn=DBUtil.getConnection();
			st=conn.prepareStatement(sql);
		
			st.setString(1, task.getClassId());
			st.setString(2, task.getTaskRequire());
			st.setString(3, task.getTaskDate());
			
			int num=st.executeUpdate();
			if (num>0) {
				System.out.println("发布作业成功！");
			}else {
				System.out.println("发布作业失败！");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.release(conn, st, rs);
		}
	}

}
