package com.memberdb.test;

import com.memberdb.service.UserService;
import com.memberdb.service.impl.UserServiceImpl;
import org.junit.Test;

public class UserServiceTest {

    UserService userService = new UserServiceImpl();
    @Test
    public void test(){
        System.out.println(userService.getMaxPage(2));
    }
}
