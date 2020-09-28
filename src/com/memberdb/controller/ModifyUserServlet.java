package com.memberdb.controller;

import com.memberdb.entity.User;
import com.memberdb.service.UserService;
import com.memberdb.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ModifyUserServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId").trim();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String userType = request.getParameter("userType").trim();
        String stateUpdate = request.getParameter("stateUpdate").trim();

        User user = new User(Long.valueOf(userId), username, password, null, Integer.valueOf(userType), Integer.valueOf(stateUpdate));
        int result = userService.update(user);
        response.sendRedirect("UserServlet");
    }
}
