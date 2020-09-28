package com.memberdb.service.impl;

import com.memberdb.dao.UserDao;
import com.memberdb.dao.impl.UserDaoImpl;
import com.memberdb.entity.User;
import com.memberdb.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public boolean login(User user) {
        if (userDao.queryUserByUsernameAndPassword(user) == null) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public int insert(User user) {
        return userDao.insert(user);
    }

    @Override
    public int update(User user) {
        return userDao.update(user);
    }

    @Override
    public int delete(Long userId) {
        return userDao.delete(userId);
    }

    @Override
    public List<User> queryUserList() {
        return userDao.queryUserList();
    }

    @Override
    public List<User> queryUserListByPage(int page, int num) {
        return userDao.queryUserListByPage(page, num);
    }

    @Override
    public Long getMaxPage(int num) {
        long count = userDao.getUserCount();
        long page = count / num;
        if (count % num > 0) {
            page++;
        }
        return page;
    }

    @Override
    public User queryUserById(Long id) {
        return userDao.queryUserById(id);
    }
}
