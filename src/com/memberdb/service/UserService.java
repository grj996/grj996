package com.memberdb.service;

import com.memberdb.entity.User;

import java.util.List;

public interface UserService {

    boolean login(User user);

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

    Long getMaxPage(int num);

    User queryUserById(Long id);
}
