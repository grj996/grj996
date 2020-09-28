package com.memberdb.test;

import com.memberdb.dao.UserDao;
import com.memberdb.dao.impl.UserDaoImpl;
import com.memberdb.entity.User;
import org.junit.Test;

public class UserDaoTest {
    UserDao userDao = new UserDaoImpl();

    @Test
    public void queryTest() {
//        System.out.println(userDao.queryUserList());
//        System.out.println(userDao.queryUserListByPage(2,5));
//        User user = new User();
//        user.setUsername("admin1");
//        user.setPassword("123456");
//        System.out.println(userDao.queryUserByUsernameAndPassword(user));
//        System.out.println(userDao.queryUserListByPage(1,10));
//        System.out.println(userDao.getUserCount());
        System.out.println(userDao.queryUserById(1L));
    }

    @Test
    public void updateTest() {
        User user = new User(11L, "admin12", "123", "", 1, 1);
//        System.out.println(userDao.update(user));
        System.out.println(userDao.delete(user.getId()));
    }
}
