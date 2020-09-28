package com.memberdb.controller;

import com.memberdb.entity.User;
import com.memberdb.service.UserService;
import com.memberdb.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddUserServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        int type = Integer.valueOf(userType.trim());
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setType(type);
        user.setStatus(1);
        user.setImage(null);
        int result = userService.insert(user);
        response.sendRedirect("UserServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
