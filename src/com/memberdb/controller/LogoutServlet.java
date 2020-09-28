package com.memberdb.controller;

import com.memberdb.service.UserService;
import com.memberdb.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //       1、销毁Session 中用户登录的信息 （或者销毁Session）
        request.getSession().invalidate();
//       2、重定向到首页 （或登录页面）。
        response.sendRedirect(request.getContextPath());
    }
}
