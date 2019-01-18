package com.dao;

import com.model.WisdomClass;

public interface ClassDao {
	public void createClass(WisdomClass wisdomClass);
	public void joinClass(String studentId,String classId);
}
