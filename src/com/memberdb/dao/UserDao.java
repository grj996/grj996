package com.memberdb.dao;

import com.memberdb.entity.User;

import java.util.List;

public interface UserDao {
    User queryUserByUsernameAndPassword(User user);

    int insert(User user);

    int update(User user);

    int delete(Long userId);

    List<User> queryUserList();

    /**
     * @param page 当前页数
     * @param num  每一页展示的记录数
     * @return
     */
    List<User> queryUserListByPage(int page, int num);

    Long getUserCount();

    User queryUserById(Long id);
}
