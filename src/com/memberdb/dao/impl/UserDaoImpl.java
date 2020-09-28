package com.memberdb.dao.impl;

import com.memberdb.dao.BaseDao;
import com.memberdb.dao.UserDao;
import com.memberdb.entity.User;

import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public User queryUserByUsernameAndPassword(User user) {
        String sql = "SELECT * FROM `User` WHERE `username` = ? AND `password` = ?";
        return queryForOne(User.class, sql, user.getUsername(), user.getPassword());
    }

    @Override
    public int insert(User user) {
        String sql = "INSERT INTO `User` (`username`, `password`, `image`, `type`, `status`) VALUES (?, ?, ?, ?, ?)";
        return update(sql, user.getUsername(), user.getPassword(), user.getImage(), user.getType(), user.getStatus());
    }

    @Override
    public int update(User user) {
        String sql = "UPDATE `User` SET `username` = ?, `password` = ?, `image` = ?, `type` = ?, `status` = ? WHERE `id` = ? ";
        return update(sql, user.getUsername(), user.getPassword(), user.getImage(), user.getType(), user.getStatus(), user.getId());
    }

    @Override
    public int delete(Long userId) {
        String sql = "DELETE FROM `User` WHERE `id` = ?";
        return update(sql, userId);
    }

    @Override
    public List<User> queryUserList() {
        String sql = "SELECT * FROM `User`";
        return queryForList(User.class, sql);
    }

    @Override
    public List<User> queryUserListByPage(int page, int num) {
        String sql = "SELECT * FROM `User` LIMIT ?, ?";
        return queryForList(User.class, sql, (page - 1) * num, num);
    }

    @Override
    public Long getUserCount() {
        String sql = "SELECT COUNT(1) FROM `User`";
        return (Long) queryForSingleValue(sql);
    }

    @Override
    public User queryUserById(Long id) {
        String sql = "SELECT * FROM `User` WHERE `id` = ?";
        return queryForOne(User.class, sql, id);
    }
}
