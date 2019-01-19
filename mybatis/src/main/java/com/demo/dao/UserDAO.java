package com.demo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.demo.entity.Users;
import com.demo.utils.SqlSessionFactoryUtils;

public class UserDAO {
private SqlSession sqlSession;
private List<Users> list;
private Users user;

private SqlSession getSession() {
    sqlSession = SqlSessionFactoryUtils.getSqlSessionFactory().openSession();
    return sqlSession;
}

public List<Users> findAll() {
    try {
        list = getSession().selectList("findUsers");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        sqlSession.close();
    }
    return list;
}

public Users findById(Integer id) {
    try {
    	user=getSession().selectOne("findUsers",new Users(id));
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        sqlSession.close();
    }
    return user;
}

public Users addUser(Users users) {
    try {
    	getSession().insert("addUser",users);
    	
    	sqlSession.commit();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        sqlSession.close();
    }
    return users;
}

public Users updataUsers(Users users) {
    try {
    	getSession().update("updateUser",users);
    	
    	sqlSession.commit();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        sqlSession.close();
    }
    return users;
}

public void deleteUsers(Integer id) {
    try {
    	getSession().delete("delUser",id);
    	
    	sqlSession.commit();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        sqlSession.close();
    }
}
}
